.class final Lcom/keymouse/tool/DebugLog;
.super Ljava/lang/Object;
.source "DebugLog.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method private static flag(Landroid/content/Context;)Ljava/io/File;
    .locals 3

    .prologue
    .line 19
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
    .line 54
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->isOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    const-string v0, "Recording to /sdcard/keymousedebug/ (cleared at 10 MB)"

    const-string v1, "\u0417\u0430\u043f\u0438\u0441\u044c \u0432 /sdcard/keymousedebug/ (\u043e\u0447\u0438\u0441\u0442\u043a\u0430 \u043f\u0440\u0438 10 \u041c\u0411)"

    const-string v2, "/sdcard/keymousedebug/ \u306b\u8a18\u9332\u4e2d(10MB\u3067\u81ea\u52d5\u30af\u30ea\u30a2)"

    const-string v3, "\u65e5\u5fd7\u8bb0\u5f55\u5230 /sdcard/keymousedebug/\uff08\u6ee1 10MB \u81ea\u52a8\u6e05\u7a7a\uff09"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    :goto_0
    return-object v0

    .line 59
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
    const/4 v0, 0x0

    .line 24
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->flag(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 25
    invoke-virtual {v1}, Ljava/io/FileInputStream;->read()I

    move-result v2

    .line 26
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    const/16 v1, 0x31

    if-ne v2, v1, :cond_0

    const/4 v0, 0x1

    .line 29
    :cond_0
    :goto_0
    return v0

    .line 28
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static label(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .prologue
    .line 46
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->isOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    const-string v0, "Bug log recording: ON (tap to stop)"

    const-string v1, "\u0417\u0430\u043f\u0438\u0441\u044c \u043b\u043e\u0433\u0430 \u043e\u0448\u0438\u0431\u043e\u043a: \u0412\u041a\u041b (\u043d\u0430\u0436\u043c\u0438\u0442\u0435, \u0447\u0442\u043e\u0431\u044b \u0432\u044b\u043a\u043b\u044e\u0447\u0438\u0442\u044c)"

    const-string v2, "\u30d0\u30b0\u30ed\u30b0\u8a18\u9332: \u30aa\u30f3(\u30bf\u30c3\u30d7\u3067\u505c\u6b62)"

    const-string v3, "Bug \u65e5\u5fd7\u8bb0\u5f55\uff1a\u5df2\u5f00\u542f\uff08\u70b9\u51fb\u5173\u95ed\uff09"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 46
    :goto_0
    return-object v0

    .line 49
    :cond_0
    const-string v0, "Bug log recording: OFF (tap to start)"

    const-string v1, "\u0417\u0430\u043f\u0438\u0441\u044c \u043b\u043e\u0433\u0430 \u043e\u0448\u0438\u0431\u043e\u043a: \u0412\u042b\u041a\u041b (\u043d\u0430\u0436\u043c\u0438\u0442\u0435, \u0447\u0442\u043e\u0431\u044b \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u044c)"

    const-string v2, "\u30d0\u30b0\u30ed\u30b0\u8a18\u9332: \u30aa\u30d5(\u30bf\u30c3\u30d7\u3067\u958b\u59cb)"

    const-string v3, "Bug \u65e5\u5fd7\u8bb0\u5f55\uff1a\u5df2\u5173\u95ed\uff08\u70b9\u51fb\u5f00\u542f\uff09"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static toggle(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 35
    :try_start_0
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->flag(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 36
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 37
    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->isOn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x30

    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write(I)V

    .line 38
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 39
    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/io/File;->setReadable(ZZ)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    :goto_1
    return-void

    .line 37
    :cond_0
    const/16 v0, 0x31

    goto :goto_0

    .line 40
    :catch_0
    move-exception v0

    goto :goto_1
.end method
