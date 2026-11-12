package com.keymouse.tool;

import android.content.Context;
import android.graphics.Point;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import java.io.File;
import java.io.FileInputStream;

/**
 * 滑动起点红点: 在屏幕上用一个红点标出 swipe 翻页(2/4/6/8)实际起手的位置，
 * 不用再猜"滑动中心点在哪"。
 *
 * 数据来自守护进程写的 files/keymouse_pos ("状态 x y 面板宽 面板高")。
 * x/y 是触摸屏原始坐标(竖屏默认方向)，这里按屏幕当前旋转换算成屏幕坐标，
 * 换算方式和系统对触摸屏坐标做的一样，所以红点就是触摸手势真正落下的位置。
 * 红点只在鼠标模式开着、且最近 15 秒内有过操作时显示(跟安卓光标空闲后淡出同步)，
 * 鼠标模式关闭/暂停(守护进程写状态 0 + 发 dot_off 广播)时立刻收起并停止轮询。
 */
public final class PosDot {
    private static final int POLL_MS = 33;
    private static final long FADE_MS = 15000L;   // 和系统光标空闲淡出同步(约15秒，未实测)
    private static final long FADE_ANIM_MS = 700L;
    private static final Tick TICK = new Tick();

    private static WindowManager sWm;
    private static View sDot;
    private static WindowManager.LayoutParams sLp;
    private static Handler sHandler;
    private static File sFile;
    private static File sAlive;
    private static File sPtr;
    private static int sSize;
    private static boolean sVisible;
    private static int sLastX = -99999;
    private static int sLastY = -99999;
    private static final byte[] BUF = new byte[48];

    private PosDot() {
    }

    public static void start(Context ctx) {
        if (sDot != null) return;
        try {
            Context app = ctx.getApplicationContext();
            if (app == null) app = ctx;
            WindowManager wm = (WindowManager) app.getSystemService("window");
            float density = app.getResources().getDisplayMetrics().density;
            sSize = Math.max(10, (int) (12 * density));
            sFile = new File(app.getFilesDir(), "keymouse_pos");
            sAlive = new File(app.getFilesDir(), "keymouse_dot_alive");
            sPtr = new File(app.getFilesDir(), "keymouse_ptr");

            GradientDrawable g = new GradientDrawable();
            g.setShape(GradientDrawable.OVAL);
            g.setColor(0xFFFF0000);
            g.setStroke(Math.max(1, (int) density), 0xFFFFFFFF);
            View v = new View(app);
            v.setBackground(g);
            v.setVisibility(View.INVISIBLE);

            // 2038=TYPE_APPLICATION_OVERLAY; 0x318=NOT_FOCUSABLE|NOT_TOUCHABLE|LAYOUT_IN_SCREEN|LAYOUT_NO_LIMITS
            WindowManager.LayoutParams lp = new WindowManager.LayoutParams(sSize, sSize, 2038, 0x318, -3);
            lp.gravity = 0x33; // TOP|LEFT
            wm.addView(v, lp);

            sWm = wm;
            sDot = v;
            sLp = lp;
            sVisible = false;
            sLastX = -99999;
            sLastY = -99999;
            if (sHandler == null) sHandler = new Handler(Looper.getMainLooper());
            sHandler.removeCallbacks(TICK);
            sHandler.post(TICK);
        } catch (Throwable t) {
            sDot = null;
        }
    }

    public static void stop() {
        try {
            if (sHandler != null) sHandler.removeCallbacks(TICK);
            if (sDot != null && sWm != null) sWm.removeView(sDot);
        } catch (Throwable t) {
            // 忽略
        }
        sDot = null;
        sVisible = false;
    }

    static void tick() {
        if (sDot == null) return;
        boolean helperOwns = false;
        boolean show = false;
        int px = 0, py = 0, pw = 0, ph = 0;
        try {
            long age = System.currentTimeMillis() - sFile.lastModified();
            if (!helperOwns && age >= 0 && age <= FADE_MS) {
                FileInputStream in = new FileInputStream(sFile);
                int n = in.read(BUF);
                in.close();
                if (n >= 24) {
                    String[] p = new String(BUF, 0, n).trim().split(" +");
                    if (p.length >= 5 && "1".equals(p[0])) {
                        px = Integer.parseInt(p[1]);
                        py = Integer.parseInt(p[2]);
                        pw = Integer.parseInt(p[3]);
                        ph = Integer.parseInt(p[4]);
                        show = pw > 1 && ph > 1;
                    }
                }
            }
        } catch (Throwable t) {
            show = false;
        }

        try {
            if (show) {
                Display d = sWm.getDefaultDisplay();
                Point real = new Point();
                d.getRealSize(real);
                int rot = d.getRotation();
                float fx = clamp01(px / (float) (pw - 1));
                float fy = clamp01(py / (float) (ph - 1));
                float sx, sy;
                // 与系统对触摸屏坐标按屏幕方向做的换算一致
                if (rot == 1) {
                    sx = fy; sy = 1f - fx;
                } else if (rot == 2) {
                    sx = 1f - fx; sy = 1f - fy;
                } else if (rot == 3) {
                    sx = 1f - fy; sy = fx;
                } else {
                    sx = fx; sy = fy;
                }
                int x = (int) (sx * real.x) - sSize / 2;
                int y = (int) (sy * real.y) - sSize / 2;
                // 助手读到的真实鼠标指针(显示器当前方向坐标)，格式 "rot dw dh x y"
                try {
                    long pa = System.currentTimeMillis() - sPtr.lastModified();
                    if (pa >= 0 && pa <= 3000L) {
                        FileInputStream pi = new FileInputStream(sPtr);
                        int pn = pi.read(BUF);
                        pi.close();
                        if (pn > 10) {
                            String[] q = new String(BUF, 0, pn).trim().split(" +");
                            if (q.length >= 5 && Integer.parseInt(q[0]) == rot) {
                                x = (int) Float.parseFloat(q[3]) - sSize / 2;
                                y = (int) Float.parseFloat(q[4]) - sSize / 2;
                            }
                        }
                    }
                } catch (Throwable t) {
                    // 退回估算坐标
                }
                long idle = System.currentTimeMillis() - sFile.lastModified();
                float alpha = 1f;
                if (idle > FADE_MS - FADE_ANIM_MS) alpha = Math.max(0f, (FADE_MS - idle) / (float) FADE_ANIM_MS);
                sDot.setAlpha(alpha);
                if (x != sLastX || y != sLastY) {
                    sLp.x = x;
                    sLp.y = y;
                    sWm.updateViewLayout(sDot, sLp);
                    sLastX = x;
                    sLastY = y;
                }
            }
            if (show != sVisible) {
                sDot.setVisibility(show ? View.VISIBLE : View.INVISIBLE);
                sVisible = show;
            }
        } catch (Throwable t) {
            // 忽略，下一轮再试
        }
        if (sHandler != null && sDot != null) sHandler.postDelayed(TICK, POLL_MS);
    }

    private static float clamp01(float v) {
        return v < 0f ? 0f : (v > 1f ? 1f : v);
    }

    static final class Tick implements Runnable {
        public void run() {
            PosDot.tick();
        }
    }
}
