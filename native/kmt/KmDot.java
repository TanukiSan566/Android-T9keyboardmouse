package kmt;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Point;
import android.graphics.drawable.GradientDrawable;
import android.os.Binder;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.view.Display;
import android.view.Gravity;
import android.view.InputChannel;
import android.view.InputEvent;
import android.view.InputEventReceiver;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.RandomAccessFile;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * keymouse 红点/弹窗助手 (root, app_process 启动，常驻)。
 *
 * 为什么放在这里而不是 App 进程里: 实测 App 进程会被系统在内存不足时直接杀掉
 * (lowmemorykiller: swap is extremely low)，而且魅族系统会把被杀进程的重启推迟几分钟，
 * 红点/弹窗就一直不回来——这正是"开了 B 站之后红点再也不出现"、"弹窗只在
 * keymouse 自己界面里才有"这两个长期问题的根子: 以前弹窗靠 am broadcast 拉起
 * App 的 BroadcastReceiver 进程来画悬浮窗，这个进程寿命极短，onReceive() 一返回
 * 马上就是系统内存回收的候选对象；addView() 调用本身是异步的，真正的合成/上屏
 * 发生在之后，进程常常等不到那一刻就被系统收掉，窗口自然从没真正显示出来——
 * App 在前台时之所以"看起来正常"，只是因为那时 App 进程本来就在跑、优先级高，
 * 不会被这么快收掉，并不是代码本身只在那种情况下才对。
 *
 * 这个 root 助手不是 App 进程，不归 lmkd 管，不会被它杀；现在它除了画红点，
 * 也顺带把"开关提示 + 方向选择"、"手电筒/最近任务/强制关闭"这些简单文字提示
 * 一起画了，不再依赖 App 进程。
 *
 * 它做的事，每件独立 try，失败只写日志、不影响其他:
 *  1. 输入监视器(InputMonitor): 直接拿到系统鼠标指针的真实坐标(悬停事件)，
 *     不再靠守护进程"估算"，所以红点和指针天然是同一个点，转屏也一样。
 *  2. 悬浮窗红点: 在真实指针位置画红点；如果一开始没建成，不会就此放弃，
 *     每隔几秒自动重试，直到成功(例如刚启动时 WindowManager 还没就绪这种
 *     一过性失败，不会再导致红点一辈子消失)。
 *  3. 心跳: 写 keymouse_dot_alive，内容 "ov=1" 表示本进程已经负责画红点
 *     (App 里的红点看到就自动让位)，"ov=0" 表示本进程没能建悬浮窗(App 继续自己画)。
 *  4. 弹窗: 轮询守护进程写的 keymouse_tip_req，有新请求就画一个简单的底部
 *     文字气泡(手电筒/最近任务/强制关闭)，或者顶部"开关提示 + 方向选择"
 *     (鼠标模式开启时)。
 */
public class KmDot {
    private static String dir;
    private static File posFile, ptrFile, ptrTmp, aliveFile, tipReqFile, langPrefFile;

    private static Handler handler;
    private static Context ctx;          // 反射拿到的系统 Context，弹窗/红点公用
    private static WindowManager wm;
    private static View dot;
    private static WindowManager.LayoutParams lp;
    private static int dotSize = 14;
    private static float density = 1f;
    private static boolean overlayOk = false;
    private static long overlayNextRetry = 0;
    private static boolean shown = false;
    private static int lastX = -99999, lastY = -99999;

    private static Object dmg;          // DisplayManagerGlobal
    private static Method getRealDisplay;

    // 真实指针(显示器坐标，当前方向)
    private static volatile boolean haveTruth = false;
    private static volatile float truthX, truthY;
    private static volatile long truthAt = 0;
    private static boolean truthDirty = false;
    private static long lastBeat = 0;
    private static long lastPtrWrite = 0;
    private static InputEventReceiver receiver;   // 防止被回收
    private static long lastTruthEventAt = 0;
    private static int truthEventsSinceLog = 0;
    private static long lastRateLogAt = 0;

    // 弹窗
    private static String lastTipSeq = "";
    private static View tipView;                 // 当前显示的简单气泡/开关提示, 同一时刻只有一个
    private static final Runnable TIP_DISMISS = new Runnable() {
        public void run() { dismissTip(); }
    };

    private static void log(String s) {
        System.out.println("[dot] " + s);
        System.out.flush();
    }

    /** 带调用栈的日志。以前只打异常的一句话，"NullPointerException ... Typeface.getWeight()"
     *  到底出在哪一步看不出来，这里把根因和前 12 层调用栈都写进去。 */
    private static void logEx(String what, Throwable t) {
        Throwable r = root(t);
        log(what + ": " + r);
        StackTraceElement[] st = r.getStackTrace();
        for (int i = 0; i < st.length && i < 12; i++) log("    at " + st[i]);
    }

    /** 红点/弹窗一直建不起来的根因: Android 15 把系统字体表改成了"懒加载"
     *  (Typeface.ENABLE_LAZY_TYPEFACE_INITIALIZATION=true)，普通 App 的字体表是
     *  系统在 bindApplication 时塞进去的；我们这个 root 助手是 app_process 单独起的
     *  进程，没人给它加载，默认字体 sDefaultTypeface 一直是 null，只要建 TextView
     *  之类就会报 "Typeface.getWeight() on a null object reference"。
     *  所以启动时自己加载一遍预装系统字体，和 Zygote 预加载做的是同一件事。 */
    private static boolean initTypefaces() {
        try {
            Class<?> tf = Class.forName("android.graphics.Typeface");
            tf.getMethod("loadPreinstalledSystemFontMap").invoke(null);
        } catch (Throwable t) {
            logEx("加载系统字体失败", t);
        }
        try {
            Object d = Class.forName("android.graphics.Typeface").getField("DEFAULT").get(null);
            log("系统字体: Typeface.DEFAULT=" + (d != null ? "有" : "空"));
            return d != null;
        } catch (Throwable t) {
            logEx("检查默认字体失败", t);
            return false;
        }
    }

    private static Throwable root(Throwable t) {
        while (t instanceof InvocationTargetException && t.getCause() != null) t = t.getCause();
        return t;
    }

    private static void exemptHiddenApis() {
        try {
            Method forName = Class.class.getDeclaredMethod("forName", String.class);
            Method getDeclaredMethod = Class.class.getDeclaredMethod("getDeclaredMethod", String.class, Class[].class);
            Class<?> vmRuntime = (Class<?>) forName.invoke(null, "dalvik.system.VMRuntime");
            Method getRuntime = (Method) getDeclaredMethod.invoke(vmRuntime, "getRuntime", null);
            Method setEx = (Method) getDeclaredMethod.invoke(vmRuntime, "setHiddenApiExemptions", new Class[] { String[].class });
            Object vm = getRuntime.invoke(null);
            setEx.invoke(vm, new Object[] { new String[] { "L" } });
        } catch (Throwable t) {
            log("豁免隐藏API失败(可忽略): " + root(t));
        }
    }

    /* ---------- 显示器信息(不需要 Context) ---------- */
    private static void setupDisplay() {
        try {
            Class<?> c = Class.forName("android.hardware.display.DisplayManagerGlobal");
            dmg = c.getMethod("getInstance").invoke(null);
            getRealDisplay = c.getMethod("getRealDisplay", int.class);
            Display d = (Display) getRealDisplay.invoke(dmg, 0);
            Point p = new Point();
            d.getRealSize(p);
            log("显示器 " + p.x + "x" + p.y + " rotation=" + d.getRotation());
        } catch (Throwable t) {
            dmg = null;
            log("取显示器信息失败: " + root(t));
        }
    }

    private static Display display() {
        try {
            return dmg == null ? null : (Display) getRealDisplay.invoke(dmg, 0);
        } catch (Throwable t) {
            return null;
        }
    }

    /* ---------- 1. 输入监视器: 真实指针坐标 ---------- */
    private static final class PtrReceiver extends InputEventReceiver {
        PtrReceiver(InputChannel ch, Looper l) {
            super(ch, l);
        }

        @Override
        public void onInputEvent(InputEvent e) {
            boolean handled = false;
            try {
                if (e instanceof MotionEvent) {
                    MotionEvent m = (MotionEvent) e;
                    // 只认鼠标(SOURCE_MOUSE=0x2002)；虚拟触摸屏的滑动手势是触摸屏源，不算
                    if ((m.getSource() & 0x2002) == 0x2002) {
                        truthX = m.getX();
                        truthY = m.getY();
                        truthAt = System.currentTimeMillis();
                        haveTruth = true;
                        truthDirty = true;
                        lastTruthEventAt = truthAt;
                        truthEventsSinceLog++;
                        renderDot(truthAt);   // 事件一到就立刻挪红点，不等 30ms 的轮询
                    }
                }
            } catch (Throwable t) {
                // 忽略单次事件的问题
            }
            finishInputEvent(e, handled);
        }

        // 实测关心的问题: "红点只在松开方向键/移动停下来之后才归位，移动过程中不跟手"。
        // InputEventReceiver 对连续的 MOVE/HOVER_MOVE 事件默认会攒批(batch)，正常
        // 情况下框架会在下一次 vsync 时自动消费掉——但为保险起见这里显式覆写、
        // 立刻消费，避免任何批处理延迟导致红点跟不上鼠标移动本身。
        @Override
        public void onBatchedInputEventPending(int source) {
            consumeBatchedInputEvents(-1);
        }
    }

    private static boolean setupMonitor() {
        try {
            Class<?> sm = Class.forName("android.os.ServiceManager");
            IBinder b = (IBinder) sm.getMethod("getService", String.class).invoke(null, "input");
            if (b == null) { log("监视器: 找不到 input 服务"); return false; }
            Object svc = Class.forName("android.hardware.input.IInputManager$Stub")
                    .getMethod("asInterface", IBinder.class).invoke(null, b);
            Method m = null;
            for (Method x : Class.forName("android.hardware.input.IInputManager").getMethods()) {
                if (x.getName().equals("monitorGestureInput")) { m = x; break; }
            }
            if (m == null) { log("监视器: IInputManager 里没有 monitorGestureInput"); return false; }
            Class<?>[] pt = m.getParameterTypes();
            StringBuilder sig = new StringBuilder();
            for (Class<?> c : pt) sig.append(c.getSimpleName()).append(' ');
            log("监视器: monitorGestureInput(" + sig.toString().trim() + ")");
            Object[] args = new Object[pt.length];
            int strIdx = 0;
            for (int i = 0; i < pt.length; i++) {
                if (pt[i] == IBinder.class) args[i] = new Binder();
                else if (pt[i] == String.class) args[i] = "keymouse-dot" + (strIdx++ > 0 ? "2" : "");
                else if (pt[i] == int.class) args[i] = 0;
                else args[i] = null;
            }
            Object monitor;
            try {
                monitor = m.invoke(svc, args);
            } catch (InvocationTargetException ite) {
                throw ite.getCause() != null ? ite.getCause() : ite;
            }
            if (monitor == null) { log("监视器: 返回空"); return false; }
            Object ch = monitor.getClass().getMethod("getInputChannel").invoke(monitor);
            receiver = new PtrReceiver((InputChannel) ch, Looper.myLooper());
            log("监视器已建立: 开始接收真实鼠标指针坐标");
            return true;
        } catch (Throwable t) {
            logEx("监视器失败", t);
            return false;
        }
    }

    /* ---------- 2. 悬浮窗红点 ---------- */
    private static boolean textOk = false;      // 能不能画带文字的窗口(字体系统是否可用)
    private static boolean textProbed = false;

    private static boolean ensureContext() {
        if (ctx != null) return true;
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Object t = at.getMethod("systemMain").invoke(null);
            log("ActivityThread.systemMain 成功");
            Context c = (Context) at.getMethod("getSystemContext").invoke(t);
            c.setTheme(android.R.style.Theme_DeviceDefault);
            density = c.getResources().getDisplayMetrics().density;
            dotSize = Math.max(10, (int) (12 * density));
            ctx = c;
            log("系统 Context 就绪 density=" + density);
            return true;
        } catch (Throwable t) {
            logEx("取系统 Context 失败", t);
            return false;
        }
    }

    /** 先在屏幕外建一个 TextView 试一下: 能建说明字体系统 OK，弹窗可以交给本助手画；
     *  建不了就在心跳里报 tx=0，守护进程会退回旧的广播方式，不会让提示悄悄丢掉。 */
    private static void probeText() {
        if (textProbed || ctx == null) return;
        textProbed = true;
        try {
            TextView tv = new TextView(ctx);
            tv.setText("km");
            tv.setTextSize(14f);
            tv.setTextColor(0xFFFFFFFF);
            textOk = true;
            log("文字窗口自检通过(弹窗由本助手负责)");
        } catch (Throwable t) {
            textOk = false;
            logEx("文字窗口自检失败(弹窗退回广播方式)", t);
        }
    }

    private static boolean setupOverlay() {
        // 实测(Session: Unknown pid=.. uid=0): WindowManagerService 只给已注册的 App 进程开窗口会话，
        // 本进程是 root 的 app_process，永远建不出窗口。红点/弹窗改由 App 里的 KeepAliveService 负责，
        // 这里只保留"读真实鼠标指针坐标"这一件事。
        if (true) return false;
        try {
            if (!ensureContext()) return false;
            probeText();
            wm = (WindowManager) ctx.getSystemService("window");

            GradientDrawable g = new GradientDrawable();
            g.setShape(GradientDrawable.OVAL);
            g.setColor(0xFFFF0000);
            g.setStroke(Math.max(1, (int) density), 0xFFFFFFFF);
            dot = new View(ctx);
            dot.setBackground(g);
            dot.setVisibility(View.INVISIBLE);

            lp = new WindowManager.LayoutParams(dotSize, dotSize,
                    2038 /* TYPE_APPLICATION_OVERLAY */,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                            | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                            | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
                    -3 /* PixelFormat.TRANSLUCENT */);
            lp.gravity = Gravity.TOP | Gravity.LEFT;
            lp.setTitle("keymouse-dot");
            wm.addView(dot, lp);
            log("悬浮窗已建立(由 root 助手负责画红点)");
            return true;
        } catch (Throwable t) {
            logEx("悬浮窗失败(稍后自动重试)", t);
            dot = null;
            return false;
        }
    }

    /* 悬浮窗没建成(常见于启动瞬间 WindowManager 还没就绪)不是永久性失败，
     * 每隔 5 秒重试一次，直到成功——这是"红点消失后再也不回来"这个问题
     * 的另一半根因: 以前这里只在 main() 里试一次，失败就是这个进程
     * 一辈子都不会再画红点了，哪怕 WindowManager 几秒后就绪了也没用。 */
    private static void ensureOverlay(long now) {
        if (overlayOk && dot != null) return;
        if (now < overlayNextRetry) return;
        overlayNextRetry = now + 5000;
        overlayOk = setupOverlay();
    }

    /* ---------- 轮询 ---------- */
    private static final byte[] BUF = new byte[64];
    private static final byte[] TIPBUF = new byte[256];

    private static void touchAlive(long now) {
        if (now - lastBeat < 500) return;
        lastBeat = now;
        try {
            FileOutputStream o = new FileOutputStream(aliveFile);
            o.write(((overlayOk ? "ov=1" : "ov=0") + (textOk ? " tx=1\n" : " tx=0\n")).getBytes());
            o.close();
            aliveFile.setReadable(true, false);
        } catch (Throwable t) {
            // 忽略
        }
        if (now - lastRateLogAt >= 5000) {
            if (lastRateLogAt != 0) {
                log("真实指针事件速率: " + truthEventsSinceLog + " 个/" + ((now - lastRateLogAt) / 1000) + "s"
                        + " overlayOk=" + overlayOk + " haveTruth=" + haveTruth);
            }
            lastRateLogAt = now;
            truthEventsSinceLog = 0;
        }
    }

    private static void writePtr(int rot, int dw, int dh, long now) {
        if (!haveTruth || (!truthDirty && now - lastPtrWrite < 1000)) return;
        truthDirty = false;
        lastPtrWrite = now;
        try {
            String s = String.format("%d %05d %05d %08.1f %08.1f\n", rot, dw, dh, truthX, truthY);
            FileOutputStream o = new FileOutputStream(ptrTmp);
            o.write(s.getBytes());
            o.close();
            ptrTmp.setReadable(true, false);
            ptrTmp.renameTo(ptrFile);
        } catch (Throwable t) {
            // 忽略
        }
    }

    private static final Runnable TICK = new Runnable() {
        public void run() {
            try {
                tick();
            } catch (Throwable t) {
                // 保证轮询不中断
            }
            handler.postDelayed(this, 30);
        }
    };

    private static void tick() throws Exception {
        long now = System.currentTimeMillis();
        ensureOverlay(now);
        touchAlive(now);
        checkTipRequest(now);

        // 守护进程写的"估算坐标": 状态 x y 面板宽 面板高。状态位=1 表示鼠标模式开着。
        boolean on = false;
        int px = 0, py = 0, pw = 0, ph = 0;
        long mt = posFile.lastModified();
        if (mt > 0) {
            FileInputStream in = new FileInputStream(posFile);
            int n = in.read(BUF);
            in.close();
            if (n >= 24) {
                String[] p = new String(BUF, 0, n).trim().split(" +");
                if (p.length >= 5 && "1".equals(p[0])) {
                    px = Integer.parseInt(p[1]);
                    py = Integer.parseInt(p[2]);
                    pw = Integer.parseInt(p[3]);
                    ph = Integer.parseInt(p[4]);
                    on = pw > 1 && ph > 1;
                }
            }
        }
        modeOn = on;
        posMtime = mt;
        estX = px; estY = py; estW = pw; estH = ph;

        Display d = display();
        int rot = -1, dw = 0, dh = 0;
        if (d != null) {
            Point real = new Point();
            d.getRealSize(real);
            rot = d.getRotation();
            dw = real.x;
            dh = real.y;
        }
        curRot = rot; curDw = dw; curDh = dh;
        writePtr(rot, dw, dh, now);
        renderDot(now);
    }

    // ---- 红点显示状态 (和系统鼠标指针保持一致) ----
    private static boolean modeOn = false;     // 鼠标模式是否开着(守护进程写的状态位)
    private static long posMtime = 0;          // 守护进程最后一次动鼠标/点击/翻页的时间
    private static int estX, estY, estW, estH; // 守护进程自己估算的坐标(没有真实指针时才用)
    private static int curRot = -1, curDw = 0, curDh = 0;
    private static float lastAlpha = -1f;
    // 系统鼠标指针静止约 15 秒后会渐渐淡出，红点同步: 15 秒后用 0.7 秒淡出，任何移动立刻恢复
    private static final long IDLE_MS = 15000L, FADE_MS = 700L;

    private static void renderDot(long now) {
        if (!overlayOk || dot == null || wm == null) return;
        try {
            float a = 0f;
            if (modeOn) {
                long last = Math.max(truthAt, posMtime);
                long idle = now - last;
                if (idle < IDLE_MS) a = 1f;
                else if (idle < IDLE_MS + FADE_MS) a = 1f - (idle - IDLE_MS) / (float) FADE_MS;
            }
            if (a <= 0f) {
                if (shown) { dot.setVisibility(View.INVISIBLE); shown = false; }
                lastAlpha = 0f;
                return;
            }
            int x, y;
            if (haveTruth && now - truthAt < 600000L) {
                x = (int) truthX;
                y = (int) truthY;
            } else if (curDw > 0 && curDh > 0 && estW > 1 && estH > 1) {
                float fx = clamp01(estX / (float) (estW - 1));
                float fy = clamp01(estY / (float) (estH - 1));
                float sx, sy;
                if (curRot == 1) { sx = fy; sy = 1f - fx; }
                else if (curRot == 2) { sx = 1f - fx; sy = 1f - fy; }
                else if (curRot == 3) { sx = 1f - fy; sy = fx; }
                else { sx = fx; sy = fy; }
                x = (int) (sx * curDw);
                y = (int) (sy * curDh);
            } else {
                return;
            }
            if (!shown) { dot.setVisibility(View.VISIBLE); shown = true; }
            if (a != lastAlpha) { dot.setAlpha(a); lastAlpha = a; }
            if (x != lastX || y != lastY) {
                lp.x = x - dotSize / 2;
                lp.y = y - dotSize / 2;
                wm.updateViewLayout(dot, lp);
                lastX = x;
                lastY = y;
            }
        } catch (Throwable t) {
            // 单次刷新失败不影响后续
        }
    }

    private static float clamp01(float v) {
        return v < 0f ? 0f : (v > 1f ? 1f : v);
    }

    /* ================== 3. 弹窗 (开关提示/方向选择/手电筒/最近任务/强制关闭) ================== */

    /** 0=en 1=ru 2=ja 3=zh；读不到/格式不对一律当 0(en)，和原来 App 里的默认一致。 */
    private static int readLang() {
        try {
            RandomAccessFile f = new RandomAccessFile(langPrefFile, "r");
            byte[] b = new byte[2048];
            int n = f.read(b);
            f.close();
            if (n <= 0) return 0;
            String s = new String(b, 0, n);
            int i = s.indexOf("name=\"lang\"");
            if (i < 0) return 0;
            int vi = s.indexOf("value=\"", i);
            if (vi < 0) return 0;
            vi += 7;
            int ve = s.indexOf('"', vi);
            if (ve < 0) return 0;
            int v = Integer.parseInt(s.substring(vi, ve).trim());
            return (v >= 0 && v <= 3) ? v : 0;
        } catch (Throwable t) {
            return 0;
        }
    }

    private static String appLabel(String pkg) {
        try {
            PackageManager pm = ctx.getPackageManager();
            ApplicationInfo ai = pm.getApplicationInfo(pkg, 0);
            CharSequence lbl = pm.getApplicationLabel(ai);
            if (lbl != null && lbl.length() > 0) return lbl.toString();
        } catch (Throwable t) {
            // 忽略，退回包名
        }
        return pkg;
    }

    private static String pick(int lang, String en, String ru, String ja, String zh) {
        switch (lang) {
            case 1: return ru;
            case 2: return ja;
            case 3: return zh;
            default: return en;
        }
    }

    private static void checkTipRequest(long now) {
        try {
            long age = now - tipReqFile.lastModified();
            if (age < 0 || age > 10000L) return;   // 太旧的请求不处理(比如助手刚重启、文件是上一轮残留)
            RandomAccessFile f = new RandomAccessFile(tipReqFile, "r");
            int n = f.read(TIPBUF);
            f.close();
            if (n <= 0) return;
            String line = new String(TIPBUF, 0, n).trim();
            int sp1 = line.indexOf(' ');
            if (sp1 < 0) return;
            String seq = line.substring(0, sp1);
            if (seq.equals(lastTipSeq)) return;
            lastTipSeq = seq;
            String rest = line.substring(sp1 + 1);
            int sp2 = rest.indexOf(' ');
            String kind = sp2 < 0 ? rest : rest.substring(0, sp2);
            String arg = sp2 < 0 ? "-" : rest.substring(sp2 + 1).trim();
            handleTip(kind, arg);
        } catch (Throwable t) {
            log("弹窗请求读取失败: " + root(t));
        }
    }

    private static void handleTip(String kind, String arg) {
        if (true) return;
        if (!ensureContext()) return;
        if (wm == null) wm = (WindowManager) ctx.getSystemService("window");
        probeText();
        if (!textOk) return;   // 画不了文字: 心跳里 tx=0，守护进程那边已经退回广播方式
        int lang = readLang();
        if ("mouse_on".equals(kind)) {
            showToggle(true, lang);
        } else if ("mouse_off".equals(kind)) {
            showToggle(false, lang);
        } else if ("menu".equals(kind)) {
            showBubble(pick(lang, "Recent apps", "Недавние приложения", "最近のタスク", "最近任务列表"), 2200);
        } else if ("kill".equals(kind)) {
            String label = "-".equals(arg) ? "?" : appLabel(arg);
            String fmt = pick(lang, "Foreground \"%s\" force-closed",
                    "Приложение «%s» принудительно закрыто",
                    "前面の「%s」を強制終了しました",
                    "前台\u201c%s\u201d已强制关闭");
            showBubble(String.format(fmt, label), 2200);
        } else if ("torch_on".equals(kind)) {
            showBubble(pick(lang, "Flashlight on", "Фонарик включён", "ライトをオンにしました", "手电筒已开"), 2200);
        } else if ("torch_off".equals(kind)) {
            showBubble(pick(lang, "Flashlight off", "Фонарик выключен", "ライトをオフにしました", "手电筒已关"), 2200);
        } else if ("torch_fail".equals(kind)) {
            showBubble(pick(lang, "Flashlight failed to turn on", "Не удалось включить фонарик",
                    "ライトをオンにできませんでした", "手电筒打开失败"), 2200);
        }
    }

    private static void dismissTip() {
        try {
            handler.removeCallbacks(TIP_DISMISS);
            if (tipView != null && wm != null) wm.removeView(tipView);
        } catch (Throwable t) {
            // 忽略
        }
        tipView = null;
    }

    /** 屏幕底部居中的简单文字气泡，duration 毫秒后自动消失。 */
    private static void showBubble(String text, long durationMs) {
        try {
            dismissTip();
            TextView tv = new TextView(ctx);
            tv.setText(text);
            tv.setTextColor(0xFFFFFFFF);
            tv.setTextSize(14f);
            tv.setGravity(Gravity.CENTER);
            int padH = (int) (16 * density), padV = (int) (9 * density);
            tv.setPadding(padH, padV, padH, padV);
            tv.setMaxWidth(ctx.getResources().getDisplayMetrics().widthPixels - (int) (24 * density));
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xE6222222);
            bg.setCornerRadius(24 * density);
            tv.setBackground(bg);

            WindowManager.LayoutParams p = new WindowManager.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                    2038 /* TYPE_APPLICATION_OVERLAY */,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                            | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                            | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
                    -3);
            p.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
            p.y = (int) (56 * density);
            wm.addView(tv, p);
            tipView = tv;
            handler.postDelayed(TIP_DISMISS, durationMs);
        } catch (Throwable t) {
            logEx("显示气泡失败", t);
        }
    }

    /** 屏幕顶部的"开关提示"；enabled=true 时额外带 5 个方向选择按钮。 */
    private static void showToggle(boolean enabled, int lang) {
        try {
            dismissTip();
            LinearLayout container = new LinearLayout(ctx);
            container.setOrientation(LinearLayout.VERTICAL);
            int pad = (int) (30 * density);
            container.setPadding(pad, pad, pad, pad);
            container.setBackgroundColor(0xFF222222);

            TextView msg = new TextView(ctx);
            msg.setText(enabled
                    ? pick(lang, "Key mouse ON", "Клавиатурная мышь включена", "キーマウス オン", "按键鼠标已开启")
                    : pick(lang, "Key mouse OFF", "Клавиатурная мышь выключена", "キーマウス オフ", "按键鼠标已关闭"));
            msg.setTextColor(0xFFFFFFFF);
            msg.setTextSize(14f);
            container.addView(msg);

            if (enabled) {
                TextView hint = new TextView(ctx);
                hint.setText(pick(lang, "Tap below to fix direction:", "Нажмите, чтобы задать направление:",
                        "下のボタンで向きを固定:", "方向不对可点下方手动选择："));
                hint.setTextColor(0xFFCCCCCC);
                hint.setTextSize(12f);
                hint.setPadding(0, (int) (12 * density), 0, 0);
                container.addView(hint);

                LinearLayout row1 = new LinearLayout(ctx);
                row1.setOrientation(LinearLayout.HORIZONTAL);
                container.addView(row1);
                LinearLayout row2 = new LinearLayout(ctx);
                row2.setOrientation(LinearLayout.HORIZONTAL);
                container.addView(row2);

                String rotFilePath = dir + "/keymouse_manual_rot.cfg";
                String[] labels = lang == 3
                        ? new String[] { "\u81ea\u52a8", "\u7ad6\u5c4f\u6b63", "\u7ad6\u5c4f\u5012", "\u6a2a\u5c4f\u6b63", "\u6a2a\u5c4f\u5012" }
                        : new String[] { "Auto", "Port", "Port180", "Land", "Land180" };
                int[] values = { -1, 0, 2, 1, 3 };
                addPickerButton(row1, labels[0], rotFilePath, values[0]);
                addPickerButton(row1, labels[1], rotFilePath, values[1]);
                addPickerButton(row1, labels[2], rotFilePath, values[2]);
                addPickerButton(row2, labels[3], rotFilePath, values[3]);
                addPickerButton(row2, labels[4], rotFilePath, values[4]);
            }

            WindowManager.LayoutParams p = new WindowManager.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                    2038 /* TYPE_APPLICATION_OVERLAY */,
                    enabled
                            ? (WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                                    | WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
                                    | WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE)
                            : (WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                                    | WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                                    | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN),
                    -3);
            p.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
            p.y = (int) (40 * density);
            wm.addView(container, p);
            tipView = container;
            // 关闭提示 3 秒后自动收起；开启+选择器给够时间点按钮，8 秒后兜底收起
            handler.postDelayed(TIP_DISMISS, enabled ? 8000 : 3000);
        } catch (Throwable t) {
            logEx("显示开关提示失败", t);
        }
    }

    private static void addPickerButton(LinearLayout row, String label, final String rotFilePath, final int value) {
        TextView btn = new TextView(ctx);
        btn.setText(label);
        btn.setTextColor(0xFFFFFFFF);
        btn.setTextSize(12f);
        int ph = (int) (20 * density), pv = (int) (10 * density);
        btn.setPadding(ph, pv, ph, pv);
        btn.setBackgroundColor(0xFF3A3A3A);
        LinearLayout.LayoutParams lpBtn = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lpBtn.setMargins((int) (4 * density), 0, (int) (4 * density), 0);
        btn.setLayoutParams(lpBtn);
        btn.setClickable(true);
        btn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                try {
                    FileOutputStream o = new FileOutputStream(rotFilePath);
                    o.write(String.valueOf(value).getBytes());
                    o.close();
                } catch (Throwable t) {
                    // 忽略
                }
                dismissTip();
            }
        });
        row.addView(btn);
    }

    public static void main(String[] args) {
        dir = args.length > 0 ? args[0] : "/data/local/tmp";
        posFile = new File(dir, "keymouse_pos");
        ptrFile = new File(dir, "keymouse_ptr");
        ptrTmp = new File(dir, "keymouse_ptr.tmp");
        aliveFile = new File(dir, "keymouse_dot_alive");
        tipReqFile = new File(dir, "keymouse_tip_req");
        // dir 是 .../files，shared_prefs 是它的同级目录
        File parent = new File(dir).getParentFile();
        langPrefFile = new File(parent != null ? parent : new File(dir), "shared_prefs/keymouse.xml");
        log("红点/弹窗助手启动");
        exemptHiddenApis();
        initTypefaces();
        Looper.prepareMainLooper();
        handler = new Handler(Looper.getMainLooper());
        setupDisplay();
        boolean mon = setupMonitor();
        overlayOk = setupOverlay();
        if (!mon && !overlayOk) {
            // 悬浮窗这里会自动重试(ensureOverlay)，只有连真实指针监视器都建不成
            // 才说明这个设备/这个 Android 版本完全不吃这套隐藏 API，退出让
            // 守护进程走老的 am broadcast 兜底，没必要空转。
            log("监视器建不成，且悬浮窗首次也失败，助手退出，守护进程会定期重启本助手重试");
            System.exit(3);
        }
        log("就绪: 真实指针=" + (mon ? "是" : "否") + " 悬浮窗=" + (overlayOk ? "是" : "否"));
        handler.post(TICK);
        Looper.loop();
    }
}
