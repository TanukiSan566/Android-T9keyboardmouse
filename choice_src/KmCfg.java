package com.keymouse.tool;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * "按键自定义"的配置读写 (files/keymouse_keymap.cfg，守护进程检测到文件变化马上热重读)。
 * KeyCustomActivity 和 KmExclActivity 共用这一份，保存时整份写回，互不覆盖。
 * 键: kmOn / menuAct menuMs / backAct backMs / starAct starMs / lockOk / sleepOk / excl
 * 动作: 0 关闭 1 最近任务 2 结束前台应用 3 手电筒 4 回到桌面
 */
final class KmCfg {
    private KmCfg() {
    }

    static File file(Context c) {
        return new File(c.getFilesDir(), "keymouse_keymap.cfg");
    }

    static String L(Context c, String en, String ru, String ja, String zh) {
        SharedPreferences sp = c.getSharedPreferences("keymouse", 0);
        int l = sp.getInt("lang", 0);
        return l == 1 ? ru : l == 2 ? ja : l == 3 ? zh : en;
    }

    static int geti(Map<String, String> m, String k, int d) {
        try {
            return Integer.parseInt(m.get(k).trim());
        } catch (Throwable t) {
            return d;
        }
    }

    private static Map<String, String> readLines(File f) {
        Map<String, String> m = new LinkedHashMap<String, String>();
        try {
            BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(f), "UTF-8"));
            try {
                String line;
                while ((line = r.readLine()) != null) {
                    int i = line.indexOf('=');
                    if (i > 0) {
                        m.put(line.substring(0, i).trim(), line.substring(i + 1).trim());
                    }
                }
            } finally {
                r.close();
            }
        } catch (Throwable ignore) {
        }
        return m;
    }

    /** 读配置；文件还不存在(从旧版升级)时，用旧 keymouse_hold.cfg 里的长按时间垫底，动作用旧的固定映射。 */
    static Map<String, String> load(Context c) {
        File f = file(c);
        int[] ms = { 1500, 1500, 2000 };
        boolean[] on = { true, true, true };
        Map<String, String> m;
        if (f.exists()) {
            m = readLines(f);
        } else {
            m = new LinkedHashMap<String, String>();
            Map<String, String> old = readLines(new File(c.getFilesDir(), "keymouse_hold.cfg"));
            String[] keys = { "menuHold", "backHold", "starHold" };
            for (int i = 0; i < 3; i++) {
                int v = geti(old, keys[i], ms[i]);
                if (v <= 0) {
                    on[i] = false;
                } else {
                    ms[i] = Math.max(500, Math.min(5000, v));
                }
            }
        }
        String[] pre = { "menu", "back", "star" };
        int[] defAct = { 1, 2, 3 };
        if (!m.containsKey("kmOn")) {
            m.put("kmOn", "1");
        }
        for (int i = 0; i < 3; i++) {
            if (!m.containsKey(pre[i] + "Act")) {
                m.put(pre[i] + "Act", String.valueOf(on[i] ? defAct[i] : 0));
            }
            if (!m.containsKey(pre[i] + "Ms")) {
                m.put(pre[i] + "Ms", String.valueOf(ms[i]));
            }
        }
        if (!m.containsKey("lockOk")) {
            m.put("lockOk", "1");
        }
        if (!m.containsKey("sleepOk")) {
            m.put("sleepOk", "1");
        }
        if (!m.containsKey("excl")) {
            m.put("excl", "");
        }
        return m;
    }

    static void save(Context c, Map<String, String> m) {
        try {
            StringBuilder sb = new StringBuilder();
            for (Map.Entry<String, String> e : m.entrySet()) {
                sb.append(e.getKey()).append('=').append(e.getValue()).append('\n');
            }
            FileOutputStream o = new FileOutputStream(file(c));
            try {
                o.write(sb.toString().getBytes("UTF-8"));
            } finally {
                o.close();
            }
            file(c).setReadable(true, false);
        } catch (Throwable ignore) {
        }
    }

    /** 主界面启动时调用: 配置文件还没有就按旧设置生成一份，守护进程从此以它为准(升级后行为不变)。 */
    static void ensure(Context c) {
        if (!file(c).exists()) {
            save(c, load(c));
        }
    }

    static int exclCount(Map<String, String> m) {
        String s = m.get("excl");
        if (s == null || s.trim().length() == 0) {
            return 0;
        }
        return s.trim().split("\\s+").length;
    }
}
