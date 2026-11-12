/*
 * km_debounce.h —— 按键防抖引擎(纯逻辑，不碰任何设备，方便单独测试)
 *
 * 两道过滤(都是"前沿立即响应 + 后沿延迟确认"，按下不会被拖慢到影响手感):
 *   1) 松开防抖 g_deb_ms: 松开信号不立刻生效，等 g_deb_ms 毫秒；这段时间里又按下
 *      了 = 触点抖动，吞掉这次"按下"，也撤销那次"松开"，等于这个键一直按着。
 *   2) 幽灵短按过滤 g_deb_ghost_ms: 按下信号等 g_deb_ghost_ms 毫秒再确认；这段时间里
 *      就松开了 = 毛刺，整次按压丢掉。0 = 关闭这道过滤(按下立刻生效)。
 *
 * 引擎只负责"清洗"事件，干净的事件通过 deb_out() 交给调用方(由 keymouse.c 实现)。
 * 时间由调用方传入(毫秒)，不自己读时钟。
 */
#ifndef KM_DEBOUNCE_H
#define KM_DEBOUNCE_H

#include <stdbool.h>

#define DEB_MAXKEY 0x300

typedef struct {
    bool phys;      /* 物理上此刻是否按着(按引擎收到的信号算) */
    bool out;       /* 已经向外发出"按下"，且还没发出"松开" */
    bool dpend;     /* 按下信号还在幽灵过滤的观察期里，没向外发 */
    bool kbd;       /* 事件来自主键盘设备 */
    long up_due;    /* >0: 待发"松开"的时刻 */
    long dn_due;    /* >0: 待发"按下"的时刻 */
} deb_key_t;

static deb_key_t g_dk[DEB_MAXKEY];
static int  g_deb_ms = 120;          /* 松开防抖时间 */
static int  g_deb_ghost_ms = 30;     /* 幽灵短按过滤时间 */
static int  g_deb_pending = 0;       /* 有多少个键带着待处理的计时 */
static long g_deb_n_bounce = 0;      /* 统计: 吞掉的抖动(松开又按下) */
static long g_deb_n_ghost = 0;       /* 统计: 丢掉的幽灵短按 */

/* 由 keymouse.c(或测试程序)实现: 把清洗后的事件交出去 */
static void deb_out(int code, int value, bool from_kbd);

static bool deb_busy(int code) {
    if (code < 0 || code >= DEB_MAXKEY) return false;
    const deb_key_t *k = &g_dk[code];
    return k->phys || k->out || k->dpend;
}

static bool deb_any_busy(void) {
    for (int i = 0; i < DEB_MAXKEY; i++) if (deb_busy(i)) return true;
    return false;
}

static void deb_feed(int code, int value, bool from_kbd, long now) {
    if (code < 0 || code >= DEB_MAXKEY) return;
    deb_key_t *k = &g_dk[code];
    k->kbd = from_kbd;
    if (value == 1) {
        if (k->phys) return;                         /* 重复的按下 */
        k->phys = true;
        if (k->out && k->up_due > 0) {               /* 松开后很快又按下: 抖动 */
            k->up_due = 0; g_deb_pending--; g_deb_n_bounce++;
            return;
        }
        if (k->out) return;
        if (g_deb_ghost_ms > 0) {
            k->dpend = true; k->dn_due = now + g_deb_ghost_ms; g_deb_pending++;
        } else {
            k->out = true; deb_out(code, 1, from_kbd);
        }
    } else if (value == 0) {
        if (!k->phys) return;
        k->phys = false;
        if (k->dpend) {                              /* 还没确认就松开了: 毛刺 */
            k->dpend = false; k->dn_due = 0; g_deb_pending--; g_deb_n_ghost++;
            return;
        }
        if (k->out) {
            if (g_deb_ms > 0) { k->up_due = now + g_deb_ms; g_deb_pending++; }
            else { k->out = false; deb_out(code, 0, from_kbd); }
        }
    } else if (value == 2) {
        if (k->out && k->phys) deb_out(code, 2, from_kbd);
    }
}

/* 到点的计时在这里兑现；*timeout_ms 会被收紧到最近一个计时 */
static void deb_poll(long now, int *timeout_ms) {
    if (g_deb_pending <= 0) return;
    for (int i = 0; i < DEB_MAXKEY; i++) {
        deb_key_t *k = &g_dk[i];
        if (k->up_due > 0) {
            if (now >= k->up_due) {
                k->up_due = 0; g_deb_pending--;
                k->out = false;
                deb_out(i, 0, k->kbd);
            } else {
                int t = (int)(k->up_due - now);
                if (*timeout_ms < 0 || t < *timeout_ms) *timeout_ms = t;
            }
        }
        if (k->dn_due > 0) {
            if (now >= k->dn_due) {
                k->dn_due = 0; g_deb_pending--;
                k->dpend = false;
                if (k->phys) { k->out = true; deb_out(i, 1, k->kbd); }
            } else {
                int t = (int)(k->dn_due - now);
                if (*timeout_ms < 0 || t < *timeout_ms) *timeout_ms = t;
            }
        }
    }
}

#endif
