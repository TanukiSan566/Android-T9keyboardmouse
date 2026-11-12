package com.keymouse.tool;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * 选项卡式的开/关选择行: 上面一行完整显示说明文字(自动换行)，下面是并排的两个选项卡
 * ("开启" / "关闭")，当前选中的那个整块高亮。
 *
 * 为什么不用普通 Switch: 说明文字一长，横向排版里开关会被挤出屏幕(320 像素宽的屏幕上
 * 已经实测看不到)。这里说明文字独占一行，选项卡永远在下面一行、而且一眼能看出选了哪个。
 *
 * 状态和保存逻辑不在这里: 点选项卡只是去 setChecked() 一个"隐形"的 Switch，
 * MainActivity.onCheckedChanged 原来的保存/实时生效逻辑原封不动地继续用。
 */
public final class ChoiceRow {
    private static final int SEL_BG = 0xFF2E7D32;     // 选中: 绿底
    private static final int SEL_FG = 0xFFFFFFFF;     // 选中: 白字
    private static final int OFF_BG = 0x33808080;     // 未选: 淡灰底(深浅色主题都看得清)

    private ChoiceRow() {
    }

    public static View build(Context ctx, String label, String onText, String offText, CompoundButton sw) {
        float d = ctx.getResources().getDisplayMetrics().density;

        LinearLayout box = new LinearLayout(ctx);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(0, 40, 0, 10);

        TextView lbl = new TextView(ctx);
        lbl.setText(label);
        lbl.setTextSize(16f);
        box.addView(lbl);

        LinearLayout seg = new LinearLayout(ctx);
        seg.setOrientation(LinearLayout.HORIZONTAL);
        seg.setPadding(0, (int) (6 * d), 0, 0);

        TextView on = tab(ctx, onText, d);
        TextView off = tab(ctx, offText, d);
        LinearLayout.LayoutParams lp1 = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        lp1.rightMargin = (int) (4 * d);
        LinearLayout.LayoutParams lp2 = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        lp2.leftMargin = (int) (4 * d);
        seg.addView(on, lp1);
        seg.addView(off, lp2);
        box.addView(seg);

        int fg = lbl.getTextColors().getDefaultColor();   // 未选中的字用当前主题的正文颜色，深/浅色主题都看得清
        paint(on, off, sw.isChecked(), d, fg);

        Click c = new Click(sw, on, off, d, fg);
        on.setOnClickListener(c);
        off.setOnClickListener(c);
        return box;
    }

    private static TextView tab(Context ctx, String text, float d) {
        TextView t = new TextView(ctx);
        t.setText(text);
        t.setTextSize(16f);
        t.setGravity(Gravity.CENTER);
        int p = (int) (10 * d);
        t.setPadding(p, p, p, p);
        t.setClickable(true);
        return t;
    }

    private static void style(TextView t, boolean selected, float d, int fg) {
        GradientDrawable g = new GradientDrawable();
        g.setCornerRadius(6 * d);
        g.setColor(selected ? SEL_BG : OFF_BG);
        t.setBackground(g);
        if (selected) {
            t.setTextColor(SEL_FG);
            t.setTypeface(null, android.graphics.Typeface.BOLD);
        } else {
            t.setTextColor(fg);
            t.setTypeface(null, android.graphics.Typeface.NORMAL);
        }
    }

    static void paint(TextView on, TextView off, boolean isOn, float d, int fg) {
        style(on, isOn, d, fg);
        style(off, !isOn, d, fg);
    }

    static final class Click implements View.OnClickListener {
        private final CompoundButton sw;
        private final TextView on, off;
        private final float d;
        private final int fg;

        Click(CompoundButton sw, TextView on, TextView off, float d, int fg) {
            this.fg = fg;
            this.sw = sw;
            this.on = on;
            this.off = off;
            this.d = d;
        }

        public void onClick(View v) {
            boolean wantOn = (v == on);
            sw.setChecked(wantOn);           // 状态变了才会触发 onCheckedChanged 去保存/生效
            paint(on, off, wantOn, d, fg);
        }
    }
}
