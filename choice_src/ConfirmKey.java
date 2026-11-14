package com.keymouse.tool;

import android.app.Activity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.File;
import java.io.FileOutputStream;

/** 中间键(确定键)按键映射: 学习本机中间键的键码，解决不同手机键码不同导致点不了的问题。 */
public final class ConfirmKey {
    private ConfirmKey() {}

    private static String L(Activity a, String en, String ru, String ja, String zh) {
        int l = a.getSharedPreferences("keymouse", 0).getInt("lang", 0);
        return l == 1 ? ru : l == 2 ? ja : l == 3 ? zh : en;
    }

    private static int readInt(File f) {
        try {
            java.io.BufferedReader r = new java.io.BufferedReader(new java.io.InputStreamReader(new java.io.FileInputStream(f)));
            String s = r.readLine();
            r.close();
            return Integer.parseInt(s.trim());
        } catch (Throwable t) {
            return 0;
        }
    }

    public static void addTo(final Activity a, LinearLayout root) {
        final File dir = a.getFilesDir();

        TextView title = new TextView(a);
        title.setTextSize(16f);
        title.setPadding(0, 40, 0, 4);
        title.setText(L(a, "Center key mapping", "Назначение центральной клавиши", "中央キーの割り当て", "中间键映射"));
        root.addView(title);

        final TextView info = new TextView(a);
        info.setTextSize(13f);
        info.setPadding(0, 4, 0, 6);
        root.addView(info);

        final Runnable[] tick = new Runnable[1];
        tick[0] = new Runnable() {
            public void run() {
                int c = readInt(new File(dir, "keymouse_confirm_key"));
                String cur = c > 0 ? ("key code " + c) : L(a, "none", "нет", "なし", "无");
                info.setText(L(a,
                        "Built in: Select(353) / Enter(28) / KPEnter(96) / OK(352)\nCustom: ",
                        "Встроено: Select(353) / Enter(28) / KPEnter(96) / OK(352)\nСвоя: ",
                        "内蔵: Select(353) / Enter(28) / KPEnter(96) / OK(352)\nカスタム: ",
                        "内置: Select(353) / Enter(28) / KPEnter(96) / OK(352)\n自定义: ") + cur);
                if (info.isAttachedToWindow()) info.postDelayed(tick[0], 800);
            }
        };
        info.post(tick[0]);

        LinearLayout row = new LinearLayout(a);
        row.setOrientation(LinearLayout.HORIZONTAL);
        Button set = new Button(a);
        set.setText(L(a, "Set center key", "Задать", "中央キーを設定", "设置中间键"));
        set.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                ToggleKeys.sendCmd(dir, "learn_confirm");
                info.setText(L(a, "Press your phone's center key within 8 s...",
                        "Нажмите центральную клавишу (8 с)...",
                        "8秒以内に中央キーを押してください...",
                        "请在 8 秒内按下你手机的中间键..."));
            }
        });
        Button clr = new Button(a);
        clr.setText(L(a, "Clear", "Сброс", "消去", "清除"));
        clr.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                ToggleKeys.sendCmd(dir, "clear_confirm");
                try {
                    FileOutputStream o = new FileOutputStream(new File(dir, "keymouse_confirm_key"));
                    o.write("0\n".getBytes());
                    o.close();
                } catch (Throwable t) {
                }
            }
        });
        row.addView(set);
        row.addView(clr);
        root.addView(row);

        TextView hint = new TextView(a);
        hint.setTextSize(12f);
        hint.setText(L(a, "If the center key does not click, turn the main switch on, tap \"Set center key\" and press it.",
                "Если центр не кликает: включите главный переключатель, нажмите «Задать» и нажмите клавишу.",
                "中央キーでクリックできない場合: メインスイッチをオンにし、「中央キーを設定」を押してからそのキーを押します。",
                "中间键点不了时: 先打开总开关，点“设置中间键”，再按一下你手机的中间键即可(不同手机键码不同)。"));
        root.addView(hint);
    }
}
