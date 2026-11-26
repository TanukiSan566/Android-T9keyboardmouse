.class public final Lcom/keymouse/tool/PosDot;
.super Ljava/lang/Object;
.source "PosDot.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keymouse/tool/PosDot$Art;,
        Lcom/keymouse/tool/PosDot$Tick;
    }
.end annotation


# static fields
.field private static final BUF:[B

.field private static final FADE_ANIM_MS:J = 0x2bcL

.field private static final FADE_MS:J = 0x3a98L

.field private static final POLL_MS:I = 0x21

.field private static final TICK:Lcom/keymouse/tool/PosDot$Tick;

.field private static sBeat:Ljava/io/File;

.field private static sBeatAt:J

.field private static sCfgAt:J

.field private static sCursorCfg:Ljava/io/File;

.field private static sCursorHide:Z

.field private static sCursorOk:Ljava/io/File;

.field private static sCursorOn:Z

.field private static sDot:Lcom/keymouse/tool/PosDot$Art;

.field private static sFile:Ljava/io/File;

.field private static sHandler:Landroid/os/Handler;

.field private static sLastX:I

.field private static sLastY:I

.field private static sLp:Landroid/view/WindowManager$LayoutParams;

.field private static sOkAt:J

.field private static sPtr:Ljava/io/File;

.field private static sVisible:Z

.field private static sWin:I

.field private static sWm:Landroid/view/WindowManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const v1, -0x1869f

    const-wide/16 v2, 0x0

    .line 41
    new-instance v0, Lcom/keymouse/tool/PosDot$Tick;

    invoke-direct {v0}, Lcom/keymouse/tool/PosDot$Tick;-><init>()V

    sput-object v0, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    .line 54
    sput v1, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 55
    sput v1, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 56
    const/4 v0, 0x1

    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorOn:Z

    .line 57
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorHide:Z

    .line 58
    sput-wide v2, Lcom/keymouse/tool/PosDot;->sCfgAt:J

    .line 59
    sput-wide v2, Lcom/keymouse/tool/PosDot;->sOkAt:J

    .line 60
    sput-wide v2, Lcom/keymouse/tool/PosDot;->sBeatAt:J

    .line 61
    const/16 v0, 0x40

    new-array v0, v0, [B

    sput-object v0, Lcom/keymouse/tool/PosDot;->BUF:[B

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    return-void
.end method

.method private static clamp01(F)F
    .locals 3

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    .line 259
    cmpg-float v2, p0, v0

    if-gez v2, :cond_1

    move p0, v0

    :cond_0
    :goto_0
    return p0

    :cond_1
    cmpl-float v0, p0, v1

    if-lez v0, :cond_0

    move p0, v1

    goto :goto_0
.end method

.method private static readFirstLine(Ljava/io/File;)Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 119
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 120
    sget-object v2, Lcom/keymouse/tool/PosDot;->BUF:[B

    invoke-virtual {v1, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    .line 121
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 122
    if-gtz v2, :cond_0

    .line 125
    :goto_0
    return-object v0

    .line 123
    :cond_0
    new-instance v1, Ljava/lang/String;

    sget-object v3, Lcom/keymouse/tool/PosDot;->BUF:[B

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4, v2}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 124
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static refreshCursorFlags(J)V
    .locals 8

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 131
    sget-wide v4, Lcom/keymouse/tool/PosDot;->sCfgAt:J

    sub-long v4, p0, v4

    const-wide/16 v6, 0x190

    cmp-long v0, v4, v6

    if-lez v0, :cond_1

    .line 132
    sput-wide p0, Lcom/keymouse/tool/PosDot;->sCfgAt:J

    .line 133
    sget-object v0, Lcom/keymouse/tool/PosDot;->sCursorCfg:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/PosDot;->readFirstLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 134
    if-eqz v0, :cond_0

    const-string v3, "0"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_0
    move v0, v2

    :goto_0
    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorOn:Z

    .line 136
    :cond_1
    sget-wide v4, Lcom/keymouse/tool/PosDot;->sOkAt:J

    sub-long v4, p0, v4

    const-wide/16 v6, 0x3e8

    cmp-long v0, v4, v6

    if-lez v0, :cond_2

    .line 137
    sput-wide p0, Lcom/keymouse/tool/PosDot;->sOkAt:J

    .line 138
    sget-object v0, Lcom/keymouse/tool/PosDot;->sCursorOk:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/PosDot;->readFirstLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 139
    if-eqz v0, :cond_4

    const-string v3, "1"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    :goto_1
    sput-boolean v2, Lcom/keymouse/tool/PosDot;->sCursorHide:Z

    .line 141
    :cond_2
    return-void

    :cond_3
    move v0, v1

    .line 134
    goto :goto_0

    :cond_4
    move v2, v1

    .line 139
    goto :goto_1
.end method

.method public static start(Landroid/content/Context;)V
    .locals 10

    .prologue
    .line 67
    sget-object v2, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-eqz v2, :cond_0

    .line 104
    :goto_0
    return-void

    .line 69
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 70
    if-nez v2, :cond_2

    .line 71
    :goto_1
    const-string v2, "window"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/view/WindowManager;

    move-object v8, v0

    .line 72
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 73
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 74
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_pos"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    .line 75
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_ptr"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    .line 76
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_cursor"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sCursorCfg:Ljava/io/File;

    .line 77
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_cursor_ok"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sCursorOk:Ljava/io/File;

    .line 78
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_cursor_beat"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    .line 80
    new-instance v9, Lcom/keymouse/tool/PosDot$Art;

    invoke-direct {v9, p0, v2}, Lcom/keymouse/tool/PosDot$Art;-><init>(Landroid/content/Context;F)V

    .line 81
    iget v2, v9, Lcom/keymouse/tool/PosDot$Art;->win:I

    sput v2, Lcom/keymouse/tool/PosDot;->sWin:I

    .line 82
    const/4 v2, 0x4

    invoke-virtual {v9, v2}, Lcom/keymouse/tool/PosDot$Art;->setVisibility(I)V

    .line 85
    new-instance v2, Landroid/view/WindowManager$LayoutParams;

    sget v3, Lcom/keymouse/tool/PosDot;->sWin:I

    sget v4, Lcom/keymouse/tool/PosDot;->sWin:I

    const/16 v5, 0x7f6

    const/16 v6, 0x318

    const/4 v7, -0x3

    invoke-direct/range {v2 .. v7}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 86
    const/16 v3, 0x33

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 87
    invoke-interface {v8, v9, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    sput-object v8, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    .line 90
    sput-object v9, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    .line 91
    sput-object v2, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    .line 92
    const/4 v2, 0x0

    sput-boolean v2, Lcom/keymouse/tool/PosDot;->sVisible:Z

    .line 93
    const v2, -0x1869f

    sput v2, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 94
    const v2, -0x1869f

    sput v2, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 95
    const-wide/16 v2, 0x0

    sput-wide v2, Lcom/keymouse/tool/PosDot;->sCfgAt:J

    .line 96
    const-wide/16 v2, 0x0

    sput-wide v2, Lcom/keymouse/tool/PosDot;->sOkAt:J

    .line 97
    const-wide/16 v2, 0x0

    sput-wide v2, Lcom/keymouse/tool/PosDot;->sBeatAt:J

    .line 98
    sget-object v2, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-nez v2, :cond_1

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    .line 99
    :cond_1
    sget-object v2, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v3, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 100
    sget-object v2, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v3, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 101
    :catch_0
    move-exception v2

    .line 102
    const/4 v2, 0x0

    sput-object v2, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    goto/16 :goto_0

    :cond_2
    move-object p0, v2

    goto/16 :goto_1
.end method

.method public static stop()V
    .locals 2

    .prologue
    .line 108
    :try_start_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 109
    :cond_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :cond_1
    :goto_0
    const/4 v0, 0x0

    sput-object v0, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    .line 114
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sVisible:Z

    .line 115
    return-void

    .line 110
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static tick()V
    .locals 18

    .prologue
    .line 144
    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-nez v0, :cond_1

    .line 242
    :cond_0
    :goto_0
    return-void

    .line 145
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 146
    invoke-static {v12, v13}, Lcom/keymouse/tool/PosDot;->refreshCursorFlags(J)V

    .line 150
    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorOn:Z

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorHide:Z

    if-eqz v0, :cond_2

    sget-wide v0, Lcom/keymouse/tool/PosDot;->sBeatAt:J

    sub-long v0, v12, v0

    const-wide/16 v2, 0xfa

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 151
    sput-wide v12, Lcom/keymouse/tool/PosDot;->sBeatAt:J

    .line 152
    invoke-static {}, Lcom/keymouse/tool/PosDot;->touchBeat()V

    .line 154
    :cond_2
    const/4 v7, 0x0

    .line 155
    const/4 v6, 0x1

    .line 156
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v0, 0x0

    .line 157
    sget-object v1, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    sub-long v14, v12, v8

    .line 159
    const-wide/16 v8, 0x0

    cmp-long v1, v14, v8

    if-ltz v1, :cond_15

    const-wide/16 v8, 0x3a98

    cmp-long v1, v14, v8

    if-gtz v1, :cond_15

    .line 160
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    sget-object v8, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    invoke-direct {v1, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 161
    sget-object v8, Lcom/keymouse/tool/PosDot;->BUF:[B

    invoke-virtual {v1, v8}, Ljava/io/FileInputStream;->read([B)I

    move-result v8

    .line 162
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 163
    const/16 v1, 0x18

    if-lt v8, v1, :cond_15

    .line 164
    new-instance v1, Ljava/lang/String;

    sget-object v9, Lcom/keymouse/tool/PosDot;->BUF:[B

    const/4 v10, 0x0

    invoke-direct {v1, v9, v10, v8}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v8, " +"

    invoke-virtual {v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 165
    array-length v1, v8

    const/4 v9, 0x5

    if-lt v1, v9, :cond_15

    const-string v1, "1"

    const/4 v9, 0x0

    aget-object v9, v8, v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 166
    const/4 v1, 0x1

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 167
    const/4 v1, 0x2

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 168
    const/4 v1, 0x3

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 169
    const/4 v1, 0x4

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 170
    array-length v1, v8

    const/4 v7, 0x6

    if-lt v1, v7, :cond_14

    const/4 v1, 0x5

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 171
    :goto_1
    :try_start_1
    array-length v0, v8

    const/4 v7, 0x7

    if-lt v0, v7, :cond_3

    const-string v0, "0"

    const/4 v7, 0x6

    aget-object v7, v8, v7

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    move-result v0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_2
    move v6, v0

    .line 172
    :cond_3
    const/4 v0, 0x1

    if-le v3, v0, :cond_a

    const/4 v0, 0x1

    if-le v2, v0, :cond_a

    const/4 v0, 0x1

    :goto_3
    move v7, v0

    :goto_4
    move v8, v1

    move v9, v2

    move v10, v5

    move v11, v6

    .line 179
    :goto_5
    if-eqz v7, :cond_b

    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorOn:Z

    if-eqz v0, :cond_b

    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorHide:Z

    if-eqz v0, :cond_b

    const/4 v0, 0x1

    move v6, v0

    .line 180
    :goto_6
    if-eqz v7, :cond_c

    if-eqz v11, :cond_c

    const/4 v0, 0x1

    move v5, v0

    .line 181
    :goto_7
    if-nez v6, :cond_4

    if-eqz v5, :cond_d

    :cond_4
    const/4 v0, 0x1

    .line 184
    :goto_8
    if-eqz v0, :cond_12

    .line 185
    :try_start_2
    sget-object v1, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 186
    new-instance v7, Landroid/graphics/Point;

    invoke-direct {v7}, Landroid/graphics/Point;-><init>()V

    .line 187
    invoke-virtual {v1, v7}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 188
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v11

    .line 189
    int-to-float v1, v10

    add-int/lit8 v2, v3, -0x1

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-static {v1}, Lcom/keymouse/tool/PosDot;->clamp01(F)F

    move-result v2

    .line 190
    int-to-float v1, v4

    add-int/lit8 v3, v9, -0x1

    int-to-float v3, v3

    div-float/2addr v1, v3

    invoke-static {v1}, Lcom/keymouse/tool/PosDot;->clamp01(F)F

    move-result v3

    .line 193
    const/4 v1, 0x1

    if-ne v11, v1, :cond_e

    .line 194
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v2

    move v4, v3

    .line 202
    :goto_9
    iget v2, v7, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    mul-float/2addr v2, v4

    float-to-int v2, v2

    .line 203
    iget v3, v7, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    mul-float/2addr v1, v3

    float-to-int v1, v1

    .line 205
    sget-object v3, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v16

    sub-long v12, v12, v16

    .line 206
    const-wide/16 v16, 0x0

    cmp-long v3, v12, v16

    if-ltz v3, :cond_5

    const-wide/16 v16, 0xbb8

    cmp-long v3, v12, v16

    if-gtz v3, :cond_5

    .line 207
    sget-object v3, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    invoke-static {v3}, Lcom/keymouse/tool/PosDot;->readFirstLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    .line 208
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v7, 0xa

    if-le v4, v7, :cond_5

    .line 209
    const-string v4, " +"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 210
    array-length v4, v3

    const/4 v7, 0x5

    if-lt v4, v7, :cond_5

    const/4 v4, 0x0

    aget-object v4, v3, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v11, :cond_5

    .line 211
    const/4 v1, 0x3

    aget-object v1, v3, v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    float-to-int v2, v1

    .line 212
    const/4 v1, 0x4

    aget-object v1, v3, v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    float-to-int v1, v1

    .line 216
    :cond_5
    sget v3, Lcom/keymouse/tool/PosDot;->sWin:I

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    .line 217
    sget v3, Lcom/keymouse/tool/PosDot;->sWin:I

    div-int/lit8 v3, v3, 0x2

    sub-int v3, v1, v3

    .line 219
    const-wide/16 v10, 0x37dc

    cmp-long v1, v14, v10

    if-lez v1, :cond_11

    .line 220
    const/4 v1, 0x0

    const-wide/16 v10, 0x3a98

    sub-long/2addr v10, v14

    long-to-float v4, v10

    const/high16 v7, 0x442f0000    # 700.0f

    div-float/2addr v4, v7

    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 221
    :goto_a
    sget-object v4, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-virtual {v4, v1}, Lcom/keymouse/tool/PosDot$Art;->setAlpha(F)V

    .line 222
    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-virtual {v1, v6, v5}, Lcom/keymouse/tool/PosDot$Art;->configure(ZZ)V

    .line 223
    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-virtual {v1, v8}, Lcom/keymouse/tool/PosDot$Art;->setPress(I)V

    .line 224
    sget v1, Lcom/keymouse/tool/PosDot;->sLastX:I

    if-ne v2, v1, :cond_6

    sget v1, Lcom/keymouse/tool/PosDot;->sLastY:I

    if-eq v3, v1, :cond_7

    .line 225
    :cond_6
    sget-object v1, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 226
    sget-object v1, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 227
    sget-object v1, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    sget-object v4, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    sget-object v5, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v1, v4, v5}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 228
    sput v2, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 229
    sput v3, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 234
    :cond_7
    :goto_b
    sget-boolean v1, Lcom/keymouse/tool/PosDot;->sVisible:Z

    if-eq v0, v1, :cond_8

    .line 235
    sget-object v2, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-eqz v0, :cond_13

    const/4 v1, 0x0

    :goto_c
    invoke-virtual {v2, v1}, Lcom/keymouse/tool/PosDot$Art;->setVisibility(I)V

    .line 236
    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sVisible:Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 241
    :cond_8
    :goto_d
    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    const-wide/16 v2, 0x21

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 171
    :cond_9
    const/4 v0, 0x0

    goto/16 :goto_2

    .line 172
    :cond_a
    const/4 v0, 0x0

    goto/16 :goto_3

    .line 176
    :catch_0
    move-exception v1

    .line 177
    :goto_e
    const/4 v7, 0x0

    move v8, v0

    move v9, v2

    move v10, v5

    move v11, v6

    goto/16 :goto_5

    .line 179
    :cond_b
    const/4 v0, 0x0

    move v6, v0

    goto/16 :goto_6

    .line 180
    :cond_c
    const/4 v0, 0x0

    move v5, v0

    goto/16 :goto_7

    .line 181
    :cond_d
    const/4 v0, 0x0

    goto/16 :goto_8

    .line 195
    :cond_e
    const/4 v1, 0x2

    if-ne v11, v1, :cond_f

    .line 196
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v2, v1, v2

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v3

    move v4, v2

    goto/16 :goto_9

    .line 197
    :cond_f
    const/4 v1, 0x3

    if-ne v11, v1, :cond_10

    .line 198
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v3, v1, v3

    move v1, v2

    move v4, v3

    goto/16 :goto_9

    :cond_10
    move v1, v3

    move v4, v2

    .line 200
    goto/16 :goto_9

    .line 220
    :cond_11
    const/high16 v1, 0x3f800000    # 1.0f

    goto/16 :goto_a

    .line 232
    :cond_12
    :try_start_3
    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-virtual {v1}, Lcom/keymouse/tool/PosDot$Art;->reset()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_b

    .line 238
    :catch_1
    move-exception v0

    goto :goto_d

    .line 235
    :cond_13
    const/4 v1, 0x4

    goto :goto_c

    .line 176
    :catch_2
    move-exception v0

    move v0, v1

    goto :goto_e

    :cond_14
    move v1, v0

    goto/16 :goto_1

    :cond_15
    move v1, v0

    goto/16 :goto_4
.end method

.method private static touchBeat()V
    .locals 4

    .prologue
    .line 246
    :try_start_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 247
    new-instance v0, Ljava/io/FileOutputStream;

    sget-object v1, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 248
    const/16 v1, 0x31

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write(I)V

    .line 249
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 250
    sget-object v0, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setReadable(ZZ)Z

    .line 252
    :cond_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/io/File;->setLastModified(J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    :goto_0
    return-void

    .line 253
    :catch_0
    move-exception v0

    goto :goto_0
.end method
