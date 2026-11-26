package com.keymouse.tool;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * 主界面"鼠标开关"区(取代原来的 SoftSwitch + ExtraSwitches):
 *  - 鼠标软开关(立即开/关鼠标模式)
 *  - 开关键: 1~4 个键组合，只有一个"设置开关键"按钮——点它之后同时按住想用的键再松开，一次学完；
 *    不再有"第二开关键/第三开关键"这类单独的设置
 *  - 显示红点标记
 *  - 锁屏界面是否启用鼠标
 * 与守护进程的通信: 写 files/keymouse_cmd(守护进程用 inotify 监听) + 备用的 SIGUSR1。
 */
public final class ToggleKeys {
    private ToggleKeys() {
    }

    private static String L(Activity a, String en, String ru, String ja, String zh) {
        return KmCfg.L(a, en, ru, ja, zh);
    }

    private static int dp(Activity a, int v) {
        return (int) (v * a.getResources().getDisplayMetrics().density + 0.5f);
    }

    static String keyName(Activity a, int c) {
        if (c >= 0x3b && c <= 0x44) {
            return "F" + (c - 0x3b + 1);
        }
        if (c == 0x57) {
            return "F11";
        }
        if (c == 0x58) {
            return "F12";
        }
        if (c == 0x72) {
            return L(a, "Volume-", "Громкость-", "音量-", "音量-");
        }
        if (c == 0x73) {
            return L(a, "Volume+", "Громкость+", "音量+", "音量+");
        }
        if (c >= 2 && c <= 10) {
            return String.valueOf(c - 1);
        }
        if (c == 11) {
            return "0";
        }
        if (c == 0x37) {
            return "*";
        }
        if (c == 0x160 || c == 0x161) {
            return L(a, "Center(OK)", "Центр(OK)", "中央(OK)", "中间键(确定)");
        }
        return L(a, "key code ", "код клавиши ", "キーコード ", "键码 ") + c;
    }

    /** 写命令文件，再给守护进程发 SIGUSR1(守护进程 inotify 监听命令文件，信号只是后备)。 */
    static void sendCmd(final File dir, final String cmd) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    File f = new File(dir, "keymouse_cmd");
                    FileOutputStream o = new FileOutputStream(f);
                    o.write((cmd + "\n").getBytes());
                    o.close();
                    f.setReadable(true, false);
                    String pid = new File(dir, "keymouse.pid").getAbsolutePath();
                    Runtime.getRuntime().exec(new String[] { "su", "-c", "kill -USR1 $(cat " + pid + ")" }).waitFor();
                } catch (Throwable t) {
                }
            }
        }).start();
    }

    private static String readLine(File f) {
        try {
            BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(f)));
            try {
                return r.readLine();
            } finally {
                r.close();
            }
        } catch (Throwable t) {
            return null;
        }
    }

    /** 自绘光标开关: files/keymouse_cursor，1/0；没有文件=开。App 悬浮窗和 root 助手都读它。 */
    private static boolean readCursorOn(File dir) {
        String s = readLine(new File(dir, "keymouse_cursor"));
        return s == null || !s.trim().startsWith("0");
    }

    private static void writeCursorOn(File dir, boolean on) {
        try {
            File f = new File(dir, "keymouse_cursor");
            FileOutputStream o = new FileOutputStream(f);
            o.write((on ? "1\n" : "0\n").getBytes());
            o.close();
            f.setReadable(true, false);
        } catch (Throwable t) {
        }
    }

    /** 当前开关键组合。新文件 keymouse_toggle_keys 还没有(刚升级)时，读老的两个文件。 */
    private static int[] readKeys(File dir) {
        int[] out = new int[4];
        int n = 0;
        String s = readLine(new File(dir, "keymouse_toggle_keys"));
        try {
            if (s != null) {
                for (String p : s.trim().split("\\s+")) {
                    if (n < 4 && p.length() > 0) {
                        int c = Integer.parseInt(p);
                        if (c > 0) {
                            out[n++] = c;
                        }
                    }
                }
            } else {
                String[] olds = { "keymouse_toggle_key", "keymouse_toggle_key2" };
                for (int i = 0; i < 2; i++) {
                    String t = readLine(new File(dir, olds[i]));
                    if (t != null) {
                        int c = Integer.parseInt(t.trim());
                        if (c > 0 && (n == 0 || c != out[0])) {
                            out[n++] = c;
                        }
                    }
                }
            }
        } catch (Throwable t) {
        }
        if (n == 0) {
            out[0] = 59;                       // 默认 F1
            n = 1;
        }
        int[] r = new int[n];
        System.arraycopy(out, 0, r, 0, n);
        return r;
    }

    /** {鼠标开着, 正在学习, 红点已隐藏, 保留}；守护进程没在跑返回 null。 */
    private static int[] readState(File dir) {
        try {
            if (!new File(dir, "keymouse.pid").exists()) {
                return null;
            }
            String s = readLine(new File(dir, "keymouse_state"));
            if (s == null) {
                return null;
            }
            String[] p = s.trim().split(" +");
            int[] r = new int[4];
            for (int i = 0; i < 4 && i < p.length; i++) {
                r[i] = Integer.parseInt(p[i]);
            }
            return r;
        } catch (Throwable t) {
            return null;
        }
    }

    private static int readToggleHold(File dir) {
        try {
            Properties p = new Properties();
            FileInputStream in = new FileInputStream(new File(dir, "keymouse_hold.cfg"));
            try {
                p.load(in);
            } finally {
                in.close();
            }
            String v = p.getProperty("toggleHold");
            if (v != null) {
                int ms = Integer.parseInt(v.trim());
                if (ms >= 100) {
                    return ms;
                }
            }
        } catch (Throwable t) {
        }
        return 500;
    }

    private static boolean readLockAllow(File dir) {
        try {
            BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(new File(dir, "keymouse_lock.cfg"))));
            try {
                String s;
                boolean v = false;
                while ((s = r.readLine()) != null) {
                    s = s.trim();
                    if (s.startsWith("lockAllow=")) {
                        v = !"0".equals(s.substring(10).trim());
                    }
                }
                return v;
            } finally {
                r.close();
            }
        } catch (Throwable t) {
            return false;
        }
    }

    private static void writeLockAllow(File dir, boolean v) {
        try {
            File f = new File(dir, "keymouse_lock.cfg");
            FileOutputStream o = new FileOutputStream(f);
            o.write(("lockAllow=" + (v ? 1 : 0) + "\n").getBytes());
            o.close();
            f.setReadable(true, false);
        } catch (Throwable t) {
        }
    }

    private static TextView small(Activity a, int topDp) {
        TextView t = new TextView(a);
        t.setTextSize(12f);
        t.setAlpha(0.75f);
        t.setPadding(0, dp(a, topDp), 0, dp(a, 4));
        return t;
    }

    public static void addTo(final Activity a, LinearLayout root) {
        final File dir = a.getFilesDir();
        final Handler h = new Handler(Looper.getMainLooper());
        final boolean[] guard = { false };
        final long[] lastMouse = { 0 };
        final long[] lastDot = { 0 };

        TextView title = new TextView(a);
        title.setTextSize(16f);
        title.setPadding(0, dp(a, 20), 0, dp(a, 4));
        title.setText(L(a, "Mouse mode (soft switch)", "Режим мыши (кнопка)", "マウスモード(ソフトスイッチ)", "鼠标软开关"));
        root.addView(title);

        // 软开关: 立即开/关鼠标模式
        final Switch mouseSw = new Switch(a);
        mouseSw.setText(L(a, "Mouse on", "Мышь включена", "マウス オン", "鼠标已开启"));
        root.addView(mouseSw);

        // 开关键(组合)
        final TextView info = small(a, 10);
        info.setTextSize(13f);
        root.addView(info);

        LinearLayout row = new LinearLayout(a);
        row.setOrientation(LinearLayout.HORIZONTAL);
        final Button setBtn = new Button(a);
        Button resetBtn = new Button(a);
        resetBtn.setText(L(a, "Reset to F1", "Вернуть F1", "F1に戻す", "恢复 F1"));
        row.addView(setBtn);
        row.addView(resetBtn);
        root.addView(row);

        final Switch dotSw = new Switch(a);
        dotSw.setText(L(a, "Show red dot marker", "Показывать красную точку", "赤い点を表示", "显示红点标记"));
        root.addView(dotSw);

        // 自绘光标(黄红渐变尖角箭头)，随中间键按压缩小/弹回；关掉就用系统自带箭头
        final Switch curSw = new Switch(a);
        curSw.setText(L(a, "Custom cursor (shrinks when pressed)", "Свой курсор (уменьшается при нажатии)",
                "オリジナルカーソル(押すと縮む)", "自绘光标（按下会缩小）"));
        curSw.setChecked(readCursorOn(dir));
        curSw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton b, boolean on) {
                writeCursorOn(dir, on);
            }
        });
        root.addView(curSw);
        TextView curHint = small(a, 0);
        curHint.setText(L(a, "On: the system arrow is hidden and a sharp yellow-red arrow is drawn instead; it shrinks with the red dot when the center key is pressed. Off: system arrow.",
                "Вкл: системная стрелка скрыта, вместо неё рисуется жёлто-красная; уменьшается вместе с красной точкой при нажатии. Выкл: системная стрелка.",
                "オン: システムの矢印を隠し、黄〜赤の尖った矢印を表示。中央キーを押すと赤い点と一緒に縮みます。オフ: システムの矢印。",
                "开启: 隐藏系统箭头，改画黄→红渐变的尖角箭头；按住中间键时和红点一起缩小、松开弹回。关闭: 用系统自带箭头。"));
        root.addView(curHint);

        // 锁屏界面是否启用鼠标
        Switch lockSw = new Switch(a);
        lockSw.setChecked(readLockAllow(dir));
        lockSw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton b, boolean on) {
                writeLockAllow(dir, on);
            }
        });
        root.addView(ChoiceRow.build(a,
                L(a, "Mouse on lock screen", "Мышь на экране блокировки", "ロック画面でもマウスを有効", "锁屏界面也启用鼠标"),
                L(a, "On", "Вкл", "オン", "开启"), L(a, "Off", "Выкл", "オフ", "关闭"), lockSw));
        TextView lockHint = small(a, 0);
        lockHint.setText(L(a, "Off (default): the mouse pauses on the lock screen and resumes after unlock, so you can type the PIN.",
                "Выкл (по умолчанию): на экране блокировки мышь на паузе, после разблокировки возобновляется.",
                "オフ(初期値): ロック画面ではマウスを一時停止し、解除後に自動で再開します。",
                "关闭(默认): 锁屏界面自动暂停鼠标，解锁后自动恢复，这样可以正常输入数字密码。"));
        root.addView(lockHint);

        mouseSw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton b, boolean on) {
                if (guard[0]) {
                    return;
                }
                lastMouse[0] = System.currentTimeMillis();
                if (readState(dir) == null) {
                    info.setText(L(a, "Turn on the main switch first.", "Сначала включите главный переключатель.",
                            "先にメインスイッチをオンにしてください。", "请先打开上方的鼠标总开关。"));
                    guard[0] = true;
                    b.setChecked(!on);
                    guard[0] = false;
                    return;
                }
                sendCmd(dir, on ? "on" : "off");
            }
        });
        dotSw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton b, boolean on) {
                if (guard[0]) {
                    return;
                }
                lastDot[0] = System.currentTimeMillis();
                sendCmd(dir, on ? "dot_on" : "dot_off");
            }
        });
        resetBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                sendCmd(dir, "reset");
                // 守护进程写文件有延迟: 先直接写新文件，界面马上更新
                try {
                    FileOutputStream o = new FileOutputStream(new File(dir, "keymouse_toggle_keys"));
                    o.write("59\n".getBytes());
                    o.close();
                } catch (Throwable t) {
                }
            }
        });
        setBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                int[] st = readState(dir);
                if (st == null) {
                    info.setText(L(a, "Turn on the main switch first.", "Сначала включите главный переключатель.",
                            "先にメインスイッチをオンにしてください。", "请先打开上方的鼠标总开关。"));
                    return;
                }
                sendCmd(dir, st[1] == 1 ? "learn_cancel" : "learn");
                info.setText(st[1] == 1 ? "" : L(a,
                        "Hold the key(s) you want (1-4 keys together), then release all (within 8 s)...",
                        "Зажмите нужные клавиши (1-4 вместе), затем отпустите все (8 с)...",
                        "使いたいキーを同時に押し続け(1〜4個)、すべて離してください(8秒以内)...",
                        "请同时按住想用的键（1~4 个），然后全部松开（8 秒内）…"));
            }
        });

        final Runnable[] tick = new Runnable[1];
        tick[0] = new Runnable() {
            public void run() {
                long now = System.currentTimeMillis();
                int[] st = readState(dir);
                boolean learning = st != null && st[1] == 1;
                guard[0] = true;
                if (now - lastMouse[0] > 1500) {
                    mouseSw.setChecked(st != null && st[0] == 1);
                }
                if (now - lastDot[0] > 1500) {
                    dotSw.setChecked(st == null || st[2] == 0);
                }
                guard[0] = false;
                // 软开关文字跟随开关状态: 已开启 / 已关闭
                mouseSw.setText(mouseSw.isChecked()
                        ? L(a, "Mouse on", "Мышь включена", "マウス オン", "鼠标已开启")
                        : L(a, "Mouse off", "Мышь выключена", "マウス オフ", "鼠标已关闭"));
                setBtn.setText(learning
                        ? L(a, "Cancel", "Отмена", "キャンセル", "取消")
                        : L(a, "Set toggle key(s)", "Задать клавиши", "切替キーを設定", "设置开关键"));
                if (!learning) {
                    int[] ks = readKeys(dir);
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < ks.length; i++) {
                        sb.append(i > 0 ? " + " : "").append(keyName(a, ks[i]));
                    }
                    int hold = readToggleHold(dir);
                    info.setText(L(a, "Toggle key: ", "Клавиша переключения: ", "切替キー: ", "开关键: ") + sb
                            + (ks.length > 1 ? L(a, " (hold together)", " (вместе)", " (同時押し)", "（同时按住）") : "")
                            + "\n" + L(a, "Hold time: ", "Время удержания: ", "長押し時間: ", "长按时间: ")
                            + (hold / 1000) + "." + ((hold % 1000) / 100)
                            + L(a, " s (adjust in \"Long-press time\" below)", " с (ползунок ниже)",
                                " 秒 (下の「長押し時間」で調整)", " 秒（在下方“长按时间”里调整）"));
                }
                if (info.isAttachedToWindow()) {
                    h.postDelayed(tick[0], 800);
                }
            }
        };
        info.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            public void onViewAttachedToWindow(View v) {
                h.removeCallbacks(tick[0]);
                h.post(tick[0]);
            }

            public void onViewDetachedFromWindow(View v) {
                h.removeCallbacks(tick[0]);
            }
        });
    }
}
