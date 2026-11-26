package com.keymouse.tool;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 * "Bug 日志记录"开关(主界面最下面的按钮，取代原来的"复制诊断日志")。
 * 开关状态存在 files/keymouse_debug (1/0，没有文件=关)，守护进程每 0.5 秒看一眼:
 * 开着就把日志同步到 /sdcard/keymousedebug/<日期>-keymouse.txt，关着就不写。
 */
final class DebugLog {
    private DebugLog() {
    }

    private static File flag(Context c) {
        return new File(c.getFilesDir(), "keymouse_debug");
    }

    static boolean isOn(Context c) {
        try {
            FileInputStream in = new FileInputStream(flag(c));
            int b = in.read();
            in.close();
            return b != '0';          // 默认开: 没有文件/读不到都算开，只有明确写了 0 才关
        } catch (Throwable t) {
            return true;
        }
    }

    static void toggle(Context c) {
        try {
            File f = flag(c);
            FileOutputStream o = new FileOutputStream(f);
            o.write(isOn(c) ? '0' : '1');
            o.close();
            f.setReadable(true, false);
        } catch (Throwable t) {
            // 忽略
        }
    }

    static String label(Context c) {
        return isOn(c)
                ? KmCfg.L(c, "Bug log recording: ON (tap to stop)", "Запись лога ошибок: ВКЛ (нажмите, чтобы выключить)",
                        "バグログ記録: オン(タップで停止)", "Bug 日志记录：已开启（点击关闭）")
                : KmCfg.L(c, "Bug log recording: OFF (tap to start)", "Запись лога ошибок: ВЫКЛ (нажмите, чтобы включить)",
                        "バグログ記録: オフ(タップで開始)", "Bug 日志记录：已关闭（点击开启）");
    }

    static String hint(Context c) {
        return isOn(c)
                ? KmCfg.L(c, "Recording to /sdcard/keymousedebug/ (cleared at 10 MB)",
                        "Запись в /sdcard/keymousedebug/ (очистка при 10 МБ)",
                        "/sdcard/keymousedebug/ に記録中(10MBで自動クリア)",
                        "日志记录到 /sdcard/keymousedebug/（满 10MB 自动清空）")
                : KmCfg.L(c, "Bug log recording stopped", "Запись лога остановлена",
                        "バグログ記録を停止しました", "已停止记录 Bug 日志");
    }

    private static void set(Context c, boolean on) {
        try {
            File f = flag(c);
            FileOutputStream o = new FileOutputStream(f);
            o.write(on ? '1' : '0');
            o.close();
            f.setReadable(true, false);
        } catch (Throwable t) {
            // 忽略
        }
    }

    /** 主界面最下面的Bug 日志记录开关行，样式同开机自启。默认开，持续记录，总开关关闭时停止。 */
    static View build(final Activity a) {
        LinearLayout box = new LinearLayout(a);
        box.setOrientation(LinearLayout.VERTICAL);
        LinearLayout row = new LinearLayout(a);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, 40, 0, 10);
        TextView lbl = new TextView(a);
        lbl.setTextSize(16f);
        lbl.setText(KmCfg.L(a, "Bug log", "Лог ошибок", "バグログ", "Bug 日志记录"));
        row.addView(lbl);
        Switch sw = new Switch(a);
        sw.setChecked(isOn(a));
        sw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton v, boolean c) {
                set(a, c);
            }
        });
        row.addView(sw);
        box.addView(row);
        TextView h = new TextView(a);
        h.setTextSize(12f);
        h.setAlpha(0.7f);
        h.setText(KmCfg.L(a, "Recorded continuously to /sdcard/keymousedebug/ - one txt per master-switch start, stops when it is turned off",
                "Запись в /sdcard/keymousedebug/ - один txt на каждое включение, останавливается при выключении",
                "/sdcard/keymousedebug/ に常時記録 - メインスイッチ開始ごとに1つのtxt、オフで停止",
                "持续记录到 /sdcard/keymousedebug/，总开关每开启一次生成一个 txt，关闭总开关后停止"));
        box.addView(h);
        return box;
    }
}
