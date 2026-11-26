package com.keymouse.tool;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;

/**
 * 鼠标指针文件解析: .cur / .ico / .ani / .png (以及 .bmp 等 BitmapFactory 能读的图)。
 * 结果 Set = 若干帧位图 + 每帧热点 + 播放顺序/时长(.ani 才有多帧)。
 * 全部自己解析 DIB，不依赖系统对 .cur 的支持(安卓不认 .cur/.ani)。
 */
final class CurLoader {
    private CurLoader() {
    }

    /** 一个指针 = 多帧。frames[i] 的热点是 (hx[i], hy[i])，单位是该位图自己的像素。 */
    static final class Set {
        Bitmap[] frames;
        int[] hx;
        int[] hy;
        int[] seq;      // 播放步骤 -> 帧号
        int[] delay;    // 播放步骤 -> 毫秒
        int total;      // 一轮总毫秒
        int baseW;
        int baseH;

        boolean animated() {
            return seq != null && seq.length > 1;
        }

        /** 播放到 t 毫秒时应画哪一帧。 */
        int frameAt(long t) {
            if (!animated() || total <= 0) {
                return seq != null && seq.length > 0 ? seq[0] : 0;
            }
            long m = t % total;
            for (int i = 0; i < seq.length; i++) {
                if (m < delay[i]) {
                    return seq[i];
                }
                m -= delay[i];
            }
            return seq[seq.length - 1];
        }
    }

    private static final int MAX_BYTES = 12 * 1024 * 1024;
    private static final int MAX_FRAMES = 240;

    /** hsMode: 位图类文件(png 等)没有热点时用。0=左上 1=上边中间 2=正中。 */
    static Set load(File f, int hsMode) {
        try {
            byte[] b = readAll(f);
            if (b == null || b.length < 12) {
                return null;
            }
            if (b[0] == 'R' && b[1] == 'I' && b[2] == 'F' && b[3] == 'F'
                    && b[8] == 'A' && b[9] == 'C' && b[10] == 'O' && b[11] == 'N') {
                return loadAni(b);
            }
            if (b[0] == 0 && b[1] == 0 && (b[2] == 1 || b[2] == 2) && b[3] == 0) {
                Frame fr = decodeIco(b, 0, b.length);
                return fr == null ? null : single(fr);
            }
            Bitmap bm = BitmapFactory.decodeByteArray(b, 0, b.length);
            if (bm == null) {
                return null;
            }
            Frame fr = new Frame();
            fr.bmp = bm;
            fr.hx = hsMode == 2 ? bm.getWidth() / 2 : hsMode == 1 ? bm.getWidth() / 2 : 0;
            fr.hy = hsMode == 2 ? bm.getHeight() / 2 : 0;
            return single(fr);
        } catch (Throwable t) {
            return null;
        }
    }

    private static final class Frame {
        Bitmap bmp;
        int hx;
        int hy;
    }

    private static Set single(Frame fr) {
        Set s = new Set();
        s.frames = new Bitmap[] { fr.bmp };
        s.hx = new int[] { fr.hx };
        s.hy = new int[] { fr.hy };
        s.seq = new int[] { 0 };
        s.delay = new int[] { 1000 };
        s.total = 1000;
        s.baseW = fr.bmp.getWidth();
        s.baseH = fr.bmp.getHeight();
        return s;
    }

    private static byte[] readAll(File f) throws Exception {
        if (!f.isFile() || f.length() > MAX_BYTES) {
            return null;
        }
        InputStream in = new FileInputStream(f);
        try {
            ByteArrayOutputStream o = new ByteArrayOutputStream((int) f.length());
            byte[] buf = new byte[16384];
            int n;
            while ((n = in.read(buf)) > 0) {
                o.write(buf, 0, n);
            }
            return o.toByteArray();
        } finally {
            in.close();
        }
    }

    private static int u8(byte[] b, int o) {
        return b[o] & 0xFF;
    }

    private static int u16(byte[] b, int o) {
        return (b[o] & 0xFF) | ((b[o + 1] & 0xFF) << 8);
    }

    private static int i32(byte[] b, int o) {
        return (b[o] & 0xFF) | ((b[o + 1] & 0xFF) << 8) | ((b[o + 2] & 0xFF) << 16) | ((b[o + 3] & 0xFF) << 24);
    }

    // ---------------------------------------------------------------- ANI

    private static Set loadAni(byte[] b) {
        int nFrames = 0;
        int nSteps = 0;
        int jif = 6;
        int flags = 1;
        int[] rate = null;
        int[] seq = null;
        ArrayList<Frame> frames = new ArrayList<Frame>();
        int p = 12;
        while (p + 8 <= b.length) {
            int id = i32(b, p);
            int sz = i32(b, p + 4);
            int d = p + 8;
            if (sz < 0 || d + sz > b.length) {
                sz = Math.max(0, b.length - d);
            }
            if (isTag(b, p, "anih") && sz >= 36) {
                nFrames = i32(b, d + 4);
                nSteps = i32(b, d + 8);
                jif = i32(b, d + 28);
                flags = i32(b, d + 32);
            } else if (isTag(b, p, "rate")) {
                int n = sz / 4;
                rate = new int[n];
                for (int i = 0; i < n; i++) {
                    rate[i] = i32(b, d + i * 4);
                }
            } else if (isTag(b, p, "seq ")) {
                int n = sz / 4;
                seq = new int[n];
                for (int i = 0; i < n; i++) {
                    seq[i] = i32(b, d + i * 4);
                }
            } else if (isTag(b, p, "LIST") && sz >= 4 && isTag(b, d, "fram")) {
                int q = d + 4;
                int end = d + sz;
                while (q + 8 <= end && frames.size() < MAX_FRAMES) {
                    int csz = i32(b, q + 4);
                    if (csz < 0 || q + 8 + csz > b.length) {
                        break;
                    }
                    if (isTag(b, q, "icon")) {
                        Frame fr = decodeIco(b, q + 8, csz);
                        if (fr != null) {
                            frames.add(fr);
                        }
                    }
                    q += 8 + csz + (csz & 1);
                }
            }
            p = d + sz + (sz & 1);
            if (id == 0 && sz == 0) {
                break;
            }
        }
        if ((flags & 1) == 0 || frames.isEmpty()) {
            return null;
        }
        if (nSteps <= 0) {
            nSteps = nFrames > 0 ? nFrames : frames.size();
        }
        if (seq != null && seq.length > 0) {
            nSteps = seq.length;
        }
        if (nSteps > 4000) {
            nSteps = 4000;
        }
        Set s = new Set();
        int n = frames.size();
        s.frames = new Bitmap[n];
        s.hx = new int[n];
        s.hy = new int[n];
        for (int i = 0; i < n; i++) {
            s.frames[i] = frames.get(i).bmp;
            s.hx[i] = frames.get(i).hx;
            s.hy[i] = frames.get(i).hy;
        }
        s.seq = new int[nSteps];
        s.delay = new int[nSteps];
        int total = 0;
        for (int i = 0; i < nSteps; i++) {
            int fi = seq != null && i < seq.length ? seq[i] : i;
            if (fi < 0 || fi >= n) {
                fi = Math.min(Math.max(fi, 0), n - 1);
            }
            int j = rate != null && i < rate.length ? rate[i] : jif;
            if (j <= 0) {
                j = jif > 0 ? jif : 6;
            }
            int ms = Math.max(16, j * 1000 / 60);   // 1 jiffy = 1/60 秒
            s.seq[i] = fi;
            s.delay[i] = ms;
            total += ms;
        }
        s.total = total;
        s.baseW = s.frames[0].getWidth();
        s.baseH = s.frames[0].getHeight();
        return s;
    }

    private static boolean isTag(byte[] b, int o, String t) {
        return o + 4 <= b.length && b[o] == t.charAt(0) && b[o + 1] == t.charAt(1)
                && b[o + 2] == t.charAt(2) && b[o + 3] == t.charAt(3);
    }

    // ---------------------------------------------------------------- ICO / CUR

    /** 解一个 .cur/.ico 文件(从 b[off] 起 len 字节)，取面积最大(同面积取色深最高)的那一张。 */
    private static Frame decodeIco(byte[] b, int off, int len) {
        if (len < 22) {
            return null;
        }
        int type = u16(b, off + 2);
        int count = u16(b, off + 4);
        if ((type != 1 && type != 2) || count <= 0 || off + 6 + count * 16 > b.length) {
            return null;
        }
        int best = -1;
        long bestScore = -1;
        for (int i = 0; i < count; i++) {
            int e = off + 6 + i * 16;
            int w = u8(b, e);
            int h = u8(b, e + 1);
            if (w == 0) {
                w = 256;
            }
            if (h == 0) {
                h = 256;
            }
            int bits = u16(b, e + 6);
            long score = (long) w * h * 100 + bits;
            if (score > bestScore) {
                bestScore = score;
                best = i;
            }
        }
        int e = off + 6 + best * 16;
        int size = i32(b, e + 8);
        int pos = off + i32(b, e + 12);
        if (size <= 0 || pos < off || pos + size > b.length) {
            return null;
        }
        int hx;
        int hy;
        Bitmap bm;
        if (size > 8 && u8(b, pos) == 0x89 && b[pos + 1] == 'P' && b[pos + 2] == 'N' && b[pos + 3] == 'G') {
            bm = BitmapFactory.decodeByteArray(b, pos, size);
        } else {
            bm = decodeDib(b, pos, size);
        }
        if (bm == null) {
            return null;
        }
        if (type == 2) {
            hx = u16(b, e + 4);
            hy = u16(b, e + 6);
        } else {
            hx = bm.getWidth() / 2;
            hy = bm.getHeight() / 2;
        }
        Frame f = new Frame();
        f.bmp = bm;
        f.hx = Math.max(0, Math.min(hx, bm.getWidth() - 1));
        f.hy = Math.max(0, Math.min(hy, bm.getHeight() - 1));
        return f;
    }

    /** 解 BMP 数据块(.cur 里没有文件头): BITMAPINFOHEADER + 调色板 + XOR 位图 + AND 掩码。 */
    private static Bitmap decodeDib(byte[] b, int p, int size) {
        int hs = i32(b, p);
        if (hs < 40 || p + hs > b.length) {
            return null;
        }
        int w = i32(b, p + 4);
        int h2 = i32(b, p + 8);
        int bits = u16(b, p + 14);
        int comp = i32(b, p + 16);
        int clr = i32(b, p + 32);
        if (w <= 0 || w > 1024 || h2 == 0 || Math.abs(h2) > 2048) {
            return null;
        }
        boolean topDown = h2 < 0;
        int h = Math.abs(h2) / 2;
        if (h <= 0) {
            return null;
        }
        if (comp != 0 && comp != 3) {
            return null;
        }
        int palN = 0;
        if (bits <= 8) {
            palN = clr > 0 ? clr : (1 << bits);
        }
        int pal = p + hs + (comp == 3 && hs == 40 ? 12 : 0);
        int xor = pal + palN * 4;
        int stride = ((w * bits + 31) / 32) * 4;
        int andStride = ((w + 31) / 32) * 4;
        int andOff = xor + stride * h;
        boolean haveMask = andOff + andStride * h <= p + size + 4 && andOff + andStride * h <= b.length;
        if (xor + stride * h > b.length) {
            return null;
        }
        int[] px = new int[w * h];
        boolean anyAlpha = false;
        for (int y = 0; y < h; y++) {
            int sy = topDown ? y : (h - 1 - y);
            int row = xor + sy * stride;
            for (int x = 0; x < w; x++) {
                int c;
                if (bits == 32) {
                    int o = row + x * 4;
                    int a = u8(b, o + 3);
                    if (a != 0) {
                        anyAlpha = true;
                    }
                    c = (a << 24) | (u8(b, o + 2) << 16) | (u8(b, o + 1) << 8) | u8(b, o);
                } else if (bits == 24) {
                    int o = row + x * 3;
                    c = 0xFF000000 | (u8(b, o + 2) << 16) | (u8(b, o + 1) << 8) | u8(b, o);
                } else if (bits == 8) {
                    c = palette(b, pal, u8(b, row + x), palN);
                } else if (bits == 4) {
                    int v = u8(b, row + x / 2);
                    c = palette(b, pal, (x & 1) == 0 ? (v >> 4) : (v & 15), palN);
                } else if (bits == 1) {
                    int v = u8(b, row + x / 8);
                    c = palette(b, pal, (v >> (7 - (x & 7))) & 1, palN);
                } else {
                    return null;
                }
                px[y * w + x] = c;
            }
        }
        if (haveMask) {
            for (int y = 0; y < h; y++) {
                int sy = topDown ? y : (h - 1 - y);
                int row = andOff + sy * andStride;
                for (int x = 0; x < w; x++) {
                    boolean transparent = ((u8(b, row + x / 8) >> (7 - (x & 7))) & 1) != 0;
                    int i = y * w + x;
                    if (bits == 32 && anyAlpha) {
                        continue;       // 32 位且带 alpha: 以 alpha 为准，不看掩码
                    }
                    if (transparent) {
                        px[i] = 0;
                    } else if (bits == 32) {
                        px[i] |= 0xFF000000;
                    }
                }
            }
        } else if (bits == 32 && !anyAlpha) {
            for (int i = 0; i < px.length; i++) {
                px[i] |= 0xFF000000;
            }
        }
        return Bitmap.createBitmap(px, w, h, Bitmap.Config.ARGB_8888);
    }

    private static int palette(byte[] b, int pal, int idx, int n) {
        if (idx >= n) {
            return 0xFF000000;
        }
        int o = pal + idx * 4;
        return 0xFF000000 | (u8(b, o + 2) << 16) | (u8(b, o + 1) << 8) | u8(b, o);
    }
}
