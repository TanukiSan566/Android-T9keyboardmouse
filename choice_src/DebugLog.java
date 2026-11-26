package com.keymouse.tool;

import android.content.Context;

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
            return b == '1';
        } catch (Throwable t) {
            return false;
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
}
