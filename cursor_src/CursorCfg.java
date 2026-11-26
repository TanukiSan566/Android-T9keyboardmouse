package com.keymouse.tool;

import android.content.Context;
import android.provider.Settings;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 自定义鼠标的配置 + 指针库 + Windows 鼠标方案(.inf)解析。
 * 配置文件 files/keymouse_cursor_theme.cfg(每行 key=value):
 *   on=1|0      启用自定义鼠标(0=用内置黄红箭头)
 *   size=32     指针画布大小(dp)，16~72
 *   smart=1|0   智能手型/文字光标(需无障碍服务)
 *   grabms=450  按住多久算"长按抓取"(毫秒)
 *   arrow= hand= ibeam= grab=   各状态用的文件(相对 files/cursor_lib/ 的路径)
 *   hs_arrow= ...  位图(png)没有热点时的热点位置: 0 左上 / 1 上边中间 / 2 正中
 * 指针库: 用户把 .cur/.ani/.png(或整套 Windows 主题文件夹)放到手机存储的 keymousecursor 文件夹，
 * 设置页点"导入"，由 root 复制进 files/cursor_lib/。
 */
final class CursorCfg {
    static final String[] SLOTS = { "arrow", "hand", "ibeam", "grab" };
    static final String PUB_DIR = "/storage/emulated/0/keymousecursor";
    static final String SERVICE = "com.keymouse.tool/com.keymouse.tool.CursorA11yService";

    private CursorCfg() {
    }

    static File file(Context c) {
        return new File(c.getFilesDir(), "keymouse_cursor_theme.cfg");
    }

    static File lib(Context c) {
        return new File(c.getFilesDir(), "cursor_lib");
    }

    static int defHotspot(String slot) {
        if ("hand".equals(slot)) {
            return 1;
        }
        if ("ibeam".equals(slot) || "grab".equals(slot)) {
            return 2;
        }
        return 0;
    }

    static Map<String, String> load(Context c) {
        return parse(file(c));
    }

    static Map<String, String> parse(File f) {
        Map<String, String> m = new LinkedHashMap<String, String>();
        try {
            if (!f.isFile()) {
                return m;
            }
            String s = new String(readAll(f), "UTF-8");
            for (String ln : s.split("\n")) {
                int i = ln.indexOf('=');
                if (i > 0) {
                    m.put(ln.substring(0, i).trim(), ln.substring(i + 1).trim());
                }
            }
        } catch (Throwable t) {
            // 忽略
        }
        return m;
    }

    static void save(Context c, Map<String, String> m) {
        try {
            StringBuilder sb = new StringBuilder();
            for (Map.Entry<String, String> e : m.entrySet()) {
                if (e.getValue() != null) {
                    sb.append(e.getKey()).append('=').append(e.getValue()).append('\n');
                }
            }
            File f = file(c);
            FileOutputStream o = new FileOutputStream(f);
            try {
                o.write(sb.toString().getBytes("UTF-8"));
            } finally {
                o.close();
            }
            f.setReadable(true, false);
        } catch (Throwable t) {
            // 忽略
        }
    }

    static int geti(Map<String, String> m, String k, int d) {
        try {
            String v = m.get(k);
            return v == null || v.length() == 0 ? d : Integer.parseInt(v.trim());
        } catch (Throwable t) {
            return d;
        }
    }

    // ------------------------------------------------------------ 内嵌默认指针(Sam Toki 的 STMC)

    static final String DEF_DIR = "STMC";
    private static boolean sDefChecked = false;

    private static void copyAsset(Context c, String name, File dst) throws Exception {
        InputStream in = c.getAssets().open("cursor_default/" + DEF_DIR + "/" + name);
        try {
            FileOutputStream o = new FileOutputStream(dst);
            try {
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) > 0) {
                    o.write(buf, 0, n);
                }
            } finally {
                o.close();
            }
        } finally {
            in.close();
        }
        dst.setReadable(true, false);
    }

    /** 把 assets 里内嵌的 STMC 指针复制进 files/cursor_lib/STMC/(没复制过才做)。 */
    static void installDefaultFiles(Context c) {
        try {
            File dir = new File(lib(c), DEF_DIR);
            File mark = new File(dir, ".v71");
            if (mark.exists()) {
                return;
            }
            dir.mkdirs();
            String[] names = c.getAssets().list("cursor_default/" + DEF_DIR);
            if (names == null) {
                return;
            }
            for (String n : names) {
                copyAsset(c, n, new File(dir, n));
            }
            mark.createNewFile();
        } catch (Throwable t) {
            // 忽略
        }
    }

    /** 默认槽位 = 内嵌 STMC theme.cfg 里写的文件。force=true 覆盖用户已选的。 */
    static void applyDefaultCfg(Context c, boolean force) {
        Map<String, String> m = load(c);
        Map<String, String> th = themeFromFolder(lib(c), DEF_DIR);
        boolean fresh = m.isEmpty();
        if (force || fresh || !m.containsKey("on")) {
            m.put("on", "1");
        }
        if (force || !m.containsKey("smart")) {
            m.put("smart", "1");
        }
        if (force || !m.containsKey("size")) {
            m.put("size", "32");
        }
        for (String slot : SLOTS) {
            String p = th.get(slot);
            if (p == null) {
                continue;
            }
            if (force || m.get(slot) == null || m.get(slot).length() == 0) {
                m.put(slot, p);
                m.remove("hs_" + slot);
            }
        }
        m.put("def", "1");
        save(c, m);
    }

    /** App 进程启动光标层时调用一次: 装默认文件、首次套用默认配置、智能手型开着但服务没开就用 root 补开。 */
    static void ensureDefaults(final Context c) {
        if (sDefChecked) {
            return;
        }
        sDefChecked = true;
        try {
            installDefaultFiles(c);
            Map<String, String> m = load(c);
            if (!"1".equals(m.get("def"))) {
                applyDefaultCfg(c, false);
                m = load(c);
            }
            if (geti(m, "on", 1) != 0 && geti(m, "smart", 1) != 0 && !a11yListed(c)) {
                new Thread(new Runnable() {
                    public void run() {
                        setA11y(true);
                    }
                }).start();
            }
        } catch (Throwable t) {
            // 忽略
        }
    }

    // ------------------------------------------------------------ 指针库

    static boolean isCursorFile(String n) {
        String s = n.toLowerCase();
        return s.endsWith(".cur") || s.endsWith(".ani") || s.endsWith(".png") || s.endsWith(".ico");
    }

    private static void walk(File root, File dir, ArrayList<String> out, int depth) {
        File[] fs = dir.listFiles();
        if (fs == null || depth > 4) {
            return;
        }
        for (File f : fs) {
            if (f.isDirectory()) {
                walk(root, f, out, depth + 1);
            } else if (isCursorFile(f.getName())) {
                String p = f.getPath().substring(root.getPath().length() + 1);
                out.add(p);
            }
        }
    }

    /** 库里所有指针文件(相对路径，排好序)。 */
    static ArrayList<String> listFiles(File lib) {
        ArrayList<String> out = new ArrayList<String>();
        walk(lib, lib, out, 0);
        Collections.sort(out, String.CASE_INSENSITIVE_ORDER);
        return out;
    }

    /** 库里的主题文件夹(相对路径): 含有指针文件的最上层文件夹。 */
    static ArrayList<String> listThemes(File lib) {
        ArrayList<String> out = new ArrayList<String>();
        File[] fs = lib.listFiles();
        if (fs == null) {
            return out;
        }
        for (File f : fs) {
            if (f.isDirectory()) {
                ArrayList<String> in = new ArrayList<String>();
                walk(f, f, in, 0);
                if (!in.isEmpty()) {
                    out.add(f.getName());
                }
            }
        }
        Collections.sort(out, String.CASE_INSENSITIVE_ORDER);
        return out;
    }

    /** 用 root 把 /sdcard/keymousecursor 整个复制进 files/cursor_lib。返回是否成功执行。 */
    static boolean importLib(Context c) {
        try {
            String files = c.getFilesDir().getPath();
            String lib = lib(c).getPath();
            String sh = "U=$(stat -c %u " + files + "); mkdir -p " + PUB_DIR + " " + lib
                    + "; cp -rf " + PUB_DIR + "/. " + lib + "/; chown -R $U:$U " + lib
                    + "; chmod -R u+rwX,go+rX " + lib + "; restorecon -R " + lib + " 2>/dev/null; echo done";
            Process p = Runtime.getRuntime().exec(new String[] { "su", "-c", sh });
            p.getOutputStream().close();
            byte[] o = readStream(p.getInputStream());
            p.waitFor();
            return new String(o).contains("done");
        } catch (Throwable t) {
            return false;
        }
    }

    // ------------------------------------------------------------ 无障碍(智能手型/文字光标)

    static boolean a11yListed(Context c) {
        try {
            String s = Settings.Secure.getString(c.getContentResolver(), "enabled_accessibility_services");
            return s != null && s.contains("CursorA11yService");
        } catch (Throwable t) {
            return false;
        }
    }

    /** 用 root 写系统设置，自动开/关无障碍服务，不用用户手动去设置里点。 */
    static boolean setA11y(boolean on) {
        try {
            String s = "S=" + SERVICE + "; C=$(settings get secure enabled_accessibility_services); "
                    + "[ \"$C\" = null ] && C=\"\"; "
                    + "N=$(echo \":$C:\" | sed \"s#:$S:#:#g\" | sed 's#^:*##; s#:*$##'); ";
            if (on) {
                s += "if [ -z \"$N\" ]; then N=$S; else N=\"$N:$S\"; fi; "
                        + "settings put secure enabled_accessibility_services \"$N\"; "
                        + "settings put secure accessibility_enabled 1; echo done";
            } else {
                s += "if [ -z \"$N\" ]; then settings delete secure enabled_accessibility_services; "
                        + "else settings put secure enabled_accessibility_services \"$N\"; fi; echo done";
            }
            Process p = Runtime.getRuntime().exec(new String[] { "su", "-c", s });
            p.getOutputStream().close();
            byte[] o = readStream(p.getInputStream());
            p.waitFor();
            return new String(o).contains("done");
        } catch (Throwable t) {
            return false;
        }
    }

    // ------------------------------------------------------------ 主题(Windows .inf / 文件名猜测)

    /** 把库里一个文件夹当成一套主题，返回 槽位 -> 相对路径。 */
    static Map<String, String> themeFromFolder(File lib, String rel) {
        Map<String, String> out = new HashMap<String, String>();
        File dir = new File(lib, rel);
        // 文件夹里有 theme.cfg(arrow=xx.cur 之类)就直接按它来，最准
        File tc = new File(dir, "theme.cfg");
        if (tc.isFile()) {
            Map<String, String> t = parse(tc);
            for (String slot : SLOTS) {
                String v = t.get(slot);
                if (v != null && v.length() > 0 && new File(dir, v).isFile()) {
                    out.put(slot, rel + "/" + v);
                }
            }
            if (!out.isEmpty()) {
                return out;
            }
        }
        ArrayList<String> files = new ArrayList<String>();
        walk(lib, dir, files, 0);
        Collections.sort(files, String.CASE_INSENSITIVE_ORDER);
        Map<String, String> byName = new HashMap<String, String>();
        for (String p : files) {
            byName.put(baseName(p).toLowerCase(), p);
        }
        // 1) Windows 方案文件
        ArrayList<File> infs = new ArrayList<File>();
        findInf(dir, infs, 0);
        for (File inf : infs) {
            try {
                parseInf(inf, byName, out);
            } catch (Throwable t) {
                // 忽略
            }
        }
        // 2) 文件名猜测，补没填上的槽位
        for (String p : files) {
            String slot = guess(baseName(p).toLowerCase());
            if (slot != null && !out.containsKey(slot)) {
                out.put(slot, p);
            }
        }
        // 3) 抓取没有专门文件，用"移动"(Windows 的 SizeAll)代替
        String mv = out.remove("_move");
        if (!out.containsKey("grab") && mv != null) {
            out.put("grab", mv);
        }
        if (!out.containsKey("grab")) {
            for (String p : files) {
                String n = baseName(p).toLowerCase();
                if (n.contains("move") || n.contains("sizeall") || n.contains("all-scroll")) {
                    out.put("grab", p);
                    break;
                }
            }
        }
        return out;
    }

    private static void findInf(File d, ArrayList<File> out, int depth) {
        File[] fs = d.listFiles();
        if (fs == null || depth > 3) {
            return;
        }
        for (File f : fs) {
            if (f.isDirectory()) {
                findInf(f, out, depth + 1);
            } else if (f.getName().toLowerCase().endsWith(".inf")) {
                out.add(f);
            }
        }
    }

    static String baseName(String p) {
        int i = Math.max(p.lastIndexOf('/'), p.lastIndexOf('\\'));
        return i >= 0 ? p.substring(i + 1) : p;
    }

    static String guess(String n) {
        if (n.contains("grab") || n.contains("fist") || n.contains("drag") || n.contains("closed")
                || n.contains("grip") || n.contains("dnd")) {
            return "grab";
        }
        if (n.contains("ibeam") || n.contains("i-beam") || n.contains("text") || n.contains("beam")
                || n.contains("xterm")) {
            return "ibeam";
        }
        if (n.contains("link") || n.contains("hand") || n.contains("pointing") || n.contains("finger")) {
            return "hand";
        }
        if (n.contains("normal") || n.contains("arrow") || n.contains("default") || n.contains("left_ptr")
                || n.contains("pointer") || n.equals("main.cur") || n.equals("main.ani")) {
            return "arrow";
        }
        return null;
    }

    private static final String[] WIN_ORDER = { "Arrow", "Help", "AppStarting", "Wait", "Crosshair", "IBeam",
            "NWPen", "No", "SizeNS", "SizeWE", "SizeNWSE", "SizeNESW", "SizeAll", "UpArrow", "Hand", "Pin", "Person" };

    private static String slotOfWinName(String n) {
        if (n.equalsIgnoreCase("Arrow")) {
            return "arrow";
        }
        if (n.equalsIgnoreCase("Hand")) {
            return "hand";
        }
        if (n.equalsIgnoreCase("IBeam")) {
            return "ibeam";
        }
        if (n.equalsIgnoreCase("Grab")) {
            return "grab";
        }
        if (n.equalsIgnoreCase("SizeAll")) {
            return "_move";
        }
        return null;
    }

    private static void parseInf(File inf, Map<String, String> byName, Map<String, String> out) throws Exception {
        byte[] raw = readAll(inf);
        String txt;
        if (raw.length > 2 && (raw[0] & 0xFF) == 0xFF && (raw[1] & 0xFF) == 0xFE) {
            txt = new String(raw, 2, raw.length - 2, "UTF-16LE");
        } else if (raw.length > 2 && (raw[0] & 0xFF) == 0xFE && (raw[1] & 0xFF) == 0xFF) {
            txt = new String(raw, 2, raw.length - 2, "UTF-16BE");
        } else {
            int off = raw.length > 3 && (raw[0] & 0xFF) == 0xEF && (raw[1] & 0xFF) == 0xBB ? 3 : 0;
            txt = new String(raw, off, raw.length - off, "UTF-8");
            if (txt.indexOf('\uFFFD') >= 0) {
                txt = new String(raw, off, raw.length - off, Charset.forName("GBK"));
            }
        }
        Map<String, String> vars = new HashMap<String, String>();
        ArrayList<String> lines = new ArrayList<String>();
        String sec = "";
        for (String ln : txt.split("\r?\n|\r")) {
            String t = ln.trim();
            if (t.length() == 0 || t.startsWith(";")) {
                continue;
            }
            if (t.startsWith("[")) {
                sec = t.toLowerCase();
                continue;
            }
            if (sec.equals("[strings]")) {
                int i = t.indexOf('=');
                if (i > 0) {
                    vars.put(t.substring(0, i).trim().toLowerCase(), unquote(t.substring(i + 1).trim()));
                }
            } else if (t.toLowerCase().contains("control panel\\cursors")) {
                lines.add(t);
            }
        }
        for (String t : lines) {
            ArrayList<String> tok = splitCsv(t.substring(t.indexOf('=') >= 0 && t.indexOf('=') < t.indexOf(',')
                    ? t.indexOf('=') + 1 : 0));
            if (tok.size() < 5) {
                continue;
            }
            String key = expand(unquote(tok.get(1)), vars).toLowerCase();
            String name = unquote(tok.get(2));
            String data = expand(unquote(tok.get(4)), vars);
            if (key.endsWith("\\schemes")) {
                String[] parts = data.split(",");
                for (int i = 0; i < parts.length && i < WIN_ORDER.length; i++) {
                    put(out, byName, slotOfWinName(WIN_ORDER[i]), parts[i]);
                }
            } else if (name.length() > 0) {
                put(out, byName, slotOfWinName(name), data);
            }
        }
    }

    private static void put(Map<String, String> out, Map<String, String> byName, String slot, String path) {
        if (slot == null || path == null) {
            return;
        }
        String n = baseName(unquote(path.trim())).toLowerCase();
        String rel = byName.get(n);
        if (rel == null) {
            return;
        }
        // 抓取只用 SizeAll 顶替，不能盖掉已有的专门文件；其余槽位先到先得
        if (!out.containsKey(slot)) {
            out.put(slot, rel);
        }
    }

    private static String expand(String s, Map<String, String> vars) {
        for (int k = 0; k < 4; k++) {
            StringBuilder sb = new StringBuilder();
            int i = 0;
            boolean changed = false;
            while (i < s.length()) {
                char ch = s.charAt(i);
                int j = ch == '%' ? s.indexOf('%', i + 1) : -1;
                if (j > i) {
                    String v = vars.get(s.substring(i + 1, j).toLowerCase());
                    if (v != null) {
                        sb.append(v);
                        changed = true;
                    }
                    i = j + 1;
                } else {
                    sb.append(ch);
                    i++;
                }
            }
            s = sb.toString();
            if (!changed) {
                break;
            }
        }
        return s;
    }

    private static String unquote(String s) {
        s = s.trim();
        if (s.length() >= 2 && s.charAt(0) == '"' && s.charAt(s.length() - 1) == '"') {
            s = s.substring(1, s.length() - 1);
        }
        return s;
    }

    private static ArrayList<String> splitCsv(String s) {
        ArrayList<String> r = new ArrayList<String>();
        StringBuilder sb = new StringBuilder();
        boolean q = false;
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (ch == '"') {
                q = !q;
                sb.append(ch);
            } else if (ch == ',' && !q) {
                r.add(sb.toString());
                sb.setLength(0);
            } else {
                sb.append(ch);
            }
        }
        r.add(sb.toString());
        return r;
    }

    private static byte[] readAll(File f) throws Exception {
        InputStream in = new FileInputStream(f);
        try {
            return readStream(in);
        } finally {
            in.close();
        }
    }

    private static byte[] readStream(InputStream in) throws Exception {
        ByteArrayOutputStream o = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) > 0) {
            o.write(buf, 0, n);
        }
        return o.toByteArray();
    }
}
