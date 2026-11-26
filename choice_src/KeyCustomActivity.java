package com.keymouse.tool;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Map;

/**
 * 一级菜单"按键自定义": 实体按键映射。
 * 每条映射 = 1~4 个实体键(同时按住) + 一个动作；点下面的"+"，同时按住想用的键再全部松开，就学成一条。
 * 所有映射共用一个"长按时间"。另有总开关、锁屏/息屏时是否生效、排除应用。
 * 所有改动立即写 keymouse_keymap.cfg，守护进程热重读，不用重启。
 */
public class KeyCustomActivity extends Activity {
    /** 下拉框第几项 -> 动作号(1 最近任务 2 结束前台 3 手电筒 4 回到桌面 5 截屏) */
    private static final int[] ACT = { 1, 2, 5, 3, 4 };
    private static final int MAX_MAPS = 16;

    private Map<String, String> mCfg;
    private ArrayList<int[]> mMaps;
    private LinearLayout mList;
    private TextView mExclSub;
    private TextView mStatus;
    private Button mAdd;
    private final Handler mH = new Handler(Looper.getMainLooper());
    private boolean mReady = false;
    private boolean mLearning = false;
    private String mLastSeq = "";
    private long mLearnStart = 0;

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

    private void saveMaps() {
        mCfg.put("maps", KmCfg.serializeMaps(mMaps));
        KmCfg.save(this, mCfg);
    }

    private static String fmt(int ms) {
        return (ms / 1000) + "." + ((ms % 1000) / 100);
    }

    private File dir() {
        return getFilesDir();
    }

    /** 键码 -> 显示名；-1 = 任意星号键 */
    private String keyLabel(int c) {
        if (c == -1) {
            return "*";
        }
        if (c == 139) {
            return L("Menu", "Меню", "メニュー", "菜单");
        }
        if (c == 158) {
            return L("Back", "Назад", "戻る", "返回");
        }
        return ToggleKeys.keyName(this, c);
    }

    private String comboLabel(int[] e) {
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i < e.length; i++) {
            if (i > 1) {
                sb.append(" + ");
            }
            sb.append(keyLabel(e[i]));
        }
        return sb.toString();
    }

    private String[] actionNames() {
        return new String[] {
            L("Recent apps", "Недавние", "最近のアプリ", "最近任务"),
            L("Close foreground app", "Закрыть приложение", "前面アプリを終了", "结束前台应用"),
            L("Screenshot (root)", "Скриншот (root)", "スクリーンショット(root)", "截屏(root)"),
            L("Flashlight", "Фонарик", "ライト", "手电筒"),
            L("Go to home screen", "На рабочий стол", "ホーム画面へ", "回到桌面")
        };
    }

    private static int actIndex(int act) {
        for (int i = 0; i < ACT.length; i++) {
            if (ACT[i] == act) {
                return i;
            }
        }
        return 0;
    }

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        setTitle(L("Key customization", "Настройка клавиш", "キーのカスタマイズ", "按键自定义"));
        mCfg = KmCfg.load(this);
        mMaps = KmCfg.parseMaps(mCfg.get("maps"));
        mLastSeq = readLearnedSeq();

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
        h0.setText(L("Off = every mapping below is disabled; short presses always stay with the system.",
                "Выкл = все назначения отключены; короткие нажатия всегда остаются системе.",
                "オフ = 以下の割り当てをすべて停止(短押しは常にシステムに渡します)",
                "关闭 = 下面所有映射都停用；单击始终交给系统处理。"));
        box.addView(h0);

        // 映射列表
        TextView mt = new TextView(this);
        mt.setTextSize(16f);
        mt.setPadding(0, dp(20), 0, dp(4));
        mt.setText(L("Key mappings (hold 1-4 keys together)", "Назначения (удержание 1-4 клавиш вместе)",
                "キー割り当て(1〜4個を同時に長押し)", "按键映射（同时长按 1~4 个键）"));
        box.addView(mt);

        mList = new LinearLayout(this);
        mList.setOrientation(LinearLayout.VERTICAL);
        box.addView(mList);

        // "+" 按钮: 学一个新组合
        mAdd = new Button(this);
        mAdd.setTextSize(26f);
        mAdd.setText("+");
        mAdd.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                toggleLearn();
            }
        });
        box.addView(mAdd);
        mStatus = new TextView(this);
        mStatus.setTextSize(13f);
        mStatus.setAlpha(0.8f);
        box.addView(mStatus);

        // 长按时间(所有映射共用)，在 + 的下面
        final TextView lbl = new TextView(this);
        lbl.setTextSize(16f);
        lbl.setPadding(0, dp(18), 0, 0);
        int ms = Math.max(500, Math.min(5000, KmCfg.geti(mCfg, "holdMs", 1500)));
        final String holdWord = L("Long-press time (all mappings)", "Время удержания (для всех)",
                "長押し時間(すべて共通)", "长按时间（所有映射共用）");
        final String secWord = L(" s", " с", " 秒", " 秒");
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
                    put("holdMs", String.valueOf(v));
                }
            }

            public void onStartTrackingTouch(SeekBar bar) {
            }

            public void onStopTrackingTouch(SeekBar bar) {
            }
        });
        box.addView(sb);

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
        ct.setText(L("Excluded apps  ›", "Исключённые приложения  ›", "除外アプリ  ›", "排除应用  ›"));
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
        rebuildList();
        refreshAddButton();
        ScrollView sv = new ScrollView(this);
        sv.setFillViewport(true);
        sv.addView(box);
        setContentView(sv);
    }

    /** 重画映射卡片: 每条 = 键组合 + 动作下拉 + × 删除 */
    private void rebuildList() {
        mList.removeAllViews();
        if (mMaps.isEmpty()) {
            TextView none = new TextView(this);
            none.setTextSize(13f);
            none.setAlpha(0.7f);
            none.setText(L("No mappings yet. Tap + below.", "Пока нет назначений. Нажмите + ниже.",
                    "割り当てはまだありません。下の + を押してください。", "还没有映射，点下面的 + 添加。"));
            mList.addView(none);
            return;
        }
        String[] names = actionNames();
        for (int i = 0; i < mMaps.size(); i++) {
            final int[] e = mMaps.get(i);
            LinearLayout card = new LinearLayout(this);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(0, dp(10), 0, dp(6));

            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(android.view.Gravity.CENTER_VERTICAL);
            TextView combo = new TextView(this);
            combo.setTextSize(17f);
            combo.setText(comboLabel(e));
            row.addView(combo, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            Button del = new Button(this);
            del.setText("×");
            del.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    mMaps.remove(e);
                    saveMaps();
                    rebuildList();
                    refreshAddButton();
                }
            });
            row.addView(del);
            card.addView(row);

            Spinner sp = new Spinner(this);
            sp.setAdapter(new ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, names));
            sp.setSelection(actIndex(e[0]));
            sp.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                public void onItemSelected(AdapterView<?> p, View v, int pos, long id) {
                    int act = ACT[pos];
                    if (e[0] != act) {
                        e[0] = act;
                        saveMaps();
                    }
                }

                public void onNothingSelected(AdapterView<?> p) {
                }
            });
            card.addView(sp);
            mList.addView(card);
        }
    }

    private void refreshAddButton() {
        if (mLearning) {
            mAdd.setText(L("Cancel", "Отмена", "キャンセル", "取消"));
            mAdd.setEnabled(true);
            mStatus.setText(L("Hold the key(s) you want (1-4 keys together), then release all (within 8 s)...",
                    "Зажмите нужные клавиши (1-4 вместе), затем отпустите все (8 с)...",
                    "使いたいキーを同時に押し続け(1〜4個)、すべて離してください(8秒以内)...",
                    "请同时按住想用的键（1~4 个），然后全部松开（8 秒内）…"));
        } else {
            mAdd.setText("+");
            mAdd.setEnabled(mMaps.size() < MAX_MAPS);
            mStatus.setText("");
        }
    }

    private void toggleLearn() {
        if (mLearning) {
            mLearning = false;
            ToggleKeys.sendCmd(dir(), "learn_cancel");
            refreshAddButton();
            return;
        }
        if (!new File(dir(), "keymouse.pid").exists()) {
            mStatus.setText(L("Turn on the main switch first.", "Сначала включите главный переключатель.",
                    "先にメインスイッチをオンにしてください。", "请先打开主界面的鼠标总开关。"));
            return;
        }
        mLastSeq = readLearnedSeq();
        mLearning = true;
        mLearnStart = System.currentTimeMillis();
        ToggleKeys.sendCmd(dir(), "learn_map");
        refreshAddButton();
        mH.removeCallbacks(mPoll);
        mH.postDelayed(mPoll, 300);
    }

    /** keymouse_learned 第一行 "序号 键码 键码..." */
    private String[] readLearned() {
        try {
            BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(new File(dir(), "keymouse_learned"))));
            try {
                String s = r.readLine();
                return s == null ? null : s.trim().split("\\s+");
            } finally {
                r.close();
            }
        } catch (Throwable t) {
            return null;
        }
    }

    private String readLearnedSeq() {
        String[] p = readLearned();
        return p == null || p.length == 0 ? "" : p[0];
    }

    private final Runnable mPoll = new Runnable() {
        public void run() {
            if (!mLearning) {
                return;
            }
            String[] p = readLearned();
            if (p != null && p.length >= 2 && !p[0].equals(mLastSeq)) {
                mLastSeq = p[0];
                mLearning = false;
                addLearned(p);
                refreshAddButton();
                return;
            }
            if (System.currentTimeMillis() - mLearnStart > 10000L) {
                // 守护进程 8 秒窗口已过，没学到
                mLearning = false;
                refreshAddButton();
                return;
            }
            mH.postDelayed(this, 300);
        }
    };

    private void addLearned(String[] p) {
        int[] e = new int[p.length];
        int n = 1;
        e[0] = 1;                                    // 新映射默认"最近任务"，在卡片里再改
        try {
            for (int i = 1; i < p.length && n < 5; i++) {
                int c = Integer.parseInt(p[i]);
                if (c == 55 || c == 227 || c == 0x20a) {
                    c = -1;                          // 各种星号键码统一成"任意星号键"
                }
                boolean dup = false;
                for (int j = 1; j < n; j++) {
                    if (e[j] == c) {
                        dup = true;
                    }
                }
                if (!dup) {
                    e[n++] = c;
                }
            }
        } catch (Throwable t) {
            return;
        }
        if (n < 2) {
            return;
        }
        int[] r = new int[n];
        System.arraycopy(e, 0, r, 0, n);
        for (int[] old : mMaps) {
            if (sameKeys(old, r)) {
                Toast.makeText(this, L("That key combination already exists", "Такая комбинация уже есть",
                        "そのキーの組み合わせは既にあります", "这个组合已经存在"), Toast.LENGTH_SHORT).show();
                return;
            }
        }
        mMaps.add(r);
        saveMaps();
        rebuildList();
    }

    private static boolean sameKeys(int[] a, int[] b) {
        if (a.length != b.length) {
            return false;
        }
        for (int i = 1; i < a.length; i++) {
            boolean found = false;
            for (int j = 1; j < b.length; j++) {
                if (a[i] == b[j]) {
                    found = true;
                }
            }
            if (!found) {
                return false;
            }
        }
        return true;
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (mLearning) {
            mLearning = false;
            ToggleKeys.sendCmd(dir(), "learn_cancel");
        }
        mH.removeCallbacks(mPoll);
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (mAdd != null) {
            refreshAddButton();
        }
        // 从"排除应用"页回来: 那边改了 excl，重读一遍刷新数量
        Map<String, String> fresh = KmCfg.load(this);
        mCfg.put("excl", fresh.get("excl"));
        int n = KmCfg.exclCount(mCfg);
        String tail = n == 0 ? L("none", "нет", "なし", "无") : String.valueOf(n);
        mExclSub.setText(L("Mappings do nothing while these apps are in front: ",
                "Назначения не работают, пока эти приложения на переднем плане: ",
                "これらのアプリが前面にある間は割り当てが動作しません: ",
                "这些应用在前台时不触发映射：") + tail);
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
