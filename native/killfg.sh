# keymouse: 长按返回键 -> 结束前台应用 (守护进程用 sh -c 执行本脚本，不是文件)
# $0=km  $1=日志文件  $2=守护进程 pid  $3=本次触发序号
LF="$1"
[ -z "$LF" ] && LF=/dev/null
TAG="[kill-fg #$3 d=$2]"
V='^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z0-9_]+)+$'
log() { echo "$TAG $*" >> "$LF"; }
valid() { echo "$1" | grep -qE "$V"; }
cut_pkg() { sed -nE 's#.* u[0-9]+ ([^ /]+)/.*#\1#p' | head -n1; }

# 每个来源都把原始行写进日志，万一又取错，直接看日志就知道这台机器的真实格式。
L1=$(dumpsys activity activities 2>/dev/null | grep -m1 -E 'topResumedActivity=|[mM]ResumedActivity[:=]')
P1=$(echo "$L1" | cut_pkg)
L2=$(dumpsys activity top 2>/dev/null | grep -m1 -E '^ *ACTIVITY ')
P2=$(echo "$L2" | sed -nE 's#^ *ACTIVITY ([^ /]+)/.*#\1#p' | head -n1)
L3=$(dumpsys window displays 2>/dev/null | grep -m1 -E 'mFocusedApp=')
P3=$(echo "$L3" | cut_pkg)
L4=$(dumpsys window 2>/dev/null | grep -m1 -E 'mCurrentFocus=Window')
P4=$(echo "$L4" | cut_pkg)
log "S1[$P1] $L1"
log "S2[$P2] $L2"
log "S3[$P3] $L3"
log "S4[$P4] $L4"

P=""
for c in "$P1" "$P2" "$P3" "$P4"; do
  if valid "$c"; then P="$c"; break; fi
done
H=$(cmd package resolve-activity --brief -a android.intent.action.MAIN -c android.intent.category.HOME 2>/dev/null | tail -n1 | cut -d/ -f1)
log "采用 P=$P  桌面 H=$H"
if ! valid "$P"; then log "没取到合法包名，不处理"; exit 0; fi
case "$P" in
  com.android.systemui|android|"$H") log "前台是桌面/系统界面，不结束: $P"; exit 0;;
esac
am force-stop "$P" >> "$LF" 2>&1
RC=$?
log "am force-stop $P rc=$RC"
# 屏幕底部气泡: 前台"xxxx"已强制关闭 (包名 -> 应用名由助手进程解析，语言跟 App 设置一致)
#
# 优先写文件请求，交给常驻 root 助手(KmDot)画——它不是 App 进程，不受内存
# 回收影响，哪个 App 在前台都能弹出来；只有助手不在运行(心跳文件不新鲜)时
# 才退回旧的 am broadcast 兜底(至少 keymouse 自己在前台时还能看到)。
if [ "$RC" = "0" ]; then
  am broadcast --receiver-foreground -a com.keymouse.tool.TOGGLE -n com.keymouse.tool/.ToggleReceiver --es tip kill --es arg "$P" >/dev/null 2>&1 &
fi
input keyevent KEYCODE_HOME
