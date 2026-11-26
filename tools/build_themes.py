# -*- coding: utf-8 -*-
# 用法: THEME_SRC=<解压目录> python3 tools/build_themes.py assets/cursor_themes   (需要 pip install cairosvg pillow)
# 生成 assets/cursor_themes: 每个主题一个文件夹 arrow.cur hand.cur ibeam.cur grab.cur + theme.cfg，index.txt = id|中文名|英文名|日文名
import os, re, glob, shutil, struct, json, tomllib, io, sys
import cairosvg

# 三个主题源码包解压后的父目录(默认当前目录的上一级结构，可用环境变量 THEME_SRC 指定)
ROOT = os.environ.get("THEME_SRC", "/home/claude/w")
OUT = sys.argv[1]
STMC = ROOT + "/Sam-Toki-Mouse-Cursors-master/Sam-Toki-Mouse-Cursors-master/PROJECT/STMC"
BIB = ROOT + "/Bibata_Cursor-main/Bibata_Cursor-main"
CAP = ROOT + "/capitaine-cursors-master/capitaine-cursors-master/src/svg/"

shutil.rmtree(OUT, ignore_errors=True)
os.makedirs(OUT)
themes = []   # (id, zh, en, ja)

def cur_png(png, hx, hy, size=64):
    return struct.pack('<HHH', 0, 2, 1) + struct.pack('<BBBBHHII', size, size, 0, 0, hx, hy, len(png), 22) + png

def finish(tid, zh, en, ja):
    open(f"{OUT}/{tid}/theme.cfg", "w").write("arrow=arrow.cur\nhand=hand.cur\nibeam=ibeam.cur\ngrab=grab.cur\n")
    themes.append((tid, zh, en, ja))

# ---------------------------------------------------------------- STMC (Sam Toki)
# inf: 1-1.. 7-7；5-3(Mix)、7-2(Alt) 只是等待动画不同，四个状态的指针和 5-1/7-1 完全一样，不重复收录
fam = {
 "1": ("STMC 标准", "STMC Standard", "STMC スタンダード"),
 "2": ("STMC 45 度", "STMC 45-Degree", "STMC 45度"),
 "3": ("原神", "Genshin", "原神"),
 "4": ("原神 · 纳西妲", "Genshin Nahida", "原神 ナヒーダ"),
 "5": ("孤独摇滚 · 呆毛", "Bocchi the Rock · Ahoge", "ぼっち・ざ・ろっく! アホ毛"),
 "6": ("原神 · 芙宁娜", "Genshin Furina", "原神 フリーナ"),
 "7": ("沉默的魔女", "Silent Witch", "サイレント・ウィッチ"),
}
var = {
 "1": ("", "", ""), "2": (" · 白", " (White)", "(白)"),
 "3": (" · 经典(Windows 式)", " (Classic)", "(クラシック)"),
 "7": (" · 左手", " (Left-handed)", "(左手用)"),
}
special = {
 "3-2": ("原神 · 火元素", "Genshin (Pyro)", "原神(炎元素)"),
 "5-2": ("孤独摇滚 · 呆毛(虹夏)", "Bocchi the Rock · Nijika", "ぼっち・ざ・ろっく! 虹夏"),
}
n_stmc = 0
for f in sorted(glob.glob(STMC + "/*.inf")):
    key = re.search(r'STMC (\d)-(\d)', f)
    fm, vr = key.group(1), key.group(2)
    code = fm + "-" + vr
    if code in ("5-3", "7-2"):
        continue
    raw = open(f, "rb").read()
    for enc in ("utf-8-sig", "utf-16", "gbk"):
        try:
            t = raw.decode(enc); break
        except Exception:
            pass
    d = {}
    for ln in t.split("[Strings]")[1].splitlines():
        m = re.match(r'\s*(\w+)\s*=\s*"(.*)"', ln)
        if m:
            d[m.group(1).lower()] = m.group(2)
    src = {"arrow": d["curarrow"], "hand": d["curhand"], "ibeam": d["curibeam"], "grab": d["cursizeall"]}
    # Windows 的 Beam 是"反色"光标，Android 上画出来会看不见，换成同套里的黑色款
    if src["ibeam"] == "STMC Common 06 Beam.cur":
        src["ibeam"] = "STMC Common 06 Beam (Black).cur"
    tid = "stmc-" + code
    os.makedirs(f"{OUT}/{tid}")
    for slot, fn in src.items():
        shutil.copy(f"{STMC}/{fn}", f"{OUT}/{tid}/{slot}.cur")
    if code in special:
        zh, en, ja = special[code]
    else:
        zh, en, ja = fam[fm]
        if vr in ("2",) and fm in ("1", "2"):
            zh, en, ja = zh + var["2"][0], en + var["2"][1], ja + var["2"][2]
        elif vr == "3" and fm == "1":
            zh, en, ja = zh + var["3"][0], en + var["3"][1], ja + var["3"][2]
        elif vr == "7":
            zh, en, ja = zh + var["7"][0], en + var["7"][1], ja + var["7"][2]
    finish(tid, zh, en, ja)
    n_stmc += 1

# ---------------------------------------------------------------- Bibata (12 款，颜色取自 render.json)
rj = json.load(open(BIB + "/render.json"))
cfg = {}
for side in ("normal", "right"):
    c = tomllib.load(open(f"{BIB}/configs/{side}/win_rg.build.toml", "rb"))["cursors"]
    cfg[side] = {k: (c[k].get("x_hotspot", 128), c[k].get("y_hotspot", 128)) for k in ("left_ptr", "hand2", "xterm", "grabbing") if k in c}
    cfg[side].setdefault("xterm", (128, 128))
zhc = {"Amber": "琥珀", "Classic": "经典黑", "Ice": "冰白"}
jac = {"Amber": "アンバー", "Classic": "クラシック(黒)", "Ice": "アイス(白)"}
zhs = {"Modern": "圆角", "Original": "尖角"}
jas = {"Modern": "モダン(丸)", "Original": "オリジナル(尖)"}
n_bib = 0
for name, spec in rj.items():
    m = re.match(r'Bibata-(Modern|Original)-(Amber|Classic|Ice)(-Right)?$', name)
    if not m:
        continue
    style, color, right = m.group(1), m.group(2), bool(m.group(3))
    side = "right" if right else "normal"
    tid = "bibata-" + style.lower() + "-" + color.lower() + ("-right" if right else "")
    os.makedirs(f"{OUT}/{tid}")
    for slot, sv in (("arrow", "left_ptr"), ("hand", "hand2"), ("ibeam", "xterm"), ("grab", "grabbing")):
        svg = open(f"{BIB}/{spec['dir']}/{sv}.svg", encoding="utf-8").read()
        for cr in spec["colors"]:
            svg = svg.replace(cr["match"], cr["replace"]).replace(cr["match"].lower(), cr["replace"])
        png = cairosvg.svg2png(bytestring=svg.encode("utf-8"), output_width=64, output_height=64)
        hx, hy = cfg[side][sv]
        open(f"{OUT}/{tid}/{slot}.cur", "wb").write(cur_png(png, round(hx / 4), round(hy / 4)))
    en = f"Bibata {style} {color}" + (" (Mirrored, left-handed)" if right else "")
    zh = f"Bibata {zhs[style]} · {zhc[color]}" + (" · 镜像(左手用)" if right else "")
    ja = f"Bibata {jas[style]} {jac[color]}" + ("(反転・左手用)" if right else "")
    finish(tid, zh, en, ja)
    n_bib += 1

# ---------------------------------------------------------------- Capitaine (macOS 风格)
hs = {"default": (4, 2), "pointer": (12, 6), "text": (12, 12), "dnd-move": (12, 12)}
for v, zh, en, ja in (("dark", "macOS 风格 · 黑", "macOS style (Capitaine) · Black", "macOS風(Capitaine)・黒"),
                      ("light", "macOS 风格 · 白", "macOS style (Capitaine) · White", "macOS風(Capitaine)・白")):
    tid = "capitaine-" + v
    os.makedirs(f"{OUT}/{tid}")
    for slot, n in (("arrow", "default"), ("hand", "pointer"), ("ibeam", "text"), ("grab", "dnd-move")):
        png = cairosvg.svg2png(url=f"{CAP}{v}/{n}.svg", output_width=64, output_height=64)
        hx, hy = [round(x * 64 / 24) for x in hs[n]]
        open(f"{OUT}/{tid}/{slot}.cur", "wb").write(cur_png(png, hx, hy))
    finish(tid, zh, en, ja)

# 排序: 默认主题(STMC 标准)在最前，其余按 STMC → Bibata → Capitaine
open(f"{OUT}/index.txt", "w", encoding="utf-8").write("".join("|".join(t) + "\n" for t in themes))
print("STMC", n_stmc, "Bibata", n_bib, "total", len(themes))