package com.keymouse.tool;

import android.accessibilityservice.AccessibilityService;
import android.graphics.Rect;
import android.os.Build;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * 只做一件事: 查"屏幕上某个点下面的控件是可点击的还是文字"，给自绘光标选手型/I 型。
 * 不读取、不保存任何内容，也不模拟点击。由 root 守护进程写系统设置自动启用。
 */
public class CursorA11yService extends AccessibilityService {
    private static final long BUDGET_NS = 140L * 1000000L;

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        CursorHit.svc = this;
    }

    @Override
    public boolean onUnbind(android.content.Intent intent) {
        if (CursorHit.svc == this) {
            CursorHit.svc = null;
        }
        CursorHit.reset();
        return super.onUnbind(intent);
    }

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
    }

    @Override
    public void onInterrupt() {
    }

    /** 在后台线程被调用。返回 CursorHit.ARROW/HAND/IBEAM。 */
    int probe(int x, int y) {
        long t0 = System.nanoTime();
        int sw = getResources().getDisplayMetrics().widthPixels;
        int sh = getResources().getDisplayMetrics().heightPixels;
        long area = (long) sw * sh;
        List<AccessibilityWindowInfo> ws = null;
        try {
            ws = getWindows();
        } catch (Throwable t) {
            ws = null;
        }
        ArrayList<AccessibilityNodeInfo> roots = new ArrayList<AccessibilityNodeInfo>();
        if (ws != null && !ws.isEmpty()) {
            ArrayList<AccessibilityWindowInfo> sorted = new ArrayList<AccessibilityWindowInfo>(ws);
            Collections.sort(sorted, new Comparator<AccessibilityWindowInfo>() {
                public int compare(AccessibilityWindowInfo a, AccessibilityWindowInfo b) {
                    return b.getLayer() - a.getLayer();   // 上层在前
                }
            });
            Rect wr = new Rect();
            for (AccessibilityWindowInfo w : sorted) {
                w.getBoundsInScreen(wr);
                if (!wr.contains(x, y)) {
                    continue;
                }
                AccessibilityNodeInfo r = w.getRoot();
                if (r != null) {
                    roots.add(r);
                }
            }
        }
        if (roots.isEmpty()) {
            AccessibilityNodeInfo r = getRootInActiveWindow();
            if (r != null) {
                roots.add(r);
            }
        }
        Rect r = new Rect();
        for (AccessibilityNodeInfo root : roots) {
            if (System.nanoTime() - t0 > BUDGET_NS) {
                break;
            }
            // 自己的悬浮窗(光标本体)没有子节点，跳过；自己的设置页有子节点，正常判断
            if (getPackageName().equals(String.valueOf(root.getPackageName())) && root.getChildCount() == 0) {
                continue;
            }
            root.getBoundsInScreen(r);
            if (!r.contains(x, y)) {
                continue;
            }
            int[] budget = { 700 };
            AccessibilityNodeInfo hit = deepest(root, x, y, budget, t0);
            int type = classify(hit, area);
            return type;     // 最上层有内容的窗口说了算
        }
        return CursorHit.ARROW;
    }

    private AccessibilityNodeInfo deepest(AccessibilityNodeInfo n, int x, int y, int[] budget, long t0) {
        Rect r = new Rect();
        for (int i = n.getChildCount() - 1; i >= 0; i--) {
            if (budget[0] <= 0 || System.nanoTime() - t0 > BUDGET_NS) {
                break;
            }
            budget[0]--;
            AccessibilityNodeInfo c = n.getChild(i);
            if (c == null || !c.isVisibleToUser()) {
                continue;
            }
            c.getBoundsInScreen(r);
            if (r.contains(x, y)) {
                return deepest(c, x, y, budget, t0);
            }
        }
        return n;
    }

    private static boolean isText(AccessibilityNodeInfo n) {
        try {
            if (n.isEditable()) {
                return true;
            }
            CharSequence cn = n.getClassName();
            if (cn != null && cn.toString().contains("EditText")) {
                return true;
            }
            if (Build.VERSION.SDK_INT >= 33 && n.isTextSelectable()) {
                return true;
            }
        } catch (Throwable t) {
            // 忽略
        }
        return false;
    }

    private int classify(AccessibilityNodeInfo n, long screenArea) {
        Rect r = new Rect();
        AccessibilityNodeInfo cur = n;
        for (int i = 0; i < 8 && cur != null; i++) {
            if (isText(cur)) {
                return CursorHit.IBEAM;
            }
            if (cur.isClickable()) {
                cur.getBoundsInScreen(r);
                long a = (long) Math.max(0, r.width()) * Math.max(0, r.height());
                if (a < screenArea * 6 / 10) {      // 几乎铺满全屏的\"可点击\"容器不算
                    return CursorHit.HAND;
                }
            }
            cur = cur.getParent();
        }
        return CursorHit.ARROW;
    }
}
