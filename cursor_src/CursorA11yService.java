package com.keymouse.tool;

import android.accessibilityservice.AccessibilityService;
import android.graphics.Rect;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityWindowInfo;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * 只做一件事: 查"屏幕上某个点下面的控件是可点击还是文字"，给自绘光标选手型/I 型。
 * 不读取、不保存任何内容(日志里只记类名和文字长度)，也不模拟点击。由 root 守护进程写系统设置自动启用。
 *
 * v71 判断规则(从指针处的最深控件往上看):
 *  1) 输入框(可编辑 / EditText)，向上最多 3 层             -> I 型
 *  2) 可点击控件(isClickable / 有点击动作 / 按钮类)，向上最多 6 层，
 *     但不越过 WebView，也不算铺满屏幕 60% 以上的容器       -> 手型
 *  3) 最深控件自己有文字，且(可选择文字 或 在网页里)         -> I 型
 *  4) 其余(空白、图片、普通标签)                            -> 箭头
 * 返回 {类型, 左, 上, 右, 下}: 后面四个是"决定类型的控件"的屏幕范围，指针走出去就立刻回箭头。
 */
public class CursorA11yService extends AccessibilityService {
    private static final long BUDGET_NS = 220L * 1000000L;
    private static final int MAX_NODES = 1000;
    private static final int ACTION_CLICK = 16;

    private String mLastSig = "";
    private long mLogAt = 0;
    private int mLogBurst = 0;

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        CursorHit.svc = this;
        dlog("无障碍服务已连接");
    }

    @Override
    public boolean onUnbind(android.content.Intent intent) {
        if (CursorHit.svc == this) {
            CursorHit.svc = null;
        }
        CursorHit.reset();
        dlog("无障碍服务已断开");
        return super.onUnbind(intent);
    }

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
    }

    @Override
    public void onInterrupt() {
    }

    /** 在后台线程被调用。返回 {类型, 左, 上, 右, 下}。 */
    int[] probe(int x, int y) {
        long t0 = System.nanoTime();
        DisplayMetrics dm = getResources().getDisplayMetrics();
        long area = (long) dm.widthPixels * dm.heightPixels;
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
            ArrayList<AccessibilityNodeInfo> path = new ArrayList<AccessibilityNodeInfo>();
            path.add(root);
            int[] budget = { MAX_NODES };
            descend(root, x, y, budget, t0, path, isWebView(root));
            int[] res = classify(path, area);
            logProbe(x, y, path, res, (System.nanoTime() - t0) / 1000000L, MAX_NODES - budget[0], String.valueOf(root.getPackageName()));
            return res;     // 最上层有内容的窗口说了算
        }
        return new int[] { CursorHit.ARROW, x, y, x + 1, y + 1 };
    }

    private void descend(AccessibilityNodeInfo n, int x, int y, int[] budget, long t0,
            ArrayList<AccessibilityNodeInfo> path, boolean web) {
        Rect r = new Rect();
        for (int i = n.getChildCount() - 1; i >= 0; i--) {
            if (budget[0] <= 0 || System.nanoTime() - t0 > BUDGET_NS) {
                return;
            }
            budget[0]--;
            AccessibilityNodeInfo c = n.getChild(i);
            if (c == null) {
                continue;
            }
            c.getBoundsInScreen(r);
            if (!r.contains(x, y)) {
                continue;
            }
            boolean web2 = web || isWebView(c);
            // 网页里的节点常常报告"不可见"，所以网页内部不看可见性，其余地方不可见的跳过
            if (!web2 && !c.isVisibleToUser()) {
                continue;
            }
            path.add(c);
            descend(c, x, y, budget, t0, path, web2);
            return;
        }
    }

    private static boolean isWebView(AccessibilityNodeInfo n) {
        try {
            CharSequence cn = n.getClassName();
            return cn != null && cn.toString().contains("WebView");
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean isEditable(AccessibilityNodeInfo n) {
        try {
            if (n.isEditable()) {
                return true;
            }
            CharSequence cn = n.getClassName();
            return cn != null && cn.toString().contains("EditText");
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean looksClickable(AccessibilityNodeInfo n) {
        try {
            if (n.isClickable()) {
                return true;
            }
            List<AccessibilityNodeInfo.AccessibilityAction> acts = n.getActionList();
            if (acts != null) {
                for (int i = 0; i < acts.size(); i++) {
                    if (acts.get(i).getId() == ACTION_CLICK) {
                        return true;
                    }
                }
            }
            CharSequence cn = n.getClassName();
            if (cn != null) {
                String s = cn.toString();
                if (s.endsWith("Button") || s.endsWith("CheckBox") || s.endsWith("Switch")
                        || s.endsWith("RadioButton") || s.endsWith("Spinner")) {
                    return true;
                }
            }
        } catch (Throwable t) {
            // 忽略
        }
        return false;
    }

    private static boolean hasText(AccessibilityNodeInfo n) {
        try {
            CharSequence t = n.getText();
            return t != null && t.length() > 0;
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean selectable(AccessibilityNodeInfo n) {
        try {
            return Build.VERSION.SDK_INT >= 33 && n.isTextSelectable();
        } catch (Throwable t) {
            return false;
        }
    }

    private int[] pack(int type, AccessibilityNodeInfo n) {
        Rect r = new Rect();
        n.getBoundsInScreen(r);
        return new int[] { type, r.left, r.top, r.right, r.bottom };
    }

    private int[] classify(ArrayList<AccessibilityNodeInfo> path, long screenArea) {
        int last = path.size() - 1;
        AccessibilityNodeInfo deepest = path.get(last);
        Rect r = new Rect();
        // 1) 输入框
        for (int i = last; i >= 0 && i >= last - 3; i--) {
            AccessibilityNodeInfo n = path.get(i);
            if (isEditable(n)) {
                mWhy = "edit@" + (last - i);
                return pack(CursorHit.IBEAM, n);
            }
        }
        // 2) 可点击(不越过 WebView)
        for (int i = last; i >= 0 && i >= last - 6; i--) {
            AccessibilityNodeInfo n = path.get(i);
            if (i < last && isWebView(n)) {
                break;
            }
            if (looksClickable(n)) {
                n.getBoundsInScreen(r);
                long a = (long) Math.max(0, r.width()) * Math.max(0, r.height());
                if (a < screenArea * 6 / 10) {
                    mWhy = "click@" + (last - i);
                    return pack(CursorHit.HAND, n);
                }
            }
        }
        // 3) 文字: 最深控件自己有文字，且可选择或在网页里
        if (hasText(deepest)) {
            boolean web = false;
            for (int i = last; i >= 0; i--) {
                if (isWebView(path.get(i))) {
                    web = true;
                    break;
                }
            }
            if (selectable(deepest) || web) {
                mWhy = selectable(deepest) ? "text-sel" : "text-web";
                return pack(CursorHit.IBEAM, deepest);
            }
        }
        mWhy = "plain";
        return pack(CursorHit.ARROW, deepest);
    }

    private String mWhy = "";

    // ------------------------------------------------------------ 诊断日志
    // 追加到守护进程的 keymouse.log(开着"Bug 日志记录"时会同步进 /sdcard/keymousedebug/ 的 txt)。
    // 只在"判定结果变了"时记一行，每秒最多几行；不记任何文字内容。

    private void logProbe(int x, int y, ArrayList<AccessibilityNodeInfo> path, int[] res, long ms, int nodes, String pkg) {
        try {
            AccessibilityNodeInfo d = path.get(path.size() - 1);
            String cls = String.valueOf(d.getClassName());
            int dot = cls.lastIndexOf('.');
            if (dot >= 0) {
                cls = cls.substring(dot + 1);
            }
            String sig = res[0] + "|" + mWhy + "|" + cls + "|" + pkg;
            if (sig.equals(mLastSig)) {
                return;
            }
            mLastSig = sig;
            String tn = res[0] == CursorHit.HAND ? "手型" : res[0] == CursorHit.IBEAM ? "I型" : "箭头";
            dlog("判定 " + tn + " 原因=" + mWhy + " 点=(" + x + "," + y + ") 控件=" + cls
                    + " 点击=" + d.isClickable() + " 文字长度=" + (d.getText() == null ? 0 : d.getText().length())
                    + " 层数=" + path.size() + " 范围=[" + res[1] + "," + res[2] + "," + res[3] + "," + res[4] + "]"
                    + " 耗时=" + ms + "ms 访问节点=" + nodes + " 包=" + pkg);
        } catch (Throwable t) {
            // 忽略
        }
    }

    private void dlog(String msg) {
        try {
            long now = System.currentTimeMillis();
            if (now - mLogAt > 1000) {
                mLogAt = now;
                mLogBurst = 0;
            }
            if (++mLogBurst > 6) {
                return;
            }
            File f = new File(getFilesDir(), "keymouse.log");
            if (!f.exists()) {
                return;
            }
            java.util.Calendar c = java.util.Calendar.getInstance();
            String line = String.format("[%02d:%02d:%02d] [hit] %s\n", c.get(java.util.Calendar.HOUR_OF_DAY),
                    c.get(java.util.Calendar.MINUTE), c.get(java.util.Calendar.SECOND), msg);
            FileOutputStream o = new FileOutputStream(f, true);
            try {
                o.write(line.getBytes("UTF-8"));
            } finally {
                o.close();
            }
        } catch (Throwable t) {
            // 忽略
        }
    }
}
