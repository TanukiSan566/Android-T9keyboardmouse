package com.keymouse.tool;

import android.app.Activity;
import android.content.SharedPreferences;
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

/** 开关键的第二个键(组合键)按钮 + 锁屏界面是否启用鼠标的开关。 */
public final class ExtraSwitches {
    private ExtraSwitches() {}

    private static int lang(Activity a) {
        SharedPreferences p = a.getSharedPreferences("keymouse", 0);
        return p.getInt("lang", 0);   // 0=en 1=ru 2=ja 3=zh
    }

    private static String L(Activity a, String en, String ru, String ja, String zh) {
        int l = lang(a);
        return l == 1 ? ru : l == 2 ? ja : l == 3 ? zh : en;
    }

    static String keyName(Activity a, int c) {
        if (c >= 0x3b && c <= 0x44) return "F" + (c - 0x3b + 1);
        if (c == 0x57) return "F11";
        if (c == 0x58) return "F12";
        if (c == 0x72) return L(a, "Volume-", "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c-", "\u97f3\u91cf-", "\u97f3\u91cf-");
        if (c == 0x73) return L(a, "Volume+", "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c+", "\u97f3\u91cf+", "\u97f3\u91cf+");
        if (c >= 2 && c <= 10) return String.valueOf(c - 1);
        if (c == 11) return "0";
        if (c == 0x37) return "*";
        if (c == 0x160 || c == 0x161)
            return L(a, "Center(OK)", "\u0426\u0435\u043d\u0442\u0440(OK)", "\u4e2d\u592e(OK)", "\u4e2d\u95f4\u952e(\u786e\u5b9a)");
        return L(a, "key code ", "\u043a\u043e\u0434 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 ", "\u30ad\u30fc\u30b3\u30fc\u30c9 ", "\u952e\u7801 ") + c;
    }

    private static int readInt(File f) {
        try {
            BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(f)));
            String s = r.readLine();
            r.close();
            return Integer.parseInt(s.trim());
        } catch (Throwable t) {
            return 0;
        }
    }

    private static int readToggleHold(File dir) {
        try {
            Properties p = new Properties();
            FileInputStream in = new FileInputStream(new File(dir, "keymouse_hold.cfg"));
            p.load(in);
            in.close();
            String v = p.getProperty("toggleHold");
            if (v != null) {
                int ms = Integer.parseInt(v.trim());
                if (ms >= 100) return ms;
            }
        } catch (Throwable t) {
        }
        return 500;
    }

    static boolean readLockAllow(File dir) {
        try {
            BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(new File(dir, "keymouse_lock.cfg"))));
            String s;
            boolean v = false;
            while ((s = r.readLine()) != null) {
                s = s.trim();
                if (s.startsWith("lockAllow=")) v = !"0".equals(s.substring(10).trim());
            }
            r.close();
            return v;
        } catch (Throwable t) {
            return false;
        }
    }

    static void writeLockAllow(File dir, boolean v) {
        try {
            File f = new File(dir, "keymouse_lock.cfg");
            FileOutputStream o = new FileOutputStream(f);
            o.write(("lockAllow=" + (v ? 1 : 0) + "\n").getBytes());
            o.close();
            f.setReadable(true, false);
        } catch (Throwable t) {
        }
    }

    /** 和 SoftSwitch 一样: 写命令文件，再给守护进程发 SIGUSR1。 */
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

    private static String fmtSec(int ms) {
        return (ms / 1000) + "." + ((ms % 1000) / 100);
    }

    public static void addTo(final Activity a, LinearLayout root) {
        final File dir = a.getFilesDir();

        // 状态行: 第二键 + 当前长按时间
        final TextView info = new TextView(a);
        info.setTextSize(13f);
        info.setPadding(0, 10, 0, 6);
        root.addView(info);

        final Runnable[] tick = new Runnable[1];
        tick[0] = new Runnable() {
            public void run() {
                int k2 = readInt(new File(dir, "keymouse_toggle_key2"));
                String second = k2 > 0 ? keyName(a, k2)
                        : L(a, "none", "\u043d\u0435\u0442", "\u306a\u3057", "\u65e0");
                int hold = readToggleHold(dir);
                info.setText(
                    L(a, "2nd toggle key (optional, hold both): ", "\u0412\u0442\u043e\u0440\u0430\u044f \u043a\u043b\u0430\u0432\u0438\u0448\u0430 (\u043d\u0435\u043e\u0431\u044f\u0437\u0430\u0442\u0435\u043b\u044c\u043d\u043e, \u0434\u0435\u0440\u0436\u0430\u0442\u044c \u043e\u0431\u0435): ",
                        "2\u3064\u76ee\u306e\u30ad\u30fc(\u4efb\u610f\u30fb\u540c\u6642\u9577\u62bc\u3057): ", "\u7b2c\u4e8c\u5f00\u5173\u952e(\u53ef\u9009\uff0c\u4e24\u952e\u540c\u65f6\u6309\u4f4f\u624d\u89e6\u53d1): ")
                    + second + "\n"
                    + L(a, "Hold time: ", "\u0412\u0440\u0435\u043c\u044f \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044f: ", "\u9577\u62bc\u3057\u6642\u9593: ", "\u957f\u6309\u65f6\u95f4: ")
                    + fmtSec(hold) + L(a, " s (0.1-3 s, drag the \"Hold toggle key\" slider below)", " \u0441 (0,1-3 \u0441, \u043f\u043e\u043b\u0437\u0443\u043d\u043e\u043a \u043d\u0438\u0436\u0435)",
                        " \u79d2 (0.1-3\u79d2\u3001\u4e0b\u306e\u30b9\u30e9\u30a4\u30c0\u30fc\u3067\u8abf\u6574)", " \u79d2 (0.1-3 \u79d2\uff0c\u5728\u4e0b\u65b9\u201c\u957f\u6309\u65f6\u95f4\u201d\u91cc\u62d6\u52a8\u201c\u957f\u6309\u5f00\u5173\u952e\u201d\u8c03\u6574)"));
                if (info.isAttachedToWindow()) info.postDelayed(tick[0], 800);
            }
        };
        info.post(tick[0]);

        // 第二键按钮行
        LinearLayout row = new LinearLayout(a);
        row.setOrientation(LinearLayout.HORIZONTAL);
        Button set2 = new Button(a);
        set2.setText(L(a, "Set 2nd key", "\u0417\u0430\u0434\u0430\u0442\u044c 2-\u044e", "2\u3064\u76ee\u3092\u8a2d\u5b9a", "\u8bbe\u7b2c\u4e8c\u952e"));
        set2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                sendCmd(dir, "learn2");
                info.setText(L(a, "Press the 2nd key within 8 s...", "\u041d\u0430\u0436\u043c\u0438\u0442\u0435 \u0432\u0442\u043e\u0440\u0443\u044e \u043a\u043b\u0430\u0432\u0438\u0448\u0443 (8 \u0441)...",
                        "8\u79d2\u4ee5\u5185\u306b2\u3064\u76ee\u306e\u30ad\u30fc\u3092\u62bc\u3057\u3066\u304f\u3060\u3055\u3044...", "\u8bf7\u5728 8 \u79d2\u5185\u6309\u4e0b\u7b2c\u4e8c\u4e2a\u952e..."));
            }
        });
        Button clr2 = new Button(a);
        clr2.setText(L(a, "Clear 2nd key", "\u0423\u0431\u0440\u0430\u0442\u044c 2-\u044e", "2\u3064\u76ee\u3092\u6d88\u53bb", "\u6e05\u9664\u7b2c\u4e8c\u952e"));
        clr2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                sendCmd(dir, "clear2");
                // 守护进程写文件有延迟，先直接把文件改成 0 让界面马上更新
                try {
                    FileOutputStream o = new FileOutputStream(new File(dir, "keymouse_toggle_key2"));
                    o.write("0\n".getBytes());
                    o.close();
                } catch (Throwable t) {
                }
            }
        });
        row.addView(set2);
        row.addView(clr2);
        root.addView(row);

        // 锁屏界面是否启用鼠标
        LinearLayout lrow = new LinearLayout(a);
        lrow.setOrientation(LinearLayout.HORIZONTAL);
        lrow.setPadding(0, 40, 0, 10);
        TextView lbl = new TextView(a);
        lbl.setText(L(a, "Mouse on lock screen", "\u041c\u044b\u0448\u044c \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438",
                "\u30ed\u30c3\u30af\u753b\u9762\u3067\u3082\u30de\u30a6\u30b9\u3092\u6709\u52b9", "\u9501\u5c4f\u754c\u9762\u4e5f\u542f\u7528\u9f20\u6807"));
        lbl.setTextSize(16f);
        lrow.addView(lbl);
        Switch sw = new Switch(a);
        sw.setChecked(readLockAllow(dir));
        sw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton b, boolean on) {
                writeLockAllow(dir, on);
            }
        });
        lrow.addView(sw);
        root.addView(lrow);

        TextView hint = new TextView(a);
        hint.setTextSize(12f);
        hint.setText(L(a, "Off (default): the mouse pauses on the lock screen and resumes after unlock, so you can type the PIN.",
                "\u0412\u044b\u043a\u043b (\u043f\u043e \u0443\u043c\u043e\u043b\u0447\u0430\u043d\u0438\u044e): \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 \u043c\u044b\u0448\u044c \u043d\u0430 \u043f\u0430\u0443\u0437\u0435, \u043f\u043e\u0441\u043b\u0435 \u0440\u0430\u0437\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 \u0432\u043e\u0437\u043e\u0431\u043d\u043e\u0432\u043b\u044f\u0435\u0442\u0441\u044f.",
                "\u30aa\u30d5(\u521d\u671f\u5024): \u30ed\u30c3\u30af\u753b\u9762\u3067\u306f\u30de\u30a6\u30b9\u3092\u4e00\u6642\u505c\u6b62\u3057\u3001\u89e3\u9664\u5f8c\u306b\u81ea\u52d5\u3067\u518d\u958b\u3057\u307e\u3059\u3002",
                "\u5173\u95ed(\u9ed8\u8ba4): \u9501\u5c4f\u754c\u9762\u81ea\u52a8\u6682\u505c\u9f20\u6807\uff0c\u89e3\u9501\u540e\u81ea\u52a8\u6062\u590d\uff0c\u8fd9\u6837\u53ef\u4ee5\u6b63\u5e38\u8f93\u5165\u6570\u5b57\u5bc6\u7801\u3002"));
        root.addView(hint);
    }
}
