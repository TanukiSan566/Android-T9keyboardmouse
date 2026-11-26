package com.keymouse.tool;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/** 主界面上的\"自定义鼠标\"入口卡片(一级菜单)，样式同\"按键自定义\"，点击进入 CursorActivity。 */
public final class CursorCard {
    private CursorCard() {
    }

    public static View build(final Activity a) {
        float d = a.getResources().getDisplayMetrics().density;

        GradientDrawable normal = new GradientDrawable();
        normal.setColor(0xFF3A3A3A);
        normal.setCornerRadius(16 * d);
        GradientDrawable pressed = new GradientDrawable();
        pressed.setColor(0xFF1F4D45);
        pressed.setCornerRadius(16 * d);
        pressed.setStroke(2, 0xFF00A88E);
        StateListDrawable sl = new StateListDrawable();
        sl.addState(new int[] { android.R.attr.state_pressed }, pressed);
        sl.addState(new int[] { android.R.attr.state_focused }, pressed);
        sl.addState(new int[0], normal);

        LinearLayout card = new LinearLayout(a);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        int p = (int) (14 * d);
        card.setPadding(p, p, p, p);
        card.setBackground(sl);
        card.setClickable(true);
        card.setFocusable(true);

        ImageView iv = new ImageView(a);
        GradientDrawable dot = new GradientDrawable();
        dot.setShape(GradientDrawable.OVAL);
        dot.setColor(0xFF00A88E);
        iv.setBackground(dot);
        int ip = (int) (9 * d);
        iv.setPadding(ip, ip, ip, ip);
        int id = a.getResources().getIdentifier("ic_menu_compass", "drawable", "android");
        if (id != 0) {
            iv.setImageResource(id);
        }
        LinearLayout.LayoutParams ilp = new LinearLayout.LayoutParams((int) (44 * d), (int) (44 * d));
        ilp.rightMargin = (int) (14 * d);
        card.addView(iv, ilp);

        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        TextView t1 = new TextView(a);
        t1.setText(KmCfg.L(a, "Custom mouse pointer", "Custom mouse pointer", "カスタムマウスポインタ", "自定义鼠标"));
        t1.setTextSize(16f);
        t1.setTextColor(0xFFFFFFFF);
        col.addView(t1);
        TextView t2 = new TextView(a);
        t2.setText(KmCfg.L(a, "Use .cur / .ani / .png or a Windows cursor theme: arrow, link hand, text I-beam, grab",
                "Use .cur / .ani / .png or a Windows cursor theme: arrow, link hand, text I-beam, grab",
                ".cur / .ani / .png や Windows のマウステーマ: 矢印・リンク・テキスト・つかむ",
                "支持 .cur/.ani/.png 与 Windows 鼠标主题 · 箭头/链接手指/文字 I 型/抓取"));
        t2.setTextSize(12f);
        t2.setTextColor(0xFF9E9E9E);
        col.addView(t2);
        card.addView(col, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView arrow = new TextView(a);
        arrow.setText("\u203a");
        arrow.setTextSize(28f);
        arrow.setTextColor(0xFF00A88E);
        card.addView(arrow);

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.setMargins(0, (int) (16 * d), 0, (int) (16 * d));
        card.setLayoutParams(lp);

        card.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                a.startActivity(new Intent(a, CursorActivity.class));
            }
        });
        return card;
    }
}
