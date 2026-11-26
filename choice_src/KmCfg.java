package com.keymouse.tool;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * "按键自定义"的配置读写 (files/keymouse_keymap.cfg，守护进程检测到文件变化马上热重读)。
 * KeyCustomActivity 和 KmExclActivity 共用这一份，保存时整份写回，互不覆盖。
 * 键: kmOn / holdMs(全局长按时间 ms) / maps / lockOk / sleepOk / excl
 * maps = 分号分隔的映射项，每项 "键码[,键码...]:动作号"(1~4 个键同时按住)，键码 S = 任意一个星号键。
 * 动作: 1 最近任务 2 结束前台应用 3 手电筒 4 回到桌面 5 截屏(root)
 * v68 的旧格式(menuAct/backAct/starAct + menuMs/backMs/starMs)读到时自动转成 maps。
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

    /** 读配置。maps 还没有(v68 旧格式，或文件根本不存在、从更老的版本升级)时，
     *  把旧的 菜单/返回/* 三个固定键转成三条映射，行为不变；转完旧键删掉。 */
    static Map<String, String> load(Context c) {
        File f = file(c);
        Map<String, String> m;
        int[] ms = { 1500, 1500, 2000 };
        int[] act = { 1, 2, 3 };
        if (f.exists()) {
            m = readLines(f);
        } else {
            m = new LinkedHashMap<String, String>();
            Map<String, String> old = readLines(new File(c.getFilesDir(), "keymouse_hold.cfg"));
            String[] keys = { "menuHold", "backHold", "starHold" };
            for (int i = 0; i < 3; i++) {
                int v = geti(old, keys[i], ms[i]);
                if (v <= 0) {
                    act[i] = 0;
                } else {
                    ms[i] = Math.max(500, Math.min(5000, v));
                }
            }
        }
        if (!m.containsKey("kmOn")) {
            m.put("kmOn", "1");
        }
        String[] pre = { "menu", "back", "star" };
        String[] code = { "139", "158", "S" };
        if (!m.containsKey("maps")) {
            StringBuilder sb = new StringBuilder();
            int hold = 0;
            for (int i = 0; i < 3; i++) {
                int a = geti(m, pre[i] + "Act", act[i]);
                int t = geti(m, pre[i] + "Ms", ms[i]);
                if (a >= 1 && a <= 5) {
                    if (sb.length() > 0) {
                        sb.append(';');
                    }
                    sb.append(code[i]).append(':').append(a);
                    if (hold == 0) {
                        hold = t;
                    }
                }
            }
            m.put("maps", sb.toString());
            if (!m.containsKey("holdMs")) {
                m.put("holdMs", String.valueOf(hold > 0 ? hold : 1500));
            }
        }
        for (int i = 0; i < 3; i++) {
            m.remove(pre[i] + "Act");
            m.remove(pre[i] + "Ms");
        }
        if (!m.containsKey("holdMs")) {
            m.put("holdMs", "1500");
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

    /** maps 字符串 -> 列表，每项 int[]{动作, 键码...}，星号键码记为 -1。坏的项跳过。 */
    static ArrayList<int[]> parseMaps(String s) {
        ArrayList<int[]> out = new ArrayList<int[]>();
        if (s == null) {
            return out;
        }
        for (String item : s.split(";")) {
            try {
                int i = item.indexOf(':');
                if (i <= 0) {
                    continue;
                }
                int a = Integer.parseInt(item.substring(i + 1).trim());
                String[] ks = item.substring(0, i).split(",");
                int[] e = new int[ks.length + 1];
                int n = 0;
                e[n++] = a;
                for (String k : ks) {
                    k = k.trim();
                    if (k.length() == 0) {
                        continue;
                    }
                    e[n++] = "S".equals(k) ? -1 : Integer.parseInt(k);
                }
                if (n >= 2 && n <= 5 && a >= 1 && a <= 5) {
                    int[] r = new int[n];
                    System.arraycopy(e, 0, r, 0, n);
                    out.add(r);
                }
            } catch (Throwable ignore) {
            }
        }
        return out;
    }

    static String serializeMaps(List<int[]> l) {
        StringBuilder sb = new StringBuilder();
        for (int[] e : l) {
            if (sb.length() > 0) {
                sb.append(';');
            }
            for (int i = 1; i < e.length; i++) {
                if (i > 1) {
                    sb.append(',');
                }
                sb.append(e[i] < 0 ? "S" : String.valueOf(e[i]));
            }
            sb.append(':').append(e[0]);
        }
        return sb.toString();
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

    /** 主界面启动时调用: 配置文件还没有(从更老版本升级)，或还是 v68 的旧格式(没有 maps)，
     *  就按旧设置转换后写成新格式，守护进程从此以它为准(升级后行为不变)。 */
    static void ensure(Context c) {
        File f = file(c);
        if (!f.exists() || !readLines(f).containsKey("maps")) {
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
