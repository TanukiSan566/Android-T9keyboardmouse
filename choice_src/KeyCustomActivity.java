package com.keymouse.tool;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;

import java.util.Map;

/**
 * 一级菜单"按键自定义": 菜单键 / 返回键 / * 键 的长按映射。
 * 总开关、每个键各选动作(含"关闭")和长按时间、锁屏/息屏时是否生效、排除应用。
 * 所有改动立即写 keymouse_keymap.cfg，守护进程热重读，不用重启。
 */
public class KeyCustomActivity extends Activity {
    private static final String[] PRE = { "menu", "back", "star" };

    private Map<String, String> mCfg;
    private TextView mExclSub;
    private boolean mReady = false;

    private String L(String en, String ru, String ja, String zh) {
        return KmCfg.L(this, en, ru, ja, zh);
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    private void put(String k, String v) {
        if (!mReady || v.equals(mCfg.get(k))) {
            return;
        }
        mCfg.put(k, v);
        KmCfg.save(this, mCfg);
    }

    private static String fmt(int ms) {
        return (ms / 1000) + "." + ((ms % 1000) / 100);
    }

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        setTitle(L("Key customization", "Настройка клавиш", "キーのカスタマイズ", "按键自定义"));
        mCfg = KmCfg.load(this);

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(16), dp(12), dp(16), dp(24));

        TextView title = new TextView(this);
        title.setTextSize(20f);
        title.setText(getTitle());
        box.addView(title);

        // 总开关
        Switch master = new Switch(this);
        master.setChecked(KmCfg.geti(mCfg, "kmOn", 1) != 0);
        master.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton v, boolean on) {
                put("kmOn", on ? "1" : "0");
            }
        });
        box.addView(ChoiceRow.build(this,
                L("Enable key mapping", "Включить назначения клавиш", "キー割り当てを有効にする", "启用按键映射"),
                L("On", "Вкл", "オン", "开启"), L("Off", "Выкл", "オフ", "关闭"), master));
        TextView h0 = new TextView(this);
        h0.setTextSize(12f);
        h0.setText(L("Off = every long-press action below is disabled; short presses always stay with the system.",
                "Выкл = все действия по удержанию отключены; короткие нажатия всегда остаются системе.",
                "オフ = 以下の長押し動作をすべて停止(短押しは常にシステムに渡します)",
                "关闭 = 下面所有长按动作都停用；单击始终交给系统处理。"));
        box.addView(h0);

        String[] actions = {
            L("Off", "Выкл", "オフ", "关闭"),
            L("Recent apps", "Недавние", "最近のアプリ", "最近任务"),
            L("Close foreground app", "Закрыть приложение", "前面アプリを終了", "结束前台应用"),
            L("Flashlight", "Фонарик", "ライト", "手电筒"),
            L("Go to home screen", "На рабочий стол", "ホーム画面へ", "回到桌面")
        };
        String[] keyNames = {
            L("Menu key (long press)", "Клавиша Меню (удержание)", "メニューキー(長押し)", "菜单键（长按）"),
            L("Back key (long press)", "Клавиша Назад (удержание)", "戻るキー(長押し)", "返回键（长按）"),
            L("* key (long press)", "Клавиша * (удержание)", "*キー(長押し)", "*号键（长按）")
        };
        final String holdWord = L("Hold time", "Время удержания", "長押し時間", "长按时间");
        final String secWord = L(" s", " с", " 秒", " 秒");

        for (int i = 0; i < 3; i++) {
            final String actKey = PRE[i] + "Act";
            final String msKey = PRE[i] + "Ms";
            TextView name = new TextView(this);
            name.setTextSize(16f);
            name.setPadding(0, dp(18), 0, 0);
            name.setText(keyNames[i]);
            box.addView(name);

            Spinner sp = new Spinner(this);
            sp.setAdapter(new ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, actions));
            sp.setSelection(Math.max(0, Math.min(4, KmCfg.geti(mCfg, actKey, 0))));
            sp.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                public void onItemSelected(AdapterView<?> p, View v, int pos, long id) {
                    put(actKey, String.valueOf(pos));
                }

                public void onNothingSelected(AdapterView<?> p) {
                }
            });
            box.addView(sp);

            final TextView lbl = new TextView(this);
            lbl.setTextSize(14f);
            int ms = Math.max(500, Math.min(5000, KmCfg.geti(mCfg, msKey, 1500)));
            lbl.setText(holdWord + ": " + fmt(ms) + secWord);
            box.addView(lbl);

            SeekBar sb = new SeekBar(this);
            sb.setMax(45);                       // 0.5 ~ 5.0 秒，步长 0.1 秒
            sb.setProgress(ms / 100 - 5);
            sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                    int v = (progress + 5) * 100;
                    lbl.setText(holdWord + ": " + fmt(v) + secWord);
                    if (fromUser) {
                        put(msKey, String.valueOf(v));
                    }
                }

                public void onStartTrackingTouch(SeekBar bar) {
                }

                public void onStopTrackingTouch(SeekBar bar) {
                }
            });
            box.addView(sb);
        }

        // 生效场景
        TextView sc = new TextView(this);
        sc.setTextSize(16f);
        sc.setPadding(0, dp(22), 0, 0);
        sc.setText(L("When it works", "Когда работает", "動作する場面", "生效场景"));
        box.addView(sc);
        box.addView(sceneRow("lockOk",
                L("Also on the lock screen (screen on)", "И на экране блокировки (экран включён)",
                        "ロック画面(画面点灯中)でも有効", "锁屏界面(亮屏)也生效")));
        box.addView(sceneRow("sleepOk",
                L("Also when the screen is off (sleep)", "И при выключенном экране",
                        "画面消灯中(スリープ)も有効", "息屏(休眠)时也生效")));

        // 排除应用
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(0, dp(22), 0, dp(6));
        TextView ct = new TextView(this);
        ct.setTextSize(16f);
        ct.setText(L("Excluded apps  \u203a", "Исключённые приложения  \u203a", "除外アプリ  \u203a", "排除应用  \u203a"));
        card.addView(ct);
        mExclSub = new TextView(this);
        mExclSub.setTextSize(12f);
        card.addView(mExclSub);
        card.setClickable(true);
        card.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                startActivity(new Intent(KeyCustomActivity.this, KmExclActivity.class));
            }
        });
        box.addView(card);

        mReady = true;
        ScrollView sv = new ScrollView(this);
        sv.setFillViewport(true);
        sv.addView(box);
        setContentView(sv);
    }

    @Override
    protected void onResume() {
        super.onResume();
        // 从"排除应用"页回来: 那边改了 excl，重读一遍刷新数量
        Map<String, String> fresh = KmCfg.load(this);
        mCfg.put("excl", fresh.get("excl"));
        int n = KmCfg.exclCount(mCfg);
        String tail = n == 0 ? L("none", "нет", "なし", "无") : String.valueOf(n);
        mExclSub.setText(L("Long-press actions do nothing while these apps are in front: ",
                "Действия не выполняются, пока эти приложения на переднем плане: ",
                "これらのアプリが前面にある間は長押し動作をしません: ",
                "这些应用在前台时不触发长按动作：") + tail);
    }

    private View sceneRow(final String key, String label) {
        Switch sw = new Switch(this);
        sw.setChecked(KmCfg.geti(mCfg, key, 1) != 0);
        sw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton v, boolean on) {
                put(key, on ? "1" : "0");
            }
        });
        return ChoiceRow.build(this, label, L("On", "Вкл", "オン", "开启"), L("Off", "Выкл", "オフ", "关闭"), sw);
    }
}
