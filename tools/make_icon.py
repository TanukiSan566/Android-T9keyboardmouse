#!/usr/bin/env python3
"""生成 keymouse 的启动图标: 暗色圆角底 + 彩虹光环 + 全息(炫彩金属)鼠标箭头。
用法: python3 tools/make_icon.py [输出res目录, 默认 ./res]
依赖: pillow numpy scipy
"""
import sys, os
import numpy as np
from PIL import Image, ImageDraw
from scipy import ndimage as ndi

S = 1024
yy, xx = np.mgrid[0:S, 0:S].astype(np.float32)

def norm(v):
    return v / np.maximum(np.linalg.norm(v, axis=-1, keepdims=True), 1e-6)

def rainbow(t):
    d = np.array([0.0, 0.33, 0.67], np.float32)
    return 0.5 + 0.5 * np.cos(2 * np.pi * (t[..., None] + d))

# ---------- 圆角底 ----------
R = int(S * 0.22)
bg_mask = Image.new("L", (S, S), 0)
ImageDraw.Draw(bg_mask).rounded_rectangle([0, 0, S - 1, S - 1], R, fill=255)
bg_mask = np.asarray(bg_mask, np.float32) / 255
g = (yy / S)[..., None]
top = np.array([14, 18, 40], np.float32) / 255
bot = np.array([30, 14, 52], np.float32) / 255
bg = top * (1 - g) + bot * g
# 中间稍亮一点的径向光
r = np.hypot(xx - S / 2, yy - S / 2) / (S * 0.7)
bg = bg + (np.clip(1 - r, 0, 1) ** 2)[..., None] * np.array([0.10, 0.08, 0.16], np.float32)

# ---------- 彩虹光环(鼠标周围的彩色) ----------
cx = cy = S / 2
ang = (np.arctan2(yy - cy, xx - cx) / (2 * np.pi)) % 1.0
rad = np.hypot(xx - cx, yy - cy)
ring = np.exp(-((rad - S * 0.385) / (S * 0.030)) ** 2)
glow = np.exp(-((rad - S * 0.385) / (S * 0.10)) ** 2)
col_ring = rainbow(ang * 1.0 + 0.58)
ring_rgb = col_ring * ring[..., None] * 1.0 + col_ring * glow[..., None] * 0.35
img = np.clip(bg + ring_rgb, 0, 1)

# ---------- 箭头形状 ----------
pts = np.array([(0, 0), (0, 17), (4.6, 13), (8.2, 21.2), (11.8, 19.6), (8.2, 11.8), (13.4, 11.8)], np.float32)
H_target = S * 0.56
sc = H_target / (pts[:, 1].max() - pts[:, 1].min())
pts = pts * sc
bbox_c = (pts.min(0) + pts.max(0)) / 2
pts = pts - bbox_c + np.array([S / 2 + S * 0.012, S / 2 + S * 0.01], np.float32)
m = Image.new("L", (S, S), 0)
ImageDraw.Draw(m).polygon([tuple(p) for p in pts], fill=255)
m = np.asarray(m, np.float32) / 255
m = ndi.gaussian_filter(m, 16)                       # 圆角
m = np.clip((m - 0.5) * 12 + 0.5, 0, 1)
m = ndi.gaussian_filter(m, 1.2)

# 阴影
sh = ndi.gaussian_filter(np.roll(np.roll(m, 22, 0), 14, 1), 22) * 0.75
img = img * (1 - sh[..., None]) 

# ---------- 浮雕高度/法线 (用模糊后的形状当高度图，边缘平滑无条纹) ----------
G1 = ndi.gaussian_filter(m, 11)
G2 = ndi.gaussian_filter(m, 26)
hh = (0.65 * G1 + 0.35 * G2) * 150.0
gy, gx = np.gradient(hh)
n = norm(np.stack([-gx, -gy, np.ones_like(gx)], -1))
L = norm(np.array([-0.55, -0.65, 0.62], np.float32))
V = np.array([0, 0, 1], np.float32)
Hv = norm(L + V)
diff = np.clip((n * L).sum(-1), 0, 1)
spec = np.clip((n * Hv).sum(-1), 0, 1) ** 40
spec2 = np.clip((n * norm(np.array([0.6, 0.5, 0.7], np.float32))).sum(-1), 0, 1) ** 22
h = np.clip(G1 * 1.25, 0, 1)

x0, x1 = pts[:, 0].min(), pts[:, 0].max()
y0, y1 = pts[:, 1].min(), pts[:, 1].max()
u = (xx - x0) / (x1 - x0)
v = (yy - y0) / (y1 - y0)
# 左侧青蓝 -> 下方洋红 -> 右侧金橙，随浮雕法线轻微流动(炫彩全息感)
t = 0.56 + 0.56 * u + 0.12 * v + 0.14 * n[..., 0] + 0.12 * n[..., 1]
base = rainbow(t)
base = base * 0.85 + 0.15
# 金属感: 边缘亮、内部略暗
edge = (1 - h) ** 1.6
shade = 0.40 + 0.80 * diff
rgb = base * shade[..., None]
rgb += (spec[..., None] * 0.95 + spec2[..., None] * 0.18)
rgb += edge[..., None] * np.array([0.18, 0.20, 0.30], np.float32)
rgb = np.clip(rgb, 0, 1)

img = img * (1 - m[..., None]) + rgb * m[..., None]

# ---------- 输出 ----------
out = np.dstack([img, bg_mask]) 
out = (np.clip(out, 0, 1) * 255).astype(np.uint8)
big = Image.fromarray(out, "RGBA")

res = sys.argv[1] if len(sys.argv) > 1 else "res"
sizes = {"mdpi": 48, "hdpi": 72, "xhdpi": 96, "xxhdpi": 144, "xxxhdpi": 192}
for dpi, px in sizes.items():
    dd = os.path.join(res, "mipmap-" + dpi)
    os.makedirs(dd, exist_ok=True)
    big.resize((px, px), Image.LANCZOS).save(os.path.join(dd, "ic_launcher.png"), optimize=True)
big.resize((512, 512), Image.LANCZOS).save(os.path.join(res, "..", "icon_preview_512.png"))
print("done ->", res)
