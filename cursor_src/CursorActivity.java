package com.keymouse.tool;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;

/**
 * 二级页面\"自定义鼠标\": 开关、大小、智能手型(无障碍)、长按抓取时间、指针库导入、
 * 4 个状态(箭头/手型/文字/抓取)各选一个 .cur/.ani/.png，或一键套用整套 Windows 鼠标主题。
 * 所有改动立即写 keymouse_cursor_theme.cfg，光标层 0.5 秒内热更新，不用重启。
 */
public class CursorActivity extends Activity {
    private Map<String, String> mCfg;
    private final Handler mH = new Handler(Looper.getMainLooper());
    private LinearLayout mBox;
    private TextView mA11yStatus;
    private TextView mLibInfo;
    private LinearLayout mThemes;
    private LinearLayout mSlots;
    private Switch mSmartSw;
    private boolean mBuilding = true;

    private String S(String zh, String ja, String en) {
        return KmCfg.L(this, en, en, ja, zh);
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    private void put(String k, String v) {
        if (v == null) {
            mCfg.remove(k);
        } else {
            mCfg.put(k, v);
        }
        CursorCfg.save(this, mCfg);
    }

    private String slotName(String slot) {
        if ("arrow".equals(slot)) {
            return S("常规 · 箭头", "通常・矢印", "Normal · arrow");
        }
        if ("hand".equals(slot)) {
            return S("链接 · 手指", "リンク・指", "Link · hand");
        }
        if ("ibeam".equals(slot)) {
            return S("文字 · I 型", "テキスト・Iビーム", "Text · I-beam");
        }
        return S("抓取 · 长按图标/拖动", "つかむ・長押し/ドラッグ", "Grab · long-press / drag");
    }

    private TextView title(String t) {
        TextView v = new TextView(this);
        v.setTextSize(16f);
        v.setPadding(0, dp(22), 0, dp(4));
        v.setText(t);
        return v;
    }

    private TextView hint(String t) {
        TextView v = new TextView(this);
        v.setTextSize(12f);
        v.setAlpha(0.75f);
        v.setText(t);
        return v;
    }

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        setTitle(S("自定义鼠标", "カスタムマウスポインタ", "Custom mouse pointer"));
        mCfg = CursorCfg.load(this);
        int pad = dp(16);
        mBox = new LinearLayout(this);
        mBox.setOrientation(LinearLayout.VERTICAL);
        mBox.setPadding(pad, pad, pad, pad);

        // 总开关
        Switch on = new Switch(this);
        on.setTextSize(16f);
        on.setText(S("启用自定义鼠标", "カスタムポインタを使う", "Use custom pointer"));
        on.setChecked(CursorCfg.geti(mCfg, "on", 0) != 0);
        on.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton v, boolean c) {
                if (!mBuilding) {
                    put("on", c ? "1" : "0");
                }
            }
        });
        mBox.addView(on);
        mBox.addView(hint(S("关闭 = 用内置的黄红箭头。自定义鼠标画在\"自绘光标\"上，所以主界面\"鼠标软开关\"里的\"自绘光标\"要保持开启。",
                "オフ = 内蔵の黄赤の矢印。メイン画面の「自前カーソル」がオンである必要があります。",
                "Off = built-in yellow/red arrow. Needs the \"self-drawn cursor\" switch on the main screen.")));

        // 大小
        final TextView sizeLbl = new TextView(this);
        sizeLbl.setTextSize(16f);
        sizeLbl.setPadding(0, dp(20), 0, 0);
        int size = Math.max(16, Math.min(72, CursorCfg.geti(mCfg, "size", 32)));
        final String sizeWord = S("指针大小", "ポインタの大きさ", "Pointer size");
        sizeLbl.setText(sizeWord + ": " + size + " dp");
        mBox.addView(sizeLbl);
        SeekBar sb = new SeekBar(this);
        sb.setMax(72 - 16);
        sb.setProgress(size - 16);
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar bar, int p, boolean fromUser) {
                sizeLbl.setText(sizeWord + ": " + (p + 16) + " dp");
                if (fromUser) {
                    put("size", String.valueOf(p + 16));
                }
            }

            public void onStartTrackingTouch(SeekBar bar) {
            }

            public void onStopTrackingTouch(SeekBar bar) {
            }
        });
        mBox.addView(sb);

        // 智能手型/文字
        mSmartSw = new Switch(this);
        mSmartSw.setTextSize(16f);
        mSmartSw.setPadding(0, dp(20), 0, 0);
        mSmartSw.setText(S("智能手型 / 文字光标", "スマート手型 / テキストカーソル", "Smart hand / text cursor"));
        mSmartSw.setChecked(CursorCfg.geti(mCfg, "smart", 1) != 0 && CursorCfg.a11yListed(this));
        mSmartSw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton v, boolean c) {
                if (!mBuilding) {
                    smartToggled(c);
                }
            }
        });
        mBox.addView(mSmartSw);
        mBox.addView(hint(S("鼠标停在可点击控件上显示\"链接手指\"，停在输入框/可选文字上显示\"文字 I 型\"。靠无障碍服务查界面，由 root 自动开启，不用你去设置里点；指针停下约 0.1~0.3 秒后才会变。服务只查位置下的控件类型，不读内容。",
                "クリック可能な部品の上では「リンク」、入力欄/選択可能テキストの上では「Iビーム」。アクセシビリティサービスで調べ、root が自動で有効化します。ポインタが止まってから約0.1〜0.3秒後に切り替わります。",
                "Shows the link hand over clickable controls and the I-beam over text fields. Uses an accessibility service that root enables automatically; the pointer changes ~0.1-0.3 s after it stops. It only checks the control type under the pointer, never reads content.")));
        mA11yStatus = new TextView(this);
        mA11yStatus.setTextSize(13f);
        mA11yStatus.setPadding(0, dp(4), 0, 0);
        mBox.addView(mA11yStatus);

        // 抓取时间
        final TextView gl = new TextView(this);
        gl.setTextSize(16f);
        gl.setPadding(0, dp(20), 0, 0);
        int g = Math.max(200, Math.min(1500, CursorCfg.geti(mCfg, "grabms", 450)));
        final String gw = S("长按多久变\"抓取\"", "何ミリ秒の長押しで「つかむ」", "Long-press time for grab");
        gl.setText(gw + ": " + g + " ms");
        mBox.addView(gl);
        SeekBar gs = new SeekBar(this);
        gs.setMax((1500 - 200) / 50);
        gs.setProgress((g - 200) / 50);
        gs.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar bar, int p, boolean fromUser) {
                gl.setText(gw + ": " + (200 + p * 50) + " ms");
                if (fromUser) {
                    put("grabms", String.valueOf(200 + p * 50));
                }
            }

            public void onStartTrackingTouch(SeekBar bar) {
            }

            public void onStopTrackingTouch(SeekBar bar) {
            }
        });
        mBox.addView(gs);
        mBox.addView(hint(S("按住中间键超过这个时间(且指针下不是文字)，就换成\"抓取\"样式，用在长按应用图标拖动。",
                "決定キーをこの時間より長く押し続けると(テキスト上以外)「つかむ」に切り替わります。",
                "Holding the centre key longer than this (not over text) switches to the grab pointer.")));

        // 指针库
        mBox.addView(title(S("指针库", "ポインタライブラリ", "Pointer library")));
        mBox.addView(hint(S("把 .cur / .ani / .png 文件，或整套 Windows 鼠标主题文件夹(含 .inf 更好)，放到手机存储根目录的 keymousecursor 文件夹里，再点下面的按钮导入。",
                ".cur / .ani / .png、または Windows のマウステーマフォルダ(.inf 付き推奨)を、ストレージ直下の keymousecursor フォルダに置いて、下のボタンで取り込みます。",
                "Put .cur / .ani / .png files or a whole Windows cursor-theme folder (with its .inf) into the keymousecursor folder in internal storage, then tap import.")));
        Button imp = new Button(this);
        imp.setText(S("从 keymousecursor 导入(root)", "keymousecursor から取り込み(root)", "Import from keymousecursor (root)"));
        imp.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                doImport((Button) v);
            }
        });
        mBox.addView(imp);
        mLibInfo = new TextView(this);
        mLibInfo.setTextSize(13f);
        mBox.addView(mLibInfo);

        mBox.addView(title(S("套用整套主题", "テーマを丸ごと適用", "Apply a whole theme")));
        mThemes = new LinearLayout(this);
        mThemes.setOrientation(LinearLayout.VERTICAL);
        mBox.addView(mThemes);

        mBox.addView(title(S("各状态的指针", "状態ごとのポインタ", "Pointer for each state")));
        mSlots = new LinearLayout(this);
        mSlots.setOrientation(LinearLayout.VERTICAL);
        mBox.addView(mSlots);
        mBox.addView(hint(S("没设的状态沿用\"常规\"那个；\"常规\"也没设就用内置箭头。.cur 自带热点；png 没有热点，用右边按钮选热点位置(左上/上边中间/正中)。.ani 会按文件里的帧和速度播放。",
                "未設定の状態は「通常」を使い、それも未設定なら内蔵の矢印。.cur はホットスポット内蔵、png は右のボタンで位置(左上/上中央/中央)を選びます。.ani はフレームと速度どおりに再生します。",
                "Unset states fall back to Normal, then to the built-in arrow. .cur carries its hotspot; for png pick one with the button (top-left / top-centre / centre). .ani plays with its own frames and rates.")));

        mBuilding = false;
        refreshAll();
        ScrollView sv = new ScrollView(this);
        sv.setFillViewport(true);
        sv.addView(mBox);
        setContentView(sv);
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshA11yStatus();
    }

    private void refreshAll() {
        File lib = CursorCfg.lib(this);
        ArrayList<String> files = CursorCfg.listFiles(lib);
        ArrayList<String> themes = CursorCfg.listThemes(lib);
        mLibInfo.setText(S("库里现有 ", "ライブラリ: ", "Library: ") + files.size()
                + S(" 个指针文件，", " 個のファイル、", " files, ") + themes.size() + S(" 套主题文件夹", " 個のテーマフォルダ", " theme folders"));
        rebuildThemes(themes);
        rebuildSlots();
        refreshA11yStatus();
    }

    private void rebuildThemes(ArrayList<String> themes) {
        mThemes.removeAllViews();
        if (themes.isEmpty()) {
            mThemes.addView(hint(S("还没有主题文件夹(单个文件请在下面各状态里选)。", "テーマフォルダはまだありません(単体ファイルは下で選択)。", "No theme folders yet (pick single files below).")));
            return;
        }
        for (final String t : themes) {
            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            TextView n = new TextView(this);
            n.setTextSize(15f);
            n.setText(t);
            row.addView(n, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            Button ap = new Button(this);
            ap.setText(S("套用", "適用", "Apply"));
            ap.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    applyTheme(t);
                }
            });
            row.addView(ap);
            mThemes.addView(row);
        }
    }

    private void applyTheme(String t) {
        Map<String, String> m = CursorCfg.themeFromFolder(CursorCfg.lib(this), t);
        int n = 0;
        for (String slot : CursorCfg.SLOTS) {
            String p = m.get(slot);
            put(slot, p);
            if (p != null) {
                n++;
            }
        }
        put("on", "1");
        rebuildSlots();
        mBuilding = true;
        mBuilding = false;
        Toast.makeText(this, S("已套用 \"", "適用しました \"", "Applied \"") + t + "\" (" + n + "/4)", Toast.LENGTH_SHORT).show();
        // 开关显示同步
        recreateSoon();
    }

    private void recreateSoon() {
        mH.postDelayed(new Runnable() {
            public void run() {
                recreate();
            }
        }, 150);
    }

    private void rebuildSlots() {
        mSlots.removeAllViews();
        for (final String slot : CursorCfg.SLOTS) {
            LinearLayout card = new LinearLayout(this);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(0, dp(10), 0, dp(6));
            TextView nm = new TextView(this);
            nm.setTextSize(15f);
            nm.setText(slotName(slot));
            card.addView(nm);

            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            ImageView iv = new ImageView(this);
            iv.setBackgroundColor(0xFFDDDDDD);
            iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
            iv.setPadding(dp(3), dp(3), dp(3), dp(3));
            row.addView(iv, new LinearLayout.LayoutParams(dp(48), dp(48)));
            TextView fn = new TextView(this);
            fn.setTextSize(13f);
            fn.setPadding(dp(10), 0, dp(6), 0);
            String rel = mCfg.get(slot);
            if (rel == null || rel.length() == 0) {
                fn.setText(S("未设置", "未設定", "Not set"));
                fn.setAlpha(0.6f);
            } else {
                fn.setText(rel);
                CurLoader.Set s = CurLoader.load(new File(CursorCfg.lib(this), rel), hsOf(slot));
                if (s != null) {
                    Bitmap f0 = s.frames[s.frameAt(0)];
                    iv.setImageBitmap(f0);
                    fn.setText(rel + "\n" + f0.getWidth() + "×" + f0.getHeight()
                            + (s.animated() ? S("  动画 ", "  アニメ ", "  anim ") + s.seq.length + S(" 步", " ステップ", " steps") : ""));
                } else {
                    fn.setText(rel + "\n" + S("(读取失败)", "(読み込み失敗)", "(failed to read)"));
                }
            }
            row.addView(fn, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            card.addView(row);

            LinearLayout btns = new LinearLayout(this);
            btns.setOrientation(LinearLayout.HORIZONTAL);
            Button pick = new Button(this);
            pick.setText(S("选择", "選択", "Pick"));
            pick.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    pickFile(slot);
                }
            });
            btns.addView(pick, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            Button clr = new Button(this);
            clr.setText(S("清除", "クリア", "Clear"));
            clr.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    put(slot, null);
                    rebuildSlots();
                }
            });
            btns.addView(clr, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            Button hs = new Button(this);
            hs.setText(S("热点:", "ホットスポット:", "Hotspot: ") + hsName(hsOf(slot)));
            hs.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    put("hs_" + slot, String.valueOf((hsOf(slot) + 1) % 3));
                    rebuildSlots();
                }
            });
            btns.addView(hs, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1.3f));
            card.addView(btns);
            mSlots.addView(card);
        }
    }

    private int hsOf(String slot) {
        return CursorCfg.geti(mCfg, "hs_" + slot, CursorCfg.defHotspot(slot));
    }

    private String hsName(int m) {
        return m == 0 ? S("左上", "左上", "top-left") : m == 1 ? S("上中", "上中央", "top-centre") : S("正中", "中央", "centre");
    }

    private void pickFile(final String slot) {
        ArrayList<String> fs = CursorCfg.listFiles(CursorCfg.lib(this));
        if (fs.isEmpty()) {
            Toast.makeText(this, S("库是空的，先把文件放进 keymousecursor 再导入", "ライブラリが空です。先に keymousecursor に置いて取り込んでください",
                    "Library is empty: put files in keymousecursor and import first"), Toast.LENGTH_LONG).show();
            return;
        }
        final String[] arr = fs.toArray(new String[0]);
        new AlertDialog.Builder(this).setTitle(slotName(slot)).setItems(arr, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface d, int which) {
                put(slot, arr[which]);
                put("on", "1");
                recreateSoon();
            }
        }).show();
    }

    private void doImport(final Button btn) {
        btn.setEnabled(false);
        final CharSequence old = btn.getText();
        btn.setText("…");
        new Thread(new Runnable() {
            public void run() {
                final boolean ok = CursorCfg.importLib(CursorActivity.this);
                mH.post(new Runnable() {
                    public void run() {
                        btn.setEnabled(true);
                        btn.setText(old);
                        if (!ok) {
                            Toast.makeText(CursorActivity.this, S("导入失败(没有 root 权限？)", "取り込み失敗(root 権限なし？)", "Import failed (no root?)"), Toast.LENGTH_LONG).show();
                        }
                        refreshAll();
                    }
                });
            }
        }).start();
    }

    private void smartToggled(final boolean c) {
        put("smart", c ? "1" : "0");
        mA11yStatus.setText("…");
        new Thread(new Runnable() {
            public void run() {
                final boolean ok = CursorCfg.setA11y(c);
                mH.postDelayed(new Runnable() {
                    public void run() {
                        if (!ok) {
                            Toast.makeText(CursorActivity.this, S("自动开启无障碍失败(没有 root 权限？)，请手动到 系统设置 > 无障碍 开启 KeyMouse",
                                    "自動有効化に失敗(root なし？)。設定 > ユーザー補助 で KeyMouse を有効にしてください",
                                    "Auto-enable failed (no root?). Enable KeyMouse in Settings > Accessibility."), Toast.LENGTH_LONG).show();
                        }
                        refreshA11yStatus();
                    }
                }, 800);
            }
        }).start();
    }

    private void refreshA11yStatus() {
        if (mA11yStatus == null) {
            return;
        }
        boolean listed = CursorCfg.a11yListed(this);
        boolean live = CursorHit.available();
        String s = live ? S("无障碍服务: 已连接，正在工作", "サービス: 接続済み", "Service: connected")
                : listed ? S("无障碍服务: 已启用，等待连接…(若一直不连接，关再开一次上面的开关)", "サービス: 有効、接続待ち…", "Service: enabled, waiting to connect…")
                : S("无障碍服务: 未开启(打开上面的开关即可，需要 root)", "サービス: 無効(上のスイッチで有効化、root 必要)", "Service: off (turn the switch on; needs root)");
        mA11yStatus.setText(s);
        mA11yStatus.setTextColor(live ? 0xFF1B8A3A : 0xFF9E6A00);
    }
}
