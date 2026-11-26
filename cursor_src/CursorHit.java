package com.keymouse.tool;

import android.os.Handler;
import android.os.HandlerThread;

/**
 * 指针下面是什么: 0=普通(箭头) 1=可点击(手型) 2=文字(I 型)。
 * 由无障碍服务(CursorA11yService)去查界面，查询放在后台线程，PosDot 每 33ms 来取一次结果。
 *
 * v71 的判断方式:
 *  - 每次查询除了类型，还带回"决定这个类型的那个控件的屏幕范围"。
 *  - 指针还在这个范围里 -> 保持手型/I 型；一走出范围 -> 立刻回箭头(不用等下一次查询)，
 *    所以"离开文字马上变常规"。
 *  - 移动过程中也每 70ms 查一次(不再等指针停下)，进入新控件时更早变手型/I 型。
 *  - 指针停下约 90ms 再补查一次；静止时周期复查(页面滚动、弹窗出现后能纠正)。
 */
final class CursorHit {
    static final int ARROW = 0;
    static final int HAND = 1;
    static final int IBEAM = 2;

    static volatile CursorA11yService svc;

    private static int lastX = -99999;
    private static int lastY = -99999;
    private static long movedAt = 0;
    private static long lastStart = 0;
    private static boolean pending = false;
    private static volatile boolean busy = false;
    private static volatile int[] res = new int[] { ARROW, 0, 0, 0, 0 };   // 类型, 左, 上, 右, 下
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
        boolean moved = Math.abs(x - lastX) > 2 || Math.abs(y - lastY) > 2;
        if (moved) {
            lastX = x;
            lastY = y;
            movedAt = now;
            pending = true;
        }
        if (!busy) {
            boolean due;
            if (moved) {
                due = now - lastStart >= 70;
            } else if (pending) {
                due = now - movedAt >= 90;
            } else {
                due = now - resAt >= (res[0] == ARROW ? 1200 : 450);
            }
            if (due) {
                pending = false;
                lastStart = now;
                startQuery(x, y);
            }
        }
        int[] r = res;
        if (r[0] != ARROW && x >= r[1] && x < r[3] && y >= r[2] && y < r[4]) {
            return r[0];
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
                int[] r = null;
                try {
                    CursorA11yService s = svc;
                    if (s != null) {
                        r = s.probe(x, y);
                    }
                } catch (Throwable t) {
                    r = null;
                }
                if (r == null) {
                    r = new int[] { ARROW, 0, 0, 0, 0 };
                }
                res = r;
                resAt = System.currentTimeMillis();
                busy = false;
            }
        });
    }

    static void reset() {
        res = new int[] { ARROW, 0, 0, 0, 0 };
    }
}
