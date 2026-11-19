/*
 * keymouse - T9 物理按键 -> 虚拟鼠标 守护进程 (v3)
 * ------------------------------------------------
 * 纯 C 实现，无第三方依赖，仅使用标准 Linux / POSIX 接口
 * (epoll / uinput / evdev)。设计目标：
 *   1. 空闲时 epoll_wait 阻塞，CPU 占用为 0；
 *   2. 通过 su 以 root 方式启动的独立守护进程，double-fork +
 *      setsid 彻底与 App 进程脱离，不会被 Android 的
 *      ActivityManager / lmkd 按"应用进程"的生命周期规则回收；
 *   3. 关闭鼠标模式时完全不 grab 设备、不产生任何事件，
 *      对原生按键功能零侵入；开启后独占按键设备，屏蔽原功能；
 *   4. 依据系统对"内部关联显示屏的相对指针设备"的自动旋转
 *      补偿（CursorInputMapper / TouchInputMapper 会按当前
 *      屏幕方向自动旋转设备上报的坐标），本程序只按"面板出厂
 *      默认方向"的物理语义输出坐标，不做任何手动旋转换算。
 *
 * 按键映射:
 *   方向键 上/下/左/右   -> 移动光标
 *   确定键 (KEY_SELECT)  -> 鼠标左键
 *   数字键 2 / 8         -> 上/下翻页(滚动)，短按=快速翻一页，长按=慢速连续滑动(阅读速度)，松开即停
 *   数字键 4 / 6         -> 左/右翻页(横向滑动)，短按/长按规则同上
 *                            (滑动模式下长按不再是一小段一小段地搓，而是一根手指从指针处
 *                            开始持续慢速拖动，松开才停；走到屏幕边缘会自动换到对侧继续)
 *   数字键 1 / 3         -> 双指横向(沿面板 X 轴)缓慢捏合: 1=缩小(双指靠拢)，3=放大(双指分开)，
 *                            约 1.5 秒完成；执行期间按任何其它键都会立刻打断
 *   F1                   -> 长按 (>= --toggle-hold-ms) 切换鼠标模式开关；一按住不松手
 *                            达到阈值就立刻切换并提示 (不必等松开)，短按不触发，避免误触
 *   其余未被上面占用的按键 (返回键/菜单键/电源键等) -> 原样透传给系统，
 *                            鼠标模式开启期间也保留其原厂功能 (电源键所在的
 *                            功能键设备本来就不会被独占，锁屏/关机不受影响)
 *
 * 用法:
 *   keymouse [选项]
 *
 *   --kbd-name=NAME          主键盘 input 设备名 (默认 sprd-keypad)
 *   --func-name=NAME         功能键 input 设备名 (默认 gpio-keys)
 *   --uinput-path=PATH       uinput 节点 (默认自动探测 /dev/uinput
 *                            或 /dev/input/uinput)
 *   --move-step=N            每次移动的像素数 (默认 5)
 *   --move-interval=MS       移动连发间隔 ms (默认 50)
 *   --scroll-step=N          短按(快速翻页)时 wheel 模式的滚动格数 (默认 1)
 *   --scroll-interval=MS     长按慢速连续滑动时的连发间隔 ms (默认 130，
 *                            数值越大滑动越慢，模拟阅读速度)
 *   --scroll-mode=wheel|swipe 翻页实现方式 (默认 wheel)
 *   --swipe-distance=PX      短按(快速翻页)时 swipe 模式每次滑动距离像素 (默认 150)
 *   --swipe-step-ms=MS       swipe 模式单次手势内部插值间隔 ms (默认 16)
 *   --scroll-hold-ms=MS      2/4/6/8 按住超过这个时长视为"长按"，进入慢速连续
 *                            滑动模式；松开前若一直没到这个时长，松开时按快速
 *                            翻页处理一次 (默认 300)
 *   --scroll-slow-distance=PX 长按慢速连续滑动时，swipe 模式每个 tick 的距离
 *                            (默认 40，配合 --scroll-interval 决定滑动速度)
 *   --toggle-hold-ms=MS      F1 需要长按多久(ms)才会切换鼠标模式 (默认 500)
 *   --touch-name=NAME        触摸屏设备名关键字，用于探测面板分辨率
 *                             (默认自动扫描第一个具备 ABS_MT_POSITION
 *                             能力的设备)
 *   --daemon                 fork 到后台运行（双重 fork + setsid）
 *   --pidfile=PATH            守护进程启动后将自身 pid 写入该文件
 *   --logfile=PATH            简单日志输出路径（默认不输出，节省资源）
 *
 * 退出: SIGTERM / SIGINT 会触发清理 (ungrab + 销毁 uinput 设备) 后退出。
 */

#define _GNU_SOURCE
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <signal.h>
#include <dirent.h>
#include <getopt.h>
#include <time.h>
#include <sys/epoll.h>
#include <sys/inotify.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/syscall.h>
#include <linux/input.h>
#include <linux/uinput.h>
#include "km_embed.h"   /* 手电筒助手 jar + 返回键脚本 (native/gen_embed.sh 生成) */
#include "km_debounce.h" /* 按键防抖引擎(纯逻辑，tools 里有单元测试) */

/* ---- Android shell 适配 ----
 * 用 musl 静态编译时，system()/popen() 写死调用 /bin/sh，而 Android 上只有
 * /system/bin/sh。这里用 fork+exec /system/bin/sh 重新实现，行为与原版一致。
 * (用 NDK/bionic 编译时定义 KM_BIONIC 即可跳过本段) */
#ifndef KM_BIONIC
#include <sys/types.h>
static int km_system(const char *cmd) {
    pid_t pid = fork();
    if (pid < 0) return -1;
    if (pid == 0) {
        execl("/system/bin/sh", "sh", "-c", cmd, (char *)NULL);
        _exit(127);
    }
    int st = 0;
    while (waitpid(pid, &st, 0) < 0) { if (errno != EINTR) return -1; }
    return st;
}
static pid_t g_popen_pid = -1;       /* 本程序同一时刻只会有一个 popen */
static FILE *km_popen(const char *cmd, const char *mode) {
    (void)mode;                      /* 只用到 "r" */
    int fd[2];
    if (pipe(fd) != 0) return NULL;
    pid_t pid = fork();
    if (pid < 0) { close(fd[0]); close(fd[1]); return NULL; }
    if (pid == 0) {
        dup2(fd[1], 1);
        close(fd[0]); close(fd[1]);
        execl("/system/bin/sh", "sh", "-c", cmd, (char *)NULL);
        _exit(127);
    }
    close(fd[1]);
    g_popen_pid = pid;
    return fdopen(fd[0], "r");
}
static int km_pclose(FILE *fp) {
    int st = 0;
    fclose(fp);
    if (g_popen_pid > 0) {
        while (waitpid(g_popen_pid, &st, 0) < 0) { if (errno != EINTR) break; }
        g_popen_pid = -1;
    }
    return st;
}
#define system km_system
#define popen  km_popen
#define pclose km_pclose
#endif

/* ------------------------------------------------------------------ */
/* 按键码 (与需求文档给出的十六进制保持一致，直接使用原厂上报的键码)  */
/* ------------------------------------------------------------------ */
#define KC_UP      0x67
#define KC_DOWN    0x6c
#define KC_LEFT    0x69
#define KC_RIGHT   0x6a
/* 0x161 = KEY_SELECT，真正的"确定"键。
 * 注意: 0x9e 是 KEY_BACK(物理返回键)，早期版本误把它当成确定键用，
 * 已修正；现在 0x9e 不在下面任何 case 里出现，会落入 default 分支，
 * 按"未占用按键"原样透传，从而恢复返回键的原厂功能。*/
#define KC_CONFIRM       0x161
/* 百合(BIHEE A89)等机型的中间键上报的是 KEY_ENTER(28)，不是 KEY_SELECT(0x161)，
 * 以前只认 0x161，所以这类机型按中间键没有任何反应。现在把下面这几个常见的
 * "确定/回车" 键码也当成中间键(只在鼠标模式开着、事件来自主键盘时才生效；
 * 鼠标关闭时一切原样交给系统，对原生功能零侵入)。 */
#define KC_ALIAS_ENTER   0x1c   /* KEY_ENTER   (28)  */
#define KC_ALIAS_KPENTER 0x60   /* KEY_KPENTER (96)  */
#define KC_ALIAS_OK      0x160  /* KEY_OK      (352) */
#define KC_SCROLL_UP     0x03   /* 数字键 2：向上翻页/滚动 */
#define KC_SCROLL_DOWN   0x09   /* 数字键 8：向下翻页/滚动 */
#define KC_HSCROLL_LEFT  0x05   /* 数字键 4：向左滑动 */
#define KC_HSCROLL_RIGHT 0x07   /* 数字键 6：向右滑动 */
#define KC_TOGGLE        0x3b   /* F1：长按切换鼠标模式(默认值，可在 App 里改成别的键) */

enum scroll_mode { MODE_WHEEL = 0, MODE_SWIPE = 1 };

/* ------------------------------------------------------------------ */
/* 全局配置                                                            */
/* ------------------------------------------------------------------ */
struct config {
    char kbd_name[64];
    char func_name[64];
    char uinput_path[128];
    char touch_name[64];       /* 空表示自动扫描 */
    int  move_step;
    int  move_interval_ms;
    int  scroll_step;
    int  scroll_interval_ms;   /* 长按慢速连续滑动的连发间隔 */
    enum scroll_mode scroll_mode;
    int  swipe_distance;       /* 短按(快速翻页)swipe 距离 */
    int  swipe_step_ms;
    int  scroll_hold_ms;       /* 长按判定阈值 */
    int  scroll_slow_distance; /* 长按慢速连续滑动时 swipe 每 tick 的距离 */
    int  glide_speed;          /* 长按连续慢拖的速度(像素/秒)，0=按 scroll_slow_distance/scroll_interval_ms 换算 */
    int  pinch_ms;             /* 1/3 键捏合缩放从开始到结束的时间 */
    int  fast_speed;           /* 单击 2/4/6/8 快速滑动的速度(像素/秒)，0=用 swipe_step_ms 原来的节奏 */
    int  toggle_hold_ms;       /* F1 长按判定阈值 */
    bool daemonize;
    char pidfile[256];
    char logfile[256];
    bool auto_rotate;          /* 是否根据当前屏幕旋转自动补偿方向 (默认开) */
    int  rotate_sign;          /* 补偿方向的符号，如果发现补偿反了改成 -1 即可，
                                   不需要改动其他逻辑/重新设计算法 (默认 1) */
    int  swipe_rotate_sign;    /* 同上，但专门给 swipe 翻页用——翻页走的是
                                   绝对坐标触摸事件，和方向键的相对指针事件
                                   是两条完全不同的系统路径，经过实测验证，
                                   两边需要的补偿方向并不需要一致，所以拆成
                                   独立的符号位，不共用 rotate_sign (默认 1)。 */
    int  rotate_poll_ms;       /* 检测屏幕旋转状态的最小轮询间隔 (默认 250ms) */
    int  rotate_base;          /* 校准用: 把检测到的旋转值先减去这个数再使用，
                                   用于"设备默认状态在系统里就不是 0"的情况
                                   (比如默认竖屏时系统实际报的不是 ROTATION_0)。
                                   默认 0，即完全信任检测值。 */
    char live_cfg[256];        /* 实时参数文件路径: 只要这个文件的修改时间变了
                                   就重新读取 moveStep/scrollStep/flip180 并
                                   立即生效，不需要重启守护进程、不需要 su。 */
    bool flip180;              /* 在 rotate_base 基础上再叠加 180 度。用于一键
                                   修正"方向整体反了"这种和旋转检测本身无关、
                                   设备默认方向定义就反的情况；App 里是一个开关，
                                   改了立即生效，不需要重新编译。 */
    char manual_rot_file[256]; /* 手动方向覆盖文件路径: 只包含一个整数
                                   (-1=自动跟随系统, 0/1/2/3=强制按该方向，
                                   含义与 Surface.ROTATION_* 一致)。App 在
                                   F1 切换鼠标模式弹出的方向确认框里，用户
                                   手动选择某个方向时写入这个文件，立即生效
                                   且完全跳过下面的自动检测(不再受检测误判
                                   影响)；写 -1 或不写(维持上次选择)则继续
                                   使用自动检测。 */
    bool auto_home_suspend;    /* 前台是桌面(Launcher)时自动隐藏(暂停)鼠标，离开桌面
                                   自动恢复。默认关，App 里有开关。 */
    int  home_poll_ms;         /* 检测前台是不是桌面的轮询间隔 (默认 1000ms) */
    /* 防抖(详见 km_debounce.h)。时间(deb_ms/ghost)在引擎里: g_deb_ms / g_deb_ghost_ms */
    bool deb_global;           /* 全局防抖: 鼠标关闭时也接管整个主键盘做防抖(需要独占键盘+克隆虚拟键盘转发) */
    bool deb_mouse;            /* 鼠标模式开启时，主键盘上所有按键(方向/确认/1·3/2468...)防抖 */
    bool deb_toggle;           /* 开关键(F1/组合键)防抖，鼠标关闭时也有效(只影响我们自己的判断，不拦截系统) */
    bool deb_all;              /* true = 所有应用都防抖；false = 只在 debApps 列表里的应用防抖 */
    bool dialer_allow;         /* 拨号应用里是否允许使用鼠标。false = 前台是拨号应用时自动关闭
                                   鼠标(数字键原样交给拨号应用)，离开后自动恢复。App 里有开关。 */
    bool auto_ime_suspend;     /* 点击输入框弹出输入法时，自动临时关闭鼠标
                                   模式(交还给输入法)，输入法收起后自动恢复。
                                   默认开。 */
    int  menu_hold_ms;         /* 长按菜单键 -> 最近任务 (0=关闭，默认 1500) */
    int  back_hold_ms;         /* 长按返回键 -> 结束前台应用 (0=关闭，默认 1500) */
    int  auto_menu_ms;         /* 拖动松手后多久自动右键弹出复制菜单 (0=关闭，默认 1000；触摸点击模式下不用) */
    bool touch_mode;           /* 触摸点击模式: 确认键/拖动改用虚拟触摸屏发手指事件(而不是鼠标左键) */
    int  drag_hold_ms;         /* 长按确认键 -> 进入拖动(锁住按下)，短按再松手 (0=关闭，默认 3000) */
    int  star_hold_ms;         /* 长按 * 键 -> 开关手电筒 (0=关闭，默认 2000) */
    int  star_code;            /* 额外指定 * 键的键码 (0=只认 55/522) */
    char torch_path[160];      /* 手电筒 sysfs 节点 (空=自动在 /sys/class/leds 里找) */
    int  torch_on_value;       /* 打开手电筒时写入的值 (<=0 表示用 max_brightness) */
    int  ime_poll_ms;          /* 检测输入法显示状态的轮询间隔 (默认 400ms)。
                                   这个检测点击输入框这个动作本身不产生任何
                                   物理按键事件，不能像旋转检测那样只在有按键
                                   按住时才轮询，必须独立于按键状态定期醒来看
                                   一眼，所以有自己独立的轮询间隔/开销，不和
                                   rotate_poll_ms 混用。 */
    int  ime_hide_confirm_ms;  /* 探测到输入法"没显示"之后，必须连续、不
                                   间断地保持这个状态达到这么多毫秒，才认为
                                   输入法真的收起了、恢复鼠标模式(默认
                                   2500ms)。有些输入法在正常打字过程中自己
                                   的窗口会频繁短暂闪烁，这个阈值就是用来
                                   滤掉这种误判的；如果某台设备上还是会在
                                   打字中途被误恢复，调大这个值即可，不用
                                   改代码。 */
    bool force_soft_kbd_when_off; /* 鼠标模式暂停/关闭时，自动打开系统的
                                   show_ime_with_hard_keyboard，让只要检测
                                   到实体键盘就拒绝进入软键盘/T9 模式的
                                   输入法(比如讯飞)能正常工作；鼠标模式恢复
                                   时自动关掉。默认开。 */
};

static struct config g_cfg;
static FILE *g_log = NULL;
static volatile sig_atomic_t g_running = 1;

/* 同时把日志写进系统 logcat(tag=keymouse)，这样 BootLive 抓的 logcat 里就能直接
 * 看到守护进程的判断过程。走 logd 的 /dev/socket/logdw 数据报协议，不依赖
 * liblog，静态编译也能用；失败就静默忽略。 */
static void logd_write(const char *msg) {
    static int fd = -2;
    if (fd == -2) {
        fd = socket(AF_UNIX, SOCK_DGRAM | SOCK_CLOEXEC, 0);
        if (fd >= 0) {
            struct sockaddr_un a;
            memset(&a, 0, sizeof(a));
            a.sun_family = AF_UNIX;
            snprintf(a.sun_path, sizeof(a.sun_path), "/dev/socket/logdw");
            if (connect(fd, (struct sockaddr *)&a, sizeof(a)) != 0) { close(fd); fd = -1; }
        }
    }
    if (fd < 0) return;
    unsigned char buf[1100];
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    uint16_t tid = (uint16_t)syscall(SYS_gettid);
    uint32_t sec = (uint32_t)ts.tv_sec, nsec = (uint32_t)ts.tv_nsec;
    size_t o = 0;
    buf[o++] = 0;                         /* LOG_ID_MAIN */
    memcpy(buf + o, &tid, 2);  o += 2;
    memcpy(buf + o, &sec, 4);  o += 4;
    memcpy(buf + o, &nsec, 4); o += 4;
    buf[o++] = 4;                         /* ANDROID_LOG_INFO */
    memcpy(buf + o, "keymouse", 9); o += 9;
    size_t ml = strlen(msg);
    if (ml > 900) ml = 900;
    memcpy(buf + o, msg, ml); o += ml;
    buf[o++] = 0;
    if (send(fd, buf, o, MSG_DONTWAIT) < 0) { /* ignore */ }
}

static void logmsg(const char *fmt, ...) {
    char line[1000];
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(line, sizeof(line), fmt, ap);
    va_end(ap);
    logd_write(line);
    if (!g_log) return;
    time_t t = time(NULL);
    struct tm tmv;
    localtime_r(&t, &tmv);
    fprintf(g_log, "[%02d:%02d:%02d] %s\n", tmv.tm_hour, tmv.tm_min, tmv.tm_sec, line);
    fflush(g_log);
}

/* ------------------------------------------------------------------ */
/* 工具函数                                                            */
/* ------------------------------------------------------------------ */

static long now_ms(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (long)ts.tv_sec * 1000L + ts.tv_nsec / 1000000L;
}

/* 在 /proc/bus/input/devices 中按设备名查找对应的 eventN 节点路径。
 * 找到则把 "/dev/input/eventN" 写入 out (大小 outsz)，返回 0；
 * 找不到返回 -1。 */
static int find_event_node_by_name(const char *want_name, char *out, size_t outsz) {
    FILE *f = fopen("/proc/bus/input/devices", "r");
    if (!f) return -1;

    char line[512];
    char cur_name[128] = "";
    bool name_matched = false;
    int ret = -1;

    while (fgets(line, sizeof(line), f)) {
        if (line[0] == 'I') {
            /* 新设备块开始，重置状态 */
            cur_name[0] = '\0';
            name_matched = false;
        } else if (line[0] == 'N') {
            /* N: Name="xxx" */
            char *p = strchr(line, '"');
            if (p) {
                char *q = strchr(p + 1, '"');
                if (q) {
                    size_t len = (size_t)(q - (p + 1));
                    if (len >= sizeof(cur_name)) len = sizeof(cur_name) - 1;
                    memcpy(cur_name, p + 1, len);
                    cur_name[len] = '\0';
                    name_matched = (strstr(cur_name, want_name) != NULL);
                }
            }
        } else if (line[0] == 'H' && name_matched) {
            /* H: Handlers=kbd event3 ... 查找 eventN token */
            char *p = strstr(line, "event");
            if (p) {
                int evnum = atoi(p + 5);
                snprintf(out, outsz, "/dev/input/event%d", evnum);
                ret = 0;
                name_matched = false; /* 已取到，避免同名多个设备时覆盖为最后一个 */
            }
        }
    }
    fclose(f);
    return ret;
}

/* 扫描所有 /dev/input/eventN，返回第一个具备 ABS_MT_POSITION_X 能力
 * 的设备节点 (用于自动探测触摸屏)，若指定了 name_hint 则优先匹配
 * 名称中包含该关键字的设备。 */
static int find_touchscreen_node(const char *name_hint, char *out, size_t outsz) {
    DIR *d = opendir("/dev/input");
    if (!d) return -1;
    struct dirent *ent;
    char best[300] = "";
    while ((ent = readdir(d)) != NULL) {
        if (strncmp(ent->d_name, "event", 5) != 0) continue;
        char path[300];
        snprintf(path, sizeof(path), "/dev/input/%s", ent->d_name);
        int fd = open(path, O_RDONLY | O_NONBLOCK);
        if (fd < 0) continue;

        unsigned long absbits[(ABS_MAX / (sizeof(unsigned long) * 8)) + 1];
        memset(absbits, 0, sizeof(absbits));
        if (ioctl(fd, EVIOCGBIT(EV_ABS, sizeof(absbits)), absbits) >= 0) {
            int idx = ABS_MT_POSITION_X / (sizeof(unsigned long) * 8);
            int bit = ABS_MT_POSITION_X % (sizeof(unsigned long) * 8);
            if (absbits[idx] & (1UL << bit)) {
                if (name_hint && name_hint[0]) {
                    char namebuf[128] = "";
                    ioctl(fd, EVIOCGNAME(sizeof(namebuf)), namebuf);
                    if (strstr(namebuf, name_hint)) {
                        snprintf(best, sizeof(best), "%s", path);
                        close(fd);
                        break;
                    }
                } else if (best[0] == '\0') {
                    snprintf(best, sizeof(best), "%s", path);
                }
            }
        }
        close(fd);
    }
    closedir(d);
    if (best[0] == '\0') return -1;
    snprintf(out, outsz, "%s", best);
    return 0;
}

static int query_axis_range(const char *dev_path, int axis, int *out_min, int *out_max) {
    int fd = open(dev_path, O_RDONLY | O_NONBLOCK);
    if (fd < 0) return -1;
    struct input_absinfo ai;
    int rc = ioctl(fd, EVIOCGABS(axis), &ai);
    close(fd);
    if (rc < 0) return -1;
    *out_min = ai.minimum;
    *out_max = ai.maximum;
    return 0;
}

static int open_uinput(const char *preferred_path) {
    const char *candidates[3];
    int n = 0;
    if (preferred_path && preferred_path[0]) candidates[n++] = preferred_path;
    candidates[n++] = "/dev/uinput";
    candidates[n++] = "/dev/input/uinput";
    for (int i = 0; i < n; i++) {
        int fd = open(candidates[i], O_WRONLY | O_NONBLOCK);
        if (fd >= 0) return fd;
    }
    return -1;
}

/* ------------------------------------------------------------------ */
/* 虚拟设备: 鼠标 / 触摸屏 / 按键透传键盘                              */
/* ------------------------------------------------------------------ */
static int g_mouse_fd = -1;
static int g_touch_fd = -1;
static int g_pass_fd  = -1;   /* 未被鼠标功能占用的按键(返回/菜单等)透传出口 */
static int g_touch_track_id = 0;
static int g_panel_w = 480, g_panel_h = 320; /* 触摸屏面板原始分辨率，出错时的默认值 */
static int g_cur_x, g_cur_y;                  /* 软件跟踪的虚拟光标位置 (仅 swipe 模式使用) */
static bool g_dot_hidden = false;   /* 用户选择不显示红点(只用系统指针本身) */
static int  g_ptrcolor = 0;         /* 1=鼠标模式开着时把系统指针改成粉色(实验功能) */
static bool g_ptr_changed = false;
static char g_flags_path[300] = "", g_ptr_orig_path[300] = "";
static long g_dot_last_notify = 0;            /* 上次发 dot_on 广播的时间 */
static void pos_publish(bool visible);        /* 定义在后面"光标位置->App红点"一节 */
static void notify_dot(bool on);
static void app_keepalive_kick(void);            /* 保证 App 保活服务在跑 */
static void write_state_file(void);
static void ptr_color_apply(bool want);
static bool dot_overlay_ok(void);                /* root 红点助手是否已接管画红点 */
static bool dot_helper_alive(void);               /* root 助手进程本身是否活着(心跳新鲜) */
static void send_tip_file(const char *kind, const char *arg);  /* 弹窗请求写文件交给助手画 */
static void dot_helper_ensure(void);
static bool g_ptr_used_real = false;              /* 最近一次 ptr_sync 是否用上了系统真实指针坐标 */
static long g_ptr_age_ms = -1;                    /* 指针坐标文件的年龄 */
static void ptr_sync(bool force);               /* 用系统真实鼠标指针坐标校正 g_cur */
static long now_ms(void);

static int create_mouse_device(int uifd) {
    if (ioctl(uifd, UI_SET_EVBIT, EV_KEY) < 0) return -1;
    ioctl(uifd, UI_SET_KEYBIT, BTN_LEFT);
    ioctl(uifd, UI_SET_KEYBIT, BTN_RIGHT);
    ioctl(uifd, UI_SET_KEYBIT, BTN_MIDDLE);

    if (ioctl(uifd, UI_SET_EVBIT, EV_REL) < 0) return -1;
    ioctl(uifd, UI_SET_RELBIT, REL_X);
    ioctl(uifd, UI_SET_RELBIT, REL_Y);
    ioctl(uifd, UI_SET_RELBIT, REL_WHEEL);
    ioctl(uifd, UI_SET_RELBIT, REL_HWHEEL);

    struct uinput_setup usetup;
    memset(&usetup, 0, sizeof(usetup));
    usetup.id.bustype = BUS_VIRTUAL;
    usetup.id.vendor  = 0x1234;
    usetup.id.product = 0x0001;
    usetup.id.version = 1;
    strncpy(usetup.name, "keymouse-virtual-mouse", sizeof(usetup.name) - 1);

    if (ioctl(uifd, UI_DEV_SETUP, &usetup) < 0) return -1;
    if (ioctl(uifd, UI_DEV_CREATE) < 0) return -1;
    return 0;
}

static int create_touch_device(int uifd, int w, int h) {
    if (ioctl(uifd, UI_SET_EVBIT, EV_KEY) < 0) return -1;
    ioctl(uifd, UI_SET_KEYBIT, BTN_TOUCH);

    if (ioctl(uifd, UI_SET_EVBIT, EV_ABS) < 0) return -1;
    ioctl(uifd, UI_SET_ABSBIT, ABS_MT_SLOT);
    ioctl(uifd, UI_SET_ABSBIT, ABS_MT_TRACKING_ID);
    ioctl(uifd, UI_SET_ABSBIT, ABS_MT_POSITION_X);
    ioctl(uifd, UI_SET_ABSBIT, ABS_MT_POSITION_Y);
    ioctl(uifd, UI_SET_PROPBIT, INPUT_PROP_DIRECT);

    struct uinput_setup usetup;
    memset(&usetup, 0, sizeof(usetup));
    usetup.id.bustype = BUS_VIRTUAL;
    usetup.id.vendor  = 0x1234;
    usetup.id.product = 0x0002;
    usetup.id.version = 1;
    strncpy(usetup.name, "keymouse-virtual-touch", sizeof(usetup.name) - 1);
    if (ioctl(uifd, UI_DEV_SETUP, &usetup) < 0) return -1;

    struct uinput_abs_setup slot_setup = {0};
    slot_setup.code = ABS_MT_SLOT;
    slot_setup.absinfo.minimum = 0;
    slot_setup.absinfo.maximum = 4;
    ioctl(uifd, UI_ABS_SETUP, &slot_setup);

    struct uinput_abs_setup track_setup = {0};
    track_setup.code = ABS_MT_TRACKING_ID;
    track_setup.absinfo.minimum = 0;
    track_setup.absinfo.maximum = 65535;
    ioctl(uifd, UI_ABS_SETUP, &track_setup);

    struct uinput_abs_setup x_setup = {0};
    x_setup.code = ABS_MT_POSITION_X;
    x_setup.absinfo.minimum = 0;
    x_setup.absinfo.maximum = w - 1;
    ioctl(uifd, UI_ABS_SETUP, &x_setup);

    struct uinput_abs_setup y_setup = {0};
    y_setup.code = ABS_MT_POSITION_Y;
    y_setup.absinfo.minimum = 0;
    y_setup.absinfo.maximum = h - 1;
    ioctl(uifd, UI_ABS_SETUP, &y_setup);

    if (ioctl(uifd, UI_DEV_CREATE) < 0) return -1;
    return 0;
}

/* 未被鼠标功能占用的按键(返回键/菜单键等)透传设备：注册全量 KEY_*
 * 位，这样不管物理上报的具体键码是什么，都能原样转发出去，不需要
 * 事先精确知道"菜单键"到底是哪个 keycode。 */
static int create_passthrough_device(int uifd) {
    if (ioctl(uifd, UI_SET_EVBIT, EV_KEY) < 0) return -1;
    for (int k = 1; k <= KEY_MAX; k++) {
        /* 不注册字母键(Q-P / A-L / Z-M)。Android 的 EventHub 只要看到设备带
         * KEY_Q 就把它判成"字母键盘(QWERTY)"，输入法因此认为接着实体键盘
         * 而拒绝进 T9。这个设备只需要转发返回/菜单/主页/数字键等非字母键，
         * 去掉字母键后它在系统眼里和 sprd-keypad 一样是非字母键盘。 */
        if ((k >= KEY_Q && k <= KEY_P) || (k >= KEY_A && k <= KEY_L) ||
            (k >= KEY_Z && k <= KEY_M))
            continue;
        ioctl(uifd, UI_SET_KEYBIT, k);
    }

    struct uinput_setup usetup;
    memset(&usetup, 0, sizeof(usetup));
    usetup.id.bustype = BUS_VIRTUAL;
    usetup.id.vendor  = 0x1234;
    usetup.id.product = 0x0003;
    usetup.id.version = 1;
    strncpy(usetup.name, "keymouse-virtual-passthrough", sizeof(usetup.name) - 1);

    if (ioctl(uifd, UI_DEV_SETUP, &usetup) < 0) return -1;
    if (ioctl(uifd, UI_DEV_CREATE) < 0) return -1;
    return 0;
}

/* 克隆物理主键盘: 名称/总线/厂商/产品/版本和支持的按键位全部照抄。这样系统给克隆体套用的
 * 按键布局(.kl/.kcm/.idc)和原设备完全一样，输入法/T9 看到的键盘类型也一样——全局防抖
 * 要长期顶替原设备转发按键，必须和原设备"长得一模一样"，否则 T9 输入法可能认错键盘。 */
static int create_clone_device(int uifd, int srcfd) {
    unsigned char bits[KEY_MAX / 8 + 1];
    memset(bits, 0, sizeof(bits));
    if (srcfd < 0 || ioctl(srcfd, EVIOCGBIT(EV_KEY, sizeof(bits)), bits) < 0) return -1;
    if (ioctl(uifd, UI_SET_EVBIT, EV_KEY) < 0) return -1;
    for (int k = 1; k <= KEY_MAX; k++)
        if (bits[k / 8] & (1 << (k % 8))) ioctl(uifd, UI_SET_KEYBIT, k);

    struct uinput_setup usetup;
    memset(&usetup, 0, sizeof(usetup));
    struct input_id id;
    memset(&id, 0, sizeof(id));
    if (ioctl(srcfd, EVIOCGID, &id) == 0) usetup.id = id;
    else { usetup.id.bustype = BUS_VIRTUAL; usetup.id.vendor = 0x1234; usetup.id.product = 0x0004; usetup.id.version = 1; }
    char nm[80];
    memset(nm, 0, sizeof(nm));
    if (ioctl(srcfd, EVIOCGNAME(sizeof(nm) - 1), nm) < 0 || !nm[0]) snprintf(nm, sizeof(nm), "keymouse-virtual-keypad");
    strncpy(usetup.name, nm, sizeof(usetup.name) - 1);
    if (ioctl(uifd, UI_DEV_SETUP, &usetup) < 0) return -1;
    if (ioctl(uifd, UI_DEV_CREATE) < 0) return -1;
    return 0;
}

static void emit(int fd, int type, int code, int value) {
    struct input_event ev;
    memset(&ev, 0, sizeof(ev));
    ev.type = type;
    ev.code = code;
    ev.value = value;
    ssize_t wr = write(fd, &ev, sizeof(ev));
    (void)wr;
}

static bool g_touch_down = false;      /* 触摸点击模式: 虚拟手指当前是否按在屏幕上 */
static int  g_touch_start_x = 0, g_touch_start_y = 0;
static void touch_down_now(void);
static void touch_up_now(void);
static void gesture_cancel_all(void);   /* 定义在后面"触摸手势"一节 */

static void mouse_move(int dx, int dy) {
    if (g_touch_down && g_touch_fd >= 0) {
        /* 手指按着: 光标移动改成手指移动(拖选文字/拖选区把手/拖图标)，系统指针先不动，
         * 抬起时再一次性补上位移，避免鼠标和触摸两路事件同时进系统互相打架。 */
        g_cur_x += dx; g_cur_y += dy;
        if (g_cur_x < 0) g_cur_x = 0;
        if (g_cur_y < 0) g_cur_y = 0;
        if (g_cur_x >= g_panel_w) g_cur_x = g_panel_w - 1;
        if (g_cur_y >= g_panel_h) g_cur_y = g_panel_h - 1;
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, g_cur_x);
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_Y, g_cur_y);
        emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
        pos_publish(true);
        return;
    }
    if (dx) emit(g_mouse_fd, EV_REL, REL_X, dx);
    if (dy) emit(g_mouse_fd, EV_REL, REL_Y, dy);
    emit(g_mouse_fd, EV_SYN, SYN_REPORT, 0);

    g_cur_x += dx; g_cur_y += dy;
    if (g_cur_x < 0) g_cur_x = 0;
    if (g_cur_y < 0) g_cur_y = 0;
    if (g_cur_x >= g_panel_w) g_cur_x = g_panel_w - 1;
    if (g_cur_y >= g_panel_h) g_cur_y = g_panel_h - 1;
    pos_publish(true);
    /* 红点浮层在 App 进程里，进程被回收后红点就没了；移动时若超过一分钟没补发过
     * dot_on，就补发一次把它拉起来(广播本身很轻，且一分钟最多一次)。 */
    if (now_ms() - g_dot_last_notify > 60000) notify_dot(true);
}

static void mouse_click(int down) {
    if (down && g_cfg.touch_mode && g_touch_fd >= 0) { touch_down_now(); return; }
    if (!down && g_touch_down) { touch_up_now(); return; }
    pos_publish(true);
    emit(g_mouse_fd, EV_KEY, BTN_LEFT, down ? 1 : 0);
    emit(g_mouse_fd, EV_SYN, SYN_REPORT, 0);
}

/* 触摸点击模式: 确认键按下 = 手指按下，抬起 = 手指抬起；按住不放系统会当成长按
 * (网页里选中一个词、出选区把手和工具栏)，按住再用方向键移动就是手指拖动。 */
static void touch_down_now(void) {
    ptr_sync(true);                       /* 起点 = 系统里指针此刻的真实位置 */
    pos_publish(true);
    g_touch_start_x = g_cur_x; g_touch_start_y = g_cur_y;
    int tid = g_touch_track_id++;
    emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 0);
    emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, tid);
    emit(g_touch_fd, EV_KEY, BTN_TOUCH, 1);
    emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, g_cur_x);
    emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_Y, g_cur_y);
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
    g_touch_down = true;
}

static void touch_up_now(void) {
    emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, -1);
    emit(g_touch_fd, EV_KEY, BTN_TOUCH, 0);
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
    g_touch_down = false;
    int dx = g_cur_x - g_touch_start_x, dy = g_cur_y - g_touch_start_y;
    if (dx || dy) {                       /* 把系统鼠标指针补移到手指抬起的位置 */
        if (dx) emit(g_mouse_fd, EV_REL, REL_X, dx);
        if (dy) emit(g_mouse_fd, EV_REL, REL_Y, dy);
        emit(g_mouse_fd, EV_SYN, SYN_REPORT, 0);
    }
}

static void mouse_wheel(int steps /* 正数向上, 负数向下 */) {
    emit(g_mouse_fd, EV_REL, REL_WHEEL, steps);
    emit(g_mouse_fd, EV_SYN, SYN_REPORT, 0);
}

static void mouse_hwheel(int steps /* 正数向右, 负数向左 */) {
    emit(g_mouse_fd, EV_REL, REL_HWHEEL, steps);
    emit(g_mouse_fd, EV_SYN, SYN_REPORT, 0);
}

/* 在虚拟触摸屏上合成一次"从当前光标位置拖动 (dx,dy) 像素"的手势。
 * 该函数会阻塞 (swipe_step_ms * 步数) 的时间——调用者应保证这个
 * 耗时远小于按键连发间隔，属于短促操作。 */
static int g_swipe_dur_ms = 0;   /* >0: 本次滑动总时长(ms)，由 do_axis_fast 按"速度"设置算出 */

static void touch_swipe(int dx, int dy) {
    if (g_touch_fd < 0) return;
    ptr_sync(true);   /* 滑动起点 = 系统里鼠标指针此刻的真实位置 */
    pos_publish(true);
    int steps = 6;
    int step_ms = g_cfg.swipe_step_ms;
    if (g_swipe_dur_ms > 0) {
        steps = g_swipe_dur_ms / 16;
        if (steps < 6) steps = 6;
        if (steps > 40) steps = 40;
        step_ms = g_swipe_dur_ms / steps;
        if (step_ms < 1) step_ms = 1;
    }
    int start_x = g_cur_x, start_y = g_cur_y;
    int end_x = start_x + dx;
    int end_y = start_y + dy;
    if (end_x < 0) end_x = 0;
    if (end_x >= g_panel_w) end_x = g_panel_w - 1;
    if (end_y < 0) end_y = 0;
    if (end_y >= g_panel_h) end_y = g_panel_h - 1;

    {
        static int s_swipe_n = 0;
        s_swipe_n++;
        if (s_swipe_n <= 30 || s_swipe_n % 20 == 0)
            logmsg("滑动起点: 面板(%d,%d) -> 终点(%d,%d) 起点来源=%s 指针文件年龄=%ldms (第%d次)",
                   start_x, start_y, end_x, end_y, g_ptr_used_real ? "系统真实指针" : "估算坐标(没读到真实指针)",
                   g_ptr_age_ms, s_swipe_n);
    }
    int tid = g_touch_track_id++;

    emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 0);
    emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, tid);
    emit(g_touch_fd, EV_KEY, BTN_TOUCH, 1);
    emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, start_x);
    emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_Y, start_y);
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);

    for (int i = 1; i <= steps; i++) {
        struct timespec ts = { step_ms / 1000,
                                (step_ms % 1000) * 1000000L };
        nanosleep(&ts, NULL);
        int x = start_x + (end_x - start_x) * i / steps;
        int y = start_y + (end_y - start_y) * i / steps;
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, x);
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_Y, y);
        emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
    }

    emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, -1);
    emit(g_touch_fd, EV_KEY, BTN_TOUCH, 0);
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
}

static void destroy_uinput_devices(void) {
    if (g_mouse_fd >= 0) {
        ioctl(g_mouse_fd, UI_DEV_DESTROY);
        close(g_mouse_fd);
        g_mouse_fd = -1;
    }
    if (g_touch_fd >= 0) {
        ioctl(g_touch_fd, UI_DEV_DESTROY);
        close(g_touch_fd);
        g_touch_fd = -1;
    }
    if (g_pass_fd >= 0) {
        ioctl(g_pass_fd, UI_DEV_DESTROY);
        close(g_pass_fd);
        g_pass_fd = -1;
    }
}

/* ------------------------------------------------------------------ */
/* 光标/滑动起点位置 -> App 红点                                        */
/* ------------------------------------------------------------------ */
/* swipe 翻页(2/4/6/8)是从 g_cur_x/g_cur_y 这个位置起手的，用户看不见，只能猜。
 * 这里把它写进 App 私有目录里一个固定宽度的小文件，App 的红点浮层按它的内容
 * 和修改时间画点: "状态 x y 面板宽 面板高"，状态 1=显示 0=隐藏。每次光标移动/
 * 点击/滑动都会重写一次(修改时间就是"最近一次操作"，App 超过 15 秒没更新就把点
 * 收起来，跟安卓光标空闲约 15 秒自动淡出同步)。固定宽度是为了 pwrite 覆盖写不留残字。 */
static int  g_pos_fd = -1;

static void pos_open(void) {
    if (g_pos_fd >= 0) return;
    char dir[256] = "";
    const char *src = g_cfg.logfile[0] ? g_cfg.logfile : g_cfg.pidfile;
    if (src[0]) {
        snprintf(dir, sizeof(dir), "%s", src);
        char *sl = strrchr(dir, '/');
        if (sl) *sl = '\0'; else dir[0] = '\0';
    }
    if (!dir[0]) return;
    char path[300];
    snprintf(path, sizeof(path), "%s/keymouse_pos", dir);
    g_pos_fd = open(path, O_RDWR | O_CREAT | O_CLOEXEC, 0666);
    if (g_pos_fd >= 0) fchmod(g_pos_fd, 0666);   /* umask(027) 会把它变成 0640，App 读不了 */
}

static void pos_publish(bool visible) {
    if (g_pos_fd < 0) return;
    char buf[48];
    if (g_dot_hidden) visible = false;
    int n = snprintf(buf, sizeof(buf), "%d %05d %05d %05d %05d\n",
                     visible ? 1 : 0, g_cur_x, g_cur_y, g_panel_w, g_panel_h);
    if (n > 0) { ssize_t r = pwrite(g_pos_fd, buf, (size_t)n, 0); (void)r; }
}

/* 只管红点的显示/隐藏，不弹提示窗。App 那边靠这个广播启动/停止红点浮层；
 * 红点所在进程万一被系统回收，下面的"每分钟补发一次"也会把它重新拉起来。 */
static void notify_dot(bool on) {
    /* root 助手已经接管画红点(ov=1)时，App 进程没必要为此被拉起来(它还会被
     * 系统内存清理杀掉)；红点的显隐由 keymouse_pos 里的状态位驱动。 */
    char cmd[300];
    snprintf(cmd, sizeof(cmd),
             "am broadcast --receiver-foreground -a com.keymouse.tool.TOGGLE "
             "-n com.keymouse.tool/.ToggleReceiver "
             "--es tip %s >/dev/null 2>&1 &", on ? "dot_on" : "dot_off");
    int rc = system(cmd);
    (void)rc;
    g_dot_last_notify = now_ms();
}

/* ------------------------------------------------------------------ */
/* App 端通知 (开关小提示 Toast)                                       */
/* ------------------------------------------------------------------ */
/* 本进程已经是 su 拉起的 root 进程，直接调用 am broadcast 即可，不需要
 * 再套一层 su -c。显式指定组件 (-n) 避免隐式广播在高版本 Android 上
 * 被限制；丢到后台执行(&)并吞掉输出，避免阻塞主循环。 */
static void notify_app(bool enabled) {
    /* 需求(2026-10-04 起): 开、关两种状态都要弹提示窗——关闭时弹"按键鼠标已关闭"。
     * 输入法弹出时的自动暂停/恢复调用 disable/enable_mouse_mode(false)，不会走到这里，
     * 仍然是静默的，避免每点一次输入框就弹一次窗。
     *
     * 需求(2026-10-04 第二轮): 这个提示窗之前反复反馈"只有在 keymouse 自己
     * 界面里才弹得出来，切到别的 App(包括手电筒/最近任务/强制关闭那几个
     * 提示)就没反应"。根因是以前全靠 am broadcast 拉起 App 的
     * BroadcastReceiver 进程画悬浮窗，那个进程寿命极短，常来不及真正上屏
     * 就被系统回收，App 自己在前台时之所以"看起来正常"只是因为进程本来
     * 就活着、不会被马上收掉。现在优先写文件请求交给常驻的 root 助手
     * (KmDot，见 native/kmt/KmDot.java)画，它不是 App 进程，不受这个影响；
     * 只有助手还没起来/没活着(心跳文件不新鲜，比如刚开机那几秒)时才退回
     * 旧的 am broadcast 兜底。 */
    char cmd[300];
    snprintf(cmd, sizeof(cmd),
             "am broadcast --receiver-foreground -a com.keymouse.tool.TOGGLE "
             "-n com.keymouse.tool/.ToggleReceiver "
             "--ez enabled %s >/dev/null 2>&1 &",
             enabled ? "true" : "false");
    int rc = system(cmd);
    (void)rc;
}

/* 屏幕底部气泡提示 (菜单/手电筒等长按动作)。tip/arg 只用我们自己写死的
 * 固定字符串或 killfg.sh 校验过的包名，不接收外部输入。显示文字和语言
 * (en/ru/ja/zh) 都由 root 助手(KmDot)按 App 的语言设置决定，见
 * native/kmt/KmDot.java 的 handleTip()。
 * 和 notify_app() 同样的道理: 优先写文件交给常驻助手画，只有助手没活着
 * 时才退回旧的 am broadcast 兜底。 */
static void notify_tip(const char *tip) {
    char cmd[256];
    snprintf(cmd, sizeof(cmd),
             "am broadcast --receiver-foreground -a com.keymouse.tool.TOGGLE "
             "-n com.keymouse.tool/.ToggleReceiver "
             "--es tip %s >/dev/null 2>&1 &", tip);
    int rc = system(cmd);
    (void)rc;
}

#define LEARN_WINDOW_MS 8000   /* 所有"按键学习"(开关键/中间键)统一的等待时间 */

/* 带参数的提示: 给 App 的 TipBubble 传一个显示用的文字(kind=keyset 时 arg 是键名) */
static void notify_tip_arg(const char *tip, const char *arg) {
    char safe[64]; size_t n = 0;
    for (const char *q = arg; *q && n + 1 < sizeof(safe); q++) {
        unsigned char ch = (unsigned char)*q;
        if ((ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || ch == '+' || ch == '-' || ch == '_' || ch == '(' || ch == ')' || ch == '*' || ch == '#' || ch == '.')
            safe[n++] = (char)ch;
        else if (ch == ' ') safe[n++] = '_';
    }
    safe[n] = 0;
    char cmd[320];
    snprintf(cmd, sizeof(cmd),
             "am broadcast --receiver-foreground -a com.keymouse.tool.TOGGLE "
             "-n com.keymouse.tool/.ToggleReceiver "
             "--es tip %s --es arg '%s' >/dev/null 2>&1 &", tip, safe);
    int rc = system(cmd);
    (void)rc;
}

static void key_display_name(int c, char *out, size_t n) {
    if (c >= 0x3b && c <= 0x44) snprintf(out, n, "F%d", c - 0x3b + 1);
    else if (c == 0x57) snprintf(out, n, "F11");
    else if (c == 0x58) snprintf(out, n, "F12");
    else if (c == 0x72) snprintf(out, n, "Volume-");
    else if (c == 0x73) snprintf(out, n, "Volume+");
    else if (c >= 2 && c <= 10) snprintf(out, n, "%d", c - 1);
    else if (c == 11) snprintf(out, n, "0");
    else if (c == 0x37) snprintf(out, n, "*");
    else if (c == 0x1c) snprintf(out, n, "Enter(28)");
    else if (c == 0x60) snprintf(out, n, "KPEnter(96)");
    else if (c == 0x160 || c == 0x161) snprintf(out, n, "Center(%d)", c);
    else snprintf(out, n, "key_%d", c);
}

static void learn_done_tip(int c) {
    char nm[32];
    key_display_name(c, nm, sizeof(nm));
    notify_tip_arg("keyset", nm);
}

/* 需求: 鼠标模式暂停/关闭的时候(不管是手动 F1 关的，还是被输入法弹出
 * 自动暂停的)，希望能把"实体键盘"关掉——具体起因是这台设备上的讯飞
 * 输入法，只要系统认为"有实体键盘接着"，就会拒绝走它自己的 T9 软键盘
 * 处理逻辑，数字键按了跟没按一样；只有"实体键盘"在系统层面被认为不存在
 * 的时候，讯飞才会恢复正常的 T9 打字。
 *
 * 这里没有真的去禁用/隐藏这个输入设备本身(那样会连数字键的原始按键
 * 事件都发不出去，反而会让输入法一起瞎了，比现在还糟)。改成调整
 * Android 自己那个专门管这件事的系统设置:
 * Settings.Secure.show_ime_with_hard_keyboard——这个设置本来的作用就是
 * "即使检测到有实体键盘接着，也强制走软键盘"，跟你描述的"关闭实体键盘、
 * T9 才正常"效果应该是一致的，而且是标准、可逆、不影响任何按键实际
 * 送达的做法。鼠标模式一暂停/关闭就打开这个开关，一恢复就关掉(此时
 * 键盘反正被我们 grab 着，输入法看不到原始按键，这个设置打不打开都
 * 没影响，关掉只是图个"状态复位"干净)。
 *
 * 心里没底的地方: 这是我按 Android 标准 API 猜的最常见机制，不确定这台
 * 设备的定制 ROM / 这个版本的讯飞输入法是不是真的看这个设置来决定要不要
 * 进 T9 模式。如果装上之后现象没变化，麻烦告诉我你平时是怎么手动"关闭
 * 实体键盘"让 T9 恢复正常的(哪个设置里的哪个开关，或者用的什么工具)，
 * 我照着你实际用的那个机制换一种实现。 */
static void set_show_ime_with_hard_keyboard(bool force_soft) {
    /* settings put 每次都会拉起一个完整的 Java 进程，在这台内存吃紧的机器上
     * 代价不小。目标值没变就不再重复执行。 */
    static int s_last = -1;
    if (s_last == (force_soft ? 1 : 0)) return;
    s_last = force_soft ? 1 : 0;
    char cmd[160];
    snprintf(cmd, sizeof(cmd),
             "settings put secure show_ime_with_hard_keyboard %d >/dev/null 2>&1",
             force_soft ? 1 : 0);
    int rc = system(cmd);
    logmsg("尝试%s强制软键盘(show_ime_with_hard_keyboard=%d)，system() 返回值=%d",
           force_soft ? "打开" : "关闭", force_soft ? 1 : 0, rc);
}

/* ------------------------------------------------------------------ */
/* 按键状态机                                                          */
/* ------------------------------------------------------------------ */
static bool g_enabled = false;      /* F1 全局开关状态 */
static int  g_toggle_code = KC_TOGGLE;   /* 长按切换鼠标模式的键码，默认 F1 */
static bool g_learn = false;             /* 学习模式: 下一个按下的键会成为开关键 */
static long g_learn_deadline = 0;
static char g_cmd_path[300] = "", g_state_path[300] = "", g_togkey_path[300] = "";
static int  g_cmd_pipe[2] = { -1, -1 };
static int  g_cmd_inotify = -1;        /* inotify 监听 keymouse_cmd: App 写完文件立刻生效，不用等 su 起进程发信号 */
static int  g_learn_swallow = -1;      /* 学习到的键如果还按着，它的松开/连发事件要吞掉，免得被当成别的操作 */
static bool g_auto_ime_suspended = false; /* true = 当前的"关闭"是我们因为
                                              输入法弹出自动做的，不是用户
                                              按 F1 手动关的 (定义提前到这里，
                                              好让 f1_poll 等更早的函数也能
                                              引用；真正的读写逻辑在后面
                                              "输入法自动让出控制权"一节) */
static long g_ime_hidden_since_ms = -1; /* 同上提前声明，供 f1_poll 复位；
                                            -1 表示当前不处于"持续未显示"
                                            的观察窗口内 */
static bool g_auto_home_suspended = false; /* true = 当前的"关闭"是因为前台是桌面自动做的 */
static bool g_home_manual_override = false; /* 用户在桌面上手动按 F1 开启了鼠标：
                                                离开桌面之前不再自动隐藏 */
/* App 里\"鼠标隐藏应用列表\"勾选的应用包名(空格分隔)，来自实时参数文件的 hideApps= 行。
 * 前台应用在这个列表里就自动关闭鼠标，离开自动恢复。桌面/拨号应用/输入法这三类
 * 仍走各自的系统自动识别(不在这个列表里)。 */
static char g_hide_apps[4096] = "";
static int  g_fg_custom = -1;               /* 前台是否在隐藏列表里: -1 未知 0 否 1 是 */
/* "手动优先"只对手动开鼠标时所在的那个应用有效: 切到别的应用就作废。
 * 以前只有"前台不在隐藏列表"才会清除；桌面/eka2l1/keymouse 全都在列表里时标记永远不清，
 * 表现就是"进了 eka2l1 鼠标不会被关/隐藏"。
 * g_ovr_pkg 为空表示还没绑定应用：等第一次"在手动开鼠标之后才开始的"探测结果来绑定
 * (避免用手动开鼠标之前就启动的旧探测结果误绑)。 */
static char g_fg_pkg[200] = "";             /* 最近一次探测到的前台包名 */
static long g_fg_probe_started_ms = 0;      /* 当前/最近一次探测启动时刻 */
static long g_ovr_set_ms = 0;               /* 手动优先标记设置时刻 */
static char g_ovr_pkg[200] = "";            /* 手动优先绑定的应用包名("" = 尚未绑定) */
static void set_manual_override(void) {
    g_home_manual_override = true;
    g_ovr_set_ms = now_ms();
    g_ovr_pkg[0] = '\0';
}
/* 防抖: 只在这些应用里生效(deb_all=false 时)，来自实时参数文件的 debApps= 行(空格分隔包名) */
static char g_deb_apps[4096] = "";
static int  g_fg_deb = -1;                  /* 前台是否在防抖应用列表里: -1 未知 0 否 1 是 */
static bool g_deb_global_active = false;    /* 全局防抖当前是否真的在运行(已独占键盘+克隆键盘就绪) */
static long g_deb_fail_until = 0;
static bool g_raw_down[DEB_MAXKEY];         /* 主键盘上物理按着的键(用来决定什么时候才能安全地切换独占状态) */
static int  g_raw_down_cnt = 0;
static long g_raw_last_ms = 0;              /* 主键盘最近一次事件的时刻(防止丢了"松开"事件导致永远认为有键按着) */
/* 防抖的按键表: 只有这里打勾的键才会被防抖(按键码是 Linux 原始扫描码)。来自实时参数文件的
 * debKeys= 行(形如 "2:1:1,3:1:2,227:0:*": 键码:是否防抖[:显示名])。方向键/确认键默认不在表里:
 * 它们是鼠标移动/点击用的，被防抖延迟会让指针发飘、也没法快速双击。 */
static bool g_deb_key[DEB_MAXKEY];
/* 同一个物理键在不同机型上可能上报不同键码，成组处理: 勾选其中一个，整组一起生效 */
static void deb_key_set(int code, bool on) {
    if (code <= 0 || code >= DEB_MAXKEY) return;
    g_deb_key[code] = on;
    if (code == 55 || code == 227 || code == 0x20a) {           /* * 键 */
        g_deb_key[55] = g_deb_key[227] = g_deb_key[0x20a] = on;
    } else if (code == 228 || code == 0x20b) {                  /* # 键 */
        g_deb_key[228] = g_deb_key[0x20b] = on;
    } else if (code >= 2 && code <= 11) {                       /* 数字键 1..9,0 对应 KEY_NUMERIC_x */
        int n = (code == 11) ? 0 : code - 1;
        g_deb_key[0x200 + n] = on;
    } else if (code >= 0x200 && code <= 0x209) {
        int n = code - 0x200;
        g_deb_key[n == 0 ? 11 : n + 1] = on;
    }
}
static void deb_keys_default(void) {
    memset(g_deb_key, 0, sizeof(g_deb_key));
    for (int c = 2; c <= 11; c++) deb_key_set(c, true);          /* 0-9 */
    deb_key_set(227, true);                                      /* * */
    deb_key_set(228, true);                                      /* # */
}

static int  g_fg_dialer = -1;               /* 前台是否拨号应用(含通话界面): -1 未知 0 否 1 是 */
static int  g_fg_home = -1;                 /* 前台是否桌面: -1 未知 0 否 1 是 */
static int  g_kbd_fd = -1;
static int  g_func_fd = -1;
static bool g_same_device = false;  /* kbd/func 落在同一节点的极端情况 */

static bool held_up, held_down, held_left, held_right;
static long next_move_due = 0;

/* F1 长按检测：按住不松手，一到阈值就立刻切换（不必等松开） */
static long g_f1_down_ms = -1;
static bool g_f1_fired = false;    /* 本次按住是否已经触发过切换 */
/* 实测反馈: 长按 F1 关闭鼠标"有时候关不掉"——日志显示已经 DISABLED，
 * 但方向键马上又能唤醒鼠标。根因大概率是这颗按键本身的物理/电气抖动
 * (弹片式按键很常见): 一次按压在电平上可能不是干净的一次 1->0->1，
 * 而是短时间内出现好几次抖动沿。之前每来一次 down 沿都无条件重置
 * g_f1_down_ms/g_f1_fired，如果用户手指按住的时间明显长于
 * toggle_hold_ms(默认500ms)，中途一次抖动重新起算计时，仍然会在
 * 用户松手前再次攒够时长——于是同一次"长按"里触发了两次切换
 * (关->开)，最终停在"开"，跟用户看到的"日志说关了，但马上又能用"
 * 完全吻合。加一个几十毫秒的消抖窗口，短时间内的重复沿直接忽略，
 * 只认第一条。 */
#define F1_DEBOUNCE_MS 150

/* 开关键(组合键): 1~TK_MAX 个键，全部同时按住并保持 toggle_hold_ms 才切换(只设一个键就是单键)。
 * 保存在 keymouse_toggle_keys (空格分隔的键码)；老版本的 keymouse_toggle_key / _key2 只在
 * 新文件不存在时读一次，用来平滑升级。 */
#define TK_MAX 4
static int  g_tk_code[TK_MAX] = { KC_TOGGLE, 0, 0, 0 };
static int  g_tk_n = 1;
static bool g_tk_dn[TK_MAX];                    /* 各开关键当前是否按住 */
static long g_tk_last_edge[TK_MAX] = { -1000000, -1000000, -1000000, -1000000 };
static long g_tk_down_edge[TK_MAX];
static int  g_learn_slot = 1;                   /* 学习模式: 1=学开关(组合)键 3=学中间键 */
static int  g_lc_code[TK_MAX];                  /* 开关键学习: 已收集到的键 */
static bool g_lc_dn[TK_MAX];
static int  g_lc_n = 0;
static bool g_confirm_swallow = false;          /* 中间键属于开关组合键时，这次按下被组合键吞掉 */
static char g_togkey2_path[300] = "";
static char g_togkeys_path[300] = "";
static int tk_slot(int code) {
    for (int i = 0; i < g_tk_n; i++) if (g_tk_code[i] == code) return i;
    return -1;
}
/* 自定义中间键(按键映射): App 里"设置中间键"后学到的键码，存在 keymouse_confirm_key。
 * 0 = 未设置(只用内置的 0x161 + Enter/KPEnter/OK 别名)。 */
static int  g_confirm_custom = 0;
static char g_confkey_path[300] = "";
/* 锁屏: App 里的开关 (keymouse_lock.cfg 的 lockAllow)，默认 0 = 锁屏界面不启用鼠标 */
static bool g_cfg_lock_allow = false;
static bool g_auto_lock_suspended = false;      /* 当前的"关闭"是因为锁屏自动做的 */
static bool lock_blocks_enable(bool manual);
static void chord_center_cleanup(void);

/* 翻页(滚动)四个方向的状态机：短按=松开时补一次"快速翻页"，
 * 长按(超过 scroll_hold_ms)=进入持续的"慢速连续滑动"，松开即停。 */
typedef struct {
    bool held;          /* 物理按键当前是否按住 */
    bool active;        /* 是否已经进入长按慢速连续模式 */
    long press_start;   /* 按下时刻 (ms) */
    long next_due;      /* 下一次慢速 tick 的到期时刻 (ms) */
    int  dx, dy;         /* 方向单位向量 (-1/0/+1) */
    bool up_pending;    /* 收到了松开信号，但还在防抖观察期(期间又按下 = 触点抖动) */
    long up_time;       /* 松开信号到达的时刻 */
    long up_due;        /* 观察期结束时刻: 到点仍没再按下才算真松开 */
} scroll_axis_t;

/* 2/4/6/8 防抖(触点抖动过滤)。实测日志里这台机器的 # 键一次按压会冒出
 * 5~25ms 间隔的 松开/按下 毛刺，单次误触脉冲最短 5~15ms，而真人按键一次至少约
 * 90ms、两次点按之间至少隔 150ms 以上。所以:
 *   - 松开信号要"持续 SCROLL_DEBOUNCE_MS 没再按下"才算真松开；观察期内又按下就当成
 *     一直按着(长按的慢拖不会被抖断，也不会因此多触发一次快速翻页)；
 *   - 整次按下不到 SCROLL_MIN_PRESS_MS 就松开，当成毛刺丢掉。
 * 只对 2/4/6/8 生效；时间远小于 0.8 秒，不会吞掉正常的连续点按。 */
/* 2/4/6/8 自己这一层的防抖/最短按压现在统一交给 km_debounce.h 引擎(防抖设置页可调)，
 * 这里置 0 = 直通，避免松开被延迟两次。(引擎对应\"鼠标操作防抖\"开关) */
#define SCROLL_DEBOUNCE_MS  0
#define SCROLL_MIN_PRESS_MS 0

/* 2/4/6/8 长按冷却: 这台机器按键质量差，长按过程中触点会抖动(松开-按下)，
 * 抖动后立刻重新进入"慢速连续滑动"会显得忽快忽慢。现在一次长按(连续慢拖)结束后，
 * 进入 SCROLL_COOLDOWN_MS 的冷却期: 冷却期内不会重新进入长按；冷却期内按下的键
 * 如果一直按着，冷却一结束就自动接上长按，不用松手重按。
 * 只管"长按"——短按(快速翻页)、其它按键、开关键(F1/组合键)都不受冷却影响。 */
#define SCROLL_COOLDOWN_MS 1000
static long g_scroll_cool_until = 0;

static scroll_axis_t g_scroll_up    = { .dx = 0, .dy = +1 };
static scroll_axis_t g_scroll_down  = { .dx = 0, .dy = -1 };
/* 实测反馈: 上下(2/8)方向没问题，但左右(4/6)是反的——4 应该是"手指从左
 * 滑到右"(dx=+1)，6 应该是"手指从右滑到左"(dx=-1)，和下面注释按 2/8 的
 * 已验证正确的"手指反向拖动->内容按直觉方向翻页"规律完全对称。之前这两个
 * 值刚好写反了，直接对调。 */
static scroll_axis_t g_scroll_left  = { .dx = +1, .dy = 0 };
static scroll_axis_t g_scroll_right = { .dx = -1, .dy = 0 };

static void set_grab(int fd, int grab) {
    if (fd < 0) return;
    ioctl(fd, EVIOCGRAB, grab);
}

static int g_pass_kind = 0;      /* 0 没有  1 通用透传键盘  2 克隆的真键盘(全局防抖用) */
static void pass_destroy(void) {
    if (g_pass_fd >= 0) {
        ioctl(g_pass_fd, UI_DEV_DESTROY);
        close(g_pass_fd);
        g_pass_fd = -1;
    }
    g_pass_kind = 0;
}
static int pass_ensure(int kind) {
    if (g_pass_fd >= 0 && g_pass_kind == kind) return 0;
    pass_destroy();
    int ui = open_uinput(g_cfg.uinput_path);
    if (ui < 0) return -1;
    int rc = (kind == 2) ? create_clone_device(ui, g_kbd_fd) : create_passthrough_device(ui);
    if (rc != 0) { close(ui); return -1; }
    g_pass_fd = ui;
    g_pass_kind = kind;
    return 0;
}

static void enable_mouse_mode(bool notify) {
    if (g_enabled) return;
    if (lock_blocks_enable(notify)) return;   /* 锁屏界面(未解锁)且没允许: 不启用 */
    g_enabled = true;
    /* 只独占主键盘设备；功能键设备 (F1 所在) 绝不 grab，
     * 以保证 F1 本身始终可用。若两者是同一节点(极端情况)，
     * 这里依然会 grab，F1 在该极端情况下会一并被屏蔽，
     * 详见文档说明。 */
    set_grab(g_kbd_fd, 1);
    /* 这里才真正创建"未占用按键透传"虚拟键盘设备——只有抓住了主键盘、
     * 需要靠它把返回键/菜单键等转发回去的时候才需要它存在。 */
    if (pass_ensure(g_deb_global_active ? 2 : 1) != 0) {
        logmsg("警告: 创建透传键盘设备失败，返回键/菜单键等未映射按键在鼠标模式下可能不会生效");
    }
    held_up = held_down = held_left = held_right = false;
    g_scroll_up.held = g_scroll_up.active = false;
    g_scroll_down.held = g_scroll_down.active = false;
    g_scroll_left.held = g_scroll_left.active = false;
    g_scroll_right.held = g_scroll_right.active = false;
    logmsg("mouse mode ENABLED (grab kbd fd)");
    /* 实测反馈: 用户希望"使用屏幕键盘"这个开关就一直保持打开，不需要
     * 鼠标模式一恢复就关掉——之前这里会调用 set_show_ime_with_hard_keyboard
     * (false)，现在按需求去掉，只在 disable_mouse_mode() 里打开，从不
     * 主动关闭。 */
    dot_helper_ensure();               /* root 红点/真实指针助手(被杀了会自动拉起) */
    ptr_sync(true);
    pos_publish(true);                 /* 红点: 开启鼠标模式就显示 */
    /* notify_app() 现在走独立的弹窗文件机制(见其注释)，不再顺带启动红点，
     * 所以这里要显式地单独调用 notify_dot()。 */
    ptr_color_apply(true);
    write_state_file();
    app_keepalive_kick();
    notify_dot(true);
    if (notify) notify_app(true);
}

static void drag_reset(void);
static void disable_mouse_mode(bool notify) {
    if (!g_enabled) return;
    g_enabled = false;
    gesture_cancel_all();               /* 连续慢拖/捏合进行到一半: 手指先抬起来 */
    drag_reset();                       /* 拖动中途被暂停/关闭: 先松手，免得按键卡住 */
    /* 全局防抖正在运行时不能松开键盘/销毁转发设备(松开了，防抖就失效、按键直接送到系统) */
    if (!g_deb_global_active) set_grab(g_kbd_fd, 0);
    /* 把透传虚拟键盘设备整个销毁掉(而不只是不用它)——这个设备注册了
     * 全量 KEY_* 位，只要它还存在，Android/输入法就会一直认为"有实体
     * QWERTY 键盘接着"，T9 就进不去数字输入模式。销毁它完全不影响真实
     * 数字键的送达，因为那些是主键盘设备(g_kbd_fd)在刚刚 ungrab 之后
     * 直接原生送达系统的，跟这个透传设备无关。 */
    if (!g_deb_global_active) pass_destroy();
    held_up = held_down = held_left = held_right = false;
    g_scroll_up.held = g_scroll_up.active = false;
    g_scroll_down.held = g_scroll_down.active = false;
    g_scroll_left.held = g_scroll_left.active = false;
    g_scroll_right.held = g_scroll_right.active = false;
    logmsg("mouse mode DISABLED (ungrab kbd fd, destroy passthrough device)");
    /* 键盘刚被松开，原始按键马上就能被输入法看到——在这之前把
     * show_ime_with_hard_keyboard 打开，让检测到实体键盘就拒绝进软键盘
     * /T9 模式的输入法能正常工作。 */
    if (g_cfg.force_soft_kbd_when_off) set_show_ime_with_hard_keyboard(true);
    pos_publish(false);                /* 红点: 关闭/暂停鼠标模式就收起 */
    /* 同上: notify_app() 不再顺带停红点，这里要显式单独调用 notify_dot()。 */
    ptr_color_apply(false);
    write_state_file();
    notify_dot(false);
    if (notify) notify_app(false);
}

/* 前向声明: 定义在文件后面 (屏幕旋转检测/方向补偿一节) */
static void rotate_vec(int dx, int dy, int *out_dx, int *out_dy);
static void rotate_vec_swipe(int dx, int dy, int *out_dx, int *out_dy);
static void refresh_rotation(long tnow);

/* 前向声明: g_rotation 真正定义在后面"屏幕旋转检测"一节 */
static int g_rotation;

/* 实测结论 (2026-09-26，基于用户提供的诊断日志):
 * "swipe 是绝对坐标、系统会自动按屏幕方向转好、不需要我们手动补偿"这个
 * 假设是错的——用户反馈横屏(rotation=1)下未补偿时 2/4/6/8 表现为
 * 6→下 4→上 2→右 8→左，对照发送的物理向量，正好等于标准 Android
 * ROTATION_90 坐标变换公式 (out_x=in_y, out_y=-in_x)：说明这条路径确实
 * 被转了一次，且是按文档化的标准公式转的，只是我们从没抵消过它。
 * 现在用 rotate_vec_swipe() 发送该变换的反函数，把它转回去，使 2/4/6/8
 * 在横屏下和竖屏表现一致。这条路径需要的补偿方向 (swipe_rotate_sign)
 * 和方向键那条路径(rotate_sign) 是两个独立的经验值，没有理由相同——
 * 两者经过的系统环节不一样，不要合并成一个开关。 */
#define GLIDE_MARGIN     14      /* 慢拖/单击滑动: 离屏幕边缘至少留这么多像素 */

/* 单击 2/4/6/8 的滑动距离: 不再是固定值。设置里的距离是"鼠标在屏幕正中"时的基准，
 * 实际距离按鼠标前方到屏幕边缘的空间等比缩放——鼠标在屏幕下方往上滑，前方空间多，
 * 就比在正中时滑得更长；贴近边缘时前方空间少，就滑得更短，不会冲到屏幕边缘。 */
static int edge_scaled_dist(int rdx, int rdy) {
    int W = g_panel_w, H = g_panel_h, M = GLIDE_MARGIN;
    int base = g_cfg.swipe_distance;
    int x = g_cur_x, y = g_cur_y;
    if (x < M) x = M;
    if (x > W - 1 - M) x = W - 1 - M;
    if (y < M) y = M;
    if (y > H - 1 - M) y = H - 1 - M;
    int room, half;
    if (rdx) { room = rdx > 0 ? W - 1 - M - x : x - M; half = (W - 1) / 2 - M; }
    else     { room = rdy > 0 ? H - 1 - M - y : y - M; half = (H - 1) / 2 - M; }
    if (half < 1) half = 1;
    if (room < 1) room = 1;
    int d = (int)((long)base * room / half);
    if (d > room) d = room;
    if (d < 20) d = room < 20 ? room : 20;
    return d;
}

static void do_axis_fast(scroll_axis_t *s) {
    if (g_cfg.scroll_mode == MODE_WHEEL) {
        /* REL_WHEEL/REL_HWHEEL 是逻辑滚动动作，不是空间坐标，应用按当前
         * 显示方向直接解释，本身与屏幕物理朝向无关，不需要旋转补偿
         * (道理同外接键盘的 PageUp/PageDown 不会因为设备转向而变义)。 */
        if (s->dy) mouse_wheel(s->dy > 0 ? g_cfg.scroll_step : -g_cfg.scroll_step);
        if (s->dx) mouse_hwheel(s->dx > 0 ? g_cfg.scroll_step : -g_cfg.scroll_step);
    } else {
        int rdx, rdy;
        rotate_vec_swipe(s->dx, s->dy, &rdx, &rdy);
        logmsg("翻页诊断(fast): rotation=%d 物理(dx=%d,dy=%d) -> 补偿后(dx=%d,dy=%d)",
               g_rotation, s->dx, s->dy, rdx, rdy);
        ptr_sync(true);                 /* 距离要按鼠标(红点)此刻的位置算 */
        int dist = edge_scaled_dist(rdx, rdy);
        if (g_cfg.fast_speed > 0) {
            int dur = dist * 1000 / g_cfg.fast_speed;
            if (dur < 40) dur = 40;
            if (dur > 500) dur = 500;
            g_swipe_dur_ms = dur;
        }
        touch_swipe(rdx * dist, rdy * dist);
        g_swipe_dur_ms = 0;
    }
}

static void do_axis_slow_tick(scroll_axis_t *s) {
    if (g_cfg.scroll_mode == MODE_WHEEL) {
        if (s->dy) mouse_wheel(s->dy > 0 ? 1 : -1);
        if (s->dx) mouse_hwheel(s->dx > 0 ? 1 : -1);
    } else {
        int rdx, rdy;
        rotate_vec_swipe(s->dx, s->dy, &rdx, &rdy);
        touch_swipe(rdx * g_cfg.scroll_slow_distance, rdy * g_cfg.scroll_slow_distance);
    }
}

/* ------------------------------------------------------------------ */
/* 触摸手势: 长按 2/4/6/8 的连续慢拖 + 数字键 1/3 的横向缓慢捏合        */
/* ------------------------------------------------------------------ */
/* 都由主循环 tick 驱动(不阻塞)，所以进行中随时能被打断。
 *
 * 连续慢拖: 一根虚拟手指在指针处按下，以固定速度(由 scroll_slow_distance /
 * scroll_interval_ms 换算，默认约 300 像素/秒，和以前"每 130ms 搓 40 像素"同速)
 * 连续地往一个方向挪，像慢速鼠标滚轮，直到松开按键。
 *
 * 【基准点 = 鼠标(红点)位置，不是屏幕边缘】
 * 以前走到屏幕边缘就抬手、再到"对侧屏幕边缘"重新按下——手指落在屏幕物理
 * 边缘，会误触发返回桌面等系统边缘手势。现在每一段都从鼠标位置起手，往按键
 * 方向挪到离屏幕边缘 GLIDE_MARGIN 为止(段长不是固定值: 鼠标前方空间多就走得长，
 * 空间少就走得短)，然后先停
 * 一下抬起，再回到鼠标位置同一条线上重新按下，接着往同一方向挪——
 * 效果仍然是"可以一直滚下去"，但手指永远只在鼠标位置附近按下，不会落到屏幕
 * 边缘。鼠标紧贴屏幕边缘、前方没有足够空间时，这一段整体往回(反方向)平移，
 * 让鼠标位置成为这一段的终点，而不是把手指放到屏幕另一侧。
 *
 * 为什么抬手前要先静止 GESTURE_STOP_MS: 系统的速度估计只看最近的几个触点，
 * 并且两个事件间隔超过约 40ms 就认为手指已经停了、速度清零。慢拖的速度(约
 * 300 像素/秒)高于系统的"最小惯性滑动速度"，如果边走边抬手，松开按键后页面
 * 还会自己往前冲一段；先停 60ms 再抬就不会。 */
#define GLIDE_MIN_PATH   90      /* 一段至少这么长，鼠标前方空间不够时整段往回平移 */
#define GESTURE_TICK_MS  8       /* 慢拖/捏合的出点间隔: 8ms≈屏幕刷新(约17ms)的一半，避免和刷新节拍相互错位造成抖动 */
#define GESTURE_STOP_MS  60
#define GLIDE_REDOWN_MS  30

#define PINCH_FAR_HALF   100    /* 双指"远"时各自离中心的距离(像素) */
#define PINCH_NEAR_HALF  40     /* 双指"近"时各自离中心的距离 */

typedef enum { GL_IDLE = 0, GL_MOVE, GL_PAUSE_RELEASE, GL_PAUSE_REANCHOR, GL_REDOWN } glide_phase_t;

static struct {
    glide_phase_t phase;
    scroll_axis_t *axis;
    int   vx, vy;      /* 方向单位向量(面板坐标，已做方向补偿) */
    float x, y;        /* 手指当前位置 */
    float end;         /* 本段终点(沿运动方向的那一个坐标，面板坐标) */
    float sx, sy;      /* 本段起点 */
    long  t0;          /* 本段起点时刻: 位置按"起点+速度×经过时间"算，主循环偶尔慢一拍也不会抖 */
    float speed;       /* 像素/秒 */
    long  last;        /* 上一次 tick 时刻 */
    long  phase_at;    /* 进入当前阶段的时刻 */
    bool  down;        /* 虚拟手指此刻是否按在屏幕上 */
} g_gl;

static struct {
    bool active;
    int  cx, cy, h0, h1, last_h;
    long t0, next_due;
} g_pinch;

static void glide_emit_pos(void) {
    emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 0);
    emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, (int)(g_gl.x + 0.5f));
    emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_Y, (int)(g_gl.y + 0.5f));
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
}

static void glide_finger_down(void) {
    int tid = g_touch_track_id++;
    emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 0);
    emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, tid);
    emit(g_touch_fd, EV_KEY, BTN_TOUCH, 1);
    emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, (int)(g_gl.x + 0.5f));
    emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_Y, (int)(g_gl.y + 0.5f));
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
    g_gl.down = true;
}

static void glide_finger_up(void) {
    if (!g_gl.down) return;
    emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 0);
    emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, -1);
    emit(g_touch_fd, EV_KEY, BTN_TOUCH, 0);
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
    g_gl.down = false;
}

static float glide_speed(void) {
    int iv = g_cfg.scroll_interval_ms > 0 ? g_cfg.scroll_interval_ms : 130;
    float v = g_cfg.glide_speed > 0 ? (float)g_cfg.glide_speed
                                    : (float)g_cfg.scroll_slow_distance * 1000.0f / (float)iv;
    if (v < 40.0f) v = 40.0f;
    if (v > 1500.0f) v = 1500.0f;
    return v;
}

/* 以鼠标(红点)当前位置为基准，规划一段慢拖: 起点、终点。
 * 垂直于运动方向的那个坐标始终等于鼠标的坐标；沿运动方向的起点就是鼠标位置
 * (前方空间不够 GLIDE_MIN_PATH 时，整段往回平移，使鼠标位置成为终点)。
 * 全程只依赖 g_cur_x/g_cur_y，不会再把手指放到屏幕另一侧的边缘。 */
static void glide_plan(void) {
    int W = g_panel_w, H = g_panel_h, M = GLIDE_MARGIN;
    int x = g_cur_x, y = g_cur_y;
    if (x < M) x = M;
    if (x > W - 1 - M) x = W - 1 - M;
    if (y < M) y = M;
    if (y > H - 1 - M) y = H - 1 - M;
    bool horiz = (g_gl.vx != 0);
    int dir = horiz ? g_gl.vx : g_gl.vy;
    int pos = horiz ? x : y;
    int lo = M, hi = (horiz ? W : H) - 1 - M;
    int room = dir > 0 ? hi - pos : pos - lo;
    int start = pos, len = room;          /* 段长 = 鼠标前方到屏幕边缘的全部空间(检测屏幕边缘，不用固定距离) */
    if (room < GLIDE_MIN_PATH) {
        len = GLIDE_MIN_PATH;
        start = dir > 0 ? hi - len : lo + len;
        if (start < lo) start = lo;
        if (start > hi) start = hi;
    }
    int end = start + dir * len;
    if (end < lo) end = lo;
    if (end > hi) end = hi;
    if (horiz) { g_gl.x = (float)start; g_gl.y = (float)y; }
    else       { g_gl.x = (float)x;     g_gl.y = (float)start; }
    g_gl.end = (float)end;
    g_gl.sx = g_gl.x;
    g_gl.sy = g_gl.y;
}

static void glide_try_start(scroll_axis_t *s, long tnow) {
    if (g_gl.phase != GL_IDLE || g_pinch.active || g_touch_fd < 0 || g_touch_down) return;
    int rdx, rdy;
    rotate_vec_swipe(s->dx, s->dy, &rdx, &rdy);
    if (!rdx && !rdy) return;
    ptr_sync(true);                 /* 基准 = 系统里鼠标指针(红点)此刻的真实位置 */
    pos_publish(true);
    g_gl.vx = rdx > 0 ? 1 : (rdx < 0 ? -1 : 0);
    g_gl.vy = rdy > 0 ? 1 : (rdy < 0 ? -1 : 0);
    glide_plan();
    g_gl.axis = s;
    g_gl.speed = glide_speed();
    g_gl.last = tnow;
    g_gl.phase_at = tnow;
    g_gl.phase = GL_MOVE;
    g_gl.t0 = tnow;
    glide_finger_down();
    logmsg("连续慢拖开始: 鼠标(%d,%d) 起点面板(%d,%d)->终点%d 方向(%d,%d) 速度=%d像素/秒",
           g_cur_x, g_cur_y, (int)g_gl.x, (int)g_gl.y, (int)g_gl.end,
           g_gl.vx, g_gl.vy, (int)g_gl.speed);
}

static void glide_poll(long tnow) {
    switch (g_gl.phase) {
    case GL_MOVE: {
        if (tnow - g_gl.last < GESTURE_TICK_MS) return;
        if (!g_gl.axis || !g_gl.axis->held) {      /* 按键松开: 手指先停住 */
            g_gl.phase = GL_PAUSE_RELEASE;
            g_gl.phase_at = tnow;
            return;
        }
        float el = (float)(tnow - g_gl.t0) / 1000.0f;
        g_gl.last = tnow;
        g_gl.x = g_gl.sx + (float)g_gl.vx * g_gl.speed * el;
        g_gl.y = g_gl.sy + (float)g_gl.vy * g_gl.speed * el;
        bool hit = false;                          /* 到本段终点(以鼠标位置为基准算出的) */
        if (g_gl.vx > 0 && g_gl.x >= g_gl.end) { g_gl.x = g_gl.end; hit = true; }
        if (g_gl.vx < 0 && g_gl.x <= g_gl.end) { g_gl.x = g_gl.end; hit = true; }
        if (g_gl.vy > 0 && g_gl.y >= g_gl.end) { g_gl.y = g_gl.end; hit = true; }
        if (g_gl.vy < 0 && g_gl.y <= g_gl.end) { g_gl.y = g_gl.end; hit = true; }
        glide_emit_pos();
        if (hit) { g_gl.phase = GL_PAUSE_REANCHOR; g_gl.phase_at = tnow; }
        return;
    }
    case GL_PAUSE_RELEASE:
        if (tnow - g_gl.phase_at < GESTURE_STOP_MS) return;
        glide_finger_up();
        g_gl.phase = GL_IDLE;
        g_gl.axis = NULL;
        return;
    case GL_PAUSE_REANCHOR:
        if (tnow - g_gl.phase_at < GESTURE_STOP_MS) return;
        glide_finger_up();
        g_gl.phase = GL_REDOWN;
        g_gl.phase_at = tnow;
        return;
    case GL_REDOWN:
        if (tnow - g_gl.phase_at < GLIDE_REDOWN_MS) return;
        if (!g_gl.axis || !g_gl.axis->held) { g_gl.phase = GL_IDLE; g_gl.axis = NULL; return; }
        glide_plan();                      /* 回到鼠标位置重新起手(不是屏幕对侧边缘) */
        g_gl.last = tnow;
        g_gl.t0 = tnow;
        g_gl.phase = GL_MOVE;
        glide_finger_down();
        return;
    default:
        return;
    }
}

/* ---- 横向缓慢捏合 ---- */
static int pinch_duration(void) {
    int d = g_cfg.pinch_ms;
    if (d < 300) d = 300;
    if (d > 6000) d = 6000;
    return d;
}

static void pinch_emit(int h, bool first) {
    int x0 = g_pinch.cx - h, x1 = g_pinch.cx + h;
    if (first) {
        int t0 = g_touch_track_id++, t1 = g_touch_track_id++;
        emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 0);
        emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, t0);
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, x0);
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_Y, g_pinch.cy);
        emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 1);
        emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, t1);
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, x1);
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_Y, g_pinch.cy);
        emit(g_touch_fd, EV_KEY, BTN_TOUCH, 1);
    } else {
        emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 0);
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, x0);
        emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 1);
        emit(g_touch_fd, EV_ABS, ABS_MT_POSITION_X, x1);
    }
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
}

static void pinch_finish(const char *why) {
    if (!g_pinch.active) return;
    emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 0);
    emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, -1);
    emit(g_touch_fd, EV_ABS, ABS_MT_SLOT, 1);
    emit(g_touch_fd, EV_ABS, ABS_MT_TRACKING_ID, -1);
    emit(g_touch_fd, EV_KEY, BTN_TOUCH, 0);
    emit(g_touch_fd, EV_SYN, SYN_REPORT, 0);
    g_pinch.active = false;
    logmsg("捏合结束: %s", why);
}

static void gesture_cancel_all(void) {
    pinch_finish("被取消");
    if (g_gl.down) glide_finger_up();
    g_gl.phase = GL_IDLE;
    g_gl.axis = NULL;
}

/* dir<0: 缩小(双指靠拢)，dir>0: 放大(双指分开) */
static void pinch_start(int dir) {
    if (g_touch_fd < 0 || g_touch_down) return;
    gesture_cancel_all();
    ptr_sync(true);
    pos_publish(true);
    int W = g_panel_w, H = g_panel_h, M = 6;
    int far = PINCH_FAR_HALF, near = PINCH_NEAR_HALF;
    if (2 * (far + M) >= W) { far = (W - 1) / 2 - M - 1; if (far < 20) far = 20; }
    if (near >= far) near = far / 2;
    int cx = g_cur_x, cy = g_cur_y;
    if (cx < far + M) cx = far + M;                 /* 指针离左右边太近: 中心往里挪一点 */
    if (cx > W - 1 - far - M) cx = W - 1 - far - M;
    if (cy < M) cy = M;
    if (cy > H - 1 - M) cy = H - 1 - M;
    g_pinch.cx = cx; g_pinch.cy = cy;
    g_pinch.h0 = dir < 0 ? far : near;
    g_pinch.h1 = dir < 0 ? near : far;
    g_pinch.last_h = g_pinch.h0;
    g_pinch.t0 = now_ms();
    g_pinch.next_due = g_pinch.t0 + GESTURE_TICK_MS;
    g_pinch.active = true;
    pinch_emit(g_pinch.h0, true);
    logmsg("横向捏合开始: %s 中心面板(%d,%d) 半间距 %d -> %d，%dms",
           dir < 0 ? "缩小" : "放大", cx, cy, g_pinch.h0, g_pinch.h1, pinch_duration());
}

static void pinch_poll(long tnow) {
    if (!g_pinch.active || tnow < g_pinch.next_due) return;
    g_pinch.next_due = tnow + GESTURE_TICK_MS;
    long el = tnow - g_pinch.t0;
    int dur = pinch_duration();
    float f = el >= dur ? 1.0f : (float)el / (float)dur;
    float e = f * f * (3.0f - 2.0f * f);            /* 起止都柔和，不是匀速硬拉 */
    float d = (float)(g_pinch.h1 - g_pinch.h0) * e;
    int h = g_pinch.h0 + (int)(d >= 0 ? d + 0.5f : d - 0.5f);
    if (h != g_pinch.last_h) { pinch_emit(h, false); g_pinch.last_h = h; }
    if (f >= 1.0f) pinch_finish("完成");
}

static void gesture_poll(long tnow, int *timeout_ms) {
    pinch_poll(tnow);
    glide_poll(tnow);
    if (g_pinch.active || g_gl.phase != GL_IDLE) {
        if (*timeout_ms < 0 || *timeout_ms > GESTURE_TICK_MS) *timeout_ms = GESTURE_TICK_MS;
    }
}

static void scroll_key_down(scroll_axis_t *s) {
    if (s->held && s->up_pending) {
        /* 松开后很快又按下: 触点抖动，当作一直按着，状态(包括长按慢拖)原样继续 */
        s->up_pending = false;
        logmsg("2468防抖: 松开后%ldms内又按下，判定为触点抖动，忽略这次松开",
               now_ms() - s->up_time);
        return;
    }
    s->held = true;
    s->active = false;
    s->up_pending = false;
    s->press_start = now_ms();
}

/* 真正的"松开"处理(防抖观察期结束后才会走到这里) */
static void scroll_release_now(scroll_axis_t *s) {
    s->held = false;
    s->up_pending = false;
    if (s->active) {
        /* 一次长按结束: 开始冷却(只限制下一次进入长按) */
        g_scroll_cool_until = s->up_time + SCROLL_COOLDOWN_MS;
    } else if (s->up_time - s->press_start < SCROLL_MIN_PRESS_MS) {
        logmsg("2468防抖: 按下仅%ldms就松开，判定为毛刺，忽略",
               s->up_time - s->press_start);
    } else if (s->up_time - s->press_start >= g_cfg.scroll_hold_ms) {
        /* 按住的时间已经够长按了，却没进入长按——只可能是被冷却挡住了(冷却内不进入长按)。
         * 这是"想长按"的操作，松开时不能当短按去触发一次快速翻页(这就是之前"弹射"的来源)。 */
        logmsg("2468冷却: 按住%ldms(已达长按阈值)但还在冷却期，松开时不触发快速翻页",
               s->up_time - s->press_start);
    } else {
        /* 真正的短按(没到长按阈值就松开) -> 快速翻页；记下按住多久、离上次长按结束多久，方便排查 */
        long last_end = g_scroll_cool_until > 0 ? g_scroll_cool_until - SCROLL_COOLDOWN_MS : 0;
        logmsg("2468短按: 按住%ldms, 距上次长按结束%ldms -> 快速翻页",
               s->up_time - s->press_start, last_end > 0 ? s->up_time - last_end : -1L);
        do_axis_fast(s);
    }
    s->active = false;
}

static void scroll_key_up(scroll_axis_t *s) {
    if (!s->held || s->up_pending) return;
    s->up_time = now_ms();
    if (SCROLL_DEBOUNCE_MS <= 0) { scroll_release_now(s); return; }
    s->up_pending = true;               /* 先不下结论，等 SCROLL_DEBOUNCE_MS 看会不会又按下 */
    s->up_due = s->up_time + SCROLL_DEBOUNCE_MS;
}

/* 主循环每次 tick 调用；tnow 为当前时间戳，*timeout_ms 是主循环
 * epoll_wait 的下一次超时时间，会按需收紧(取更小值)。 */
static void scroll_axis_poll(scroll_axis_t *s, long tnow, int *timeout_ms) {
    if (!s->held) return;
    if (s->up_pending) {
        if (tnow >= s->up_due) { scroll_release_now(s); return; }
        int w = (int)(s->up_due - tnow);
        if (*timeout_ms < 0 || w < *timeout_ms) *timeout_ms = w;
        if (!s->active) return;          /* 观察期内还没进长按的，不要抢着进入长按 */
    }
    if (!s->active) {
        if (tnow < g_scroll_cool_until) {        /* 冷却中: 先不进入长按，等冷却结束 */
            int cd = (int)(g_scroll_cool_until - tnow);
            if (*timeout_ms < 0 || cd < *timeout_ms) *timeout_ms = cd;
            return;
        }
        long held_for = tnow - s->press_start;
        if (held_for >= g_cfg.scroll_hold_ms) {
            s->active = true;
            if (g_cfg.scroll_mode == MODE_SWIPE) {
                glide_try_start(s, tnow);     /* 连续慢拖，不再一小段一小段地搓 */
                s->next_due = tnow + GESTURE_TICK_MS;
            } else {
                do_axis_slow_tick(s); /* 进入慢速模式的第一步 */
                s->next_due = tnow + g_cfg.scroll_interval_ms;
            }
        } else {
            int remain = (int)(g_cfg.scroll_hold_ms - held_for);
            if (*timeout_ms < 0 || remain < *timeout_ms) *timeout_ms = remain;
            return;
        }
    } else if (g_cfg.scroll_mode == MODE_SWIPE) {
        /* 手指由 gesture_poll 驱动；这里只负责"上一根手指收完以后接着起下一根" */
        if (g_gl.axis != s) glide_try_start(s, tnow);
        s->next_due = tnow + GESTURE_TICK_MS;
    } else if (s->next_due <= tnow) {
        do_axis_slow_tick(s);
        s->next_due = tnow + g_cfg.scroll_interval_ms;
    }
    int t = (int)(s->next_due - tnow);
    if (t < 0) t = 0;
    if (*timeout_ms < 0 || t < *timeout_ms) *timeout_ms = t;
}

/* F1 一直按住不松手时，一到 toggle_hold_ms 阈值就立刻切换鼠标模式，
 * 不必等按键抬起；本次按住只触发一次 (g_f1_fired 防抖)。主循环每次
 * tick 调用，和 scroll_axis_poll 一样会按需收紧 epoll_wait 的超时。 */
static void f1_poll(long tnow, int *timeout_ms) {
    if (g_f1_down_ms < 0 || g_f1_fired) return;
    long held_for = tnow - g_f1_down_ms;
    if (held_for >= g_cfg.toggle_hold_ms) {
        g_f1_fired = true;
        logmsg("开关键: 按住 %ldms 已达阈值(%dms)，立即切换，不等松开", held_for, g_cfg.toggle_hold_ms);
        /* 用户手动按 F1，优先级高于"输入法弹出自动暂停"这件事本身——
         * 不管当前是不是处于自动暂停状态，清掉这个标记，避免之后输入法
         * 收起时莫名其妙又把用户刚手动关掉的鼠标模式自动打开。 */
        g_auto_ime_suspended = false;
        g_ime_hidden_since_ms = -1;
        g_auto_home_suspended = false;
        g_auto_lock_suspended = false;
        chord_center_cleanup();
        if (g_enabled) {
            disable_mouse_mode(true);
        } else {
            enable_mouse_mode(true);
            /* 用户手动打开鼠标(可能就是在桌面上): 明确要用，别马上又被"桌面隐藏"关掉。
             * 直到探测到前台已经不是桌面，这个"手动优先"标记才会清掉。 */
            set_manual_override();
        }
        return;
    }
    int remain = (int)(g_cfg.toggle_hold_ms - held_for);
    if (*timeout_ms < 0 || remain < *timeout_ms) *timeout_ms = remain;
}

/* 开关键(组合键，最多 4 个)的按下/抬起跟踪。所有开关键都按住时才开始计时，任何一个抬起就取消。
 * 第一个键(F1 这类机械键)有触点抖动: 按下沿落在上一次边沿的 F1_DEBOUNCE_MS 内忽略；
 * 抬起沿只要不是按下后 30ms 内的触点抖动就一律处理——之前连抬起也按 150ms 窗口一起丢，
 * 快速点一下 F1(<150ms)时抬起被丢掉，计时器一直留着，0.5 秒后会莫名其妙切换一次。 */
static void toggle_chord_update(int slot, bool down, bool up, long tnow) {
    if (down) {
        if (g_tk_dn[slot]) return;
        if (slot == 0 && tnow - g_tk_last_edge[0] < F1_DEBOUNCE_MS) return;
        g_tk_dn[slot] = true;
        g_tk_last_edge[slot] = tnow;
        g_tk_down_edge[slot] = tnow;
    } else if (up) {
        if (!g_tk_dn[slot]) return;
        if (slot == 0 && tnow - g_tk_down_edge[0] < 30) return;
        g_tk_dn[slot] = false;
        g_tk_last_edge[slot] = tnow;
    } else {
        return;
    }
    bool chord = true;
    for (int i = 0; i < g_tk_n; i++) if (!g_tk_dn[i]) chord = false;
    if (chord) {
        if (g_f1_down_ms < 0) {
            g_f1_down_ms = tnow; g_f1_fired = false;
            logmsg("开关键: 按下，开始计时(需按住 %dms，不必松手)", g_cfg.toggle_hold_ms);
        }
    } else {
        if (g_f1_down_ms >= 0 && !g_f1_fired)
            logmsg("开关键: 松开时只按住了 %ldms，不足 %dms，未切换", tnow - g_f1_down_ms, g_cfg.toggle_hold_ms);
        g_f1_down_ms = -1; g_f1_fired = false;
    }
}

/* ------------------------------------------------------------------ */
/* 屏幕旋转检测 / 方向补偿                                              */
/* ------------------------------------------------------------------ */
/* 部分设备/ROM 上，虚拟鼠标(相对指针设备)默认不是"orientationAware"的，
 * 系统不会随当前屏幕旋转自动旋转其相对位移——移动方向始终按"面板出厂
 * 默认方向"解释，与视频/横屏应用当前显示方向脱节，导致物理"上"键在
 * 横屏时视觉上变成"左"移动等现象。这里通过轮询 dumpsys 获取当前
 * WindowManager/Display 的旋转状态 (0/1/2/3 对应 0/90/180/270 度，
 * 与 Android Surface.ROTATION_* 常量一致)，在输出前对方向向量做补偿
 * 旋转，使物理按键的视觉方向始终符合直觉，与当前屏幕方向无关。
 *
 * 检测本身有一定开销 (fork dumpsys)，因此做节流：只在存在按键按住
 * (移动/翻页) 时才轮询，且两次轮询间隔不小于 rotate_poll_ms。若检测
 * 失败 (dumpsys 输出格式不符预期等)，保留上一次已知值，不会导致方向
 * 突然跳变；若从未检测成功过，默认按 0 度(不补偿)处理，即退化为原有
 * 行为，不会比补偿前更差。 */
static int  g_rotation = 0;        /* 当前已知的屏幕旋转: 0/1/2/3 */
static long g_rotate_next_check = 0;
static int  g_rotate_pending = -1;
static int  g_rotate_pending_count = 0;
static int  g_last_raw_rotation = -1; /* 最近一次成功检测到的原始值(减 base 前) */

/* 手动方向覆盖 (-1=未启用/跟随自动检测，0-3=用户在 App 弹窗里手动选择的
 * 方向，含义与 Surface.ROTATION_* 一致)。一旦启用，refresh_rotation() 会
 * 直接采用这个值，完全跳过下面容易受干扰的自动检测逻辑——这是"自动检测
 * 实在测不准时"的可靠兜底，由用户在 F1 切换鼠标模式弹出的确认框里手动
 * 选择，不依赖 dumpsys/logcat 解析。 */
static int  g_manual_rotation = -1;
static long g_manual_rot_next_check = 0;
static time_t g_manual_rot_last_mtime = 0;

static void refresh_manual_rotation(long tnow) {
    if (!g_cfg.manual_rot_file[0]) return;
    if (tnow < g_manual_rot_next_check) return;
    g_manual_rot_next_check = tnow + 150;

    struct stat st;
    if (stat(g_cfg.manual_rot_file, &st) != 0) return;
    if (st.st_mtime == g_manual_rot_last_mtime) return;
    g_manual_rot_last_mtime = st.st_mtime;

    FILE *f = fopen(g_cfg.manual_rot_file, "r");
    if (!f) return;
    char line[32];
    int v = -1;
    if (fgets(line, sizeof(line), f)) v = atoi(line);
    fclose(f);
    if (v < -1 || v > 3) return; /* 内容异常，忽略这次更新 */

    if (v != g_manual_rotation) {
        g_manual_rotation = v;
        if (v >= 0) {
            g_rotation = v;
            g_rotate_pending = -1;
            g_rotate_pending_count = 0;
            logmsg("手动方向覆盖已启用: rotation=%d (跳过自动检测)", v);
        } else {
            /* 切回自动: 不在这里立刻重新检测，交给下一轮 refresh_rotation()
             * 的正常检测流程即可，避免这里重复一份检测逻辑。 */
            g_rotate_pending = -1;
            g_rotate_pending_count = 0;
            logmsg("手动方向覆盖已关闭，恢复自动检测");
        }
    }
}

/* rotate_base 和 flip180 都是"常数偏移"，合并成一个数一起用。flip180 是
 * 给用户在 App 里留的手动开关：如果 rotate_base/检测逻辑怎么调都还有
 * 某个方向是反的(比如这台设备默认状态在系统里报告的旋转值本身就跟直觉
 * 差 180 度)，直接在 App 里勾选它，不需要再猜 rotate_base 具体该填几、
 * 也不需要重新编译。 */
static int effective_rotate_base(void) {
    int b = g_cfg.rotate_base + (g_cfg.flip180 ? 2 : 0);
    return ((b % 4) + 4) % 4;
}

/* 在一段文本里查找屏幕旋转值，同时兼容两种系统会打印的格式：
 *   1) 符号常量: ROTATION_0 / ROTATION_90 / ROTATION_180 / ROTATION_270
 *   2) 数字形式: rotation=0 / mRotation=1 / mCurRotation=2 ...
 * 数字形式用 strtol 一次性吃掉后面所有连续数字再判断是否落在 0-3，
 * 这样 "rotation=180" 这种角度值(180)不会被误判成只截取首位数字"1"
 * (对应 90 度) 那种错误——这正是旧版用 shell grep 单字符匹配时的 bug。
 * 同一段文本里可能出现多次，取最后一次出现的(最新的)为准。 */
/* 专门找 "SurfaceOrientation: N" (dumpsys input 的输出)。这一项是输入
 * 分发系统实际用来旋转触摸/指针坐标的权威状态，每个物理显示屏只会
 * 出现一次，不会像 dumpsys window 那样在几十个不相关的窗口记录里
 * 反复出现同名字段，因此不存在"该取第几次出现"的歧义，是目前几种
 * 来源里最可靠的一个，优先使用。取第一次出现(即默认/主显示屏)。 */
static int parse_surface_orientation(const char *text) {
    const char *p = strstr(text, "SurfaceOrientation:");
    if (!p) return -1;
    p += 19;
    while (*p == ' ' || *p == '\t') p++;
    if (*p < '0' || *p > '3') return -1;
    return *p - '0';
}

/* 在一段文本里查找屏幕旋转值，同时兼容两种系统会打印的格式：
 *   1) 符号常量: ROTATION_0 / ROTATION_90 / ROTATION_180 / ROTATION_270
 *   2) 数字形式: rotation=0 / mRotation=1 / mCurRotation=2 ...
 * 数字形式用 strtol 一次性吃掉后面所有连续数字再判断是否落在 0-3，
 * 这样 "rotation=180" 这种角度值(180)不会被误判成只截取首位数字"1"
 * (对应 90 度) 那种错误——这正是旧版用 shell grep 单字符匹配时的 bug。
 *
 * 取第一次出现(而不是最后一次)为准: dumpsys window/display 的完整输出里
 * 顶层 DisplayContent 自身的旋转状态总是最先打印，后面还会跟着几十个
 * 不相关的窗口/任务记录，它们身上偶尔也带 "mRotation="/"rotation=" 之类
 * 字段(比如某个 Task 的 requestedOrientation、historical 记录等)，含义
 * 和"当前屏幕物理旋转"毫无关系；旧版取"最后一次出现"，命中过这类无关
 * 字段，这正是实测中出现过"默认竖屏下方向键整体被转了180度"的根因之一。
 * 取第一次出现能大幅降低命中无关字段的概率。 */
static int parse_rotation_from_text(const char *text) {
    const char *p = strstr(text, "ROTATION_");
    if (p) {
        int deg = atoi(p + 9);
        if (deg == 0) return 0;
        if (deg == 90) return 1;
        if (deg == 180) return 2;
        if (deg == 270) return 3;
    }

    static const char *keys[] = { "mRotation=", "mCurRotation=", "rotation=", NULL };
    for (int k = 0; keys[k]; k++) {
        size_t klen = strlen(keys[k]);
        const char *q = strstr(text, keys[k]);
        if (!q) continue;
        const char *num = q + klen;
        if (*num >= '0' && *num <= '9') {
            char *end;
            long v = strtol(num, &end, 10);
            if (v >= 0 && v <= 3) return (int)v;
        }
    }
    return -1;
}

static int run_cmd_capture(const char *cmd, char *buf, size_t bufsz) {
    FILE *fp = popen(cmd, "r");
    if (!fp) return -1;
    size_t total = 0, n;
    while (total + 1 < bufsz && (n = fread(buf + total, 1, bufsz - 1 - total, fp)) > 0) {
        total += n;
    }
    buf[total] = '\0';
    pclose(fp);
    return (int)total;
}

/* logcat 是"历史记录"而不是"当前状态快照"——最近几百行里任何一个
 * app/service 只要打印过含 "rotation="/"ROTATION_" 字样的日志(哪怕和
 * 屏幕方向毫无关系，比如相机 EXIF、传感器校准等)都可能被误当成屏幕
 * 旋转事件，命中一次误判就可能是完全无关的角度值(实测中出现过默认
 * 竖屏下方向键整体被转了 180 度，怀疑就是这里的误判)。dumpsys 是当前
 * 状态的即时快照，天然只会包含窗口/显示相关内容，不需要这层过滤；
 * 只对 logcat 来源做过滤，只保留确定和屏幕方向相关的系统组件打印的
 * 行(WindowManager/ActivityTaskManager/DisplayPolicy 等)，其余全部
 * 丢弃，避免被无关信息干扰。 */
static void filter_relevant_lines(const char *text, char *out, size_t outsz) {
    static const char *tags[] = {
        "WindowManager", "ActivityTaskManager", "DisplayPolicy",
        "DisplayContent", "hidestatusbar", "WindowManagerShell", NULL
    };
    size_t used = 0;
    out[0] = '\0';
    const char *line = text;
    while (line && *line && used + 1 < outsz) {
        const char *nl = strchr(line, '\n');
        size_t linelen = nl ? (size_t)(nl - line) : strlen(line);
        int relevant = 0;
        for (int i = 0; tags[i] && !relevant; i++) {
            size_t tlen = strlen(tags[i]);
            for (size_t off = 0; tlen > 0 && off + tlen <= linelen; off++) {
                if (memcmp(line + off, tags[i], tlen) == 0) { relevant = 1; break; }
            }
        }
        if (relevant) {
            size_t copy = linelen;
            if (used + copy + 1 >= outsz) copy = outsz - used - 1;
            memcpy(out + used, line, copy);
            used += copy;
            out[used++] = '\n';
        }
        line = nl ? nl + 1 : NULL;
    }
    out[used] = '\0';
}

static int detect_rotation(void) {
    static char buf[8192];
    static char filtered[8192];
    /* 只在探测到的原始值发生变化时才打一行"命中"日志，避免每次轮询
     * (哪怕值没变) 都刷一行，把按键触发的一次性诊断日志淹没在里面——
     * 之前那版每秒都打印一次"命中 rotation=X"，导致日志缓冲区被这种
     * 重复信息占满，真正想看的按键诊断行反而被挤没了。这里不改变任何
     * 探测逻辑本身，只改日志噪音。 */
    static int s_last_logged_raw = -999;
    /* SurfaceOrientation 单独放在最前面、优先级最高: 这是输入系统真正
     * 用来做坐标旋转的权威状态，全局唯一，没有"取第几次命中"的歧义。 */
    if (run_cmd_capture("dumpsys input 2>/dev/null", buf, sizeof(buf)) > 0) {
        int r = parse_surface_orientation(buf);
        if (r >= 0) {
            if (r != s_last_logged_raw) {
                logmsg("旋转检测: 命中 SurfaceOrientation=%d (来源: dumpsys input)", r);
                s_last_logged_raw = r;
            }
            return r;
        }
    }
    static const char *dump_cmds[] = {
        "dumpsys window displays 2>/dev/null",
        "dumpsys window 2>/dev/null",
        "dumpsys display 2>/dev/null",
        NULL
    };
    static const char *logcat_cmds[] = {
        "logcat -d -b system -t 400 2>/dev/null",
        "logcat -d -t 400 2>/dev/null",
        NULL
    };
    for (int i = 0; dump_cmds[i]; i++) {
        if (run_cmd_capture(dump_cmds[i], buf, sizeof(buf)) > 0) {
            int r = parse_rotation_from_text(buf);
            if (r >= 0) {
                if (r != s_last_logged_raw) {
                    logmsg("旋转检测: 命中 rotation=%d (来源: %s)", r, dump_cmds[i]);
                    s_last_logged_raw = r;
                }
                return r;
            }
        }
    }
    for (int i = 0; logcat_cmds[i]; i++) {
        if (run_cmd_capture(logcat_cmds[i], buf, sizeof(buf)) > 0) {
            filter_relevant_lines(buf, filtered, sizeof(filtered));
            int r = parse_rotation_from_text(filtered);
            if (r >= 0) {
                if (r != s_last_logged_raw) {
                    logmsg("旋转检测: 命中 rotation=%d (来源: %s, 已按标签过滤)", r, logcat_cmds[i]);
                    s_last_logged_raw = r;
                }
                return r;
            }
        }
    }
    /* 最后兜底: 用户手动锁定旋转时这个值才准确反映当前方向，
     * 开着系统自动旋转的情况下它不代表当前实际方向，聊胜于无。 */
    if (run_cmd_capture("settings get system user_rotation 2>/dev/null", buf, sizeof(buf)) > 0) {
        char *end;
        long v = strtol(buf, &end, 10);
        if (v >= 0 && v <= 3) {
            if ((int)v != s_last_logged_raw) {
                logmsg("旋转检测: 兜底 user_rotation=%ld", v);
                s_last_logged_raw = (int)v;
            }
            return (int)v;
        }
    }
    return -1;
}

static void refresh_rotation(long tnow) {
    refresh_manual_rotation(tnow);
    if (g_manual_rotation >= 0) return; /* 手动覆盖生效中，g_rotation 已在
                                            refresh_manual_rotation() 里设好，
                                            不再跑下面的自动检测 */
    if (!g_cfg.auto_rotate) return;
    if (tnow < g_rotate_next_check) return;
    g_rotate_next_check = tnow + g_cfg.rotate_poll_ms;
    int raw = detect_rotation();
    if (raw < 0) return;
    g_last_raw_rotation = raw;
    int r = ((raw - effective_rotate_base()) % 4 + 4) % 4;
    if (r == g_rotation) { g_rotate_pending_count = 0; return; }
    /* 防抖: 同一个新值要连续命中两次才真正采用，避免一次性的误判
     * (比如 logcat 里偶然出现一行无关内容凑巧匹配上) 就让方向突然
     * 跳变；真实的屏幕旋转会持续存在，两次轮询后一定还是同一个值，
     * 不会因此明显变慢(默认轮询间隔 250ms，最多多等一轮)。 */
    if (r == g_rotate_pending) {
        g_rotate_pending_count++;
    } else {
        g_rotate_pending = r;
        g_rotate_pending_count = 1;
    }
    if (g_rotate_pending_count >= 2) {
        logmsg("屏幕旋转变化: rotation=%d (原始值=%d, rotate_base=%d, flip180=%d)",
               r, raw, g_cfg.rotate_base, g_cfg.flip180 ? 1 : 0);
        g_rotation = r;
        g_rotate_pending_count = 0;
    }
}

/* ------------------------------------------------------------------ */
/* 点击输入框时自动让出鼠标控制权给输入法                                 */
/* ------------------------------------------------------------------ */
/* 需求: 点输入框弹出输入法后，方向键/翻页键应该完全交给输入法(候选词
 * 翻页、光标移动等)使用，而不是被我们当成鼠标操作；输入完成、输入法
 * 收起后，鼠标模式再自动恢复，不需要用户手动按 F1 关一次开一次。
 *
 * 检测手段: 和屏幕旋转检测同样的思路——没有能直接订阅"输入法显示/隐藏"
 * 事件的轻量接口，用 dumpsys 快照代替。不同版本的 InputMethodManagerService
 * dump 格式不尽相同，这里按经验尝试几种已知字段，命中第一个能解析出
 * 布尔值的就采用，和屏幕旋转检测使用完全相同的"多来源尝试+一旦命中就
 * 停"策略。如果这台设备/这个 Android 版本上恰好都不命中，这个功能会
 * 静默不生效(鼠标模式不受影响，不会因为探测不到就出错或误触发)——
 * 和当初屏幕旋转检测一样，如果实测发现不生效，把守护进程日志发回来，
 * 照着实际的 dumpsys 输出再补一条解析规则即可，不需要改动其它逻辑。 */
static int parse_ime_shown_from_text(const char *text) {
    /* 经典 AOSP 字段 (Android 8~11 左右的 InputMethodManagerService dump
     * 里很常见): mInputShown=true/false */
    const char *p = strstr(text, "mInputShown=");
    if (p) {
        p += strlen("mInputShown=");
        if (!strncmp(p, "true", 4)) return 1;
        if (!strncmp(p, "false", 5)) return 0;
    }
    /* 较新版本里的等价位图字段: mImeWindowVis 的 bit0 表示 IME_VISIBLE */
    p = strstr(text, "mImeWindowVis=");
    if (p) {
        char *end;
        long v = strtol(p + strlen("mImeWindowVis="), &end, 0);
        if (end != p + strlen("mImeWindowVis=")) return (v & 0x1) ? 1 : 0;
    }
    return -1;
}

/* 在 "InputMethod" 这个窗口自己的记录段落里找可见性字段，不跨段落匹配，
 * 避免误命中其它无关窗口/任务身上恰好同名的字段 (思路和旋转检测里
 * filter_relevant_lines 的"只信当前段落"是一致的)。 */
static int parse_ime_shown_from_window_dump(const char *text) {
    const char *w = strstr(text, "InputMethod}");
    if (!w) return -1;
    const char *next = strstr(w, "Window #");
    size_t seg_len = next ? (size_t)(next - w) : strlen(w);
    if (seg_len > 4096) seg_len = 4096;
    char seg[4097];
    memcpy(seg, w, seg_len);
    seg[seg_len] = '\0';
    if (strstr(seg, "isVisible=true")) return 1;
    if (strstr(seg, "isVisible=false")) return 0;
    if (strstr(seg, "shown=true")) return 1;
    if (strstr(seg, "shown=false")) return 0;
    return -1;
}

static int detect_ime_shown(void) {
    /* 实测反馈("keymouse.log"证实): 之前 8KB 的缓冲区根本不够——这台设备
     * 装了好几个输入法，仅列出第一个(Google 语音输入)的 ServiceInfo 就
     * 已经把 8KB 占满，我们要找的 mInputShown/mImeWindowVis 这类"当前
     * 状态"字段在 dumpsys 输出里排在所有已装输入法的详细信息之后，还
     * 没读到就被截断丢弃了——不是字段名猜错了，是压根没读到那一段。
     * 换成一个大得多的缓冲区，把整份输出都装下。 */
    static char buf[131072];
    static int s_last_logged = -999;
    static long s_last_diag_ms = 0;
    if (run_cmd_capture("dumpsys input_method 2>/dev/null", buf, sizeof(buf)) > 0) {
        int r = parse_ime_shown_from_text(buf);
        if (r >= 0) {
            if (r != s_last_logged) {
                logmsg("输入法检测: 命中 mInputShown/mImeWindowVis=%d (来源: dumpsys input_method)", r);
                s_last_logged = r;
            }
            return r;
        }
    }
    static const char *dump_cmds[] = {
        "dumpsys window windows 2>/dev/null",
        "dumpsys window 2>/dev/null",
        NULL
    };
    for (int i = 0; dump_cmds[i]; i++) {
        if (run_cmd_capture(dump_cmds[i], buf, sizeof(buf)) > 0) {
            int r = parse_ime_shown_from_window_dump(buf);
            if (r >= 0) {
                if (r != s_last_logged) {
                    logmsg("输入法检测: 命中 InputMethod 窗口可见性=%d (来源: %s)", r, dump_cmds[i]);
                    s_last_logged = r;
                }
                return r;
            }
        }
    }
    /* 两条路径都没解析出来 —— 这台设备/这个 Android 版本上的 dumpsys 字段
     * 名字大概率和这里假设的不一样(参考屏幕旋转检测当初也是这么校准的：
     * 先看实际输出，再照着写解析规则)。这里每隔至少 20 秒打印一次实际抓到
     * 的原始文本(截断，避免把日志灌爆)，方便直接从日志里复制真实字段名回来，
     * 不需要用户额外操作或者猜。
     *
     * 优先定位"当前状态"相关的关键字附近的文本；这类字段在 dumpsys 输出里
     * 通常排在所有已装输入法的详细列表之后，如果找不到关键字就退而求其次
     * 打印末尾片段而不是开头——开头几乎总是装了哪些输入法这种静态列表，
     * 之前就是因为只截了开头一段，永远看不到真正有用的状态字段。 */
    long tnow = now_ms();
    if (tnow - s_last_diag_ms >= 20000) {
        s_last_diag_ms = tnow;
        if (run_cmd_capture("dumpsys input_method 2>/dev/null", buf, sizeof(buf)) > 0) {
            char snippet[1600];
            size_t total = strlen(buf);
            static const char *anchors[] = {
                "mInputShown", "mImeWindowVis", "ClientState", "mCurClient",
                "Client Map", "mCurMethodId", NULL
            };
            const char *start = NULL;
            bool used_anchor = false;
            for (int i = 0; anchors[i]; i++) {
                const char *p = strstr(buf, anchors[i]);
                if (p) { start = p; used_anchor = true; break; }
            }
            size_t n;
            if (start) {
                size_t off = (size_t)(start - buf);
                size_t back = off > 200 ? 200 : off;
                start -= back;
                n = strlen(start);
            } else {
                /* 没找到任何关键字: 打印末尾片段而不是开头 */
                size_t tail = total > (size_t)1500 ? (size_t)1500 : total;
                start = buf + (total - tail);
                n = tail;
            }
            if (n > sizeof(snippet) - 1) n = sizeof(snippet) - 1;
            memcpy(snippet, start, n);
            snippet[n] = '\0';
            logmsg("输入法检测诊断(总长度=%zu字节, %s): 两条解析规则都没命中，原始片段如下:\n%s",
                   total, used_anchor ? "关键字附近" : "末尾", snippet);
        } else {
            logmsg("输入法检测诊断: dumpsys input_method 没有任何输出(可能命令不存在或权限不足)");
        }
    }
    return -1; /* 这一轮没探测到任何可信信号，沿用上次状态，不做任何改变 */
}

static long g_ime_next_poll = 0;
static bool g_ime_shown_last = false;

/* 实测反馈("BootLive_20260927_160431"系统日志证实): 这台设备上的输入法
 * "Start draw after previous draw not visible"，间隔常常只有几百毫秒到
 * 一两秒，且贯穿整个正常输入过程，跟用户是否还在打字毫无关系(很可能是
 * 这个输入法自己的候选栏/工具条一类子视图定期重建导致的)。
 *
 * 之前的实现只要单次探测到"没显示"就立刻恢复鼠标模式，于是每一次这种
 * 瞬间闪烁都会被误当成"用户输完收起了键盘"，把鼠标模式重新打开——而
 * 鼠标模式一旦打开又会重新抓取键盘，这时候如果输入法马上又闪回"显示"，
 * 下一轮又会立刻再关一次。表现出来就是鼠标在整个打字过程中不停被
 * 唤醒/关闭，而且因为这个自动逻辑和手动 F1 抢着改 g_enabled，赶上用户
 * 手动按 F1 关闭的时机前后，很容易被这个自动流程几乎立刻又打开，
 * 看起来就像"按 F1 关不掉"——其实两个现象是同一个根因。
 *
 * 第一版修复(连续 3 次轮询 ≈1.2 秒才当真)上线后，实测日志(2026-09-27
 * 08:20~08:22)显示: "自动暂停"这一侧完全可靠，每次探测到 mInputShown=1
 * 都立刻正确暂停；但"自动恢复"还是经常在探测到 mInputShown=0 之后仅仅
 * 1~2 秒内就恢复了鼠标模式——说明这台设备上"没显示"的真实持续时间，
 * 哪怕用户还在断断续续地打字(思考、切换候选词的间隙)，也经常会超过
 * 1.2 秒，光靠"连续几次轮询"这个粗粒度的判断滤不掉。
 *
 * 改成按经过时间而不是轮询次数判断，且把窗口大幅放宽: 从探测到第一次
 * "没显示"开始计时，必须连续、不间断地保持"没显示"状态达到
 * ime_hide_confirm_ms(默认 2500ms)，才认为输入法真的收起了。中途只要
 * 有一次重新探测到"显示"，计时就作废重新开始。2.5 秒对"真正打完字、
 * 移开输入框"这个场景造成的恢复延迟基本感觉不到，但足以覆盖观察到的
 * 打字间隙闪烁。如果这台设备上仍然不够，可以不改代码，直接在
 * Daemon 启动参数里加 --ime-hide-confirm-ms=更大的值。 */
static void refresh_ime_state(long tnow) {
    if (!g_cfg.auto_ime_suspend) return;
    if (tnow < g_ime_next_poll) return;
    g_ime_next_poll = tnow + g_cfg.ime_poll_ms;

    int shown = detect_ime_shown();
    if (shown < 0) return;

    if (shown) {
        g_ime_hidden_since_ms = -1; /* 中途又显示了，之前的"未显示"计时作废 */
        if (!g_ime_shown_last && g_enabled && !g_auto_home_suspended) {
            g_auto_ime_suspended = true;
            disable_mouse_mode(false); /* 静默: 不弹方向确认框，避免每次点
                                           输入框都弹一次窗，很烦人 */
            logmsg("检测到输入法弹出，自动暂停鼠标模式，交还给输入法");
        }
    } else {
        if (g_auto_ime_suspended) {
            if (g_ime_hidden_since_ms < 0) {
                g_ime_hidden_since_ms = tnow; /* 这次"未显示"观察窗口的起点 */
            } else if (tnow - g_ime_hidden_since_ms >= g_cfg.ime_hide_confirm_ms) {
                g_auto_ime_suspended = false;
                g_ime_hidden_since_ms = -1;
                if (!g_auto_home_suspended) enable_mouse_mode(false); /* 同上，静默恢复 */
                logmsg("检测到输入法收起(持续未显示%dms以上)，自动恢复鼠标模式",
                       g_cfg.ime_hide_confirm_ms);
            }
        } else {
            g_ime_hidden_since_ms = -1;
        }
    }
    g_ime_shown_last = shown;
}

/* ------------------------------------------------------------------ */
/* 前台是桌面时自动隐藏鼠标                                             */
/* ------------------------------------------------------------------ */
/* 在后台子进程里跑 dumpsys(单次要几十~几百毫秒)，不能卡住主循环，否则光标会
 * 一顿一顿。子进程把"前台包名"写进 files/keymouse_fg，下一轮循环收结果。
 * 前台包名取 topResumedActivity(有日志证实在这台机器上取值正确)，取不到再退到
 * mFocusedApp；桌面包名用 "cmd package resolve-activity ... HOME" 查，缓存在文件里。
 * "桌面"指 Launcher 这个应用，包括它的最近任务界面。 */
static pid_t g_fg_pid = -1;
static long  g_fg_next_poll = 0;
static char  g_fg_path[300] = "";

static void fg_paths_init(void) {
    const char *src = g_cfg.logfile[0] ? g_cfg.logfile : g_cfg.pidfile;
    if (!src[0]) return;
    char dir[256];
    snprintf(dir, sizeof(dir), "%s", src);
    char *sl = strrchr(dir, '/');
    if (!sl) return;
    *sl = '\0';
    snprintf(g_fg_path, sizeof(g_fg_path), "%s/keymouse_fg", dir);
}

static void fg_probe_start(void) {
    g_fg_probe_started_ms = now_ms();
    if (!g_fg_path[0]) return;
    pid_t pid = fork();
    if (pid < 0) return;
    if (pid == 0) {
        setsid();
        for (int fd = 3; fd < 1024; fd++) close(fd);
        char script[4200];
        /* 输出三行: F=前台 包/类 ; D=系统"默认桌面"(角色持有者/resolve-activity) ;
         * Q=所有声明了 HOME 的应用(默认桌面查不到时兜底)。全部由系统实时查询，
         * 不写死任何桌面包名。 */
        snprintf(script, sizeof(script),
            "RX='[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+'; "
            "F=$(dumpsys activity activities 2>/dev/null | grep -m1 -E 'topResumedActivity=' "
            "| grep -oE 'u[0-9]+ [A-Za-z0-9_.]+/[A-Za-z0-9_.$]+' | head -n1 | cut -d' ' -f2); "
            "if [ -z \"$F\" ]; then F=$(dumpsys activity activities 2>/dev/null | grep -m1 -E 'ResumedActivity' "
            "| grep -oE 'u[0-9]+ [A-Za-z0-9_.]+/[A-Za-z0-9_.$]+' | head -n1 | cut -d' ' -f2); fi; "
            "if [ -z \"$F\" ]; then F=$(dumpsys window displays 2>/dev/null | grep -m1 -E 'mFocusedApp=' "
            "| grep -oE 'u[0-9]+ [A-Za-z0-9_.]+/[A-Za-z0-9_.$]+' | head -n1 | cut -d' ' -f2); fi; "
            "D=$( { cmd role get-role-holders android.app.role.HOME 2>/dev/null; "
            "cmd package resolve-activity --brief -a android.intent.action.MAIN "
            "-c android.intent.category.HOME 2>/dev/null | tail -n1; } "
            "| grep -oE \"$RX\" | sort -u | tr '\\n' ' '); "
            "Q=$(cmd package query-activities --brief -a android.intent.action.MAIN "
            "-c android.intent.category.HOME 2>/dev/null | grep -oE \"$RX/\" | tr -d '/' | sort -u | tr '\\n' ' '); "
            /* P = 系统里的"拨号应用": 先问 DIALER 角色持有者和 ACTION_DIAL 的默认处理者；
             * 都没有时才退到"声明了 ACTION_DIAL 且包名像拨号/电话/通话"的应用。
             * 同样全部由系统实时查询，不写死任何拨号应用的包名(各厂商/各系统不同)。 */
            "P=$( { cmd role get-role-holders android.app.role.DIALER 2>/dev/null; "
            "cmd package resolve-activity --brief -a android.intent.action.DIAL -d tel:1 2>/dev/null | tail -n1; } "
            "| grep -oE \"$RX\" | sort -u | tr '\\n' ' '); "
            "if [ -z \"$P\" ]; then P=$(cmd package query-activities --brief -a android.intent.action.DIAL -d tel:1 2>/dev/null "
            "| grep -oE \"$RX/\" | tr -d '/' | grep -iE 'dial|phone|call' | sort -u | tr '\\n' ' '); fi; "
            "{ echo \"F $F\"; echo \"D $D\"; echo \"Q $Q\"; echo \"P $P\"; } > '%s.tmp' && mv '%s.tmp' '%s'; "
            "chmod 644 '%s' 2>/dev/null",
            g_fg_path, g_fg_path, g_fg_path, g_fg_path);
        execl("/system/bin/sh", "sh", "-c", script, (char *)NULL);
        _exit(127);
    }
    g_fg_pid = pid;
}

static bool pkg_in_list(const char *list, const char *pkg) {
    size_t pl = strlen(pkg);
    if (!pl) return false;
    const char *p = list;
    while (*p) {
        while (*p == ' ') p++;
        const char *e = p;
        while (*e && *e != ' ') e++;
        if ((size_t)(e - p) == pl && strncmp(p, pkg, pl) == 0) return true;
        p = e;
    }
    return false;
}

/* 这些包即使声明了 HOME 也不当桌面(选择器/开机向导/设置) */
static bool pkg_home_blacklisted(const char *pkg) {
    static const char *bl[] = { "android", "com.android.settings", "com.android.provision",
        "com.google.android.setupwizard", "com.android.setupwizard", NULL };
    for (int i = 0; bl[i]; i++) if (strcmp(pkg, bl[i]) == 0) return true;
    return false;
}

/* 取回上一次探测的结果: 1=桌面 0=不是 -1=没取到 */
static int fg_probe_result(void) {
    FILE *f = fopen(g_fg_path, "r");
    if (!f) return -1;
    char fg[300] = "", dflt[600] = "", qry[1200] = "", dial[600] = "", line[1300];
    while (fgets(line, sizeof(line), f)) {
        size_t n = strlen(line);
        while (n && (line[n-1] == '\n' || line[n-1] == '\r' || line[n-1] == ' ')) line[--n] = '\0';
        if (line[0] && line[1] == ' ') {
            if (line[0] == 'F') snprintf(fg, sizeof(fg), "%s", line + 2);
            else if (line[0] == 'D') snprintf(dflt, sizeof(dflt), "%s", line + 2);
            else if (line[0] == 'Q') snprintf(qry, sizeof(qry), "%s", line + 2);
            else if (line[0] == 'P') snprintf(dial, sizeof(dial), "%s", line + 2);
        } else if (line[0] == 'F' && !line[1]) {
            fg[0] = '\0';
        }
    }
    fclose(f);
    unlink(g_fg_path);
    if (!fg[0]) {
        static int warned = 0;
        if (warned++ < 3) logmsg("[fg] 没取到前台应用 (D=%s | Q=%s)", dflt, qry);
        return -1;
    }
    char pkg[200];
    snprintf(pkg, sizeof(pkg), "%s", fg);
    char *sl = strchr(pkg, '/');
    const char *cls = sl ? sl + 1 : "";
    if (sl) *sl = '\0';

    /* 默认桌面: 去掉黑名单后还有剩 → 只认它; 否则退到"所有声明了 HOME 的应用" */
    char dclean[600] = "";
    {
        char tmp[600];
        snprintf(tmp, sizeof(tmp), "%s", dflt);
        for (char *t = strtok(tmp, " "); t; t = strtok(NULL, " ")) {
            if (pkg_home_blacklisted(t)) continue;
            size_t l = strlen(dclean);
            snprintf(dclean + l, sizeof(dclean) - l, "%s ", t);
        }
    }
    const char *homes = dclean[0] ? dclean : qry;
    int home = 0;
    const char *why = "不在桌面列表";
    if (homes[0]) {
        if (!pkg_home_blacklisted(pkg) && pkg_in_list(homes, pkg)) { home = 1; why = dclean[0] ? "=默认桌面" : "声明了HOME"; }
    } else {
        /* 系统一个桌面都没查到(命令不可用): 只能认几个常见桌面，避免误伤普通应用 */
        if (strcmp(pkg, "com.meizu.flyme.launcher") == 0 || strcmp(pkg, "com.android.launcher3") == 0 ||
            strstr(pkg, "launcher") != NULL) { home = 1; why = "兜底:包名含launcher"; }
    }
    /* 最近任务(多任务界面)虽然跑在桌面进程里，但用户在切应用，不当桌面 */
    if (home && strstr(cls, "Recents")) { home = 0; why = "最近任务界面"; }

    /* 拨号应用: 系统查到的拨号应用列表里有它就算；列表是空的(命令不可用)才按包名含 dialer 兜底。
     * 通话界面(包名含 incallui)通话中也要按数字(DTMF)，一并当拨号应用。 */
    int dialer = 0;
    if (dial[0]) { if (!pkg_home_blacklisted(pkg) && pkg_in_list(dial, pkg)) dialer = 1; }
    else if (strstr(pkg, "dialer") != NULL) dialer = 1;
    if (!dialer && strstr(pkg, "incallui") != NULL) dialer = 1;
    g_fg_dialer = dialer;
    /* 用户在列表里勾选的应用: 包名在列表里就算(只排除 android 这个系统自身，避免选择器之类误伤) */
    snprintf(g_fg_pkg, sizeof(g_fg_pkg), "%s", pkg);
    g_fg_deb = (g_deb_apps[0] && pkg_in_list(g_deb_apps, pkg)) ? 1 : 0;
    /* KeyMouse 自己的界面永远不隐藏鼠标(否则从桌面回到 App 里，软开关还是关着，还得重新激活) */
    g_fg_custom = (g_hide_apps[0] && strcmp(pkg, "android") != 0 && strcmp(pkg, "com.keymouse.tool") != 0 &&
                   pkg_in_list(g_hide_apps, pkg)) ? 1 : 0;

    static char last[300] = "";
    char cur[300];
    snprintf(cur, sizeof(cur), "%s|%d|%d|%d", fg, home, dialer, g_fg_custom);
    if (strcmp(cur, last) != 0) {
        snprintf(last, sizeof(last), "%s", cur);
        logmsg("[fg] 前台=%s 判定=%s(%s) 拨号应用=%s 列表勾选=%s 默认桌面=[%s] HOME候选=[%s] 拨号候选=[%s]",
               fg, home ? "桌面" : "应用", why, dialer ? "是" : "否", g_fg_custom ? "是" : "否", dclean, qry, dial);
    }
    return home;
}

/* 需要盯着前台应用吗: "桌面时隐藏"开着，或者"拨号应用里不允许鼠标"(dialer_allow=0)。 */
/* 防抖只在列表里的应用生效时，也需要知道前台是谁(不管鼠标开没开) */
static bool deb_needs_fg(void) {
    return (g_cfg.deb_global || g_cfg.deb_mouse || g_cfg.deb_toggle) && !g_cfg.deb_all;
}
static bool deb_scope_ok(void) {
    return g_cfg.deb_all || g_fg_deb == 1;
}
static bool fg_watch_on(void) {
    return g_cfg.auto_home_suspend || !g_cfg.dialer_allow || g_hide_apps[0] != '\0' || deb_needs_fg();
}

static void refresh_home_state(long tnow) {
    if (!fg_watch_on()) {
        /* 桌面/拨号/列表都不需要盯了: 如果正因为它们而暂停，立刻恢复 */
        if (g_auto_home_suspended) {
            g_auto_home_suspended = false;
            if (!g_auto_ime_suspended && !g_enabled) enable_mouse_mode(false);
            logmsg("桌面/拨号应用隐藏功能已关闭，恢复鼠标模式");
        }
        g_home_manual_override = false;
        return;
    }
    if (!g_enabled && !g_auto_home_suspended && !deb_needs_fg()) {
        /* 鼠标本来就是手动关的: 没东西可隐藏/恢复。顺便把还没收的旧探测结果丢掉，
         * 免得之后重新打开鼠标时被一个几分钟前的"桌面"结果误伤。 */
        if (g_fg_pid > 0) {
            int st;
            if (waitpid(g_fg_pid, &st, WNOHANG) == g_fg_pid) { g_fg_pid = -1; if (g_fg_path[0]) unlink(g_fg_path); }
        }
        g_fg_home = -1;
        g_fg_dialer = -1;
        g_fg_custom = -1;
        g_fg_deb = -1;
        return;
    }

    if (g_fg_pid > 0) {
        int st;
        pid_t r = waitpid(g_fg_pid, &st, WNOHANG);
        if (r == 0) return;           /* 还在跑，下一轮再看 */
        g_fg_pid = -1;
        int home = fg_probe_result();
        if (home >= 0) {
            bool in_home = (home == 1) && g_cfg.auto_home_suspend;
            bool in_dial = (g_fg_dialer == 1) && !g_cfg.dialer_allow;
            bool in_custom = (g_fg_custom == 1);
            bool hide = in_home || in_dial || in_custom;
            if (home != g_fg_home) logmsg("前台检测: %s", home ? "桌面" : "应用");
            g_fg_home = home;
            if (!hide) g_home_manual_override = false;
            if (g_home_manual_override) {
                if (!g_ovr_pkg[0]) {
                    /* 只拿"手动开鼠标之后才启动"的探测结果来绑定当前应用 */
                    if (g_fg_probe_started_ms >= g_ovr_set_ms)
                        snprintf(g_ovr_pkg, sizeof(g_ovr_pkg), "%s", g_fg_pkg);
                } else if (strcmp(g_ovr_pkg, g_fg_pkg) != 0) {
                    g_home_manual_override = false;
                    g_ovr_pkg[0] = '\0';
                    logmsg("前台切到 %s，手动优先失效", g_fg_pkg);
                }
            }
            if (hide && g_enabled && !g_home_manual_override) {
                g_auto_home_suspended = true;
                disable_mouse_mode(false);   /* 静默，不弹窗；松开键盘抓取后数字键原样交给前台应用 */
                if (in_custom) notify_tip("hidden");   /* 屏幕底部小提示: 此应用鼠标已被隐藏 */
                logmsg(in_custom ? "检测到列表里勾选的应用，自动关闭鼠标"
                       : in_dial ? "检测到拨号应用，自动关闭鼠标(数字键交给拨号应用)"
                                 : "检测到桌面，自动隐藏(暂停)鼠标");
            } else if (!hide && g_auto_home_suspended) {
                g_auto_home_suspended = false;
                if (!g_auto_ime_suspended) enable_mouse_mode(false);
                logmsg("离开桌面/拨号应用，自动恢复鼠标");
            }
        }
    }
    if (g_fg_pid <= 0 && tnow >= g_fg_next_poll) {
        /* 拨号应用检测开着时，刚切进拨号应用就要尽快把数字键还给它，轮询放快到 500ms 以内 */
        int poll = g_cfg.home_poll_ms;
        if (!g_cfg.dialer_allow && poll > 500) poll = 500;
        g_fg_next_poll = tnow + poll;
        fg_probe_start();
    }
}

/* ------------------------------------------------------------------ */
/* 实时参数热更新 (移动速度/翻页速度)                                    */
/* ------------------------------------------------------------------ */
/* App 端在滑块拖动的同时(不必等松手，也不需要重启守护进程/su)直接把
 * 新的数值写进这个文件；守护进程只在有按键按住时才顺带检查一下文件的
 * mtime 有没有变，变了就重新读取生效——开销可以忽略不计，且完全不需要
 * 杀掉重启进程(重启的话旧进程还占着 grab，会导致新进程抢不到设备，
 * 这也是之前"改速度必须先关再开"的根本原因)。 */
static long g_cfg_next_check = 0;
static time_t g_cfg_last_mtime = 0;
static long   g_cfg_last_mtime_ns = -1;

static void refresh_live_config(long tnow) {
    if (!g_cfg.live_cfg[0]) return;
    if (tnow < g_cfg_next_check) return;
    g_cfg_next_check = tnow + 150;

    struct stat st;
    if (stat(g_cfg.live_cfg, &st) != 0) return;
    /* 之前只比较秒级时间戳: 一秒内连续两次写入(拖滑块、连点开关)第二次会被当成"没变化"
     * 漏掉。带上纳秒一起比较。 */
    if (st.st_mtime == g_cfg_last_mtime && st.st_mtim.tv_nsec == g_cfg_last_mtime_ns) return;
    g_cfg_last_mtime = st.st_mtime;
    g_cfg_last_mtime_ns = st.st_mtim.tv_nsec;

    FILE *f = fopen(g_cfg.live_cfg, "r");
    if (!f) return;
    bool flip_seen = false, flip_val = g_cfg.flip180;
    char line[4200];
    while (fgets(line, sizeof(line), f)) {
        int v;
        if (strncmp(line, "debKeys=", 8) == 0) {
            char *kv = line + 8;
            size_t kn = strlen(kv);
            while (kn && (kv[kn-1] == '\n' || kv[kn-1] == '\r' || kv[kn-1] == ' ')) kv[--kn] = '\0';
            bool tmp[DEB_MAXKEY];
            memset(tmp, 0, sizeof(tmp));
            memcpy(tmp, g_deb_key, sizeof(tmp));
            memset(g_deb_key, 0, sizeof(g_deb_key));
            char *save = NULL;
            for (char *tok = strtok_r(kv, ",", &save); tok; tok = strtok_r(NULL, ",", &save)) {
                int kc = 0, kf = 0;
                if (sscanf(tok, "%d:%d", &kc, &kf) == 2) deb_key_set(kc, kf != 0);
            }
            if (memcmp(tmp, g_deb_key, sizeof(tmp)) != 0) {
                char lst[256]; lst[0] = '\0';
                for (int c = 1; c < DEB_MAXKEY && strlen(lst) < 220; c++)
                    if (g_deb_key[c]) { char b[12]; snprintf(b, sizeof(b), "%d ", c); strcat(lst, b); }
                logmsg("防抖按键表已更新: [%s]", lst[0] ? lst : "(空)");
            }
        } else if (strncmp(line, "debApps=", 8) == 0) {
            char *dv = line + 8;
            size_t dn = strlen(dv);
            while (dn && (dv[dn-1] == '\n' || dv[dn-1] == '\r' || dv[dn-1] == ' ')) dv[--dn] = '\0';
            if (strcmp(dv, g_deb_apps) != 0) {
                snprintf(g_deb_apps, sizeof(g_deb_apps), "%s", dv);
                g_fg_next_poll = 0;
                logmsg("防抖应用列表已更新: [%s]", g_deb_apps[0] ? g_deb_apps : "(空)");
            }
        } else if (sscanf(line, "debGlobal=%d", &v) == 1) {
            if ((v != 0) != g_cfg.deb_global) { g_cfg.deb_global = (v != 0); logmsg("全局防抖: %s", v ? "开" : "关"); }
        } else if (sscanf(line, "debMouse=%d", &v) == 1) {
            if ((v != 0) != g_cfg.deb_mouse) { g_cfg.deb_mouse = (v != 0); logmsg("鼠标操作防抖: %s", v ? "开" : "关"); }
        } else if (sscanf(line, "debToggle=%d", &v) == 1) {
            if ((v != 0) != g_cfg.deb_toggle) { g_cfg.deb_toggle = (v != 0); logmsg("开关键防抖: %s", v ? "开" : "关"); }
        } else if (sscanf(line, "debAll=%d", &v) == 1) {
            if ((v != 0) != g_cfg.deb_all) { g_cfg.deb_all = (v != 0); g_fg_next_poll = 0; logmsg("所有应用都防抖: %s", v ? "是" : "否(只在列表里的应用)"); }
        } else if (sscanf(line, "debMs=%d", &v) == 1) {
            if (v < 0) v = 0;
            if (v > 1000) v = 1000;
            if (v != g_deb_ms) { g_deb_ms = v; logmsg("防抖时间: %dms", v); }
        } else if (sscanf(line, "debGhost=%d", &v) == 1) {
            if (v < 0) v = 0;
            if (v > 500) v = 500;
            if (v != g_deb_ghost_ms) { g_deb_ghost_ms = v; logmsg("幽灵短按过滤: %dms", v); }
        } else if (strncmp(line, "hideApps=", 9) == 0) {
            char *hv = line + 9;
            size_t hn = strlen(hv);
            while (hn && (hv[hn-1] == '\n' || hv[hn-1] == '\r' || hv[hn-1] == ' ')) hv[--hn] = '\0';
            if (strcmp(hv, g_hide_apps) != 0) {
                snprintf(g_hide_apps, sizeof(g_hide_apps), "%s", hv);
                g_fg_next_poll = 0;      /* 列表变了: 马上探测一次 */
                logmsg("鼠标隐藏应用列表已更新: [%s]", g_hide_apps[0] ? g_hide_apps : "(空)");
            }
        } else if (sscanf(line, "moveStep=%d", &v) == 1 && v > 0) {
            g_cfg.move_step = v;
        } else if (sscanf(line, "scrollStep=%d", &v) == 1 && v > 0) {
            g_cfg.scroll_step = v;
        } else if (sscanf(line, "flip180=%d", &v) == 1) {
            flip_seen = true;
            flip_val = (v != 0);
        } else if (sscanf(line, "autoImeSuspend=%d", &v) == 1) {
            bool nv = (v != 0);
            if (nv != g_cfg.auto_ime_suspend) {
                g_cfg.auto_ime_suspend = nv;
                g_ime_hidden_since_ms = -1;
                if (!nv && g_auto_ime_suspended) {
                    /* 关掉"输入法时隐藏": 正因输入法暂停着的话马上恢复，之后鼠标一直开着 */
                    g_auto_ime_suspended = false;
                    if (!g_auto_home_suspended && !g_enabled) enable_mouse_mode(false);
                }
                logmsg("输入法时隐藏鼠标: %s", nv ? "开" : "关(鼠标一直开启)");
            }
        } else if (sscanf(line, "autoHomeSuspend=%d", &v) == 1) {
            bool nv = (v != 0);
            if (nv != g_cfg.auto_home_suspend) {
                g_cfg.auto_home_suspend = nv;
                g_fg_next_poll = 0;      /* 刚打开: 马上探测一次 */
                logmsg("桌面时隐藏鼠标: %s", nv ? "开" : "关");
            }
        } else if (sscanf(line, "autoDialerAllow=%d", &v) == 1) {
            bool nv = (v != 0);
            if (nv != g_cfg.dialer_allow) {
                g_cfg.dialer_allow = nv;
                g_fg_next_poll = 0;      /* 刚切换: 马上探测一次 */
                logmsg("拨号应用里允许使用鼠标: %s", nv ? "开(拨号应用里照常用鼠标)" : "关(进拨号应用自动关鼠标)");
            }
        }
    }
    fclose(f);
    if (flip_seen && flip_val != g_cfg.flip180) {
        g_cfg.flip180 = flip_val;
        /* 立即按新的偏移重新算一次方向，不用等下一轮轮询/防抖，
         * 用户在 App 里一勾选就要马上看到效果。若还从没成功检测过
         * 旋转(g_last_raw_rotation 仍是 -1)，就先按 0 度处理，等下次
         * 轮询到真实值后自然会用新偏移重新计算一次。 */
        int raw = (g_last_raw_rotation >= 0) ? g_last_raw_rotation : 0;
        g_rotation = ((raw - effective_rotate_base()) % 4 + 4) % 4;
        g_rotate_pending = -1;
        g_rotate_pending_count = 0;
        logmsg("flip180 已切换为 %d，立即按 rotation=%d 重新生效", flip_val ? 1 : 0, g_rotation);
    }
    logmsg("实时参数已更新: move_step=%d scroll_step=%d flip180=%d",
           g_cfg.move_step, g_cfg.scroll_step, g_cfg.flip180 ? 1 : 0);
}

/* ------------------------------------------------------------------ */
/* 锁屏检测: 锁屏界面(未解锁)默认不启用鼠标                              */
/* ------------------------------------------------------------------ */
/* 起因: 锁屏界面也会出现鼠标，输入数字密码时按键却被鼠标模式抓走/当成方向键，有时候输不进去。
 * App 里有个开关(\"锁屏界面也启用鼠标\"，默认关)，写在 files/keymouse_lock.cfg 的 lockAllow。
 * 关着的时候: 检测到锁屏(keyguard 在显示且没被别的界面盖住)就自动暂停鼠标，解锁后自动恢复；
 * 锁屏状态下手动按开关键/App 开关也不会启用。检测不到状态(-1)一律按\"没锁\"处理，不会误关。 */
static time_t g_lock_cfg_mtime = 0;
static long   g_lock_cfg_mtime_ns = -1;
static long   g_lock_cfg_next = 0;
static long   g_lock_next_poll = 0;

static void refresh_lock_cfg(long tnow) {
    if (!g_cfg.live_cfg[0]) return;
    if (tnow < g_lock_cfg_next) return;
    g_lock_cfg_next = tnow + 150;
    char path[300];
    snprintf(path, sizeof(path), "%s", g_cfg.live_cfg);
    char *sl = strrchr(path, '/');
    if (!sl) return;
    snprintf(sl + 1, sizeof(path) - (size_t)(sl + 1 - path), "keymouse_lock.cfg");
    struct stat st;
    if (stat(path, &st) != 0) return;
    if (st.st_mtime == g_lock_cfg_mtime && st.st_mtim.tv_nsec == g_lock_cfg_mtime_ns) return;
    g_lock_cfg_mtime = st.st_mtime;
    g_lock_cfg_mtime_ns = st.st_mtim.tv_nsec;
    FILE *f = fopen(path, "r");
    if (!f) return;
    char line[64];
    while (fgets(line, sizeof(line), f)) {
        int v;
        if (sscanf(line, "lockAllow=%d", &v) == 1) g_cfg_lock_allow = (v != 0);
    }
    fclose(f);
    logmsg("锁屏界面启用鼠标: %s", g_cfg_lock_allow ? "允许" : "不允许(默认)");
}

static int parse_tf_after(const char *text, const char *key) {
    const char *p = text;
    while ((p = strstr(p, key)) != NULL) {
        p += strlen(key);
        if (strncmp(p, "true", 4) == 0) return 1;
        if (strncmp(p, "false", 5) == 0) return 0;
    }
    return -1;
}

/* 返回 1=锁屏中(未解锁且没被别的界面盖住)，0=没锁，-1=这一轮没探测到 */
static int detect_keyguard_locked(void) {
    static char buf[131072];
    static int s_last_logged = -999;
    static long s_last_diag_ms = 0;
    int r = -1;
    const char *src = "";
    if (run_cmd_capture("dumpsys window policy 2>/dev/null", buf, sizeof(buf)) > 0) {
        r = parse_tf_after(buf, "showingAndNotOccluded=");
        if (r >= 0) src = "window policy showingAndNotOccluded";
        if (r < 0) {
            const char *k = strstr(buf, "KeyguardServiceDelegate");
            if (k) { r = parse_tf_after(k, "showing="); if (r >= 0) src = "window policy showing"; }
        }
        if (r < 0) { r = parse_tf_after(buf, "isKeyguardShowing="); if (r >= 0) src = "window policy isKeyguardShowing"; }
    }
    if (r < 0 && run_cmd_capture("dumpsys activity activities 2>/dev/null | grep -i keyguard", buf, sizeof(buf)) > 0) {
        r = parse_tf_after(buf, "mKeyguardShowing=");
        if (r >= 0) src = "activity mKeyguardShowing";
    }
    if (r >= 0) {
        if (r != s_last_logged) { logmsg("锁屏检测: %s=%d (来源: %s)", r ? "锁屏中" : "未锁屏", r, src); s_last_logged = r; }
        return r;
    }
    long tnow = now_ms();
    if (tnow - s_last_diag_ms >= 20000) {
        s_last_diag_ms = tnow;
        if (run_cmd_capture("dumpsys window policy 2>/dev/null | grep -i -E 'keyguard|showing|occluded' | head -20", buf, sizeof(buf)) > 0)
            logmsg("锁屏检测诊断: 两条解析规则都没命中，相关原始行:\n%s", buf);
        else
            logmsg("锁屏检测诊断: dumpsys window policy 里没有任何 keyguard 相关行");
    }
    return -1;
}

static bool lock_blocks_enable(bool manual) {
    g_lock_cfg_next = 0;
    refresh_lock_cfg(now_ms());
    if (g_cfg_lock_allow) return false;
    if (detect_keyguard_locked() != 1) return false;
    if (!manual) g_auto_lock_suspended = true;   /* 自动恢复路径被拦住: 记下来，解锁后再恢复 */
    logmsg("锁屏界面(未解锁)，不启用鼠标 (App 里可打开\"锁屏界面也启用鼠标\")");
    return true;
}

static void refresh_lock_state(long tnow) {
    if (g_cfg_lock_allow) {
        if (g_auto_lock_suspended) {
            g_auto_lock_suspended = false;
            if (!g_enabled && !g_auto_ime_suspended && !g_auto_home_suspended) enable_mouse_mode(false);
        }
        return;
    }
    if (!g_enabled && !g_auto_lock_suspended) return;
    if (tnow < g_lock_next_poll) return;
    g_lock_next_poll = tnow + 1000;
    int l = detect_keyguard_locked();
    if (l < 0) return;
    if (l == 1) {
        if (g_enabled) {
            g_auto_lock_suspended = true;
            disable_mouse_mode(false);
            logmsg("检测到锁屏，自动暂停鼠标模式(解锁后自动恢复)");
        }
    } else if (g_auto_lock_suspended) {
        g_auto_lock_suspended = false;
        if (!g_enabled && !g_auto_ime_suspended && !g_auto_home_suspended) {
            enable_mouse_mode(false);
            logmsg("已解锁，自动恢复鼠标模式");
        }
    }
}

/* 长按时间(各个长按操作的阈值，毫秒)由 App 里的滑块写进 files/keymouse_hold.cfg，
 * 和实时参数同一套机制: 文件一变(含纳秒)就重新读，立即生效，不用重启守护进程。
 * 键: dragHold / menuHold / backHold / starHold (0=关闭该长按功能),
 *     toggleHold(开关键长按切换) / scrollHold(滚动键长按进入连续滑动) (最小 100)。 */
static time_t g_hold_last_mtime = 0;
static long   g_hold_last_mtime_ns = -1;
static long   g_hold_next_check = 0;

static void refresh_hold_config(long tnow) {
    if (!g_cfg.live_cfg[0]) return;
    if (tnow < g_hold_next_check) return;
    g_hold_next_check = tnow + 150;
    char path[300];
    snprintf(path, sizeof(path), "%s", g_cfg.live_cfg);
    char *sl = strrchr(path, '/');
    if (!sl) return;
    snprintf(sl + 1, sizeof(path) - (size_t)(sl + 1 - path), "keymouse_hold.cfg");
    struct stat st;
    if (stat(path, &st) != 0) return;
    if (st.st_mtime == g_hold_last_mtime && st.st_mtim.tv_nsec == g_hold_last_mtime_ns) return;
    g_hold_last_mtime = st.st_mtime;
    g_hold_last_mtime_ns = st.st_mtim.tv_nsec;
    FILE *f = fopen(path, "r");
    if (!f) return;
    char line[128];
    while (fgets(line, sizeof(line), f)) {
        int v;
        if (sscanf(line, "dragHold=%d", &v) == 1 && v >= 0) g_cfg.drag_hold_ms = v;
        else if (sscanf(line, "menuHold=%d", &v) == 1 && v >= 0) g_cfg.menu_hold_ms = v;
        else if (sscanf(line, "backHold=%d", &v) == 1 && v >= 0) g_cfg.back_hold_ms = v;
        else if (sscanf(line, "starHold=%d", &v) == 1 && v >= 0) g_cfg.star_hold_ms = v;
        else if (sscanf(line, "autoMenu=%d", &v) == 1 && v >= 0) g_cfg.auto_menu_ms = v;
        else if (sscanf(line, "touchMode=%d", &v) == 1) g_cfg.touch_mode = (v != 0);
        else if (sscanf(line, "toggleHold=%d", &v) == 1 && v >= 100) g_cfg.toggle_hold_ms = v;
        else if (sscanf(line, "scrollHold=%d", &v) == 1 && v >= 100) g_cfg.scroll_hold_ms = v;
    }
    fclose(f);
    logmsg("长按时间已更新(ms): 触摸点击模式=%d 自动复制菜单=%dms 确认拖动=%d 菜单=%d 返回=%d *=%d 开关键=%d 滚动=%d",
           g_cfg.touch_mode ? 1 : 0, g_cfg.auto_menu_ms, g_cfg.drag_hold_ms, g_cfg.menu_hold_ms, g_cfg.back_hold_ms, g_cfg.star_hold_ms,
           g_cfg.toggle_hold_ms, g_cfg.scroll_hold_ms);
}

/* 滚动/缩放速度由 App 里的滑块写进 files/keymouse_speed.cfg，机制同上(文件一变就重读)。
 * 键: glideSpeed(长按慢拖 像素/秒) / pinchMs(1/3 键捏合用时) /
 *     fastDist(单击滑动距离 像素) / fastSpeed(单击滑动速度 像素/秒)。 */
static time_t g_speed_last_mtime = 0;
static long   g_speed_last_mtime_ns = -1;
static long   g_speed_next_check = 0;

static void refresh_speed_config(long tnow) {
    if (!g_cfg.live_cfg[0]) return;
    if (tnow < g_speed_next_check) return;
    g_speed_next_check = tnow + 150;
    char path[300];
    snprintf(path, sizeof(path), "%s", g_cfg.live_cfg);
    char *sl = strrchr(path, '/');
    if (!sl) return;
    snprintf(sl + 1, sizeof(path) - (size_t)(sl + 1 - path), "keymouse_speed.cfg");
    struct stat st;
    if (stat(path, &st) != 0) return;
    if (st.st_mtime == g_speed_last_mtime && st.st_mtim.tv_nsec == g_speed_last_mtime_ns) return;
    g_speed_last_mtime = st.st_mtime;
    g_speed_last_mtime_ns = st.st_mtim.tv_nsec;
    FILE *f = fopen(path, "r");
    if (!f) return;
    char line[128];
    while (fgets(line, sizeof(line), f)) {
        int v;
        if (sscanf(line, "glideSpeed=%d", &v) == 1 && v >= 20) g_cfg.glide_speed = v;
        else if (sscanf(line, "pinchMs=%d", &v) == 1 && v >= 300) g_cfg.pinch_ms = v;
        else if (sscanf(line, "fastDist=%d", &v) == 1 && v >= 20) g_cfg.swipe_distance = v;
        else if (sscanf(line, "fastSpeed=%d", &v) == 1 && v >= 100) g_cfg.fast_speed = v;
    }
    fclose(f);
    logmsg("滚动/缩放速度已更新: 长按慢拖=%d像素/秒 捏合用时=%dms 单击滑动距离=%d像素 单击滑动速度=%d像素/秒",
           g_cfg.glide_speed, g_cfg.pinch_ms, g_cfg.swipe_distance, g_cfg.fast_speed);
}

/* 把"物理按键默认语义"的方向向量 (dx,dy) 旋转补偿成当前应实际输出给
 * (始终按面板出厂默认方向语义处理坐标的)虚拟鼠标/触摸设备的向量，使
 * 最终视觉方向始终等于物理按键的直觉方向。若发现补偿方向刚好反了(和
 * 期望的相反)，把 --rotate-sign 改成 -1 即可翻转，无需改算法。 */
static void rotate_vec(int dx, int dy, int *out_dx, int *out_dy) {
    if (!g_cfg.auto_rotate) { *out_dx = dx; *out_dy = dy; return; }
    int r = ((g_rotation * g_cfg.rotate_sign) % 4 + 4) % 4;
    switch (r) {
        case 1: *out_dx = -dy; *out_dy = dx;  break;   /* 90 度 */
        case 2: *out_dx = -dx; *out_dy = -dy; break;   /* 180 度 */
        case 3: *out_dx = dy;  *out_dy = -dx; break;   /* 270 度 */
        default: *out_dx = dx; *out_dy = dy;  break;   /* 0 度 */
    }
}

/* 专给 swipe 翻页用的旋转补偿，独立于上面的 rotate_vec()：
 *
 * 关键澄清 (2026-09-26 用户实测确认): 2/4/6/8 这四个键要的不是"意思不随
 * 屏幕方向变"(那是方向键 rotate_vec() 的模型)，而是"跟方向键一样，物理
 * 上跟着手机转"——用户给出的正确横屏映射 (2→左滑 8→右滑 4→下滑 6→上滑)
 * 相对竖屏映射 (2→上 8→下 4→左 6→右) 正好是转了 90 度，不是保持不变。
 *
 * 实测数据链路 (完整、双向确认过):
 *   - 未补偿时 (rotation=1): 6→下 4→上 2→右 8→左 —— 对照发送的物理向量，
 *     正好是标准 ROTATION_90 公式 (out_x=in_y, out_y=-in_x)，说明系统
 *     确实把我们的坐标转了一次。
 *   - 按“反函数”补偿一次 (r=1 那一档公式) 后 (rotation=1): 2/4/6/8
 *     表现变成跟竖屏完全一样(2→上 8→下 4→左 6→右)——也就是把系统那次
 *     旋转完全抵消了，回到了"意思不变"的效果。但用户要的不是这个，是要
 *     跟着物理转一次，所以还需要在此基础上再叠加一次目标本身的 90 度
 *     旋转，两次合起来正好是 180 度 = 直接取反。
 *   - 实测直接验证: 取反 raw 之后确实给出用户要的横屏映射，逐键核对
 *     完全吻合 (2/8对调、4/6对调)。
 *
 * 结论: rotation 为奇数(1、270 度这类) 时取反；rotation=0 或偶数时原样
 * 发送。这是取反(180度)运算，其本身就是自己的反函数，不存在"方向猜反了"
 * 的可能，所以不再需要 swipe_rotate_sign 那种符号开关。 */
static void rotate_vec_swipe(int dx, int dy, int *out_dx, int *out_dy) {
    if (!g_cfg.auto_rotate) { *out_dx = dx; *out_dy = dy; return; }
    if (g_rotation % 2 != 0) {
        *out_dx = -dx;
        *out_dy = -dy;
    } else {
        *out_dx = dx;
        *out_dy = dy;
    }
}

/* ------------------------------------------------------------------ */
/* 长按快捷动作 (替代 LSPosed/X-Edge 里的这几个按键功能)                */
/* ------------------------------------------------------------------ */
/* 这几个键是在 "按住达到阈值的那一刻" 就触发(而不是等松手)，本次按住只
 * 触发一次。单击仍然完全走系统默认处理——我们只是旁观按键事件，不拦截。
 * 因为守护进程是 root 一直在读 sprd-keypad，所以不管屏幕亮着还是息屏，
 * 只要这颗键的事件能上报，都能触发。 */
/* v68 按键自定义: 三个"槽位"(菜单键/返回键/星号键)，每个槽位可单独选动作、长按时间；
 * 另有总开关、锁屏时是否启用、息屏(休眠)时是否启用、排除应用列表。
 * 配置: files/keymouse_keymap.cfg (App 的"按键自定义"页写入，文件一变就热重读)。
 * 文件还不存在(从旧版升级、没进过新页面)时，沿用旧的 keymouse_hold.cfg 里的
 * menuHold/backHold/starHold 和固定动作，行为和 v67 完全一样。 */
enum { KS_MENU = 0, KS_BACK = 1, KS_STAR = 2, KS_COUNT = 3 };
enum { KA_OFF = 0, KA_RECENTS = 1, KA_KILL = 2, KA_TORCH = 3, KA_HOME = 4 };
static long g_ha_down_ms[KS_COUNT] = { -1, -1, -1 };
static bool g_ha_fired[KS_COUNT];
static bool g_torch_on = false;
static char g_torch_node[200] = "";
static char g_torch_max[32] = "1";

static bool g_km_loaded = false;                 /* keymouse_keymap.cfg 读到过 */
static bool g_km_master = true;                  /* 按键映射总开关 */
static bool g_km_lock_ok = true;                 /* 亮屏锁屏界面时是否启用 */
static bool g_km_sleep_ok = true;                /* 息屏(休眠)时是否启用 */
static int  g_km_act[KS_COUNT] = { KA_RECENTS, KA_KILL, KA_TORCH };
static int  g_km_ms[KS_COUNT]  = { 1500, 1500, 2000 };
static char g_km_excl[4096] = "";                /* 排除应用(空格分隔包名): 前台是它们时不触发 */

static int ha_action(int s) {
    if (!g_km_loaded) return s == KS_MENU ? KA_RECENTS : s == KS_BACK ? KA_KILL : KA_TORCH;
    return g_km_act[s];
}

/* 0 = 这个槽位当前不工作 */
static int ha_hold_ms(int s) {
    if (!g_km_loaded)
        return s == KS_MENU ? g_cfg.menu_hold_ms : s == KS_BACK ? g_cfg.back_hold_ms : g_cfg.star_hold_ms;
    if (!g_km_master || g_km_act[s] == KA_OFF) return 0;
    return g_km_ms[s];
}

/* 返回该键码对应的槽位，没有则 -1。KEY_MENU=139 KEY_BACK=158。
 * 星号键在不同机型上键码不一样：KEY_KPASTERISK=55、功能机常见的 227(STAR)、
 * KEY_NUMERIC_STAR=0x20a(522)，三个都认；还可以用 --star-code 额外指定。 */
static int ha_for_code(int code) {
    if (code == KEY_MENU) return KS_MENU;
    if (code == KEY_BACK) return KS_BACK;
    if (code == 55 || code == 227 || code == 0x20a || (g_cfg.star_code > 0 && code == g_cfg.star_code))
        return KS_STAR;
    return -1;
}

static time_t g_km_mtime = 0;
static long   g_km_mtime_ns = -1;
static long   g_km_next_check = 0;

static void refresh_keymap_cfg(long tnow) {
    if (!g_cfg.live_cfg[0]) return;
    if (tnow < g_km_next_check) return;
    g_km_next_check = tnow + 150;
    char path[300];
    snprintf(path, sizeof(path), "%s", g_cfg.live_cfg);
    char *sl = strrchr(path, '/');
    if (!sl) return;
    snprintf(sl + 1, sizeof(path) - (size_t)(sl + 1 - path), "keymouse_keymap.cfg");
    struct stat st;
    if (stat(path, &st) != 0) return;
    if (st.st_mtime == g_km_mtime && st.st_mtim.tv_nsec == g_km_mtime_ns) return;
    g_km_mtime = st.st_mtime;
    g_km_mtime_ns = st.st_mtim.tv_nsec;
    FILE *f = fopen(path, "r");
    if (!f) return;
    static char line[4400];
    char excl[4096] = "";
    while (fgets(line, sizeof(line), f)) {
        int v;
        if (sscanf(line, "kmOn=%d", &v) == 1) g_km_master = (v != 0);
        else if (sscanf(line, "menuAct=%d", &v) == 1 && v >= 0 && v <= KA_HOME) g_km_act[KS_MENU] = v;
        else if (sscanf(line, "backAct=%d", &v) == 1 && v >= 0 && v <= KA_HOME) g_km_act[KS_BACK] = v;
        else if (sscanf(line, "starAct=%d", &v) == 1 && v >= 0 && v <= KA_HOME) g_km_act[KS_STAR] = v;
        else if (sscanf(line, "menuMs=%d", &v) == 1 && v >= 300) g_km_ms[KS_MENU] = v;
        else if (sscanf(line, "backMs=%d", &v) == 1 && v >= 300) g_km_ms[KS_BACK] = v;
        else if (sscanf(line, "starMs=%d", &v) == 1 && v >= 300) g_km_ms[KS_STAR] = v;
        else if (sscanf(line, "lockOk=%d", &v) == 1) g_km_lock_ok = (v != 0);
        else if (sscanf(line, "sleepOk=%d", &v) == 1) g_km_sleep_ok = (v != 0);
        else if (strncmp(line, "excl=", 5) == 0) {
            char *ev = line + 5;
            size_t en = strlen(ev);
            while (en && (ev[en-1] == '\n' || ev[en-1] == '\r' || ev[en-1] == ' ')) ev[--en] = '\0';
            snprintf(excl, sizeof(excl), "%s", ev);
        }
    }
    fclose(f);
    snprintf(g_km_excl, sizeof(g_km_excl), "%s", excl);
    g_km_loaded = true;
    for (int s = 0; s < KS_COUNT; s++) g_ha_down_ms[s] = -1;   /* 配置变了，进行中的计时作废 */
    logmsg("按键自定义已更新: 总开关=%d 菜单=%d/%dms 返回=%d/%dms 星号=%d/%dms 锁屏启用=%d 息屏启用=%d 排除应用=[%s]",
           g_km_master ? 1 : 0, g_km_act[0], g_km_ms[0], g_km_act[1], g_km_ms[1], g_km_act[2], g_km_ms[2],
           g_km_lock_ok ? 1 : 0, g_km_sleep_ok ? 1 : 0, g_km_excl[0] ? g_km_excl : "(空)");
}

/* 屏幕是否亮着: 1=亮 0=息屏/休眠(Asleep/Dozing) -1=没取到 */
static int detect_screen_awake(void) {
    char buf[256];
    if (run_cmd_capture("dumpsys power 2>/dev/null | grep -m1 -o 'mWakefulness=[A-Za-z]*'", buf, sizeof(buf)) > 0) {
        if (strstr(buf, "mWakefulness=Awake")) return 1;
        if (strstr(buf, "mWakefulness=")) return 0;
    }
    return -1;
}

/* 取当前前台应用包名(只在排除列表非空、长按触发的那一刻同步查一次)。成功返回 true。 */
static bool km_foreground_pkg(char *pkg, size_t sz) {
    char buf[300] = "";
    const char *cmd =
        "F=$(dumpsys activity activities 2>/dev/null | grep -m1 -E 'topResumedActivity=' "
        "| grep -oE 'u[0-9]+ [A-Za-z0-9_.]+/[A-Za-z0-9_.$]+' | head -n1 | cut -d' ' -f2); "
        "if [ -z \"$F\" ]; then F=$(dumpsys activity activities 2>/dev/null | grep -m1 -E 'ResumedActivity' "
        "| grep -oE 'u[0-9]+ [A-Za-z0-9_.]+/[A-Za-z0-9_.$]+' | head -n1 | cut -d' ' -f2); fi; echo \"$F\"";
    if (run_cmd_capture(cmd, buf, sizeof(buf)) <= 0) return false;
    char *e = buf;
    while (*e && *e != '/' && *e != '\n' && *e != ' ') e++;
    *e = '\0';
    if (!buf[0]) return false;
    snprintf(pkg, sz, "%s", buf);
    return true;
}

static bool km_pkg_excluded(const char *pkg) {
    size_t pl = strlen(pkg);
    if (!pl) return false;
    const char *p = g_km_excl;
    while (*p) {
        while (*p == ' ') p++;
        const char *e = p;
        while (*e && *e != ' ') e++;
        if ((size_t)(e - p) == pl && strncmp(p, pkg, pl) == 0) return true;
        p = e;
    }
    return false;
}

/* 长按满时间的那一刻，检查"这次该不该执行": 排除应用 / 锁屏 / 息屏。 */
static bool km_allowed_now(void) {
    if (!g_km_loaded) return true;
    if (g_km_excl[0]) {
        char pkg[200];
        if (km_foreground_pkg(pkg, sizeof(pkg)) && km_pkg_excluded(pkg)) {
            logmsg("按键自定义: 前台应用 %s 在排除列表里，不执行", pkg);
            return false;
        }
    }
    if (!g_km_sleep_ok || !g_km_lock_ok) {
        int awake = detect_screen_awake();
        if (awake == 0) {
            if (!g_km_sleep_ok) { logmsg("按键自定义: 息屏状态下已设为不启用"); return false; }
        } else if (!g_km_lock_ok && detect_keyguard_locked() == 1) {
            logmsg("按键自定义: 锁屏界面下已设为不启用");
            return false;
        }
    }
    return true;
}

static bool write_file_str(const char *path, const char *val) {
    int fd = open(path, O_WRONLY);
    if (fd < 0) return false;
    ssize_t n = write(fd, val, strlen(val));
    close(fd);
    return n > 0;
}

/* 按住等待期间持有一个带超时的唤醒锁：息屏时系统可能很快又进入休眠，
 * 休眠了我们的 2 秒计时就走不完，长按永远触发不了。超时自动释放，
 * 不需要配对 unlock，也不会因为漏掉松开事件而一直耗电。 */
static void wake_hold(long ms) {
    char buf[64];
    snprintf(buf, sizeof(buf), "keymouse_hold %ld000000", ms);
    write_file_str("/sys/power/wake_lock", buf);
}

/* ---- 手电筒 ---------------------------------------------------------
 * 这台机器的闪光灯 (flash-aw3641) 不在 /sys/class/leds 里，由相机系统服务接管。
 * 做法：用 app_process 启动内置的 Java 助手 (kmt.KmTorch)，它调用系统自带手电筒
 * 用的同一个接口 CameraService.setTorchMode。系统会在助手进程退出时自动关灯，
 * 所以助手开灯后一直活着；关灯 = 结束助手进程。是否"开着"就看助手进程是否还活着，
 * 不靠自己记状态，避免状态和实际灯不一致。
 * 如果设备上确实有名字带 torch/flash 的 LED 节点(或指定了 --torch-path)，
 * 仍然优先直接写 sysfs。 */
static pid_t g_torch_pid = -1;
static long  g_torch_check_at = 0;   /* 助手启动后过几秒检查它是不是已经退出(失败) */
static char  g_torch_jar[300] = "";

static void torch_find_node(void) {
    if (g_cfg.torch_path[0]) {
        snprintf(g_torch_node, sizeof(g_torch_node), "%s", g_cfg.torch_path);
        return;
    }
    DIR *d = opendir("/sys/class/leds");
    if (!d) return;
    struct dirent *e;
    while ((e = readdir(d)) != NULL) {
        if (e->d_name[0] == '.') continue;
        if (g_torch_node[0]) continue;
        if (strcasestr(e->d_name, "torch") || strcasestr(e->d_name, "flash")) {
            snprintf(g_torch_node, sizeof(g_torch_node), "/sys/class/leds/%s/brightness", e->d_name);
            char mp[220]; snprintf(mp, sizeof(mp), "/sys/class/leds/%s/max_brightness", e->d_name);
            FILE *f = fopen(mp, "r");
            if (f) { if (fgets(g_torch_max, sizeof(g_torch_max), f)) g_torch_max[strcspn(g_torch_max, "\n")] = 0; fclose(f); }
        }
    }
    closedir(d);
}

/* 把内置 jar 写到日志同目录 (App 私有目录，root 能写)，没有就用 /data/local/tmp。 */
static bool torch_prepare_jar(void) {
    if (g_torch_jar[0]) return true;
    char dir[256] = "";
    const char *src = g_cfg.logfile[0] ? g_cfg.logfile : g_cfg.pidfile;
    if (src[0]) {
        snprintf(dir, sizeof(dir), "%s", src);
        char *sl = strrchr(dir, '/');
        if (sl) *sl = '\0'; else dir[0] = '\0';
    }
    const char *dirs[2] = { dir[0] ? dir : "/data/local/tmp", "/data/local/tmp" };
    for (int i = 0; i < 2; i++) {
        char path[300];
        snprintf(path, sizeof(path), "%s/km_torch.jar", dirs[i]);
        unlink(path);
        int fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0444);
        if (fd < 0) continue;
        ssize_t n = write(fd, km_torch_jar, km_torch_jar_len);
        fchmod(fd, 0444);
        close(fd);
        if (n == (ssize_t)km_torch_jar_len) {
            snprintf(g_torch_jar, sizeof(g_torch_jar), "%s", path);
            return true;
        }
    }
    return false;
}

static bool torch_helper_alive(void) {
    if (g_torch_pid <= 0) return false;
    int st;
    pid_t r = waitpid(g_torch_pid, &st, WNOHANG);
    if (r == 0) return true;
    logmsg("手电筒助手进程 %d 已经退出 (status=0x%x)", (int)g_torch_pid, st);
    g_torch_pid = -1;
    return false;
}

static void torch_helper_stop(void) {
    if (g_torch_pid <= 0) return;
    kill(g_torch_pid, SIGTERM);   /* 助手的退出钩子会先主动关灯 */
    for (int i = 0; i < 30; i++) {
        int st;
        if (waitpid(g_torch_pid, &st, WNOHANG) == g_torch_pid) { g_torch_pid = -1; return; }
        usleep(50 * 1000);
    }
    kill(g_torch_pid, SIGKILL);   /* 被杀时系统服务检测到 Binder 死亡，同样会关灯 */
    waitpid(g_torch_pid, NULL, 0);
    g_torch_pid = -1;
}

/* ---- 红点/真实指针助手 (root, 常驻) ----------------------------------
 * 见 native/kmt/KmDot.java。它不是 App 进程，不会被系统内存清理(lmkd)杀掉；
 * 它直接读系统里鼠标指针的真实坐标，红点画在那个点上，同时把真实坐标写进
 * keymouse_ptr，这里据此校正"滑动起点"，保证起点就是指针所在的位置。 */
static pid_t g_dot_pid = -1;
static long  g_dot_next_try = 0;
static char  g_ptr_path[300] = "", g_alive_path[300] = "";
static long  g_ptr_last_mtime_ms = 0;

static void files_dir_of(char *dir, size_t n) {
    dir[0] = '\0';
    const char *src = g_cfg.logfile[0] ? g_cfg.logfile : g_cfg.pidfile;
    if (!src[0]) return;
    snprintf(dir, n, "%s", src);
    char *sl = strrchr(dir, '/');
    if (sl) *sl = '\0'; else dir[0] = '\0';
}

static char g_tip_req_path[300] = "";
static char g_app_alive_path[300] = "";
static long g_app_next_try = 0;

static void dot_paths_init(void) {
    char dir[256];
    files_dir_of(dir, sizeof(dir));
    if (!dir[0]) return;
    snprintf(g_ptr_path, sizeof(g_ptr_path), "%s/keymouse_ptr", dir);
    snprintf(g_alive_path, sizeof(g_alive_path), "%s/keymouse_dot_alive", dir);
    snprintf(g_tip_req_path, sizeof(g_tip_req_path), "%s/keymouse_tip_req", dir);
    snprintf(g_app_alive_path, sizeof(g_app_alive_path), "%s/keymouse_app_alive", dir);
    snprintf(g_cmd_path, sizeof(g_cmd_path), "%s/keymouse_cmd", dir);
    snprintf(g_state_path, sizeof(g_state_path), "%s/keymouse_state", dir);
    snprintf(g_togkey_path, sizeof(g_togkey_path), "%s/keymouse_toggle_key", dir);
    snprintf(g_togkey2_path, sizeof(g_togkey2_path), "%s/keymouse_toggle_key2", dir);
    snprintf(g_togkeys_path, sizeof(g_togkeys_path), "%s/keymouse_toggle_keys", dir);
    snprintf(g_confkey_path, sizeof(g_confkey_path), "%s/keymouse_confirm_key", dir);
    snprintf(g_flags_path, sizeof(g_flags_path), "%s/keymouse_flags", dir);
    snprintf(g_ptr_orig_path, sizeof(g_ptr_orig_path), "%s/keymouse_ptr_style_orig", dir);
}

/* 心跳文件新鲜、且带 tx=1(不管 ov 是 1 还是 0)就说明 root 助手(KmDot)进程活着、
 * 而且能画文字窗口——弹窗请求可以放心写文件交给它，不需要再兜底发 am broadcast。
 * dot_overlay_ok() 另外还要求 ov=1，那是"红点悬浮窗具体建成了没"，两个
 * 问题不一样：弹窗用的是独立的悬浮窗，只要助手进程在跑、Context 建好了
 * 就能画，不需要红点那个悬浮窗也成功。 */
static bool dot_helper_alive(void) {
    if (!g_alive_path[0]) return false;
    struct stat st;
    if (stat(g_alive_path, &st) != 0) return false;
    long mt = (long)st.st_mtim.tv_sec * 1000L + st.st_mtim.tv_nsec / 1000000L;
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    long nowr = (long)ts.tv_sec * 1000L + ts.tv_nsec / 1000000L;
    if ((nowr - mt) > 3000) return false;
    /* 助手活着还不够: 心跳里要有 tx=1，说明它自检过"能画带文字的窗口"。
     * 之前的版本只看心跳新鲜，助手因为字体系统没初始化画不了字，守护进程却以为
     * 提示已经交出去了，于是不再走旧的广播方式——提示就这样悄悄丢了。 */
    char b[32] = "";
    FILE *f = fopen(g_alive_path, "r");
    if (!f) return false;
    if (fgets(b, sizeof(b), f)) { /* ov=1 tx=1 */ }
    fclose(f);
    return strstr(b, "tx=1") != NULL;
}

static bool dot_overlay_ok(void) {
    if (!g_alive_path[0]) return false;
    struct stat st;
    if (stat(g_alive_path, &st) != 0) return false;
    long mt = (long)st.st_mtim.tv_sec * 1000L + st.st_mtim.tv_nsec / 1000000L;
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    long nowr = (long)ts.tv_sec * 1000L + ts.tv_nsec / 1000000L;
    if (nowr - mt > 3000) return false;
    char b[16] = "";
    FILE *f = fopen(g_alive_path, "r");
    if (!f) return false;
    if (fgets(b, sizeof(b), f)) { /* ov=1 / ov=0 */ }
    fclose(f);
    return strncmp(b, "ov=1", 4) == 0;
}

/* 弹窗请求: 写一行 "<seq> <kind> <arg>" 给常驻 root 助手(KmDot)轮询消费，
 * 它不是 App 进程，画悬浮窗不受"是哪个 App 在前台/内存紧不紧"影响——
 * 这是"弹窗只有在 keymouse 自己界面里才出现"这个老问题的根本解法:
 * 以前靠 am broadcast 拉起 App 的 BroadcastReceiver 进程来画，那个进程
 * 寿命极短，常常等不到真正上屏就被系统收掉了。seq 用"墙上时间-计数器"
 * 拼出来，只要求助手那边能判断"和上次是不是同一条"，不需要跨进程共享
 * 计数状态。 */
static void send_tip_file(const char *kind, const char *arg) {
    if (!g_tip_req_path[0]) return;
    static int seq_counter = 0;
    FILE *f = fopen(g_tip_req_path, "w");
    if (!f) return;
    fprintf(f, "%ld-%d %s %s\n", now_ms(), ++seq_counter, kind, arg && arg[0] ? arg : "-");
    fclose(f);
}

/* 日志(2026-10-06): 魅族的进程冻结器会在 keymouse 切到后台后约 45 秒把整个 App 进程冻结
 * (am_freeze / uidFrozen，前台服务也不例外)，冻住的进程不会跑任何代码，红点就停在原地，
 * 只有看门狗每 10 秒"拉起服务"顺带临时解冻一下才动一次。这台机器的冻结器用的是
 * cgroup v2 (/sys/fs/cgroup/uid_<uid>/pid_<pid>/cgroup.freeze，日志里能看到 AMS 在检查这条路径)，
 * 守护进程是 root，鼠标模式开着时每 0.5 秒检查一次，被冻住就写 0 解冻。
 * App 里的服务把自己的 pid 写在心跳文件里(冻住前最后一次写入的值仍然有效)。
 * 副作用: 鼠标模式开着时守护进程每 0.5 秒醒一次(以前是 3 秒)，略费电；系统以为它冻着、
 * 实际在跑，目前没看到有坏处。 */
static long g_thaw_count = 0;
static void app_thaw(void) {
    if (!g_app_alive_path[0]) return;
    struct stat st;
    if (stat(g_app_alive_path, &st) != 0) return;
    int pid = 0;
    FILE *f = fopen(g_app_alive_path, "r");
    if (!f) return;
    if (fscanf(f, "%d", &pid) != 1) pid = 0;
    fclose(f);
    if (pid <= 1) return;
    char path[96];
    snprintf(path, sizeof(path), "/sys/fs/cgroup/uid_%u/pid_%d/cgroup.freeze", (unsigned)st.st_uid, pid);
    int fd = open(path, O_RDWR);
    if (fd < 0) return;                      /* 进程已不在 / 路径不存在: 忽略 */
    char c = '0';
    if (read(fd, &c, 1) == 1 && c == '1') {
        lseek(fd, 0, SEEK_SET);
        ssize_t w = write(fd, "0", 1);
        g_thaw_count++;
        if (g_thaw_count <= 5 || g_thaw_count % 50 == 0)
            logmsg("App 解冻: pid=%d 原本被冻结，已写 0 解冻 (rc=%d errno=%d, 累计 %ld 次)", pid, (int)w, w < 0 ? errno : 0, g_thaw_count);
    }
    close(fd);
}

/* 弹窗/红点必须由"真正的 App 进程"来画: 实测(日志 Session: Unknown pid=.. uid=0)
 * WindowManagerService 只给在 ActivityManager 里注册过的 App 进程开窗口会话，
 * root 的 app_process 助手永远建不出窗口。所以让 App 里的前台服务
 * (KeepAliveService)常驻，抗住内存回收，弹窗广播和红点都由它所在进程处理。
 * 它每秒写心跳 keymouse_app_alive；心跳过期且鼠标模式开着就用 am 重新拉起。 */
static void app_keepalive_ensure(bool force) {
    if (!g_app_alive_path[0]) return;
    long t = now_ms();
    if (!force && t < g_app_next_try) return;
    struct stat st;
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    long nowr = (long)ts.tv_sec * 1000L + ts.tv_nsec / 1000000L;
    if (!force && stat(g_app_alive_path, &st) == 0) {
        long mt = (long)st.st_mtim.tv_sec * 1000L + st.st_mtim.tv_nsec / 1000000L;
        if (nowr - mt <= 6000) return;
    }
    g_app_next_try = t + 8000;
    int rc = system("am start-foreground-service --user 0 -n com.keymouse.tool/.KeepAliveService >/dev/null 2>&1 &");
    (void)rc;
    logmsg("App 保活服务: 已请求拉起 KeepAliveService (force=%d)", force ? 1 : 0);
}

static void app_keepalive_kick(void) { g_app_next_try = 0; app_keepalive_ensure(false); }

static void dot_helper_start(void) {
    if (!torch_prepare_jar()) { logmsg("红点助手: 写助手 jar 失败"); return; }
    /* 守护进程被 SIGKILL / 升级覆盖安装时，上一轮的助手(它自己 setsid 了)会变成孤儿继续跑，
     * 旧版本的助手还会和新的抢同一批文件、画出两个红点。每个守护进程第一次启动助手前
     * 先把残留的清掉。[.] 是为了不匹配到 system() 起的这个 sh 自己的命令行。 */
    static bool stale_cleaned = false;
    if (!stale_cleaned) {
        stale_cleaned = true;
        int rc0 = system("pkill -x km_dot >/dev/null 2>&1; pkill -f 'kmt[.]KmDot' >/dev/null 2>&1");
        (void)rc0;
        usleep(300 * 1000);
    }
    char dir[256];
    files_dir_of(dir, sizeof(dir));
    if (!dir[0]) snprintf(dir, sizeof(dir), "/data/local/tmp");
    if (g_ptr_path[0]) unlink(g_ptr_path);   /* 旧的真实坐标不能带进新一轮 */
    pid_t pid = fork();
    if (pid < 0) { logmsg("红点助手: fork 失败 errno=%d", errno); return; }
    if (pid == 0) {
        setsid();
        for (int fd = 3; fd < 1024; fd++) close(fd);
        const char *lf = g_cfg.logfile[0] ? g_cfg.logfile : "/dev/null";
        int lfd = open(lf, O_WRONLY | O_APPEND | O_CREAT, 0666);
        if (lfd >= 0) { dup2(lfd, 1); dup2(lfd, 2); if (lfd > 2) close(lfd); }
        setenv("CLASSPATH", g_torch_jar, 1);
        execl("/system/bin/app_process", "app_process", "/system/bin",
              "--nice-name=km_dot", "kmt.KmDot", dir, (char *)NULL);
        _exit(127);
    }
    g_dot_pid = pid;
    logmsg("红点助手: 已启动 pid=%d，结果见后面的 [dot] 行", (int)pid);
}

/* 确保助手在跑；挂了(被杀/崩溃/没建成)就重启，但两次尝试至少隔 8 秒，
 * 避免它起不来的时候疯狂重启。 */
static void dot_helper_ensure(void) {
    if (g_dot_pid > 0) {
        int st;
        pid_t r = waitpid(g_dot_pid, &st, WNOHANG);
        if (r == 0) return;
        logmsg("红点助手进程 %d 已退出 (status=0x%x)", (int)g_dot_pid, st);
        g_dot_pid = -1;
    }
    long t = now_ms();
    if (t < g_dot_next_try) return;
    g_dot_next_try = t + 8000;
    dot_helper_start();
}

static void dot_helper_stop(void) {
    if (g_dot_pid <= 0) return;
    kill(g_dot_pid, SIGTERM);
    for (int i = 0; i < 20; i++) {
        int st;
        if (waitpid(g_dot_pid, &st, WNOHANG) == g_dot_pid) { g_dot_pid = -1; return; }
        usleep(50 * 1000);
    }
    kill(g_dot_pid, SIGKILL);
    waitpid(g_dot_pid, NULL, 0);
    g_dot_pid = -1;
}

/* 用系统里鼠标指针的真实坐标(显示器当前方向下的像素坐标)校正 g_cur。
 * 换算和系统把触摸屏坐标映射到显示器的方向一致(与 PosDot 里的正向换算互为反函数)。 */
static void ptr_sync(bool force) {
    g_ptr_used_real = false;
    if (!g_ptr_path[0]) return;
    struct stat st;
    if (stat(g_ptr_path, &st) != 0) return;
    long mt = (long)st.st_mtim.tv_sec * 1000L + st.st_mtim.tv_nsec / 1000000L;
    {
        /* 助手每秒都会重写这个文件；超过 3 秒没更新说明助手没在跑，里面的坐标可能是
         * 上一轮/很久以前的旧值，用它起手滑动反而比估算坐标更不准，所以不用。 */
        struct timespec ts;
        clock_gettime(CLOCK_REALTIME, &ts);
        long nowr = (long)ts.tv_sec * 1000L + ts.tv_nsec / 1000000L;
        g_ptr_age_ms = nowr - mt;
        if (g_ptr_age_ms > 3000) return;
    }
    if (!force && mt == g_ptr_last_mtime_ms) return;
    FILE *f = fopen(g_ptr_path, "r");
    if (!f) return;
    int rot = -1, dw = 0, dh = 0;
    float x = 0, y = 0;
    int n = fscanf(f, "%d %d %d %f %f", &rot, &dw, &dh, &x, &y);
    fclose(f);
    if (n != 5 || dw <= 1 || dh <= 1) return;
    g_ptr_last_mtime_ms = mt;
    if (rot < 0 || rot > 3) rot = g_rotation;
    float u = x / (float)(dw - 1), v = y / (float)(dh - 1), fx, fy;
    if (u < 0) u = 0; if (u > 1) u = 1;
    if (v < 0) v = 0; if (v > 1) v = 1;
    switch (rot) {
        case 1:  fx = 1.0f - v; fy = u;        break;
        case 2:  fx = 1.0f - u; fy = 1.0f - v; break;
        case 3:  fx = v;        fy = 1.0f - u; break;
        default: fx = u;        fy = v;        break;
    }
    int nx = (int)(fx * (float)(g_panel_w - 1) + 0.5f);
    int ny = (int)(fy * (float)(g_panel_h - 1) + 0.5f);
    static long s_last_log = 0;
    long tn = now_ms();
    if ((abs(nx - g_cur_x) > 4 || abs(ny - g_cur_y) > 4) && tn - s_last_log > 3000) {
        s_last_log = tn;
        logmsg("指针校正: 估算(%d,%d) -> 真实(%d,%d) [显示器 rot=%d %dx%d 指针(%.0f,%.0f)]",
               g_cur_x, g_cur_y, nx, ny, rot, dw, dh, x, y);
    }
    g_cur_x = nx;
    g_cur_y = ny;
    g_ptr_used_real = true;
    pos_publish(true);
}

static void torch_helper_start(void) {
    if (!torch_prepare_jar()) { logmsg("手电筒: 写助手 jar 失败"); return; }
    pid_t pid = fork();
    if (pid < 0) { logmsg("手电筒: fork 失败 errno=%d", errno); return; }
    if (pid == 0) {
        setsid();
        /* 绝不能把守护进程已打开的输入设备/uinput 句柄带进长期存活的助手进程，
         * 否则守护进程退出后设备的独占(grab)和虚拟设备都会被它拖着不释放。 */
        for (int fd = 3; fd < 1024; fd++) close(fd);
        const char *lf = g_cfg.logfile[0] ? g_cfg.logfile : "/dev/null";
        int lfd = open(lf, O_WRONLY | O_APPEND | O_CREAT, 0666);
        if (lfd >= 0) { dup2(lfd, 1); dup2(lfd, 2); if (lfd > 2) close(lfd); }
        setenv("CLASSPATH", g_torch_jar, 1);
        execl("/system/bin/app_process", "app_process", "/system/bin",
              "--nice-name=km_torch", "kmt.KmTorch", "auto", (char *)NULL);
        _exit(127);
    }
    g_torch_pid = pid;
    g_torch_check_at = now_ms() + 3500;
    logmsg("手电筒: 已启动助手进程 pid=%d (jar=%s)，结果见后面的 [torch] 行", (int)pid, g_torch_jar);
}

static void do_torch_toggle(void) {
    if (!g_torch_node[0]) torch_find_node();
    if (g_torch_node[0]) {
        char val[32];
        if (g_torch_on) snprintf(val, sizeof(val), "0");
        else if (g_cfg.torch_on_value > 0) snprintf(val, sizeof(val), "%d", g_cfg.torch_on_value);
        else snprintf(val, sizeof(val), "%s", g_torch_max);
        bool ok = write_file_str(g_torch_node, val);
        if (ok) g_torch_on = !g_torch_on;
        logmsg("手电筒: 写 %s <- %s %s (现在=%s)", g_torch_node, val, ok ? "成功" : "失败",
               g_torch_on ? "开" : "关");
        if (ok) notify_tip(g_torch_on ? "torch_on" : "torch_off");
        else if (!g_torch_on) notify_tip("torch_fail");
        return;
    }
    if (torch_helper_alive()) {
        torch_helper_stop();
        g_torch_check_at = 0;   /* 已经主动关了，别再让"3.5秒后检查"误报打开失败 */
        logmsg("手电筒: 关闭 (已结束助手进程)");
        notify_tip("torch_off");
    } else {
        torch_helper_start();
        /* 助手进程刚拉起来、灯马上就会亮；先弹"已开"，如果几秒后发现助手已经
         * 退出(没点亮)，hold_poll 里会再补一个"打开失败"的气泡。 */
        if (g_torch_pid > 0) notify_tip("torch_on");
    }
}

/* ---- 结束前台应用 ---------------------------------------------------- */
static pid_t g_kill_pid = -1;
static int   g_kill_seq = 0;

static void kill_fg_run(void) {
    if (g_kill_pid > 0) {
        int st;
        if (waitpid(g_kill_pid, &st, WNOHANG) == 0) {
            logmsg("长按返回键: 上一次的结束前台脚本还在跑，忽略这次");
            return;
        }
        g_kill_pid = -1;
    }
    int seq = ++g_kill_seq;
    pid_t pid = fork();
    if (pid < 0) { logmsg("结束前台: fork 失败 errno=%d", errno); return; }
    if (pid == 0) {
        setsid();
        for (int fd = 3; fd < 1024; fd++) close(fd);
        char sp[16], ss[16];
        snprintf(sp, sizeof(sp), "%d", (int)getppid());
        snprintf(ss, sizeof(ss), "%d", seq);
        const char *lf = g_cfg.logfile[0] ? g_cfg.logfile : "/dev/null";
        execl("/system/bin/sh", "sh", "-c", (const char *)km_killfg_sh, "km", lf, sp, ss, (char *)NULL);
        _exit(127);
    }
    g_kill_pid = pid;
}

static void run_hold_action(int slot) {
    int a = ha_action(slot);
    const char *kn = slot == KS_MENU ? "菜单" : slot == KS_BACK ? "返回" : "星号";
    if (a == KA_RECENTS) {
        logmsg("长按%s键: 打开最近任务", kn);
        int rc = system("input keyevent KEYCODE_APP_SWITCH >/dev/null 2>&1 &");
        (void)rc;
        notify_tip("menu");
    } else if (a == KA_KILL) {
        logmsg("长按%s键: 结束前台应用 (第 %d 次触发)", kn, g_kill_seq + 1);
        kill_fg_run();
    } else if (a == KA_TORCH) {
        logmsg("长按%s键: 开关手电筒", kn);
        do_torch_toggle();
    } else if (a == KA_HOME) {
        logmsg("长按%s键: 回到桌面", kn);
        int rc = system("input keyevent KEYCODE_HOME >/dev/null 2>&1 &");
        (void)rc;
    }
}

/* ---- App -> 守护进程 命令通道 ------------------------------------------------
 * App 把一行命令写进 files/keymouse_cmd，再用 su 对守护进程发 SIGUSR1。信号处理函数
 * 只往自管道写一个字节(异步信号安全)，真正的处理在主循环里做——这样无论守护进程
 * 当时是不是在无限期阻塞等按键，都能被立刻唤醒。
 * 命令: on / off (软开关) , learn (学习新的开关键) , learn_cancel , reset (恢复 F1)。 */
static void save_flags(void) {
    if (!g_flags_path[0]) return;
    FILE *f = fopen(g_flags_path, "w");
    if (!f) return;
    fprintf(f, "%d %d\n", g_dot_hidden ? 1 : 0, g_ptrcolor);
    fclose(f);
    chmod(g_flags_path, 0644);
}

static void load_flags(void) {
    if (!g_flags_path[0]) return;
    FILE *f = fopen(g_flags_path, "r");
    if (!f) return;
    int a = 0, b = 0;
    if (fscanf(f, "%d %d", &a, &b) >= 1) { g_dot_hidden = a != 0; g_ptrcolor = 0; /* 指针变色实验已下线: 这台魅族的指针没有别的颜色 */ }
    (void)b;
    fclose(f);
}

/* 实验: 红点位置总得靠 App 进程画(会被系统冻结)，而系统自己画的鼠标指针永远跟手。
 * 想法是鼠标模式开着时把系统指针换个颜色(红色=这是带触摸定位的鼠标模式)，就不需要红点了。
 * Android 15 的设置项 pointer_fill_style 只有 0黑 1绿 2黄 3粉 4蓝，没有红色，所以用 3(粉)。
 * 这个设置在这台魅族上是否真的改变指针外观我没法确认——所以做成可开关的实验功能。
 * 用 cmd settings(原生命令，不起 Java 虚拟机)，比 settings 命令轻得多。
 * 原值存在文件里，鼠标模式关闭、守护进程退出/重启时都会还原，崩溃后下次启动也会还原。 */
static void ptr_color_apply(bool want) {
    if (want && g_ptrcolor) {
        if (g_ptr_changed) return;
        if (g_ptr_orig_path[0] && access(g_ptr_orig_path, F_OK) != 0) {
            char orig[32] = "null";
            FILE *p = popen("cmd settings get system pointer_fill_style 2>/dev/null", "r");
            if (p) { if (fgets(orig, sizeof(orig), p)) {} pclose(p); }
            size_t n = strlen(orig);
            while (n > 0 && (orig[n-1] == '\n' || orig[n-1] == '\r' || orig[n-1] == ' ')) orig[--n] = 0;
            if (!orig[0]) strcpy(orig, "null");
            FILE *f = fopen(g_ptr_orig_path, "w");
            if (f) { fprintf(f, "%s\n", orig); fclose(f); }
        }
        int rc = system("cmd settings put system pointer_fill_style 3 >/dev/null 2>&1 &");
        (void)rc;
        g_ptr_changed = true;
        logmsg("指针变色(实验): 已把系统指针填充色设为 3(粉)");
    } else {
        if (!g_ptr_orig_path[0] || access(g_ptr_orig_path, F_OK) != 0) { g_ptr_changed = false; return; }
        char orig[32] = "null";
        FILE *f = fopen(g_ptr_orig_path, "r");
        if (f) { if (fgets(orig, sizeof(orig), f)) {} fclose(f); }
        size_t n = strlen(orig);
        while (n > 0 && (orig[n-1] == '\n' || orig[n-1] == '\r' || orig[n-1] == ' ')) orig[--n] = 0;
        char cmd[128];
        int v = atoi(orig);
        if (!orig[0] || strcmp(orig, "null") == 0 || v < 0 || v > 4)
            snprintf(cmd, sizeof(cmd), "cmd settings delete system pointer_fill_style >/dev/null 2>&1 &");
        else
            snprintf(cmd, sizeof(cmd), "cmd settings put system pointer_fill_style %d >/dev/null 2>&1 &", v);
        int rc = system(cmd);
        (void)rc;
        unlink(g_ptr_orig_path);
        g_ptr_changed = false;
        logmsg("指针变色(实验): 已还原系统指针填充色(原值 %s)", orig);
    }
}

static void save_toggle_keys(void) {
    if (!g_togkeys_path[0]) return;
    FILE *f = fopen(g_togkeys_path, "w");
    if (!f) return;
    for (int i = 0; i < g_tk_n; i++) fprintf(f, i ? " %d" : "%d", g_tk_code[i]);
    fprintf(f, "\n");
    fclose(f);
    chmod(g_togkeys_path, 0644);
}

static void load_toggle_keys(void) {
    int codes[TK_MAX], n = 0;
    FILE *f = g_togkeys_path[0] ? fopen(g_togkeys_path, "r") : NULL;
    if (f) {
        int c;
        while (n < TK_MAX && fscanf(f, "%d", &c) == 1) {
            bool dup = false;
            for (int i = 0; i < n; i++) if (codes[i] == c) dup = true;
            if (c > 0 && c < 0x300 && !dup) codes[n++] = c;
        }
        fclose(f);
    } else {
        /* 老版本: keymouse_toggle_key (第一个键) + keymouse_toggle_key2 (第二个键) */
        const char *olds[2] = { g_togkey_path, g_togkey2_path };
        for (int k = 0; k < 2; k++) {
            if (!olds[k][0]) continue;
            FILE *g = fopen(olds[k], "r");
            if (!g) continue;
            int c = 0;
            if (fscanf(g, "%d", &c) == 1 && c > 0 && c < 0x300 && (n == 0 || c != codes[0])) codes[n++] = c;
            fclose(g);
        }
    }
    if (n > 0) {
        g_tk_n = n;
        for (int i = 0; i < n; i++) g_tk_code[i] = codes[i];
        g_toggle_code = g_tk_code[0];
    }
}

static void save_confirm_key(void) {
    if (!g_confkey_path[0]) return;
    FILE *f = fopen(g_confkey_path, "w");
    if (!f) return;
    fprintf(f, "%d\n", g_confirm_custom > 0 ? g_confirm_custom : 0);
    fclose(f);
    chmod(g_confkey_path, 0644);
}

static void load_confirm_key(void) {
    if (!g_confkey_path[0]) return;
    FILE *f = fopen(g_confkey_path, "r");
    if (!f) return;
    int c = 0;
    if (fscanf(f, "%d", &c) == 1 && c > 0 && c < 0x300) g_confirm_custom = c;
    fclose(f);
}

static void write_state_file(void) {
    if (!g_state_path[0]) return;
    FILE *f = fopen(g_state_path, "w");
    if (!f) return;
    fprintf(f, "%d %d %d %d\n", g_enabled ? 1 : 0, g_learn ? 1 : 0, g_dot_hidden ? 1 : 0, g_ptrcolor);
    fclose(f);
    chmod(g_state_path, 0644);
}

static void on_cmd_signal(int sig) {
    (void)sig;
    int saved = errno;
    if (g_cmd_pipe[1] >= 0) { char b = 1; ssize_t r = write(g_cmd_pipe[1], &b, 1); (void)r; }
    errno = saved;
}

static void process_command(void) {
    char buf[32] = "";
    if (g_cmd_path[0]) {
        FILE *f = fopen(g_cmd_path, "r");
        if (f) { if (fgets(buf, sizeof(buf), f)) {} fclose(f); unlink(g_cmd_path); }
    }
    size_t n = strlen(buf);
    while (n > 0 && (buf[n-1] == '\n' || buf[n-1] == '\r' || buf[n-1] == ' ')) buf[--n] = 0;
    if (!buf[0]) return;
    logmsg("收到 App 命令: %s", buf);
    g_learn_swallow = -1;
    if (strcmp(buf, "on") == 0) {
        g_auto_ime_suspended = false; g_ime_hidden_since_ms = -1; g_auto_home_suspended = false; g_auto_lock_suspended = false;
        if (!g_enabled) { enable_mouse_mode(true); set_manual_override(); }
    } else if (strcmp(buf, "off") == 0) {
        g_auto_ime_suspended = false; g_ime_hidden_since_ms = -1; g_auto_home_suspended = false; g_auto_lock_suspended = false;
        if (g_enabled) disable_mouse_mode(true);
    } else if (strcmp(buf, "learn") == 0 || strcmp(buf, "learn2") == 0) {
        g_learn = true; g_learn_slot = 1; g_lc_n = 0;
        g_learn_deadline = now_ms() + LEARN_WINDOW_MS;
    } else if (strcmp(buf, "learn_confirm") == 0) {
        g_learn = true; g_learn_slot = 3;
        g_learn_deadline = now_ms() + LEARN_WINDOW_MS;
    } else if (strcmp(buf, "clear_confirm") == 0) {
        g_confirm_custom = 0;
        save_confirm_key();
        logmsg("自定义中间键已清除");
    } else if (strcmp(buf, "clear2") == 0) {
        /* 旧命令: 组合键现在一次学完，没有"第二键"了，忽略 */
    } else if (strcmp(buf, "learn_cancel") == 0) {
        g_learn = false; g_lc_n = 0;
    } else if (strcmp(buf, "dot_off") == 0 || strcmp(buf, "dot_on") == 0) {
        g_dot_hidden = (strcmp(buf, "dot_off") == 0);
        save_flags();
        pos_publish(g_enabled);
    } else if (strcmp(buf, "ptrcolor_on") == 0 || strcmp(buf, "ptrcolor_off") == 0) {
        g_ptrcolor = 0;          /* 已下线，忽略 */
        save_flags();
        ptr_color_apply(false);
    } else if (strcmp(buf, "reset") == 0) {
        g_toggle_code = KC_TOGGLE;
        g_tk_n = 1; g_tk_code[0] = KC_TOGGLE;
        memset(g_tk_dn, 0, sizeof(g_tk_dn)); g_confirm_swallow = false;
        g_learn = false; g_lc_n = 0;
        g_f1_down_ms = -1; g_f1_fired = false;
        save_toggle_keys();
    }
    write_state_file();
}

static bool g_enter_confirm = true;     /* 是否把 Enter/KPEnter/OK 也当中间键 */
static bool g_alias_down = false;       /* 当前这次按下是否已被映射成了中间键(松开要对应处理) */
static inline bool is_confirm_alias(int c) {
    if (g_confirm_custom > 0 && c == g_confirm_custom) return true;
    return g_enter_confirm && (c == KC_ALIAS_ENTER || c == KC_ALIAS_KPENTER || c == KC_ALIAS_OK);
}

static bool is_known_key(int c) {
    if (is_confirm_alias(c)) return true;
    return c == KC_UP || c == KC_DOWN || c == KC_LEFT || c == KC_RIGHT || c == KC_CONFIRM ||
           tk_slot(c) >= 0 || (c >= KEY_1 && c <= KEY_0) || c == KEY_BACK || c == KEY_MENU;
}

static void hold_key_event(const struct input_event *ev) {
    /* 把"不认识的键"的键码写进日志(数字/方向/确定/返回/菜单/F1 不记)，
     * 这样如果 * 键的键码不在我们认的范围里，看一眼日志就知道该填多少。 */
    if (ev->value == 1 && !is_known_key(ev->code))
        logmsg("按键码 %d (0x%x) 按下", ev->code, ev->code);
    int a = ha_for_code(ev->code);
    if (a < 0 || ha_hold_ms(a) <= 0) return;
    if (ev->value == 1) {
        if (g_ha_down_ms[a] < 0) {
            g_ha_down_ms[a] = now_ms();
            g_ha_fired[a] = false;
            wake_hold(ha_hold_ms(a) + 1500);
        }
    } else if (ev->value == 0) {
        g_ha_down_ms[a] = -1; g_ha_fired[a] = false;
    }
}

static void hold_poll(long tnow, int *timeout_ms) {
    if (g_torch_check_at > 0) {
        if (tnow >= g_torch_check_at) {
            g_torch_check_at = 0;
            if (!torch_helper_alive() ) {
                logmsg("手电筒没有打开: 助手进程已退出，原因见上面的 [torch] 行");
                notify_tip("torch_fail");
            }
            else
                logmsg("手电筒助手仍在运行 (灯应该已经亮了)");
        } else {
            int remain = (int)(g_torch_check_at - tnow);
            if (*timeout_ms < 0 || remain < *timeout_ms) *timeout_ms = remain;
        }
    }
    for (int a = 0; a < KS_COUNT; a++) {
        if (g_ha_down_ms[a] < 0 || g_ha_fired[a]) continue;
        long held = tnow - g_ha_down_ms[a];
        if (held >= ha_hold_ms(a)) {
            g_ha_fired[a] = true;
            if (km_allowed_now()) run_hold_action(a);
            continue;
        }
        int remain = (int)(ha_hold_ms(a) - held);
        if (*timeout_ms < 0 || remain < *timeout_ms) *timeout_ms = remain;
    }
}

/* ---- 长按确认键 = 拖动 ---------------------------------------------------
 * 确认键按下时本来就发"左键按下"。按住满 drag_hold_ms(默认3秒)后进入"拖动锁定":
 * 手指松开确认键时不发"左键抬起"，左键继续保持按下，这时用方向键移动光标就是
 * 拖动(网页里拖选文字、桌面上拖图标/建文件夹/拖滑块)。之后再短按一次确认键，
 * 就发"左键抬起"=松手，并吞掉这次按键的抬起沿，不会多点一下。 */
static long g_ok_down_ms = -1;
static long g_ok_press_ms = 0;      /* 最近一次确认键按下的时刻(只用于日志) */
static long g_ok_last_up_ms = 0;    /* 最近一次确认键松开的时刻(只用于日志) */
static bool g_ok_fired = false;
static bool g_drag_latched = false;
static bool g_drag_swallow_up = false;
static int  g_drag_start_x = 0, g_drag_start_y = 0;
static long g_menu_due_ms = -1;          /* 拖动松手后要在这个时刻右键弹菜单; -1=没有安排 */

/* 拖动选字松手后过一会儿自动"右键点一下": Chrome 里在选中文字上右键就是弹出
 * 复制/搜索等菜单(鼠标原生逻辑，没有触摸那两个选区把手挡着)。光标此刻正停在选区
 * 末端的边缘，先往选区里面挪几个像素再点，免得被当成点在选区外面把选区取消了。 */
static void menu_fire(void) {
    bool forward = (g_cur_y > g_drag_start_y) || (g_cur_y == g_drag_start_y && g_cur_x >= g_drag_start_x);
    int nudge = forward ? -4 : 4;
    emit(g_mouse_fd, EV_REL, REL_X, nudge);
    emit(g_mouse_fd, EV_SYN, SYN_REPORT, 0);
    g_cur_x += nudge;
    if (g_cur_x < 0) g_cur_x = 0;
    if (g_cur_x >= g_panel_w) g_cur_x = g_panel_w - 1;
    pos_publish(true);
    struct timespec ts = { 0, 40 * 1000000L };
    nanosleep(&ts, NULL);
    emit(g_mouse_fd, EV_KEY, BTN_RIGHT, 1);
    emit(g_mouse_fd, EV_SYN, SYN_REPORT, 0);
    nanosleep(&ts, NULL);
    emit(g_mouse_fd, EV_KEY, BTN_RIGHT, 0);
    emit(g_mouse_fd, EV_SYN, SYN_REPORT, 0);
    logmsg("拖动松手后自动右键: 弹出复制/搜索菜单 (光标 %d,%d)", g_cur_x, g_cur_y);
}

static void menu_poll(long tnow, int *timeout_ms) {
    if (g_menu_due_ms < 0) return;
    if (!g_enabled || held_up || held_down || held_left || held_right || g_ok_down_ms >= 0) {
        g_menu_due_ms = -1;                /* 用户又动手了，取消 */
        return;
    }
    if (tnow >= g_menu_due_ms) { g_menu_due_ms = -1; menu_fire(); return; }
    int remain = (int)(g_menu_due_ms - tnow);
    if (*timeout_ms < 0 || remain < *timeout_ms) *timeout_ms = remain;
}

static void app_thaw(void);
/* 气泡由 App 进程里的 TipBubble 画(和红点同一个常驻进程)。系统冻结器可能刚把
 * App 冻住，先解冻再发广播，气泡才不会被吞/延迟。 */
static void drag_tip(const char *kind) {
    app_thaw();
    notify_tip(kind);
}

static void drag_reset(void) {
    if (g_drag_latched) drag_tip("drag_off");
    if (g_drag_latched || g_ok_down_ms >= 0) mouse_click(0);
    g_drag_latched = false; g_drag_swallow_up = false;
    g_ok_down_ms = -1; g_ok_fired = false;
}

static void drag_poll(long tnow, int *timeout_ms) {
    if (g_ok_down_ms < 0 || g_ok_fired || g_cfg.drag_hold_ms <= 0 || !g_enabled) return;
    long held = tnow - g_ok_down_ms;
    if (held >= g_cfg.drag_hold_ms) {
        g_ok_fired = true;
        g_drag_latched = true;
        logmsg("长按确认键: 进入拖动(左键保持按下)，再短按一次确认键松手");
        drag_tip("drag_on");
        return;
    }
    int remain = (int)(g_cfg.drag_hold_ms - held);
    if (*timeout_ms < 0 || remain < *timeout_ms) *timeout_ms = remain;
}

static void confirm_key(int down, int up) {
    if (down) {
        if (g_drag_latched) {            /* 拖动中再按一次: 松手 */
            g_drag_latched = false;
            g_drag_swallow_up = true;
            mouse_click(0);
            logmsg("拖动结束: 左键已松开");
            drag_tip("drag_off");
            if (g_cfg.auto_menu_ms > 0 && !g_cfg.touch_mode) g_menu_due_ms = now_ms() + g_cfg.auto_menu_ms;
            return;
        }
        g_ok_down_ms = now_ms(); g_ok_fired = false;
        g_ok_press_ms = g_ok_down_ms;
        logmsg("确认键按下: 距上次松开 %ldms", g_ok_last_up_ms > 0 ? g_ok_press_ms - g_ok_last_up_ms : -1L);
        g_menu_due_ms = -1;
        g_drag_start_x = g_cur_x; g_drag_start_y = g_cur_y;
        mouse_click(1);
    } else if (up) {
        if (g_drag_swallow_up) { g_drag_swallow_up = false; return; }
        g_ok_last_up_ms = now_ms();
        logmsg("确认键松开: 按住 %ldms", g_ok_press_ms > 0 ? g_ok_last_up_ms - g_ok_press_ms : -1L);
        g_ok_down_ms = -1;
        if (g_drag_latched) return;      /* 锁定拖动: 抬起手指不松左键 */
        g_ok_fired = false;
        mouse_click(0);
    }
}

/* 中间键(同时是鼠标左键)被设成第二开关键，而且是先按了中间键、后按的 F1: 中间键按下时
 * 已经当成了一次鼠标点击/拖动起点。组合键触发的这一刻把它收尾(松开左键、取消拖动计时)，
 * 并把这次中间键的抬起吞掉，避免多出一次点击。 */
static void chord_center_cleanup(void) {
    int cs = tk_slot(KC_CONFIRM);
    if (cs < 0 || !g_tk_dn[cs] || g_confirm_swallow) return;
    if (g_ok_down_ms >= 0 || g_drag_latched) {
        g_ok_down_ms = -1; g_ok_fired = false; g_drag_latched = false; g_menu_due_ms = -1;
        if (g_enabled) mouse_click(0);
    }
    g_confirm_swallow = true;
}


/* 开关键学习: 点"设置"后，同时按住想用的键(1~4 个)再全部松开，一次学完。
 * 中间键可以当组合里的一员，但不能单独当开关键。 */
static bool tk_key_bad(int c) {
    return c == KC_UP || c == KC_DOWN || c == KC_LEFT || c == KC_RIGHT ||
           c == KEY_BACK || c == KEY_MENU || c == KEY_POWER ||
           c == KC_SCROLL_UP || c == KC_SCROLL_DOWN || c == KC_HSCROLL_LEFT || c == KC_HSCROLL_RIGHT ||
           c == KEY_ENTER;
}

static void toggle_learn_finalize(void) {
    if (g_lc_n <= 0) return;
    if (g_lc_n == 1 && g_lc_code[0] == KC_CONFIRM) {
        logmsg("开关键学习: 中间键不能单独作开关键，请同时再按其它键");
        g_lc_n = 0;
        return;
    }
    g_tk_n = g_lc_n;
    for (int i = 0; i < g_tk_n; i++) g_tk_code[i] = g_lc_code[i];
    g_toggle_code = g_tk_code[0];
    memset(g_tk_dn, 0, sizeof(g_tk_dn));
    g_f1_down_ms = -1; g_f1_fired = false; g_confirm_swallow = false;
    save_toggle_keys();
    g_learn = false; g_learn_slot = 1; g_lc_n = 0;
    write_state_file();      /* 关键: App 界面靠这个文件判断"还在学习吗"，不刷新就得手动点取消才退出 */
    char name[128] = "", one[32];
    for (int i = 0; i < g_tk_n; i++) {
        key_display_name(g_tk_code[i], one, sizeof(one));
        size_t l = strlen(name);
        snprintf(name + l, sizeof(name) - l, i ? "+%s" : "%s", one);
    }
    logmsg("开关键学习: 已设为 %s (%d 个键同时按住)", name, g_tk_n);
    notify_tip_arg("keyset", name);
}

static bool learn_chord_event(const struct input_event *ev) {
    int c = ev->code, idx = -1;
    for (int i = 0; i < g_lc_n; i++) if (g_lc_code[i] == c) idx = i;
    if (ev->value == 1) {
        if (idx >= 0) { g_lc_dn[idx] = true; return true; }
        if (tk_key_bad(c)) {
            logmsg("开关键学习: 键码 %d 不能用作开关键(它在鼠标模式里有别的功能)，请换一个键", c);
        } else if (g_lc_n >= TK_MAX) {
            logmsg("开关键学习: 最多 %d 个键", TK_MAX);
        } else {
            g_lc_code[g_lc_n] = c; g_lc_dn[g_lc_n] = true; g_lc_n++;
        }
        return true;
    }
    if (ev->value == 0 && idx >= 0) {
        g_lc_dn[idx] = false;
        bool any = false;
        for (int i = 0; i < g_lc_n; i++) if (g_lc_dn[i]) any = true;
        if (!any) toggle_learn_finalize();      /* 全部松开 = 组合确定 */
    }
    return true;
}

/* 学习模式(开关键 / 中间键)的统一捕获入口。
 * 放在 handle_key_event 最前面，在中间键别名映射和防抖引擎之前: 这样不管新按的键是不是防抖表里的键、
 * 是不是 Enter 别名、是不是正被防抖引擎延迟，第一次按下就会被捕获(以前走防抖会被延迟甚至当幽灵短按丢掉)。
 * 返回 true 表示这个事件已被学习逻辑消费。 */
static bool learn_capture(struct input_event *ev, bool from_kbd_fd) {
    if (ev->type != EV_KEY) return false;
    int c = ev->code;
    if (g_learn_swallow >= 0 && c == g_learn_swallow) {
        if (ev->value == 1) g_learn_swallow = -1;     /* 用户重新按了这个键: 正常处理 */
        else return true;                             /* 松开/连发: 吞掉 */
    }
    if (!g_learn) return false;
    /* 中间键按着的时候才进入学习: 它的松开必须放行给别名映射，否则鼠标左键会卡在按下状态 */
    if (g_alias_down && from_kbd_fd && ev->value == 0 && is_confirm_alias(c)) return false;
    if (g_learn_slot != 3) return learn_chord_event(ev);
    if (ev->value != 1) return true;                  /* 学习期间其它键的松开/连发一律忽略 */

    bool bad = c == KC_UP || c == KC_DOWN || c == KC_LEFT || c == KC_RIGHT ||
               tk_slot(c) >= 0 ||
               c == KEY_BACK || c == KEY_MENU || c == KEY_POWER ||
               c == KEY_1 || c == KEY_3 ||
               c == KC_SCROLL_UP || c == KC_SCROLL_DOWN || c == KC_HSCROLL_LEFT || c == KC_HSCROLL_RIGHT;
    if (!from_kbd_fd) {
        logmsg("中间键学习: 键码 %d 不在主键盘设备上，无法映射，请换一个键", c);
    } else if (bad) {
        logmsg("中间键学习: 键码 %d 已被其它功能占用，请换一个键", c);
    } else {
        g_confirm_custom = (c == KC_CONFIRM) ? 0 : c;
        save_confirm_key();
        g_learn = false; g_learn_slot = 1;
        g_learn_swallow = c;
        write_state_file();
        logmsg("中间键学习: 已把键码 %d 设为中间键(鼠标左键)", c);
        learn_done_tip(c);
    }
    return true;
}

static void handle_key_event_clean(struct input_event *ev, bool from_kbd_fd) {
    if (ev->type != EV_KEY) return;
    int down = (ev->value == 1);   /* 1=down, 0=up, 2=autorepeat(忽略，自行连发) */
    int up   = (ev->value == 0);

    /* 全局防抖 + 鼠标关闭: 主键盘已被我们独占，清洗后的按键要原样转发给系统(克隆键盘)，
     * 同时照常给下面的开关键判断看一眼。鼠标开着时由下面的 default 分支负责转发。 */
    if (from_kbd_fd && !g_enabled && g_deb_global_active && g_pass_fd >= 0 && ev->value != 2) {
        emit(g_pass_fd, EV_KEY, ev->code, ev->value);
        emit(g_pass_fd, EV_SYN, SYN_REPORT, 0);
    }


    /* 捏合进行中，按任何其它键(包括再按一次 1/3)都先打断；1/3 自己的新按下会在下面重新开始 */
    if (down && g_pinch.active) pinch_finish("被按键打断");

    {
        int slot = tk_slot(ev->code);
        if (slot >= 0) {
            bool others = true;      /* 组合里其它键是否都已按着(更新前) */
            for (int i = 0; i < g_tk_n; i++) if (i != slot && !g_tk_dn[i]) others = false;
            toggle_chord_update(slot, down, up, now_ms());
            if (ev->code == KC_CONFIRM && g_tk_n > 1) {
                /* 中间键同时是鼠标左键: 组合里其它键已经按着时再按中间键，这一下属于
                 * 组合键，不当成鼠标点击；单独按中间键仍然是正常点击。 */
                if (down && others) { g_confirm_swallow = true; return; }
                if (up && g_confirm_swallow) { g_confirm_swallow = false; return; }
            } else {
                return;
            }
        }
    }

    /* 实测反馈: 按一次电源键变成了两次(导致锁屏等手势失灵)。根因: 电源键
     * 和 F1 同在 func_fd(gpio-keys) 这个从不 grab 的设备上——既然从不
     * grab，内核本来就会把它的事件原样同时送到系统和我们这里，系统那边
     * "已经收到了一次"。如果我们对这类事件也走下面 default 分支再透传
     * 发一次，就凭空多出第二次按键。透传只对"因为被我们 grab 而系统本来
     * 收不到"的 kbd_fd 事件才有意义；func_fd 上除 F1 外的任何其它按键，
     * 系统早就自己收到了，我们不需要、也不能再重发一次。 */
    if (ev->type == EV_KEY) hold_key_event(ev);
    /* 诊断: 音量+/音量-/电源 三个键来自哪个设备、什么时刻(用来排查"鼠标开着时音量下+电源截屏很难触发") */
    if (ev->type == EV_KEY && ev->value != 2 && (ev->code == 114 || ev->code == 115 || ev->code == 116))
        logmsg("[键诊断] 键码=%d %s 来自=%s 鼠标=%s t=%ldms", ev->code, ev->value ? "按下" : "松开",
               from_kbd_fd ? "主键盘(已抓取)" : "功能键设备(未抓取)", g_enabled ? "开" : "关", now_ms());
    if (!from_kbd_fd) return;

    if (!g_enabled) return; /* 未开启鼠标模式时，其余按键不处理（正常不会收到，因为未 grab） */

    switch (ev->code) {
        case KC_UP:    if (down) held_up = true;    else if (up) held_up = false;    break;
        case KC_DOWN:  if (down) held_down = true;  else if (up) held_down = false;  break;
        case KC_LEFT:  if (down) held_left = true;  else if (up) held_left = false;  break;
        case KC_RIGHT: if (down) held_right = true; else if (up) held_right = false; break;
        case KC_CONFIRM:
            confirm_key(down, up);
            break;
        case KEY_1:
            if (down) pinch_start(-1);      /* 横向缩小 */
            break;
        case KEY_3:
            if (down) pinch_start(+1);      /* 横向放大 */
            break;
        case KC_SCROLL_UP:
            if (down) scroll_key_down(&g_scroll_up); else if (up) scroll_key_up(&g_scroll_up);
            break;
        case KC_SCROLL_DOWN:
            if (down) scroll_key_down(&g_scroll_down); else if (up) scroll_key_up(&g_scroll_down);
            break;
        case KC_HSCROLL_LEFT:
            if (down) scroll_key_down(&g_scroll_left); else if (up) scroll_key_up(&g_scroll_left);
            break;
        case KC_HSCROLL_RIGHT:
            if (down) scroll_key_down(&g_scroll_right); else if (up) scroll_key_up(&g_scroll_right);
            break;
        default:
            /* 未被鼠标功能占用的按键 (返回键/菜单键等等)：原样透传给
             * 系统，保留其原厂功能，不做拦截。 */
            if (g_pass_fd >= 0) {
                emit(g_pass_fd, EV_KEY, ev->code, ev->value);
                emit(g_pass_fd, EV_SYN, SYN_REPORT, 0);
            }
            break;
    }
}

/* ---- 防抖入口 ---- */
static bool deb_apply_to(int code, bool from_kbd) {
    if (!deb_scope_ok()) return false;
    /* 中间键(确认键 = 鼠标左键)永远不进防抖引擎: 防抖会把松开延迟 g_deb_ms，且把\"松开后很快又按下\"
     * 当成抖动吞掉——快速双击的第二下就这样被并进第一下，变成一次很长的按压(系统当成长按)。
     * 中间键被设成第二开关键时以前也会走到下面的开关键分支，这里先排除。 */
    if (code == KC_CONFIRM) return false;
    /* 方向键(移动指针)同理: 防抖的延迟会让指针发飘、连续移动不跟手，所以也永远不进防抖引擎，
     * 即使旧配置的 debKeys 里残留了方向键的键码也一律不防抖。 */
    if (code == KC_UP || code == KC_DOWN || code == KC_LEFT || code == KC_RIGHT) return false;
    /* 开关键(F1/组合键)跟着两个防抖开关走，不用单独设置 */
    if ((g_cfg.deb_global || g_cfg.deb_mouse) &&
        tk_slot(code) >= 0) return true;
    if (!from_kbd) return false;
    if (code < 0 || code >= DEB_MAXKEY || !g_deb_key[code]) return false;     /* 不在防抖按键表里 */
    if (g_enabled) return g_cfg.deb_mouse;                                     /* 鼠标模式开着: 看\"鼠标模式也防抖\" */
    return g_cfg.deb_global && g_deb_global_active;                            /* 鼠标关着: 看全局防抖是否在运行 */
}

/* 引擎清洗完的事件在这里落地(到点的延迟事件也走这里) */
static void deb_out(int code, int value, bool from_kbd) {
    struct input_event e;
    memset(&e, 0, sizeof(e));
    e.type = EV_KEY;
    e.code = (unsigned short)code;
    e.value = value;
    handle_key_event_clean(&e, from_kbd);
}

static void handle_key_event(struct input_event *ev, bool from_kbd_fd) {
    if (ev->type != EV_KEY) return;
    int code = ev->code;
    if (learn_capture(ev, from_kbd_fd)) return;
    /* 中间键别名: 鼠标模式开着时，主键盘上的 Enter/KPEnter/OK 当作中间键(鼠标左键)。
     * 按下时才决定是否映射(g_enabled)，松开跟随按下时的决定，避免中途切换模式造成卡键。 */
    if (from_kbd_fd && is_confirm_alias(code)) {
        if (ev->value == 1) {
            g_alias_down = g_enabled;
            if (g_alias_down) logmsg("中间键: 键码 %d 映射为确定键(鼠标左键)", code);
        }
        if (g_alias_down) {
            ev->code = KC_CONFIRM;
            code = KC_CONFIRM;
            if (ev->value == 0) g_alias_down = false;
        }
    }
    if (from_kbd_fd && code >= 0 && code < DEB_MAXKEY) {
        g_raw_last_ms = now_ms();
        if (ev->value == 1 && !g_raw_down[code]) { g_raw_down[code] = true; g_raw_down_cnt++; }
        else if (ev->value == 0 && g_raw_down[code]) { g_raw_down[code] = false; g_raw_down_cnt--; }
    }
    if (code >= 0 && code < DEB_MAXKEY && (deb_busy(code) || deb_apply_to(code, from_kbd_fd))) {
        deb_feed(code, ev->value, from_kbd_fd, now_ms());
        return;
    }
    handle_key_event_clean(ev, from_kbd_fd);
}

/* 全局防抖的启停: 只在"没有任何键按着"时切换，免得转发出去一半的按键卡在系统里 */
static void deb_update_global(long tnow, int *timeout_ms) {
    bool want = g_cfg.deb_global && deb_scope_ok() && !g_same_device && g_kbd_fd >= 0;
    if (want == g_deb_global_active) return;
    if (want && tnow < g_deb_fail_until) {
        int t = (int)(g_deb_fail_until - tnow);
        if (*timeout_ms < 0 || t < *timeout_ms) *timeout_ms = t;
        return;
    }
    if (g_raw_down_cnt > 0 && g_raw_last_ms > 0 && tnow - g_raw_last_ms > 10000) {
        /* 10 秒没有任何主键盘事件却还"有键按着": 多半是松开事件丢了，复位 */
        memset(g_raw_down, 0, sizeof(g_raw_down));
        g_raw_down_cnt = 0;
    }
    if (g_raw_down_cnt > 0 || deb_any_busy()) {
        if (*timeout_ms < 0 || *timeout_ms > 1000) *timeout_ms = 1000;   /* 有键按着: 隔一会儿再看一次能不能切换 */
        return;
    }
    if (want) {
        if (pass_ensure(2) != 0) {
            logmsg("全局防抖: 创建克隆键盘失败，已放弃(30 秒后重试)；按键保持原样直通");
            g_deb_fail_until = tnow + 30000;
            return;
        }
        set_grab(g_kbd_fd, 1);
        g_deb_global_active = true;
        logmsg("全局防抖: 已启用(独占主键盘，清洗后经克隆键盘转发) 防抖=%dms 幽灵过滤=%dms", g_deb_ms, g_deb_ghost_ms);
    } else {
        g_deb_global_active = false;
        if (!g_enabled) { set_grab(g_kbd_fd, 0); pass_destroy(); }
        logmsg("全局防抖: 已停用(释放主键盘)");
    }
}

static void do_move_tick(void) {
    int dx = 0, dy = 0;
    if (held_up)    dy -= g_cfg.move_step;
    if (held_down)  dy += g_cfg.move_step;
    if (held_left)  dx -= g_cfg.move_step;
    if (held_right) dx += g_cfg.move_step;
    if (dx || dy) {
        int rdx, rdy;
        rotate_vec(dx, dy, &rdx, &rdy);
        static int s_last_logged_rotation = -999;
        if (g_rotation != s_last_logged_rotation) {
            logmsg("移动方向补偿: rotation=%d sign=%d 物理(dx=%d,dy=%d) -> 输出(dx=%d,dy=%d)",
                   g_rotation, g_cfg.rotate_sign, dx, dy, rdx, rdy);
            s_last_logged_rotation = g_rotation;
        }
        mouse_move(rdx, rdy);
    }
}

/* ------------------------------------------------------------------ */
/* 命令行解析                                                          */
/* ------------------------------------------------------------------ */
static void set_defaults(struct config *c) {
    memset(c, 0, sizeof(*c));
    strncpy(c->kbd_name, "sprd-keypad", sizeof(c->kbd_name) - 1);
    strncpy(c->func_name, "gpio-keys", sizeof(c->func_name) - 1);
    c->move_step = 5;
    c->move_interval_ms = 50;
    c->scroll_step = 1;
    c->scroll_interval_ms = 130;   /* 长按慢速连续滑动的连发间隔 */
    c->scroll_mode = MODE_WHEEL;
    c->swipe_distance = 150;       /* 短按快速翻页的 swipe 距离 */
    c->swipe_step_ms = 16;
    c->scroll_hold_ms = 300;       /* 长按判定阈值 */
    c->scroll_slow_distance = 40;  /* 慢速连续滑动每 tick 的距离 */
    c->glide_speed = 0;
    c->pinch_ms = 1500;
    c->fast_speed = 0;
    c->toggle_hold_ms = 500;       /* F1 长按判定阈值 */
    c->daemonize = false;
    c->auto_rotate = true;         /* 默认开启：随屏幕旋转自动补偿方向 */
    /* 实测这台设备上按 rotate_sign=1 补偿完方向键是反的(相当于补偿成了
     * 相反方向)，改成 -1 修正；如果之后又反了，改回 1 或用命令行参数
     * --rotate-sign= 覆盖即可，不用改代码。 */
    c->rotate_sign = -1;
    /* swipe 路径的补偿方向是根据 2026-09-26 这次实测日志算出来的
     * (横屏 rotation=1 时，2/4/6/8 的方向按标准 Android ROTATION_90
     * 坐标变换公式核对过，和方向键那条路径的符号无关)。如果实测发现
     * 反了，用 --swipe-rotate-sign=-1 覆盖即可，不用改代码/重新编译。 */
    /* 2026-09-26 实测反馈: 用 swipe_rotate_sign=1 时，2/4/6/8 在横屏下
     * 全部变成了目标方向的正对面(2/8对调、4/6对调)——四个键全部同时
     * 反了，这是一个干净的180度整体反相，说明补偿的"公式选取"逻辑是对
     * 的，只是这台设备上系统对虚拟触摸屏实际做的旋转方向和最初假设的
     * 方向正好相反。改成 -1 直接抵消，不用重新推导公式。 */
    c->swipe_rotate_sign = -1;
    c->rotate_poll_ms = 250;
    /* 上一轮"默认竖屏下方向键整体倒装180度"的判断是错的：当时把
     * rotate_base 硬编码成 2 来"纠正"，但实测这台设备在常规正常
     * 竖屏下 dumpsys 汇报的就是 rotation=0，且这本来就应该对应
     * "不需要补偿"(r=0)。rotate_base=2 相当于凭空把 raw=0 当成了
     * "转了180度"，于是在真正的正常竖屏下反而把方向搬了个 180度
     * (上下、左右一起翻转)——这正是实测反馈"常规竖屏下上下颠倒"的
     * 根因。改回 0，让 raw=0 直接对应 r=0，不做任何无中生有的偏移；
     * 如果之后在某些机型上确实需要一个非零的基准偏移，应当通过
     * App 里"方向确认框"手动选择、写入 --manual-rot-file 来覆盖，
     * 而不是在默认值里硬编一个只对某一次实测有效的数字。 */
    c->rotate_base = 0;
    c->live_cfg[0] = '\0';
    c->flip180 = false;
    c->manual_rot_file[0] = '\0';
    c->auto_ime_suspend = true;    /* 默认开启：点输入框时自动让出鼠标控制权 */
    c->auto_home_suspend = false;  /* 默认关闭：App 里勾选后才在桌面隐藏鼠标 */
    c->home_poll_ms = 1000;
    c->deb_global = false; c->deb_mouse = true; c->deb_toggle = true; c->deb_all = true;
    c->dialer_allow = true;        /* 命令行默认=允许(与旧版行为一致)；App 启动时会显式传 --dialer-allow */
    c->menu_hold_ms = 1500; c->back_hold_ms = 1500; c->star_hold_ms = 2000; c->drag_hold_ms = 3000; c->auto_menu_ms = 1000;
    c->star_code = 0; c->torch_path[0] = '\0'; c->torch_on_value = 0;
    c->ime_poll_ms = 500;  /* 原400。每次轮询都会执行 dumpsys，略放宽以降低系统压力 */
    c->ime_hide_confirm_ms = 2500;
    c->force_soft_kbd_when_off = true;
}

static void print_usage(const char *prog) {
    fprintf(stderr,
        "用法: %s [选项]\n"
        "  --kbd-name=NAME           主键盘设备名 (默认 sprd-keypad)\n"
        "  --func-name=NAME          功能键设备名 (默认 gpio-keys)\n"
        "  --uinput-path=PATH        uinput 节点路径 (默认自动探测)\n"
        "  --move-step=N             移动步长像素 (默认 5)\n"
        "  --move-interval=MS        移动连发间隔ms (默认 50)\n"
        "  --scroll-step=N           短按(快速翻页) wheel 模式滚轮格数 (默认 1)\n"
        "  --scroll-interval=MS      长按慢速连续滑动连发间隔ms (默认 130)\n"
        "  --scroll-mode=wheel|swipe 翻页方式 (默认 wheel)\n"
        "  --swipe-distance=PX       短按(快速翻页) swipe 距离 (默认 150)\n"
        "  --swipe-step-ms=MS        swipe 单次手势插值间隔 (默认 16)\n"
        "  --scroll-hold-ms=MS       翻页键长按判定阈值 (默认 300)\n"
        "  --scroll-slow-distance=PX 长按慢速滑动每tick距离 (默认 40)\n"
        "  --toggle-hold-ms=MS       F1 长按判定阈值 (默认 500)\n"
        "  --touch-name=NAME         触摸屏设备名关键字 (默认自动探测)\n"
        "  --auto-rotate=on|off      根据当前屏幕旋转自动补偿方向 (默认 on)\n"
        "  --rotate-sign=1|-1        补偿方向反了就改成 -1 (默认 1)\n"
        "  --rotate-poll-ms=MS       检测屏幕旋转状态的轮询间隔 (默认 250)\n"
        "  --rotate-base=N           校准: 检测值先减去这个数再用 (默认 0)\n"
        "  --flip180=0|1             在旋转补偿基础上再整体反转180度 (默认 0)\n"
        "  --live-cfg=PATH           实时参数文件路径 (moveStep=/scrollStep=/\n"
        "                            flip180=)，App 写入这个文件即可立即生效，\n"
        "                            无需重启\n"
        "  --manual-rot-file=PATH    手动方向覆盖文件路径: 内容为单个整数\n"
        "                            -1=自动跟随系统 0/1/2/3=强制方向，写入后\n"
        "                            立即生效且跳过自动检测 (默认不启用)\n"
        "  --auto-home-suspend=0/1   前台是桌面时自动隐藏鼠标，离开桌面自动恢复 (默认 0)\n"
        "  --dialer-allow=0/1        拨号应用里是否允许使用鼠标: 0=前台是拨号应用时自动关闭鼠标，\n"
        "                            数字键交给拨号应用，离开后自动恢复 (命令行默认 1)\n"
        "  --home-poll-ms=MS         检测前台是不是桌面的轮询间隔 (默认 1000)\n"
        "  --auto-ime-suspend=0/1    点输入框弹出输入法时自动暂停鼠标模式，\n"
        "                            收起后自动恢复 (默认 1)\n"
        "  --drag-hold-ms=MS  长按确认键多久进入拖动(锁住按下，再短按确认键松手)，0=关闭，默认3000\n"
        "  --menu-hold-ms=MS / --back-hold-ms=MS / --star-hold-ms=MS  长按菜单(最近任务)/返回(结束前台)/*(手电筒)，0=关闭\n"
        "  --star-code=N --torch-path=PATH --torch-on-value=N  * 键键码、手电筒节点与开灯值\n"
        "  --ime-poll-ms=MS          检测输入法显示状态的轮询间隔 (默认 400)\n"
        "  --ime-hide-confirm-ms=MS  输入法持续未显示多久才当真、恢复鼠标\n"
        "                            模式 (默认 2500，用来滤掉某些输入法\n"
        "                            自身的短暂闪烁)\n"
        "  --force-soft-kbd-when-off=0/1  鼠标模式暂停/关闭时自动打开\n"
        "                            show_ime_with_hard_keyboard (默认 1)\n"
        "  --daemon                  后台运行 (double-fork + setsid)\n"
        "  --pidfile=PATH            写入 pid 的文件\n"
        "  --logfile=PATH            日志文件 (默认不记录)\n"
        "  -h, --help                显示帮助\n",
        prog);
}

static int parse_args(int argc, char **argv, struct config *c) {
    enum {
        OPT_KBD_NAME = 1000, OPT_FUNC_NAME, OPT_UINPUT_PATH,
        OPT_MOVE_STEP, OPT_MOVE_INTERVAL, OPT_SCROLL_STEP, OPT_SCROLL_INTERVAL,
        OPT_SCROLL_MODE, OPT_SWIPE_DIST, OPT_SWIPE_STEP_MS, OPT_TOUCH_NAME,
        OPT_SCROLL_HOLD_MS, OPT_SCROLL_SLOW_DIST, OPT_TOGGLE_HOLD_MS,
        OPT_DAEMON, OPT_PIDFILE, OPT_LOGFILE,
        OPT_AUTO_ROTATE, OPT_ROTATE_SIGN, OPT_SWIPE_ROTATE_SIGN, OPT_ROTATE_POLL_MS, OPT_ROTATE_BASE, OPT_LIVE_CFG,
        OPT_FLIP180, OPT_MANUAL_ROT_FILE, OPT_AUTO_IME_SUSPEND, OPT_AUTO_HOME_SUSPEND, OPT_DIALER_ALLOW, OPT_HOME_POLL_MS, OPT_IME_POLL_MS,
        OPT_IME_HIDE_CONFIRM_MS, OPT_FORCE_SOFT_KBD, OPT_MENU_HOLD, OPT_BACK_HOLD, OPT_STAR_HOLD, OPT_DRAG_HOLD, OPT_STAR_CODE, OPT_TORCH_PATH, OPT_TORCH_ON
    };
    static struct option longopts[] = {
        {"kbd-name",            required_argument, 0, OPT_KBD_NAME},
        {"func-name",           required_argument, 0, OPT_FUNC_NAME},
        {"uinput-path",         required_argument, 0, OPT_UINPUT_PATH},
        {"move-step",           required_argument, 0, OPT_MOVE_STEP},
        {"move-interval",       required_argument, 0, OPT_MOVE_INTERVAL},
        {"scroll-step",         required_argument, 0, OPT_SCROLL_STEP},
        {"scroll-interval",     required_argument, 0, OPT_SCROLL_INTERVAL},
        {"scroll-mode",         required_argument, 0, OPT_SCROLL_MODE},
        {"swipe-distance",      required_argument, 0, OPT_SWIPE_DIST},
        {"swipe-step-ms",       required_argument, 0, OPT_SWIPE_STEP_MS},
        {"scroll-hold-ms",      required_argument, 0, OPT_SCROLL_HOLD_MS},
        {"scroll-slow-distance",required_argument, 0, OPT_SCROLL_SLOW_DIST},
        {"toggle-hold-ms",      required_argument, 0, OPT_TOGGLE_HOLD_MS},
        {"touch-name",          required_argument, 0, OPT_TOUCH_NAME},
        {"daemon",              no_argument,       0, OPT_DAEMON},
        {"pidfile",             required_argument, 0, OPT_PIDFILE},
        {"logfile",             required_argument, 0, OPT_LOGFILE},
        {"auto-rotate",         required_argument, 0, OPT_AUTO_ROTATE},
        {"rotate-sign",         required_argument, 0, OPT_ROTATE_SIGN},
        {"swipe-rotate-sign",   required_argument, 0, OPT_SWIPE_ROTATE_SIGN},
        {"rotate-poll-ms",      required_argument, 0, OPT_ROTATE_POLL_MS},
        {"rotate-base",         required_argument, 0, OPT_ROTATE_BASE},
        {"live-cfg",            required_argument, 0, OPT_LIVE_CFG},
        {"flip180",             required_argument, 0, OPT_FLIP180},
        {"manual-rot-file",     required_argument, 0, OPT_MANUAL_ROT_FILE},
        {"auto-ime-suspend",    required_argument, 0, OPT_AUTO_IME_SUSPEND},
        {"auto-home-suspend",   required_argument, 0, OPT_AUTO_HOME_SUSPEND},
        {"dialer-allow",        required_argument, 0, OPT_DIALER_ALLOW},
        {"home-poll-ms",        required_argument, 0, OPT_HOME_POLL_MS},
        {"ime-poll-ms",         required_argument, 0, OPT_IME_POLL_MS},
        {"ime-hide-confirm-ms", required_argument, 0, OPT_IME_HIDE_CONFIRM_MS},
        {"force-soft-kbd-when-off", required_argument, 0, OPT_FORCE_SOFT_KBD},
        {"menu-hold-ms",        required_argument, 0, OPT_MENU_HOLD},
        {"back-hold-ms",        required_argument, 0, OPT_BACK_HOLD},
        {"star-hold-ms",        required_argument, 0, OPT_STAR_HOLD},
        {"drag-hold-ms",        required_argument, 0, OPT_DRAG_HOLD},
        {"star-code",           required_argument, 0, OPT_STAR_CODE},
        {"torch-path",          required_argument, 0, OPT_TORCH_PATH},
        {"torch-on-value",      required_argument, 0, OPT_TORCH_ON},
        {"help",                no_argument,       0, 'h'},
        {0,0,0,0}
    };
    int c_opt;
    while ((c_opt = getopt_long(argc, argv, "h", longopts, NULL)) != -1) {
        switch (c_opt) {
            case OPT_KBD_NAME: strncpy(c->kbd_name, optarg, sizeof(c->kbd_name)-1); break;
            case OPT_FUNC_NAME: strncpy(c->func_name, optarg, sizeof(c->func_name)-1); break;
            case OPT_UINPUT_PATH: strncpy(c->uinput_path, optarg, sizeof(c->uinput_path)-1); break;
            case OPT_MOVE_STEP: c->move_step = atoi(optarg); break;
            case OPT_MOVE_INTERVAL: c->move_interval_ms = atoi(optarg); break;
            case OPT_SCROLL_STEP: c->scroll_step = atoi(optarg); break;
            case OPT_SCROLL_INTERVAL: c->scroll_interval_ms = atoi(optarg); break;
            case OPT_SCROLL_MODE:
                c->scroll_mode = (strcmp(optarg, "swipe") == 0) ? MODE_SWIPE : MODE_WHEEL;
                break;
            case OPT_SWIPE_DIST: c->swipe_distance = atoi(optarg); break;
            case OPT_SWIPE_STEP_MS: c->swipe_step_ms = atoi(optarg); break;
            case OPT_SCROLL_HOLD_MS: c->scroll_hold_ms = atoi(optarg); break;
            case OPT_SCROLL_SLOW_DIST: c->scroll_slow_distance = atoi(optarg); break;
            case OPT_TOGGLE_HOLD_MS: c->toggle_hold_ms = atoi(optarg); break;
            case OPT_TOUCH_NAME: strncpy(c->touch_name, optarg, sizeof(c->touch_name)-1); break;
            case OPT_DAEMON: c->daemonize = true; break;
            case OPT_PIDFILE: strncpy(c->pidfile, optarg, sizeof(c->pidfile)-1); break;
            case OPT_LOGFILE: strncpy(c->logfile, optarg, sizeof(c->logfile)-1); break;
            case OPT_AUTO_ROTATE: c->auto_rotate = (strcmp(optarg, "off") != 0); break;
            case OPT_ROTATE_SIGN: c->rotate_sign = atoi(optarg) < 0 ? -1 : 1; break;
            case OPT_SWIPE_ROTATE_SIGN: c->swipe_rotate_sign = atoi(optarg) < 0 ? -1 : 1; break;
            case OPT_ROTATE_POLL_MS: c->rotate_poll_ms = atoi(optarg); break;
            case OPT_ROTATE_BASE: c->rotate_base = ((atoi(optarg) % 4) + 4) % 4; break;
            case OPT_LIVE_CFG: strncpy(c->live_cfg, optarg, sizeof(c->live_cfg)-1); break;
            case OPT_FLIP180: c->flip180 = (atoi(optarg) != 0); break;
            case OPT_MANUAL_ROT_FILE: strncpy(c->manual_rot_file, optarg, sizeof(c->manual_rot_file)-1); break;
            case OPT_AUTO_IME_SUSPEND: c->auto_ime_suspend = (atoi(optarg) != 0); break;
            case OPT_AUTO_HOME_SUSPEND: c->auto_home_suspend = (atoi(optarg) != 0); break;
            case OPT_DIALER_ALLOW: c->dialer_allow = (atoi(optarg) != 0); break;
            case OPT_HOME_POLL_MS: c->home_poll_ms = atoi(optarg) < 300 ? 300 : atoi(optarg); break;
            case OPT_IME_POLL_MS: c->ime_poll_ms = atoi(optarg); break;
            case OPT_IME_HIDE_CONFIRM_MS: c->ime_hide_confirm_ms = atoi(optarg); break;
            case OPT_MENU_HOLD: c->menu_hold_ms = atoi(optarg); break;
            case OPT_BACK_HOLD: c->back_hold_ms = atoi(optarg); break;
            case OPT_STAR_HOLD: c->star_hold_ms = atoi(optarg); break;
            case OPT_DRAG_HOLD: c->drag_hold_ms = atoi(optarg); break;
            case OPT_STAR_CODE: c->star_code = atoi(optarg); break;
            case OPT_TORCH_PATH: strncpy(c->torch_path, optarg, sizeof(c->torch_path)-1); break;
            case OPT_TORCH_ON: c->torch_on_value = atoi(optarg); break;
            case OPT_FORCE_SOFT_KBD: c->force_soft_kbd_when_off = (atoi(optarg) != 0); break;
            case 'h': print_usage(argv[0]); exit(0);
            default: print_usage(argv[0]); return -1;
        }
    }
    return 0;
}

/* ------------------------------------------------------------------ */
/* 守护进程化                                                          */
/* ------------------------------------------------------------------ */
static void write_pidfile(const char *path) {
    if (!path || !path[0]) return;
    FILE *f = fopen(path, "w");
    if (!f) return;
    fprintf(f, "%d\n", getpid());
    fclose(f);
}

static void daemonize(void) {
    pid_t pid = fork();
    if (pid < 0) exit(1);
    if (pid > 0) exit(0); /* 第一次 fork 后父进程退出 */

    if (setsid() < 0) exit(1); /* 建立新会话，彻底脱离控制终端/进程组 */

    pid_t pid2 = fork();
    if (pid2 < 0) exit(1);
    if (pid2 > 0) exit(0); /* 第二次 fork，防止重新获得控制终端 */

    /* 此时 getppid() == 1 (被 init/zygote 收养)，与最初启动它的
     * su / app 进程彻底无父子关系，不会随 App 被杀而牵连。 */
    umask(027);
    int devnull = open("/dev/null", O_RDWR);
    if (devnull >= 0) {
        dup2(devnull, STDIN_FILENO);
        dup2(devnull, STDOUT_FILENO);
        dup2(devnull, STDERR_FILENO);
        if (devnull > 2) close(devnull);
    }
    signal(SIGHUP, SIG_IGN);
}

/* 单实例保护：App 重复启动、开机自启和手动开关叠加时，会出现好几个守护进程
 * 同时在读按键(同一次长按触发多次、虚拟设备重复创建)。启动时找出所有"比自己
 * 更早启动"的 keymouse 进程，先请它们正常退出(会释放独占和虚拟设备)，等不到再强杀。
 * 只杀更老的：两个同时启动时留下较新的那个，不会互相杀光。 */
static unsigned long long proc_starttime(int pid) {
    char path[64], buf[1024];
    snprintf(path, sizeof(path), "/proc/%d/stat", pid);
    FILE *f = fopen(path, "r");
    if (!f) return 0;
    size_t n = fread(buf, 1, sizeof(buf) - 1, f);
    fclose(f);
    buf[n] = '\0';
    char *p = strrchr(buf, ')');
    if (!p) return 0;
    unsigned long long st = 0;
    if (sscanf(p + 1, " %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u %*u %*u %*u %*d %*d %*d %*d %*d %*d %llu", &st) != 1)
        return 0;
    return st;
}

static void kill_other_instances(void) {
    int self = (int)getpid();
    unsigned long long my_st = proc_starttime(self);
    int victims[32], nv = 0;
    DIR *d = opendir("/proc");
    if (!d) return;
    struct dirent *e;
    while ((e = readdir(d)) != NULL && nv < 32) {
        int pid = atoi(e->d_name);
        if (pid <= 1 || pid == self) continue;
        char path[64], comm[64] = "";
        snprintf(path, sizeof(path), "/proc/%d/comm", pid);
        FILE *f = fopen(path, "r");
        if (!f) continue;
        if (fgets(comm, sizeof(comm), f)) comm[strcspn(comm, "\n")] = 0;
        fclose(f);
        if (strcmp(comm, "km_dot") == 0) { kill(pid, SIGKILL); continue; }   /* 上一个守护进程遗留的红点助手 */
        if (strcmp(comm, "keymouse") != 0) continue;
        unsigned long long st = proc_starttime(pid);
        if (my_st && st && st > my_st) continue;   /* 比我新的，不动 */
        victims[nv++] = pid;
    }
    closedir(d);
    if (nv == 0) return;
    for (int i = 0; i < nv; i++) kill(victims[i], SIGTERM);
    for (int w = 0; w < 40; w++) {
        bool any = false;
        for (int i = 0; i < nv; i++) if (victims[i] > 0 && kill(victims[i], 0) == 0) any = true;
        if (!any) break;
        usleep(50 * 1000);
    }
    for (int i = 0; i < nv; i++) {
        if (victims[i] > 0 && kill(victims[i], 0) == 0) { kill(victims[i], SIGKILL); }
    }
    logmsg("发现 %d 个更早启动的 keymouse 进程，已结束 (保持只有一个守护进程)", nv);
}

/* ------------------------------------------------------------------ */
/* 信号处理                                                            */
/* ------------------------------------------------------------------ */
static void on_signal(int sig) {
    (void)sig;
    g_running = 0;
}

/* ------------------------------------------------------------------ */
/* 主流程                                                              */
/* ------------------------------------------------------------------ */
int main(int argc, char **argv) {
    set_defaults(&g_cfg);
    if (parse_args(argc, argv, &g_cfg) != 0) return 1;

    if (g_cfg.daemonize) daemonize();

    if (g_cfg.logfile[0]) {
        g_log = fopen(g_cfg.logfile, "a");
        if (g_log) {
            /* 守护进程以 root 身份运行(su 启动)，daemonize() 里设置的
             * umask(027) 会让这里新建的日志文件变成 root:root 0640 之类
             * 的权限——App 自身进程不是 root，也不在这个文件的属组里，
             * 之后想用普通 FileInputStream 读回来复制到剪贴板时会直接
             * 拿到"权限不足"的异常(在 App 那边看起来就是"一直没有日志"、
             * 复制按钮点了没反应)。这里用 root 权限主动把文件权限放开成
             * 0666，让 App 自己的进程也能读，"复制诊断日志"才能真正生效。*/
            fchmod(fileno(g_log), 0666);
        }
    }
    kill_other_instances();
    write_pidfile(g_cfg.pidfile);
    pos_open();
    dot_paths_init();
    fg_paths_init();
    load_toggle_keys();
    load_confirm_key();
    if (g_confirm_custom > 0) logmsg("自定义中间键键码=%d (按键映射)", g_confirm_custom);
    load_flags();
    ptr_color_apply(false);   /* 上次异常退出遗留的指针颜色，启动时还原 */
    if (pipe2(g_cmd_pipe, O_NONBLOCK | O_CLOEXEC) != 0) { g_cmd_pipe[0] = g_cmd_pipe[1] = -1; }
    if (g_cmd_path[0]) {
        /* App 写 keymouse_cmd 的瞬间守护进程就能收到(不再依赖 su 起进程发 SIGUSR1，那一步在这类机器上
         * 常要几百毫秒到几秒，用户这期间按的键就会"赶在学习模式开启之前"被当成普通按键)。信号通道保留作后备。 */
        g_cmd_inotify = inotify_init1(IN_NONBLOCK | IN_CLOEXEC);
        if (g_cmd_inotify >= 0) {
            char d[300]; snprintf(d, sizeof(d), "%s", g_cmd_path);
            char *sl = strrchr(d, '/');
            if (sl) { *sl = 0; if (inotify_add_watch(g_cmd_inotify, d, IN_CLOSE_WRITE | IN_MOVED_TO) < 0) { close(g_cmd_inotify); g_cmd_inotify = -1; } }
            else { close(g_cmd_inotify); g_cmd_inotify = -1; }
        }
    }
    {
        struct sigaction sa;
        memset(&sa, 0, sizeof(sa));
        sa.sa_handler = on_cmd_signal;
        sigemptyset(&sa.sa_mask);
        sa.sa_flags = SA_RESTART;
        sigaction(SIGUSR1, &sa, NULL);
    }
    pos_publish(false);   /* 启动时鼠标模式是关的: 红点隐藏 */

    signal(SIGTERM, on_signal);
    signal(SIGINT, on_signal);
    signal(SIGPIPE, SIG_IGN);

    /* --- 探测主键盘 / 功能键设备节点 --- */
    char kbd_path[128] = "", func_path[128] = "";
    if (find_event_node_by_name(g_cfg.kbd_name, kbd_path, sizeof(kbd_path)) != 0) {
        logmsg("找不到主键盘设备: %s", g_cfg.kbd_name);
        fprintf(stderr, "错误: 找不到主键盘设备 \"%s\"\n", g_cfg.kbd_name);
        return 2;
    }
    if (find_event_node_by_name(g_cfg.func_name, func_path, sizeof(func_path)) != 0) {
        logmsg("找不到功能键设备: %s", g_cfg.func_name);
        fprintf(stderr, "错误: 找不到功能键设备 \"%s\"\n", g_cfg.func_name);
        return 2;
    }
    g_same_device = (strcmp(kbd_path, func_path) == 0);
    if (g_same_device) {
        logmsg("警告: 主键盘与功能键解析到同一设备节点(%s)，"
               "开启鼠标模式时 F1 也会被暂时屏蔽", kbd_path);
    }

    g_kbd_fd = open(kbd_path, O_RDWR | O_NONBLOCK);
    if (g_kbd_fd < 0) { perror("open kbd"); return 3; }
    g_func_fd = g_same_device ? g_kbd_fd : open(func_path, O_RDONLY | O_NONBLOCK);
    if (g_func_fd < 0) { perror("open func"); return 3; }

    /* --- 打开 uinput 并创建虚拟鼠标 --- */
    int uimouse = open_uinput(g_cfg.uinput_path);
    if (uimouse < 0) {
        fprintf(stderr, "错误: 无法打开 uinput 节点 (需要 root 权限)\n");
        return 4;
    }
    if (create_mouse_device(uimouse) != 0) {
        perror("create_mouse_device");
        return 4;
    }
    g_mouse_fd = uimouse;

    /* 注意: "未占用按键透传"虚拟键盘 (g_pass_fd) 不再在这里创建。
     * 它注册了全量 KEY_* 位 (包括整套字母键)，Android 会把它当成一个
     * 正常的物理 QWERTY 键盘持续看待，不管我们是否 grab 着主键盘——这正是
     * T9 输入法"以为有实体键盘接着"从而拒绝进入数字输入模式的真正原因，
     * 之前只是放开 grab (disable_mouse_mode) 并不会让这个设备消失，
     * 所以单靠 grab/ungrab 和 show_ime_with_hard_keyboard 这个系统设置都
     * 治标不治本。现在改成跟随 enable/disable_mouse_mode() 的生命周期
     * 创建/销毁: 只有鼠标模式真正打开、需要靠它转发返回键/菜单键的时候才
     * 存在；一旦关闭(不管是手动 F1 还是输入法弹出自动暂停)，立刻把这个
     * 设备整个销毁，系统侧就完全看不到"有键盘接着"了，T9 输入法应该能
     * 马上恢复正常，不需要像以前那样必须整个关掉鼠标总开关(杀掉进程)
     * 才能生效。 */

    /* --- 若为 swipe 翻页模式，额外创建虚拟触摸屏 --- */
    /* 触摸点击模式也要用虚拟触摸屏，所以不管翻页模式是不是 swipe 都创建它 */
    {
        char touch_path[128] = "";
        if (find_touchscreen_node(g_cfg.touch_name, touch_path, sizeof(touch_path)) == 0) {
            int minx, maxx, miny, maxy;
            if (query_axis_range(touch_path, ABS_MT_POSITION_X, &minx, &maxx) == 0 &&
                query_axis_range(touch_path, ABS_MT_POSITION_Y, &miny, &maxy) == 0) {
                g_panel_w = maxx - minx + 1;
                g_panel_h = maxy - miny + 1;
            }
            logmsg("触摸屏: %s  面板分辨率: %dx%d", touch_path, g_panel_w, g_panel_h);
        } else {
            logmsg("警告: 未找到触摸屏设备，swipe 模式使用默认分辨率 %dx%d",
                   g_panel_w, g_panel_h);
        }
        int uitouch = open_uinput(g_cfg.uinput_path);
        if (uitouch >= 0 && create_touch_device(uitouch, g_panel_w, g_panel_h) == 0) {
            g_touch_fd = uitouch;
        } else {
            logmsg("警告: 创建虚拟触摸屏失败，翻页将退回 wheel 模式，触摸点击模式不可用");
            g_cfg.scroll_mode = MODE_WHEEL;
            if (uitouch >= 0) close(uitouch);
        }
    }
    g_cur_x = g_panel_w / 2;
    g_cur_y = g_panel_h / 2;

    /* --- epoll 主循环 --- */
    int epfd = epoll_create1(0);
    struct epoll_event ev1 = { .events = EPOLLIN, .data.fd = g_kbd_fd };
    epoll_ctl(epfd, EPOLL_CTL_ADD, g_kbd_fd, &ev1);
    if (!g_same_device) {
        struct epoll_event ev2 = { .events = EPOLLIN, .data.fd = g_func_fd };
        epoll_ctl(epfd, EPOLL_CTL_ADD, g_func_fd, &ev2);
    }

    if (g_cmd_pipe[0] >= 0) {
        struct epoll_event evc = { .events = EPOLLIN, .data.fd = g_cmd_pipe[0] };
        epoll_ctl(epfd, EPOLL_CTL_ADD, g_cmd_pipe[0], &evc);
    }
    if (g_cmd_inotify >= 0) {
        struct epoll_event evi = { .events = EPOLLIN, .data.fd = g_cmd_inotify };
        epoll_ctl(epfd, EPOLL_CTL_ADD, g_cmd_inotify, &evi);
    }
    write_state_file();
    logmsg("开关键: %d 个键, 首键键码=%d (默认 59=F1；可在 App 里设置，最多 %d 个键同时按住)", g_tk_n, g_toggle_code, TK_MAX);
    deb_keys_default();
    logmsg("拨号应用里允许鼠标=%s", g_cfg.dialer_allow ? "是" : "否(进拨号应用自动关鼠标)");
    logmsg("桌面隐藏=%s 输入法隐藏=%s home_poll_ms=%d", g_cfg.auto_home_suspend ? "开" : "关",
           g_cfg.auto_ime_suspend ? "开" : "关", g_cfg.home_poll_ms);
    logmsg("keymouse 启动完成，kbd=%s func=%s scroll_mode=%s auto_rotate=%s rotate_sign=%d swipe_rotate_sign=%d rotate_base=%d live_cfg=%s manual_rot_file=%s auto_ime_suspend=%s ime_poll_ms=%d ime_hide_confirm_ms=%d force_soft_kbd_when_off=%s panel=%dx%d",
           kbd_path, func_path, g_cfg.scroll_mode == MODE_WHEEL ? "wheel" : "swipe",
           g_cfg.auto_rotate ? "on" : "off", g_cfg.rotate_sign, g_cfg.swipe_rotate_sign, g_cfg.rotate_base,
           g_cfg.live_cfg[0] ? g_cfg.live_cfg : "(none)",
           g_cfg.manual_rot_file[0] ? g_cfg.manual_rot_file : "(none)",
           g_cfg.auto_ime_suspend ? "on" : "off", g_cfg.ime_poll_ms, g_cfg.ime_hide_confirm_ms,
           g_cfg.force_soft_kbd_when_off ? "on" : "off", g_panel_w, g_panel_h);

    /* 开机/守护进程刚启动、鼠标模式默认是关闭状态时也要保证这个设置是
     * 打开的，不用非得等到用户手动 disable 一次才第一次生效。 */
    if (g_cfg.force_soft_kbd_when_off) set_show_ime_with_hard_keyboard(true);

    struct epoll_event events[4];
    while (g_running) {
        bool any_move = held_up || held_down || held_left || held_right;
        bool any_scroll = g_scroll_up.held || g_scroll_down.held ||
                           g_scroll_left.held || g_scroll_right.held;
        bool f1_pending = (g_f1_down_ms >= 0 && !g_f1_fired);
        long tnow = now_ms();
        int timeout = -1; /* 无按键保持时无限阻塞 -> 0 CPU 占用 */

        /* 慢拖/捏合进行中: 不做 dumpsys/logcat 这类阻塞式查询(一次要几十~几百毫秒，
         * 会让手指的出点停顿，表现为滚动"卡顿")；松开按键后马上恢复。 */
        bool gesture_busy = g_pinch.active || g_gl.phase != GL_IDLE;
        if ((any_move || any_scroll) && !gesture_busy) {
            refresh_rotation(tnow);
        }
        /* App 里的开关(输入法/桌面隐藏)在没按键时也要及时生效，所以实时参数检查不再
         * 只在按键按住时做；stat 一个小文件的开销可以忽略。 */
        refresh_live_config(tnow);
        refresh_hold_config(tnow);
        refresh_keymap_cfg(tnow);
        refresh_speed_config(tnow);
        refresh_home_state(tnow);
        refresh_lock_cfg(tnow);
        if (!gesture_busy) refresh_lock_state(tnow);
        if (!g_cfg_lock_allow && (g_enabled || g_auto_lock_suspended)) {
            int t = (int)(g_lock_next_poll - tnow);
            if (t < 20) t = 20;
            if (timeout < 0 || t < timeout) timeout = t;
        }
        if (fg_watch_on() && (g_enabled || g_auto_home_suspended || deb_needs_fg())) {
            int t = (int)(g_fg_next_poll - tnow);
            if (t < 50) t = 50;
            if (g_fg_pid > 0 && t > 150) t = 150;       /* 等子进程结果别等太久 */
            if (timeout < 0 || t < timeout) timeout = t;
        }
        if (g_enabled || g_auto_ime_suspended || g_auto_home_suspended || g_auto_lock_suspended) {
            if (timeout < 0 || timeout > 1000) timeout = 1000;   /* 每秒看一眼 App 有没有改开关 */
        }

        /* 红点助手: 鼠标模式开着时保证它活着；方向键松开后过一会儿(等最后一次
         * 指针移动被系统处理、助手把真实坐标写出来)用真实指针坐标校正一次。 */
        if (g_enabled) {
            static bool s_was_moving = false;
            static long s_sync_at = 0;
            static long s_next_ensure = 0;
            static long s_next_thaw = 0;
            if (!gesture_busy && tnow >= s_next_thaw) { app_thaw(); s_next_thaw = tnow + 500; }
            if (!gesture_busy && tnow >= s_next_ensure) { dot_helper_ensure(); app_keepalive_ensure(false); s_next_ensure = tnow + 3000; }
            if (s_was_moving && !any_move) s_sync_at = tnow + 250;
            s_was_moving = any_move;
            if (s_sync_at > 0) {
                if (tnow >= s_sync_at) { ptr_sync(true); s_sync_at = 0; }
                else {
                    int t = (int)(s_sync_at - tnow);
                    if (timeout < 0 || t < timeout) timeout = t;
                }
            }
            if (timeout < 0 || timeout > 500) timeout = 500;   /* 每 0.5 秒醒一次: 解冻 App 进程，另每 3 秒检查助手/保活服务 */
        }

        if (any_move) {
            if (next_move_due <= tnow) { do_move_tick(); next_move_due = tnow + g_cfg.move_interval_ms; }
            int t = (int)(next_move_due - tnow);
            if (timeout < 0 || t < timeout) timeout = t < 0 ? 0 : t;
        }
        if (any_scroll) {
            scroll_axis_poll(&g_scroll_up, tnow, &timeout);
            scroll_axis_poll(&g_scroll_down, tnow, &timeout);
            scroll_axis_poll(&g_scroll_left, tnow, &timeout);
            scroll_axis_poll(&g_scroll_right, tnow, &timeout);
        }
        if (f1_pending) {
            f1_poll(tnow, &timeout);
        }
        gesture_poll(tnow, &timeout);
        hold_poll(tnow, &timeout);
        drag_poll(tnow, &timeout);
        menu_poll(tnow, &timeout);

        /* 输入法检测必须独立于按键状态: 点一下屏幕上的输入框本身不产生
         * 任何物理按键事件，如果沿用"没有按键按住就无限阻塞 epoll_wait"
         * 的老逻辑，我们永远没有机会主动醒过来看一眼输入法状态。只在
         * "鼠标模式当前开着"或"当前正处于因输入法而自动暂停"这两种情况下
         * 才需要关心，其余时候(用户手动整个关掉鼠标模式)没有可暂停/恢复
         * 的对象，不必为此持续唤醒进程、白白消耗一次 dumpsys 调用的开销。 */
        if (g_cfg.auto_ime_suspend && (g_enabled || g_auto_ime_suspended) && !gesture_busy) {
            if (g_ime_next_poll <= tnow) {
                refresh_ime_state(tnow);
            }
            int t = (int)(g_ime_next_poll - tnow);
            if (t < 0) t = 0;
            if (timeout < 0 || t < timeout) timeout = t;
        }

        if (g_learn) {
            long left = g_learn_deadline - tnow;
            if (left <= 0) {
                if (g_learn && g_learn_slot != 3 && g_lc_n > 0) toggle_learn_finalize();   /* 时间到: 有键就按已收集的定下来 */
                if (g_learn) { g_learn = false; g_lc_n = 0; write_state_file(); logmsg("开关键学习: 8 秒内没有有效按键，已取消"); }
            }
            else if (timeout < 0 || left < timeout) timeout = (int)left;
        }

        deb_poll(tnow, &timeout);
        deb_update_global(tnow, &timeout);
        {
            static long s_deb_log_at = 0, s_deb_last = 0;
            long tot = g_deb_n_bounce + g_deb_n_ghost;
            if (tot != s_deb_last && tnow >= s_deb_log_at) {
                logmsg("防抖统计: 已吞掉抖动 %ld 次，丢掉幽灵短按 %ld 次", g_deb_n_bounce, g_deb_n_ghost);
                s_deb_last = tot; s_deb_log_at = tnow + 30000;
            }
        }

        int n = epoll_wait(epfd, events, 4, timeout);
        if (n < 0) {
            if (errno == EINTR) continue;
            break;
        }
        for (int i = 0; i < n; i++) {
            int fd = events[i].data.fd;
            if (g_cmd_inotify >= 0 && fd == g_cmd_inotify) {
                char ib[1024] __attribute__((aligned(8)));
                bool hit = false;
                ssize_t rn;
                const char *want = strrchr(g_cmd_path, '/'); want = want ? want + 1 : g_cmd_path;
                while ((rn = read(fd, ib, sizeof(ib))) > 0) {
                    for (char *q = ib; q < ib + rn; ) {
                        struct inotify_event *ie = (struct inotify_event *)q;
                        if (ie->len > 0 && strcmp(ie->name, want) == 0) hit = true;
                        q += sizeof(struct inotify_event) + ie->len;
                    }
                }
                if (hit) process_command();
                continue;
            }
            if (g_cmd_pipe[0] >= 0 && fd == g_cmd_pipe[0]) {
                char drain[16];
                while (read(fd, drain, sizeof(drain)) > 0) {}
                process_command();
                continue;
            }
            bool from_kbd = (fd == g_kbd_fd);
            struct input_event ev;
            while (read(fd, &ev, sizeof(ev)) == (ssize_t)sizeof(ev)) {
                handle_key_event(&ev, from_kbd);
            }
        }
    }

    logmsg("keymouse 收到退出信号，清理中...");
    torch_helper_stop();
    pos_publish(false);
    dot_helper_stop();
    disable_mouse_mode(true);   /* 鼠标模式开着时被关掉(如 App 里的总开关)，也弹"已关闭" */
    destroy_uinput_devices();
    if (g_state_path[0]) unlink(g_state_path);
    if (g_cfg.pidfile[0]) unlink(g_cfg.pidfile);
    if (g_log) fclose(g_log);
    return 0;
}
