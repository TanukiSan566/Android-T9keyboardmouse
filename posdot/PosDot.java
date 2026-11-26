package com.keymouse.tool;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.CornerPathEffect;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Shader;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import java.io.File;
import java.io.FileInputStream;
import java.util.Random;

/**
 * 鼠标指示层: 在屏幕上画"自绘光标"(黄→橙→红渐变的尖角箭头)和"红点"(滑动起点标记)，
 * 两者在同一个悬浮窗里、同一个缩放中心(=指针热点)，所以按压缩放时一起缩、一起弹回。
 *
 * 数据来源(都在 files/ 下):
 *  - keymouse_pos  守护进程写: "状态 x y 面板宽 面板高 按压状态 红点开关"
 *      按压状态 0=没按 1=中间键按着(没动) 2=按着并拖动；红点开关 1=画红点 0=不画。
 *      文件修改时间=最近一次操作时间，15 秒没动就用 0.7 秒淡出(跟系统指针空闲淡出同步)。
 *  - keymouse_ptr  root 助手写: "旋转 屏宽 屏高 真实x 真实y"，系统指针的真实坐标，新鲜(3 秒内)就优先用它。
 *  - keymouse_cursor     App 设置页写: 1/0 是否用自绘光标(没有这个文件=开)。
 *  - keymouse_cursor_ok  root 助手写: 1=它能把系统箭头藏起来。藏不了就不画自绘光标(否则会出现两个箭头)。
 *  - keymouse_cursor_beat  本类每 0.3 秒 touch 一次: 告诉 root 助手"我正在画光标，可以藏系统箭头"；
 *      本类停了/被冻结，超过 0.8 秒没 touch，助手就把系统箭头还回来，保证任何时候屏幕上都有一个箭头。
 */
public final class PosDot {
    private static final int POLL_MS = 33;
    private static final long FADE_MS = 15000L;
    private static final long FADE_ANIM_MS = 700L;
    private static final Tick TICK = new Tick();

    private static WindowManager sWm;
    private static Art sDot;
    private static WindowManager.LayoutParams sLp;
    private static Handler sHandler;
    private static File sFile;
    private static File sPtr;
    private static File sCursorCfg;
    private static File sCursorOk;
    private static File sBeat;
    private static int sWin;
    private static boolean sVisible;
    private static int sLastX = -99999;
    private static int sLastY = -99999;
    private static boolean sCursorOn = true;
    private static boolean sCursorHide = false;
    private static long sCfgAt = 0;
    private static long sOkAt = 0;
    private static long sBeatAt = 0;
    private static final byte[] BUF = new byte[64];

    private PosDot() {
    }

    public static void start(Context ctx) {
        if (sDot != null) return;
        try {
            Context app = ctx.getApplicationContext();
            if (app == null) app = ctx;
            WindowManager wm = (WindowManager) app.getSystemService("window");
            float density = app.getResources().getDisplayMetrics().density;
            File dir = app.getFilesDir();
            sFile = new File(dir, "keymouse_pos");
            sPtr = new File(dir, "keymouse_ptr");
            sCursorCfg = new File(dir, "keymouse_cursor");
            sCursorOk = new File(dir, "keymouse_cursor_ok");
            sBeat = new File(dir, "keymouse_cursor_beat");

            Art v = new Art(app, density);
            sWin = v.win;
            v.setVisibility(View.INVISIBLE);

            // 2038=TYPE_APPLICATION_OVERLAY; 0x318=NOT_FOCUSABLE|NOT_TOUCHABLE|LAYOUT_IN_SCREEN|LAYOUT_NO_LIMITS
            WindowManager.LayoutParams lp = new WindowManager.LayoutParams(sWin, sWin, 2038, 0x318, -3);
            lp.gravity = 0x33; // TOP|LEFT
            wm.addView(v, lp);

            sWm = wm;
            sDot = v;
            sLp = lp;
            sVisible = false;
            sLastX = -99999;
            sLastY = -99999;
            sCfgAt = 0;
            sOkAt = 0;
            sBeatAt = 0;
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

    private static String readFirstLine(File f) {
        try {
            FileInputStream in = new FileInputStream(f);
            int n = in.read(BUF);
            in.close();
            if (n <= 0) return null;
            return new String(BUF, 0, n).trim();
        } catch (Throwable t) {
            return null;
        }
    }

    /** 每隔一会儿重读两个小配置: 设置页的开关、root 助手的"能不能藏系统箭头"。 */
    private static void refreshCursorFlags(long nowMs) {
        if (nowMs - sCfgAt > 400) {
            sCfgAt = nowMs;
            String s = readFirstLine(sCursorCfg);
            sCursorOn = s == null || !s.startsWith("0");
        }
        if (nowMs - sOkAt > 1000) {
            sOkAt = nowMs;
            String s = readFirstLine(sCursorOk);
            sCursorHide = s != null && s.startsWith("1");
        }
    }

    static void tick() {
        if (sDot == null) return;
        long nowMs = System.currentTimeMillis();
        refreshCursorFlags(nowMs);
        boolean show = false;
        boolean dotOn = true;
        int px = 0, py = 0, pw = 0, ph = 0, press = 0;
        long age = nowMs - sFile.lastModified();
        try {
            if (age >= 0 && age <= FADE_MS) {
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
                        if (p.length >= 6) press = Integer.parseInt(p[5]);
                        if (p.length >= 7) dotOn = !"0".equals(p[6]);
                        show = pw > 1 && ph > 1;
                    }
                }
            }
        } catch (Throwable t) {
            show = false;
        }
        boolean wantCursor = show && sCursorOn && sCursorHide;
        boolean wantDot = show && dotOn;
        boolean visible = wantCursor || wantDot;

        try {
            if (visible) {
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
                int cx = (int) (sx * real.x);
                int cy = (int) (sy * real.y);
                // 优先用 root 助手读到的系统指针真实坐标(跟系统箭头天然是同一个点)；没有/过期就用上面守护进程的估算
                long pa = nowMs - sPtr.lastModified();
                if (pa >= 0 && pa <= 3000L) {
                    String s = readFirstLine(sPtr);
                    if (s != null && s.length() > 10) {
                        String[] q = s.split(" +");
                        if (q.length >= 5 && Integer.parseInt(q[0]) == rot) {
                            cx = (int) Float.parseFloat(q[3]);
                            cy = (int) Float.parseFloat(q[4]);
                        }
                    }
                }
                int x = cx - sWin / 2;
                int y = cy - sWin / 2;
                // 空闲 15 秒后用 0.7 秒淡出(跟系统指针同步)，任何操作立刻恢复
                float alpha = age > FADE_MS - FADE_ANIM_MS
                        ? Math.max(0f, (FADE_MS - age) / (float) FADE_ANIM_MS) : 1f;
                sDot.setAlpha(alpha);
                sDot.configure(wantCursor, wantDot);
                sDot.setPress(press);
                if (x != sLastX || y != sLastY) {
                    sLp.x = x;
                    sLp.y = y;
                    sWm.updateViewLayout(sDot, sLp);
                    sLastX = x;
                    sLastY = y;
                }
                // 心跳: 告诉 root 助手"光标正画着，可以藏系统箭头"
                if (wantCursor && alpha > 0.05f && nowMs - sBeatAt > 300) {
                    sBeatAt = nowMs;
                    touchBeat();
                }
            } else {
                sDot.reset();
            }
            if (visible != sVisible) {
                sDot.setVisibility(visible ? View.VISIBLE : View.INVISIBLE);
                sVisible = visible;
            }
        } catch (Throwable t) {
            // 忽略，下一轮再试
        }
        if (sHandler != null && sDot != null) sHandler.postDelayed(TICK, POLL_MS);
    }

    private static void touchBeat() {
        try {
            if (!sBeat.exists()) {
                java.io.FileOutputStream o = new java.io.FileOutputStream(sBeat);
                o.write('1');
                o.close();
                sBeat.setReadable(true, false);
            }
            sBeat.setLastModified(System.currentTimeMillis());
        } catch (Throwable t) {
            // 忽略
        }
    }

    private static float clamp01(float v) {
        return v < 0f ? 0f : (v > 1f ? 1f : v);
    }

    static final class Tick implements Runnable {
        public void run() {
            PosDot.tick();
        }
    }

    /**
     * 悬浮窗里的内容: 自绘光标 + 红点。窗口是正方形，中心就是指针位置(热点)，
     * 缩放以中心为轴，所以箭头尖端和红点圆心都原地不动，只是整体变小/变大。
     *
     * 按压动画(时间都很短，跟手):
     *   按下(没动)  -> 缩到 50%
     *   按着并拖动  -> 缩到 40%，拖动期间保持
     *   松开        -> 先弹到 120%，再回到 100%
     */
    static final class Art extends View {
        // 箭头外形，单位坐标(0~1，原点=尖端，y 向下)，乘以箭头高度得到像素
        private static final float[] SHAPE = { 0f, 0f, 0.72f, 0.78f, 0.30f, 0.72f, 0.12f, 1.0f };
        final int win;
        private final float cursorH;
        private final float pad;
        private final float dotR;
        private final Bitmap bmp;
        private final Paint bmpPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final Paint dotFill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint dotEdge = new Paint(Paint.ANTI_ALIAS_FLAG);
        private boolean drawCursor = true;
        private boolean drawDot = true;
        private int press = 0;
        private float scale = 1f;
        private float segFrom = 1f;
        private float segTo = 1f;
        private long segStart = 0;
        private long segDur = 1;
        private float nextTo = -1f;
        private long nextDur = 0;

        Art(Context c, float density) {
            super(c);
            cursorH = 24f * density;
            pad = 4f * density;
            dotR = Math.max(5f, 6f * density);
            // 缩放时最大 1.25 倍，箭头往右下伸 cursorH*1.25，窗口留够，免得被窗口边界裁掉
            win = (int) Math.ceil((cursorH * 1.25f + pad) * 2f);
            dotFill.setStyle(Paint.Style.FILL);
            dotFill.setColor(0xFFFF0000);
            dotEdge.setStyle(Paint.Style.STROKE);
            dotEdge.setColor(0xFFFFFFFF);
            dotEdge.setStrokeWidth(Math.max(1f, density));
            bmp = makeCursor(cursorH, pad, density);
        }

        void configure(boolean cursor, boolean dot) {
            if (cursor != drawCursor || dot != drawDot) {
                drawCursor = cursor;
                drawDot = dot;
                invalidate();
            }
        }

        void setPress(int state) {
            if (state == press) return;
            int old = press;
            press = state;
            long now = SystemClock.uptimeMillis();
            float cur = currentScale(now);
            segFrom = cur;
            segStart = now;
            if (state == 0) {
                if (old == 0) return;
                segTo = 1.2f;
                segDur = 90;
                nextTo = 1f;
                nextDur = 110;
            } else {
                segTo = state == 2 ? 0.4f : 0.5f;
                segDur = state == 2 ? 140 : 70;
                nextTo = -1f;
            }
            postInvalidateOnAnimation();
        }

        private float currentScale(long now) {
            float t = segDur <= 0 ? 1f : (now - segStart) / (float) segDur;
            if (t >= 1f) {
                if (nextTo < 0f) {
                    scale = segTo;
                    return scale;
                }
                // 接着走第二段(松开时: 弹大之后回到 100%)
                segFrom = segTo;
                segTo = nextTo;
                segDur = nextDur;
                segStart = now;
                nextTo = -1f;
                t = 0f;
            }
            float e = 1f - (1f - t) * (1f - t);   // 先快后慢
            scale = segFrom + (segTo - segFrom) * e;
            return scale;
        }

        /** 光标收起时直接复位，下次出现不会带着残留的缩放动画。 */
        void reset() {
            press = 0;
            scale = 1f;
            segFrom = 1f;
            segTo = 1f;
            segDur = 1;
            nextTo = -1f;
        }

        @Override
        protected void onDraw(Canvas c) {
            long now = SystemClock.uptimeMillis();
            float s = currentScale(now);
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            c.save();
            c.scale(s, s, cx, cy);
            if (drawCursor) {
                c.drawBitmap(bmp, cx - pad, cy - pad, bmpPaint);
            }
            if (drawDot) {
                c.drawCircle(cx, cy, dotR, dotFill);
                c.drawCircle(cx, cy, dotR, dotEdge);
            }
            c.restore();
            if (s != segTo || nextTo >= 0f) postInvalidateOnAnimation();
        }

        /** 预先画好光标位图: 黄→橙→红渐变 + 少量颗粒 + 白色细边 + 柔和阴影。热点(尖端)在位图的 (pad, pad)。 */
        private static Bitmap makeCursor(float h, float pad, float density) {
            float w = h * 0.72f;
            int bw = (int) Math.ceil(w + pad * 2f);
            int bh = (int) Math.ceil(h + pad * 2f);
            // 2 倍分辨率画，再缩小，边缘更顺滑
            int k = 2;
            Bitmap big = Bitmap.createBitmap(bw * k, bh * k, Bitmap.Config.ARGB_8888);
            Canvas c = new Canvas(big);
            c.scale(k, k);
            Path p = new Path();
            for (int i = 0; i < SHAPE.length; i += 2) {
                float x = pad + SHAPE[i] * h;
                float y = pad + SHAPE[i + 1] * h;
                if (i == 0) p.moveTo(x, y); else p.lineTo(x, y);
            }
            p.close();

            // 阴影: 同样的形状向右下偏一点、半透明
            Paint sh = new Paint(Paint.ANTI_ALIAS_FLAG);
            sh.setStyle(Paint.Style.FILL);
            sh.setColor(0x55000000);
            sh.setPathEffect(new CornerPathEffect(1.2f * density));
            c.save();
            c.translate(1.2f * density, 1.8f * density);
            c.drawPath(p, sh);
            c.restore();

            // 渐变: 沿 尖端->红色端 的方向
            Paint f = new Paint(Paint.ANTI_ALIAS_FLAG);
            f.setStyle(Paint.Style.FILL);
            f.setPathEffect(new CornerPathEffect(1.2f * density));
            f.setShader(new LinearGradient(pad, pad + h * 0.05f, pad + w, pad + h * 0.85f,
                    new int[] { 0xFFFFD21F, 0xFFFF9A1A, 0xFFF2381E },
                    new float[] { 0f, 0.5f, 1f }, Shader.TileMode.CLAMP));
            c.drawPath(p, f);

            // 颗粒: 参考图里橙红过渡处有一点点斑驳，固定随机种子，每次画出来一样
            c.save();
            c.clipPath(p);
            Random r = new Random(7);
            Paint g = new Paint(Paint.ANTI_ALIAS_FLAG);
            g.setStyle(Paint.Style.FILL);
            for (int i = 0; i < 70; i++) {
                float x = pad + w * (0.35f + 0.6f * r.nextFloat());
                float y = pad + h * (0.25f + 0.65f * r.nextFloat());
                g.setColor(Color.argb(60 + r.nextInt(60), 240, 56, 30));
                c.drawCircle(x, y, (0.3f + 0.5f * r.nextFloat()) * density, g);
            }
            c.restore();

            // 白色细边，深浅背景上都看得清
            Paint e = new Paint(Paint.ANTI_ALIAS_FLAG);
            e.setStyle(Paint.Style.STROKE);
            e.setStrokeJoin(Paint.Join.ROUND);
            e.setStrokeWidth(Math.max(1f, 1.1f * density));
            e.setColor(0xFFFFFFFF);
            e.setPathEffect(new CornerPathEffect(1.2f * density));
            c.drawPath(p, e);

            Bitmap out = Bitmap.createScaledBitmap(big, bw, bh, true);
            if (out != big) big.recycle();
            return out;
        }
    }
}
