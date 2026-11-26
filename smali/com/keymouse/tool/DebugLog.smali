.class final Lcom/keymouse/tool/DebugLog;
.super Ljava/lang/Object;
.source "DebugLog.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Z)V
    .locals 0

    .prologue
    .line 20
    invoke-static {p0, p1}, Lcom/keymouse/tool/DebugLog;->set(Landroid/content/Context;Z)V

    return-void
.end method

.method static build(Landroid/app/Activity;)Landroid/view/View;
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 83
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 84
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 85
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 86
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 87
    const/16 v2, 0x28

    const/16 v3, 0xa

    invoke-virtual {v1, v4, v2, v4, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 88
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 89
    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 90
    const-string v3, "Bug log"

    const-string v4, "\u041b\u043e\u0433 \u043e\u0448\u0438\u0431\u043e\u043a"

    const-string v5, "\u30d0\u30b0\u30ed\u30b0"

    const-string v6, "Bug \u65e5\u5fd7\u8bb0\u5f55"

    invoke-static {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 92
    new-instance v2, Landroid/widget/Switch;

    invoke-direct {v2, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 93
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->isOn(Landroid/content/Context;)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 94
    new-instance v3, Lcom/keymouse/tool/DebugLog$1;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/DebugLog$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 99
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 101
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 102
    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 103
    const v2, 0x3f333333    # 0.7f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 104
    const-string v2, "Recorded continuously to /sdcard/keymousedebug/ - one txt per master-switch start, stops when it is turned off"

    const-string v3, "\u0417\u0430\u043f\u0438\u0441\u044c \u0432 /sdcard/keymousedebug/ - \u043e\u0434\u0438\u043d txt \u043d\u0430 \u043a\u0430\u0436\u0434\u043e\u0435 \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u0435, \u043e\u0441\u0442\u0430\u043d\u0430\u0432\u043b\u0438\u0432\u0430\u0435\u0442\u0441\u044f \u043f\u0440\u0438 \u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u0438"

    const-string v4, "/sdcard/keymousedebug/ \u306b\u5e38\u6642\u8a18\u9332 - \u30e1\u30a4\u30f3\u30b9\u30a4\u30c3\u30c1\u958b\u59cb\u3054\u3068\u306b1\u3064\u306etxt\u3001\u30aa\u30d5\u3067\u505c\u6b62"

    const-string v5, "\u6301\u7eed\u8bb0\u5f55\u5230 /sdcard/keymousedebug/\uff0c\u603b\u5f00\u5173\u6bcf\u5f00\u542f\u4e00\u6b21\u751f\u6210\u4e00\u4e2a txt\uff0c\u5173\u95ed\u603b\u5f00\u5173\u540e\u505c\u6b62"

    invoke-static {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 109
    return-object v0
.end method

.method private static flag(Landroid/content/Context;)Ljava/io/File;
    .locals 3

    .prologue
    .line 25
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "keymouse_debug"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method static hint(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .prologue
    .line 60
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->isOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    const-string v0, "Recording to /sdcard/keymousedebug/ (cleared at 10 MB)"

    const-string v1, "\u0417\u0430\u043f\u0438\u0441\u044c \u0432 /sdcard/keymousedebug/ (\u043e\u0447\u0438\u0441\u0442\u043a\u0430 \u043f\u0440\u0438 10 \u041c\u0411)"

    const-string v2, "/sdcard/keymousedebug/ \u306b\u8a18\u9332\u4e2d(10MB\u3067\u81ea\u52d5\u30af\u30ea\u30a2)"

    const-string v3, "\u65e5\u5fd7\u8bb0\u5f55\u5230 /sdcard/keymousedebug/\uff08\u6ee1 10MB \u81ea\u52a8\u6e05\u7a7a\uff09"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 60
    :goto_0
    return-object v0

    .line 65
    :cond_0
    const-string v0, "Bug log recording stopped"

    const-string v1, "\u0417\u0430\u043f\u0438\u0441\u044c \u043b\u043e\u0433\u0430 \u043e\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u0430"

    const-string v2, "\u30d0\u30b0\u30ed\u30b0\u8a18\u9332\u3092\u505c\u6b62\u3057\u307e\u3057\u305f"

    const-string v3, "\u5df2\u505c\u6b62\u8bb0\u5f55 Bug \u65e5\u5fd7"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static isOn(Landroid/content/Context;)Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 30
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->flag(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 31
    invoke-virtual {v1}, Ljava/io/FileInputStream;->read()I

    move-result v2

    .line 32
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    const/16 v1, 0x30

    if-eq v2, v1, :cond_0

    .line 35
    :goto_0
    return v0

    .line 33
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 34
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static label(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .prologue
    .line 52
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->isOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    const-string v0, "Bug log recording: ON (tap to stop)"

    const-string v1, "\u0417\u0430\u043f\u0438\u0441\u044c \u043b\u043e\u0433\u0430 \u043e\u0448\u0438\u0431\u043e\u043a: \u0412\u041a\u041b (\u043d\u0430\u0436\u043c\u0438\u0442\u0435, \u0447\u0442\u043e\u0431\u044b \u0432\u044b\u043a\u043b\u044e\u0447\u0438\u0442\u044c)"

    const-string v2, "\u30d0\u30b0\u30ed\u30b0\u8a18\u9332: \u30aa\u30f3(\u30bf\u30c3\u30d7\u3067\u505c\u6b62)"

    const-string v3, "Bug \u65e5\u5fd7\u8bb0\u5f55\uff1a\u5df2\u5f00\u542f\uff08\u70b9\u51fb\u5173\u95ed\uff09"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 52
    :goto_0
    return-object v0

    .line 55
    :cond_0
    const-string v0, "Bug log recording: OFF (tap to start)"

    const-string v1, "\u0417\u0430\u043f\u0438\u0441\u044c \u043b\u043e\u0433\u0430 \u043e\u0448\u0438\u0431\u043e\u043a: \u0412\u042b\u041a\u041b (\u043d\u0430\u0436\u043c\u0438\u0442\u0435, \u0447\u0442\u043e\u0431\u044b \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u044c)"

    const-string v2, "\u30d0\u30b0\u30ed\u30b0\u8a18\u9332: \u30aa\u30d5(\u30bf\u30c3\u30d7\u3067\u958b\u59cb)"

    const-string v3, "Bug \u65e5\u5fd7\u8bb0\u5f55\uff1a\u5df2\u5173\u95ed\uff08\u70b9\u51fb\u5f00\u542f\uff09"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static set(Landroid/content/Context;Z)V
    .locals 3

    .prologue
    .line 71
    :try_start_0
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->flag(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 72
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 73
    if-eqz p1, :cond_0

    const/16 v0, 0x31

    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write(I)V

    .line 74
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 75
    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/io/File;->setReadable(ZZ)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :goto_1
    return-void

    .line 73
    :cond_0
    const/16 v0, 0x30

    goto :goto_0

    .line 76
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method static toggle(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 41
    :try_start_0
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->flag(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 42
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 43
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->isOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x30

    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write(I)V

    .line 44
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 45
    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/io/File;->setReadable(ZZ)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :goto_1
    return-void

    .line 43
    :cond_0
    const/16 v0, 0x31

    goto :goto_0

    .line 46
    :catch_0
    move-exception v0

    goto :goto_1
.end method
