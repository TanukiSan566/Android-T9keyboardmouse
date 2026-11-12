#!/usr/bin/env bash
# 重新生成 km_embed.h (手电筒助手 jar + 返回键脚本)。改了 KmTorch.java / killfg.sh 才需要跑。
# 包含 KmTorch(手电筒) + KmDot(root 红点/真实指针助手)
# 需要: javac(8+) 和 dx (apt install dalvik-exchange)
set -euo pipefail
cd "$(dirname "$0")"
rm -rf out && mkdir out
# stubs/ 里是仅供编译的占位类(系统框架里的 InputEventReceiver 等)，不进 dex
javac --release 8 -Xlint:-options -cp "${ANDROID_JAR:-/usr/share/java/com.android.android-23.jar}" -d out stubs/android/view/*.java kmt/KmTorch.java kmt/KmDot.java
(cd out && "${DX:-/usr/lib/android-sdk/build-tools/debian/dx}" --dex --output=../km_torch.jar kmt/*.class)
python3 - <<'PY'
def arr(name, data):
    s = "static const unsigned char %s[] = {\n" % name
    for i in range(0, len(data), 16):
        s += "  " + ",".join("0x%02x" % b for b in data[i:i+16]) + ",\n"
    return s + "};\nstatic const unsigned int %s_len = %d;\n" % (name, len(data))
jar = open("km_torch.jar","rb").read()
sh = open("killfg.sh","rb").read() + b"\0"
open("../km_embed.h","w").write("/* 自动生成: 见 native/gen_embed.sh */\n" + arr("km_torch_jar", jar) + arr("km_killfg_sh", sh))
PY
