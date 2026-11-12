package com.keymouse.tool;

import android.content.Context;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.CompoundButton;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

/**
 * "长按时间"设置区: 每个长按操作一根滑块，拖动即时生效(写 files/keymouse_hold.cfg，
 * 守护进程检测到文件变化马上重读，不用重启)。滑块单位 0.1 秒；
 * 允许关闭的功能滑到最左 = 关闭。
 */
public final class HoldSliders {
    private HoldSliders() {
    }

    // key, en, ru, ja, zh, 默认ms, 最大(单位0.1s), 最小(单位0.1s; 0=可关闭)
    private static final Object[][] ITEMS = {
        {"dragHold", "Hold OK = drag", "OK удерживать = перетаскивание", "OK長押し=ドラッグ", "长按确认键=拖动", 3000, 80, 0},
        {"autoMenu", "Copy menu after drag release (right-click)", "Меню копирования после отпускания (ПКМ)", "ドラッグ後にコピーメニュー(右クリック)", "拖动松手后自动弹复制菜单(右键)", 1000, 30, 0},
        {"toggleHold", "Hold toggle key = mouse on/off", "Удерж. кнопку = вкл/выкл мышь", "切替キー長押し=マウス入/切", "长按开关键=开/关鼠标", 500, 30, 1},
        {"scrollHold", "Hold scroll key = continuous", "Удерж. прокрутку = непрерывно", "スクロールキー長押し=連続", "长按滚动键=连续滑动", 300, 20, 1},
    };

    private static File cfgFile(Context ctx) {
        return new File(ctx.getFilesDir(), "keymouse_hold.cfg");
    }

    private static Properties load(Context ctx) {
        Properties p = new Properties();
        try {
            FileInputStream in = new FileInputStream(cfgFile(ctx));
            try {
                p.load(in);
            } finally {
                in.close();
            }
        } catch (Throwable ignore) {
        }
        return p;
    }

    private static boolean sTouch = false;

    private static void save(Context ctx, int[] ms) {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("touchMode=").append(sTouch ? 1 : 0).append('\n');
            for (int i = 0; i < ITEMS.length; i++) {
                sb.append((String) ITEMS[i][0]).append('=').append(ms[i]).append('\n');
            }
            FileOutputStream out = new FileOutputStream(cfgFile(ctx));
            try {
                out.write(sb.toString().getBytes());
            } finally {
                out.close();
            }
            cfgFile(ctx).setReadable(true, false);
        } catch (Throwable ignore) {
        }
    }

    private static String fmt(int ms, int lang) {
        if (ms <= 0) {
            return lang == 1 ? "выкл" : lang == 2 ? "オフ" : lang == 3 ? "关闭" : "off";
        }
        String s = (ms / 1000) + "." + ((ms % 1000) / 100);
        return s + (lang == 1 ? " с" : lang == 2 ? " 秒" : lang == 3 ? " 秒" : " s");
    }

    public static View build(final Context ctx, final int lang) {
        float d = ctx.getResources().getDisplayMetrics().density;
        LinearLayout box = new LinearLayout(ctx);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(0, 40, 0, 10);

        TextView title = new TextView(ctx);
        title.setText(lang == 1 ? "Время удержания клавиш" : lang == 2 ? "長押し時間" : lang == 3 ? "长按时间(拖动即时生效)" : "Long-press time");
        title.setTextSize(16f);
        box.addView(title);

        Properties p = load(ctx);
        sTouch = "1".equals(p.getProperty("touchMode", "0").trim());
        final int n = ITEMS.length;
        final int[] ms = new int[n];
        for (int i = 0; i < n; i++) {
            int def = (Integer) ITEMS[i][5];
            int v = def;
            try {
                v = Integer.parseInt(p.getProperty((String) ITEMS[i][0], String.valueOf(def)).trim());
            } catch (Throwable ignore) {
            }
            ms[i] = v;
        }

        final int[] msRef = ms;
        Switch tsw = new Switch(ctx);
        tsw.setChecked(sTouch);
        tsw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton b, boolean on) {
                sTouch = on;
                save(ctx, msRef);
            }
        });
        String tl = lang == 1 ? "Режим касания (клик/перетаскивание как пальцем: выделение текста, меню)"
                : lang == 2 ? "タッチ操作モード(クリック/ドラッグを指の操作として扱う: テキスト選択・メニュー)"
                : lang == 3 ? "触摸点击模式(确认键/拖动按手指触摸处理：拖选文字、点选区工具栏)"
                : "Touch-tap mode (click/drag act like a finger: text selection, toolbar)";
        String onT = lang == 1 ? "Вкл" : lang == 2 ? "オン" : lang == 3 ? "开启" : "On";
        String offT = lang == 1 ? "Выкл" : lang == 2 ? "オフ" : lang == 3 ? "关闭" : "Off";
        box.addView(ChoiceRow.build(ctx, tl, onT, offT, tsw));

        for (int i = 0; i < n; i++) {
            final int idx = i;
            final int max = (Integer) ITEMS[i][6];
            final int min = (Integer) ITEMS[i][7];
            final String name = (String) ITEMS[i][1 + (lang >= 0 && lang <= 3 ? (lang == 0 ? 0 : lang) : 0)];
            final TextView lbl = new TextView(ctx);
            lbl.setTextSize(14f);
            lbl.setPadding(0, (int) (8 * d), 0, 0);
            lbl.setText(name + ": " + fmt(ms[i], lang));
            box.addView(lbl);

            SeekBar sb = new SeekBar(ctx);
            sb.setMax(max);
            sb.setProgress(Math.max(0, Math.min(max, ms[i] / 100)));
            sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                    int u = Math.max(min, progress);
                    ms[idx] = u * 100;
                    lbl.setText(name + ": " + fmt(ms[idx], lang));
                    if (fromUser) {
                        save(ctx, ms);
                    }
                }

                public void onStartTrackingTouch(SeekBar bar) {
                }

                public void onStopTrackingTouch(SeekBar bar) {
                    save(ctx, ms);
                }
            });
            box.addView(sb);
        }
        return box;
    }
}
