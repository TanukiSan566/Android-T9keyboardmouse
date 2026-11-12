package com.keymouse.tool;

import android.content.Context;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

/**
 * "滚动 / 缩放速度"设置区: 拖动即时生效(写 files/keymouse_speed.cfg，守护进程检测到
 * 文件变化马上重读，不用重启)。
 *   glideSpeed : 长按 2/4/6/8 连续慢拖的速度(像素/秒)
 *   pinchMs    : 1/3 键捏合缩放从开始到结束的时间(毫秒，越大越慢)
 *   fastDist   : 单击 2/4/6/8 快速滑动的距离(像素)
 *   fastSpeed  : 单击 2/4/6/8 快速滑动的速度(像素/秒)
 */
public final class SpeedSliders {
    private SpeedSliders() {
    }

    // key, en, ru, ja, zh, 默认值, 最小值, 步长, 单位(0=px/s 1=秒 2=px)
    private static final Object[][] ITEMS = {
        {"glideSpeed", "2468 hold scroll: continuous scroll speed", "2468 удержание: скорость непрерывной прокрутки",
                "2468長押しスクロールの連続スクロール速度", "2468长按滚动的连续滚动速度", 300, 60, 10, 0},
        {"pinchMs", "Keys 1/3 zoom time (longer = slower)", "Клавиши 1/3: время масштаба (больше = медленнее)",
                "1/3キー ズーム時間(長いほどゆっくり)", "1/3 键缩放用时(越大越慢)", 1500, 500, 100, 1},
        {"fastDist", "Tap scroll key: distance", "Нажатие: расстояние",
                "タップスクロール: 距離", "单击滚动键：滑动距离", 150, 40, 10, 2},
        {"fastSpeed", "Tap scroll key: speed", "Нажатие: скорость",
                "タップスクロール: 速度", "单击滚动键：滑动速度", 1600, 200, 100, 0},
    };
    private static final int[] MAXV = { 900, 4000, 440, 4000 };

    private static File cfgFile(Context ctx) {
        return new File(ctx.getFilesDir(), "keymouse_speed.cfg");
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

    private static void save(Context ctx, int[] v) {
        try {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < ITEMS.length; i++) {
                sb.append((String) ITEMS[i][0]).append('=').append(v[i]).append('\n');
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

    private static String fmt(int value, int unit) {
        if (unit == 1) {
            return (value / 1000) + "." + ((value % 1000) / 100) + " s";
        }
        return value + (unit == 2 ? " px" : " px/s");
    }

    public static android.view.View build(final Context ctx, final int lang) {
        float d = ctx.getResources().getDisplayMetrics().density;
        LinearLayout box = new LinearLayout(ctx);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(0, 40, 0, 10);

        TextView title = new TextView(ctx);
        title.setText(lang == 1 ? "Скорость прокрутки и масштаба"
                : lang == 2 ? "スクロール/ズームの速度"
                : lang == 3 ? "滚动 / 缩放速度(拖动即时生效)" : "Scroll / zoom speed");
        title.setTextSize(16f);
        box.addView(title);

        Properties p = load(ctx);
        final int n = ITEMS.length;
        final int[] vals = new int[n];
        for (int i = 0; i < n; i++) {
            int def = (Integer) ITEMS[i][5];
            int v = def;
            try {
                v = Integer.parseInt(p.getProperty((String) ITEMS[i][0], String.valueOf(def)).trim());
            } catch (Throwable ignore) {
            }
            vals[i] = v;
        }

        for (int i = 0; i < n; i++) {
            final int idx = i;
            final int min = (Integer) ITEMS[i][6];
            final int step = (Integer) ITEMS[i][7];
            final int unit = (Integer) ITEMS[i][8];
            final int steps = (MAXV[i] - min) / step;
            final String name = (String) ITEMS[i][1 + (lang >= 1 && lang <= 3 ? lang : 0)];
            final TextView lbl = new TextView(ctx);
            lbl.setTextSize(14f);
            lbl.setPadding(0, (int) (8 * d), 0, 0);
            lbl.setText(name + ": " + fmt(vals[i], unit));
            box.addView(lbl);

            SeekBar sb = new SeekBar(ctx);
            sb.setMax(steps);
            sb.setProgress(Math.max(0, Math.min(steps, (vals[i] - min) / step)));
            sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                    vals[idx] = min + progress * step;
                    lbl.setText(name + ": " + fmt(vals[idx], unit));
                    if (fromUser) {
                        save(ctx, vals);
                    }
                }

                public void onStartTrackingTouch(SeekBar bar) {
                }

                public void onStopTrackingTouch(SeekBar bar) {
                    save(ctx, vals);
                }
            });
            box.addView(sb);
        }
        return box;
    }
}
