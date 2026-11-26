package com.keymouse.tool;

import android.os.Handler;
import android.os.HandlerThread;

/**
 * 指针下面是什么: 0=普通(箭头) 1=可点击(手型) 2=文字(I 型)。
 * 由无障碍服务(CursorA11yService)去查界面，查询放在后台线程，PosDot 每 33ms 来取一次结果。
 * 指针停下约 0.11 秒才发起查询(查界面有点耗时)，所以手型/I 型会比箭头慢一拍出现。
 */
final class CursorHit {
    static final int ARROW = 0;
    static final int HAND = 1;
    static final int IBEAM = 2;

    static volatile CursorA11yService svc;

    private static int lastX = -99999;
    private static int lastY = -99999;
    private static long movedAt = 0;
    private static boolean pending = false;
    private static volatile boolean busy = false;
    private static volatile int resType = ARROW;
    private static volatile int resX = -99999;
    private static volatile int resY = -99999;
    private static volatile long resAt = 0;
    private static Handler worker;

    private CursorHit() {
    }

    static boolean available() {
        return svc != null;
    }

    /** 主线程每帧调用，(x,y) 是指针的屏幕坐标。返回当前应显示的类型。 */
    static int poll(int x, int y, long now) {
        if (svc == null) {
            return ARROW;
        }
        if (Math.abs(x - lastX) > 3 || Math.abs(y - lastY) > 3) {
            lastX = x;
            lastY = y;
            movedAt = now;
            pending = true;
        } else if (!busy && (pending ? now - movedAt >= 110 : now - resAt >= 1500)) {
            pending = false;
            startQuery(x, y);
        }
        if (Math.abs(x - resX) <= 28 && Math.abs(y - resY) <= 28) {
            return resType;
        }
        return ARROW;
    }

    private static void startQuery(final int x, final int y) {
        if (worker == null) {
            HandlerThread t = new HandlerThread("km-hit");
            t.start();
            worker = new Handler(t.getLooper());
        }
        busy = true;
        worker.post(new Runnable() {
            public void run() {
                int r = ARROW;
                try {
                    CursorA11yService s = svc;
                    if (s != null) {
                        r = s.probe(x, y);
                    }
                } catch (Throwable t) {
                    r = ARROW;
                }
                resType = r;
                resX = x;
                resY = y;
                resAt = System.currentTimeMillis();
                busy = false;
            }
        });
    }

    static void reset() {
        resType = ARROW;
        resX = -99999;
        resY = -99999;
    }
}
