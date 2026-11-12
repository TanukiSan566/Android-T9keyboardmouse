#!/usr/bin/env bash
# 一键: 交叉编译 native 守护进程 -> apktool 打包 -> 对齐 + debug 签名
# 用法:
#   ./build_and_sign.sh            # 用 zig 重新编译 keymouse.c (需要: pip install ziglang)
#   ./build_and_sign.sh /path/bin  # 或者直接使用你自己编译好的 arm64 静态可执行文件
# 需要: Java 11+、apktool_3.0.3.jar、uber-apk-signer-1.3.0.jar
# 注意: java 对含中文的路径可能报错，请把两个 jar 放在纯英文路径，用环境变量指定:
#   APKTOOL_JAR=/path/apktool_3.0.3.jar SIGNER_JAR=/path/uber-apk-signer-1.3.0.jar ./build_and_sign.sh
set -euo pipefail
cd "$(dirname "$0")"

APKTOOL_JAR="${APKTOOL_JAR:-./tools/apktool_3.0.3.jar}"
SIGNER_JAR="${SIGNER_JAR:-./tools/uber-apk-signer-1.3.0.jar}"
[ -f "$APKTOOL_JAR" ] || { echo "找不到 apktool: 请设置 APKTOOL_JAR"; exit 1; }
[ -f "$SIGNER_JAR" ]  || { echo "找不到 uber-apk-signer: 请设置 SIGNER_JAR"; exit 1; }

echo "[1/4] 准备 native 可执行文件..."
if [ $# -ge 1 ]; then
    cp "$1" assets/keymouse
else
    python3 -m ziglang cc -target aarch64-linux-musl -static -Os -s \
        -Wall -Wno-unused-function -o assets/keymouse keymouse.c
fi
chmod 755 assets/keymouse

echo "[2/4] 生成图标(res/mipmap-*)..."
[ -d res ] || python3 tools/make_icon.py res

echo "[3/4] apktool 构建未签名 APK..."
WORK="$(mktemp -d)"
rsync -a --exclude build --exclude '*.png' --exclude '*.apk' --exclude signed_out ./ "$WORK/proj/" 2>/dev/null || {
    mkdir -p "$WORK/proj" && cp -r . "$WORK/proj/" && rm -rf "$WORK/proj/build"; }
cp -r res "$WORK/proj/"      # rsync 排除了 png，图标要补回去
java -jar "$APKTOOL_JAR" b "$WORK/proj" -o keymouse-unsigned.apk

echo "[4/4] resources.arsc 改为不压缩 + zipalign + debug 签名..."
# Android 11+ 要求 resources.arsc 不压缩且对齐，否则安装报 -124
python3 tools/fix_arsc.py
rm -rf signed_out
java -jar "$SIGNER_JAR" --apks keymouse-fixed.apk --out signed_out
cp signed_out/*-aligned-debugSigned.apk ./keymouse-debug-signed.apk
rm -rf "$WORK"
echo; echo "完成: ./keymouse-debug-signed.apk"
