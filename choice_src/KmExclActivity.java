package com.keymouse.tool;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** "排除应用"选择页: 带图标和应用名，可搜索；勾选的应用在前台时，按键自定义的长按动作不触发。 */
public class KmExclActivity extends Activity {
    static final class Item {
        String pkg;
        String label;
        Drawable icon;
    }

    private final List<Item> mAll = new ArrayList<Item>();
    private final List<Item> mShown = new ArrayList<Item>();
    private final Set<String> mSel = new LinkedHashSet<String>();
    private Map<String, String> mCfg;
    private BaseAdapter mAdapter;
    private EditText mSearch;
    private boolean mShowHidden = false;
    private TextView mLoading;

    private String L(String en, String ru, String ja, String zh) {
        return KmCfg.L(this, en, ru, ja, zh);
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    private void saveSel() {
        StringBuilder sb = new StringBuilder();
        for (String p : mSel) {
            if (sb.length() > 0) {
                sb.append(' ');
            }
            sb.append(p);
        }
        mCfg.put("excl", sb.toString());
        KmCfg.save(this, mCfg);
    }

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        setTitle(L("Excluded apps", "Исключённые приложения", "除外アプリ", "排除应用"));
        mCfg = KmCfg.load(this);
        String ex = mCfg.get("excl");
        if (ex != null && ex.trim().length() > 0) {
            for (String p : ex.trim().split("\\s+")) {
                mSel.add(p);
            }
        }

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(12), dp(8), dp(12), 0);

        TextView tip = new TextView(this);
        tip.setTextSize(12f);
        tip.setText(L("Tick the apps where long-press actions should NOT fire.",
                "Отметьте приложения, где действия не должны срабатывать.",
                "長押し動作をさせたくないアプリにチェックを入れてください。",
                "勾选的应用在前台时，长按动作不会触发。"));
        root.addView(tip);

        mSearch = new EditText(this);
        mSearch.setSingleLine(true);
        mSearch.setHint(L("Search", "Поиск", "検索", "搜索"));
        mSearch.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int a, int c, int d) {
            }

            public void onTextChanged(CharSequence s, int a, int c, int d) {
            }

            public void afterTextChanged(Editable e) {
                refilter();
            }
        });
        root.addView(mSearch);

        CheckBox hid = new CheckBox(this);
        hid.setTextSize(13f);
        hid.setText(L("Also show apps without a launcher icon", "Показать и приложения без значка",
                "アイコンのないアプリも表示", "同时显示没有桌面图标的应用"));
        hid.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton v, boolean on) {
                mShowHidden = on;
                load();
            }
        });
        root.addView(hid);

        mLoading = new TextView(this);
        mLoading.setGravity(Gravity.CENTER);
        mLoading.setText(L("Loading...", "Загрузка...", "読み込み中...", "加载中..."));
        root.addView(mLoading);

        ListView lv = new ListView(this);
        mAdapter = new BaseAdapter() {
            public int getCount() {
                return mShown.size();
            }

            public Object getItem(int i) {
                return mShown.get(i);
            }

            public long getItemId(int i) {
                return i;
            }

            public View getView(int i, View cv, ViewGroup parent) {
                LinearLayout row;
                if (cv == null) {
                    row = new LinearLayout(KmExclActivity.this);
                    row.setOrientation(LinearLayout.HORIZONTAL);
                    row.setGravity(Gravity.CENTER_VERTICAL);
                    row.setPadding(0, dp(6), 0, dp(6));
                    ImageView iv = new ImageView(KmExclActivity.this);
                    iv.setId(1);
                    row.addView(iv, new LinearLayout.LayoutParams(dp(40), dp(40)));
                    LinearLayout col = new LinearLayout(KmExclActivity.this);
                    col.setOrientation(LinearLayout.VERTICAL);
                    col.setPadding(dp(12), 0, dp(8), 0);
                    TextView t1 = new TextView(KmExclActivity.this);
                    t1.setId(2);
                    t1.setTextSize(16f);
                    t1.setSingleLine(true);
                    TextView t2 = new TextView(KmExclActivity.this);
                    t2.setId(3);
                    t2.setTextSize(11f);
                    t2.setSingleLine(true);
                    col.addView(t1);
                    col.addView(t2);
                    row.addView(col, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
                    CheckBox cb = new CheckBox(KmExclActivity.this);
                    cb.setId(4);
                    cb.setClickable(false);
                    cb.setFocusable(false);
                    row.addView(cb);
                } else {
                    row = (LinearLayout) cv;
                }
                Item it = mShown.get(i);
                ((ImageView) row.findViewById(1)).setImageDrawable(it.icon);
                ((TextView) row.findViewById(2)).setText(it.label);
                ((TextView) row.findViewById(3)).setText(it.pkg);
                ((CheckBox) row.findViewById(4)).setChecked(mSel.contains(it.pkg));
                return row;
            }
        };
        lv.setAdapter(mAdapter);
        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> p, View v, int pos, long id) {
                Item it = mShown.get(pos);
                if (!mSel.remove(it.pkg)) {
                    mSel.add(it.pkg);
                }
                saveSel();
                mAdapter.notifyDataSetChanged();
            }
        });
        root.addView(lv, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        setContentView(root);
        load();
    }

    /** 后台读应用列表(带图标)，读完回到界面线程刷新。 */
    private void load() {
        mLoading.setVisibility(View.VISIBLE);
        final boolean hidden = mShowHidden;
        final Handler h = new Handler();
        new Thread(new Runnable() {
            public void run() {
                final List<Item> out = new ArrayList<Item>();
                try {
                    PackageManager pm = getPackageManager();
                    Set<String> seen = new LinkedHashSet<String>();
                    Intent li = new Intent(Intent.ACTION_MAIN);
                    li.addCategory(Intent.CATEGORY_LAUNCHER);
                    for (ResolveInfo ri : pm.queryIntentActivities(li, 0)) {
                        String pkg = ri.activityInfo.packageName;
                        if (!seen.add(pkg) || pkg.equals(getPackageName())) {
                            continue;
                        }
                        Item it = new Item();
                        it.pkg = pkg;
                        it.label = String.valueOf(ri.loadLabel(pm));
                        it.icon = ri.loadIcon(pm);
                        out.add(it);
                    }
                    if (hidden) {
                        for (ApplicationInfo ai : pm.getInstalledApplications(0)) {
                            if (!seen.add(ai.packageName) || ai.packageName.equals(getPackageName())) {
                                continue;
                            }
                            Item it = new Item();
                            it.pkg = ai.packageName;
                            it.label = String.valueOf(ai.loadLabel(pm));
                            it.icon = ai.loadIcon(pm);
                            out.add(it);
                        }
                    }
                    // 已勾选但不在列表里的(比如已卸载/隐藏的): 也留在列表里，才能取消勾选
                    for (String p : mSel) {
                        if (seen.add(p)) {
                            Item it = new Item();
                            it.pkg = p;
                            it.label = p;
                            it.icon = pm.getDefaultActivityIcon();
                            out.add(it);
                        }
                    }
                } catch (Throwable ignore) {
                }
                h.post(new Runnable() {
                    public void run() {
                        mAll.clear();
                        mAll.addAll(out);
                        mLoading.setVisibility(View.GONE);
                        refilter();
                    }
                });
            }
        }).start();
    }

    private void refilter() {
        String q = mSearch.getText().toString().trim().toLowerCase();
        mShown.clear();
        for (Item it : mAll) {
            if (q.length() == 0 || it.label.toLowerCase().contains(q) || it.pkg.toLowerCase().contains(q)) {
                mShown.add(it);
            }
        }
        // 已勾选的排前面，其余按名称
        Collections.sort(mShown, new Comparator<Item>() {
            public int compare(Item a, Item b) {
                boolean sa = mSel.contains(a.pkg);
                boolean sb = mSel.contains(b.pkg);
                if (sa != sb) {
                    return sa ? -1 : 1;
                }
                return a.label.compareToIgnoreCase(b.label);
            }
        });
        mAdapter.notifyDataSetChanged();
    }
}
