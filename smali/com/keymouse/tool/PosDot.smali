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

.field private static sDensity:F

.field private static sDot:Lcom/keymouse/tool/PosDot$Art;

.field private static sFile:Ljava/io/File;

.field private static sGrabMs:I

.field private static sHandler:Landroid/os/Handler;

.field private static sLastX:I

.field private static sLastY:I

.field private static sLatched:I

.field private static sLibDir:Ljava/io/File;

.field private static sLp:Landroid/view/WindowManager$LayoutParams;

.field private static sOkAt:J

.field private static sPressAt:J

.field private static sPrevPress:I

.field private static sPtr:Ljava/io/File;

.field private static final sSets:[Lcom/keymouse/tool/CurLoader$Set;

.field private static sSizeDp:I

.field private static sSmart:Z

.field private static sThemeCfg:Ljava/io/File;

.field private static sThemeChk:J

.field private static sThemeMt:J

.field private static sThemeOn:Z

.field private static sVisible:Z

.field private static sWin:I

.field private static sWm:Landroid/view/WindowManager;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const v1, -0x1869f

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    .line 42
    new-instance v0, Lcom/keymouse/tool/PosDot$Tick;

    invoke-direct {v0}, Lcom/keymouse/tool/PosDot$Tick;-><init>()V

    sput-object v0, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    .line 55
    sput v1, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 56
    sput v1, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 57
    sput-boolean v5, Lcom/keymouse/tool/PosDot;->sCursorOn:Z

    .line 58
    sput-boolean v4, Lcom/keymouse/tool/PosDot;->sCursorHide:Z

    .line 59
    sput-wide v2, Lcom/keymouse/tool/PosDot;->sCfgAt:J

    .line 60
    sput-wide v2, Lcom/keymouse/tool/PosDot;->sOkAt:J

    .line 61
    sput-wide v2, Lcom/keymouse/tool/PosDot;->sBeatAt:J

    .line 62
    const/16 v0, 0x40

    new-array v0, v0, [B

    sput-object v0, Lcom/keymouse/tool/PosDot;->BUF:[B

    .line 67
    const-wide/16 v0, -0x2

    sput-wide v0, Lcom/keymouse/tool/PosDot;->sThemeMt:J

    .line 68
    sput-wide v2, Lcom/keymouse/tool/PosDot;->sThemeChk:J

    .line 69
    sput-boolean v4, Lcom/keymouse/tool/PosDot;->sThemeOn:Z

    .line 70
    const/16 v0, 0x20

    sput v0, Lcom/keymouse/tool/PosDot;->sSizeDp:I

    .line 71
    sput-boolean v5, Lcom/keymouse/tool/PosDot;->sSmart:Z

    .line 72
    const/16 v0, 0x1c2

    sput v0, Lcom/keymouse/tool/PosDot;->sGrabMs:I

    .line 73
    const/high16 v0, 0x3f800000    # 1.0f

    sput v0, Lcom/keymouse/tool/PosDot;->sDensity:F

    .line 74
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/keymouse/tool/CurLoader$Set;

    sput-object v0, Lcom/keymouse/tool/PosDot;->sSets:[Lcom/keymouse/tool/CurLoader$Set;

    .line 75
    sput v4, Lcom/keymouse/tool/PosDot;->sPrevPress:I

    .line 76
    sput-wide v2, Lcom/keymouse/tool/PosDot;->sPressAt:J

    .line 77
    sput v4, Lcom/keymouse/tool/PosDot;->sLatched:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    return-void
.end method

.method private static clamp01(F)F
    .locals 3

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    .line 328
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

.method private static pickSet(I)Lcom/keymouse/tool/CurLoader$Set;
    .locals 2

    .prologue
    .line 189
    sget-object v0, Lcom/keymouse/tool/PosDot;->sSets:[Lcom/keymouse/tool/CurLoader$Set;

    aget-object v0, v0, p0

    .line 190
    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sSets:[Lcom/keymouse/tool/CurLoader$Set;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_0
.end method

.method private static readFirstLine(Ljava/io/File;)Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 140
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 141
    sget-object v2, Lcom/keymouse/tool/PosDot;->BUF:[B

    invoke-virtual {v1, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    .line 142
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 143
    if-gtz v2, :cond_0

    .line 146
    :goto_0
    return-object v0

    .line 144
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

    .line 145
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static refreshCursorFlags(J)V
    .locals 8

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 152
    sget-wide v4, Lcom/keymouse/tool/PosDot;->sCfgAt:J

    sub-long v4, p0, v4

    const-wide/16 v6, 0x190

    cmp-long v0, v4, v6

    if-lez v0, :cond_1

    .line 153
    sput-wide p0, Lcom/keymouse/tool/PosDot;->sCfgAt:J

    .line 154
    sget-object v0, Lcom/keymouse/tool/PosDot;->sCursorCfg:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/PosDot;->readFirstLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 155
    if-eqz v0, :cond_0

    const-string v3, "0"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    :cond_0
    move v0, v2

    :goto_0
    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorOn:Z

    .line 157
    :cond_1
    sget-wide v4, Lcom/keymouse/tool/PosDot;->sOkAt:J

    sub-long v4, p0, v4

    const-wide/16 v6, 0x3e8

    cmp-long v0, v4, v6

    if-lez v0, :cond_2

    .line 158
    sput-wide p0, Lcom/keymouse/tool/PosDot;->sOkAt:J

    .line 159
    sget-object v0, Lcom/keymouse/tool/PosDot;->sCursorOk:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/PosDot;->readFirstLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 160
    if-eqz v0, :cond_4

    const-string v3, "1"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    :goto_1
    sput-boolean v2, Lcom/keymouse/tool/PosDot;->sCursorHide:Z

    .line 162
    :cond_2
    return-void

    :cond_3
    move v0, v1

    .line 155
    goto :goto_0

    :cond_4
    move v2, v1

    .line 160
    goto :goto_1
.end method

.method private static refreshTheme(J)V
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 166
    sget-wide v0, Lcom/keymouse/tool/PosDot;->sThemeChk:J

    sub-long v0, p0, v0

    const-wide/16 v4, 0x1f4

    cmp-long v0, v0, v4

    if-gez v0, :cond_1

    .line 186
    :cond_0
    return-void

    .line 167
    :cond_1
    sput-wide p0, Lcom/keymouse/tool/PosDot;->sThemeChk:J

    .line 168
    sget-object v0, Lcom/keymouse/tool/PosDot;->sThemeCfg:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/keymouse/tool/PosDot;->sThemeCfg:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 169
    :goto_0
    sget-wide v4, Lcom/keymouse/tool/PosDot;->sThemeMt:J

    cmp-long v4, v0, v4

    if-eqz v4, :cond_0

    .line 170
    sput-wide v0, Lcom/keymouse/tool/PosDot;->sThemeMt:J

    .line 171
    sget-object v0, Lcom/keymouse/tool/PosDot;->sThemeCfg:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->parse(Ljava/io/File;)Ljava/util/Map;

    move-result-object v1

    .line 172
    const-string v0, "on"

    invoke-static {v1, v0, v2}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_4

    move v0, v2

    :goto_1
    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sThemeOn:Z

    .line 173
    const/16 v0, 0x10

    const/16 v4, 0x48

    const-string v5, "size"

    const/16 v6, 0x20

    invoke-static {v1, v5, v6}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    sput v0, Lcom/keymouse/tool/PosDot;->sSizeDp:I

    .line 174
    const-string v0, "smart"

    invoke-static {v1, v0, v2}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_5

    :goto_2
    sput-boolean v2, Lcom/keymouse/tool/PosDot;->sSmart:Z

    .line 175
    const/16 v0, 0xc8

    const/16 v2, 0x5dc

    const-string v4, "grabms"

    const/16 v5, 0x1c2

    invoke-static {v1, v4, v5}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    sput v0, Lcom/keymouse/tool/PosDot;->sGrabMs:I

    .line 176
    invoke-static {}, Lcom/keymouse/tool/CursorHit;->reset()V

    .line 177
    :goto_3
    const/4 v0, 0x4

    if-ge v3, v0, :cond_0

    .line 178
    sget-object v0, Lcom/keymouse/tool/PosDot;->sSets:[Lcom/keymouse/tool/CurLoader$Set;

    const/4 v2, 0x0

    aput-object v2, v0, v3

    .line 179
    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sThemeOn:Z

    if-nez v0, :cond_6

    .line 177
    :cond_2
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 168
    :cond_3
    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_4
    move v0, v3

    .line 172
    goto :goto_1

    :cond_5
    move v2, v3

    .line 174
    goto :goto_2

    .line 180
    :cond_6
    sget-object v0, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    aget-object v2, v0, v3

    .line 181
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 182
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_2

    .line 183
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "hs_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2}, Lcom/keymouse/tool/CursorCfg;->defHotspot(Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v4, v2}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v2

    .line 184
    sget-object v4, Lcom/keymouse/tool/PosDot;->sSets:[Lcom/keymouse/tool/CurLoader$Set;

    new-instance v5, Ljava/io/File;

    sget-object v6, Lcom/keymouse/tool/PosDot;->sLibDir:Ljava/io/File;

    invoke-direct {v5, v6, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v5, v2}, Lcom/keymouse/tool/CurLoader;->load(Ljava/io/File;I)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v0

    aput-object v0, v4, v3

    goto :goto_4
.end method

.method public static start(Landroid/content/Context;)V
    .locals 10

    .prologue
    .line 83
    sget-object v2, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-eqz v2, :cond_0

    .line 125
    :goto_0
    return-void

    .line 85
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 86
    if-nez v2, :cond_2

    .line 87
    :goto_1
    const-string v2, "window"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/view/WindowManager;

    move-object v8, v0

    .line 88
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 89
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 90
    sput v2, Lcom/keymouse/tool/PosDot;->sDensity:F

    .line 91
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->ensureDefaults(Landroid/content/Context;)V

    .line 92
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_cursor_theme.cfg"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sThemeCfg:Ljava/io/File;

    .line 93
    new-instance v4, Ljava/io/File;

    const-string v5, "cursor_lib"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sLibDir:Ljava/io/File;

    .line 94
    const-wide/16 v4, -0x2

    sput-wide v4, Lcom/keymouse/tool/PosDot;->sThemeMt:J

    .line 95
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_pos"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    .line 96
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_ptr"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    .line 97
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_cursor"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sCursorCfg:Ljava/io/File;

    .line 98
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_cursor_ok"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sCursorOk:Ljava/io/File;

    .line 99
    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_cursor_beat"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v4, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    .line 101
    new-instance v9, Lcom/keymouse/tool/PosDot$Art;

    invoke-direct {v9, p0, v2}, Lcom/keymouse/tool/PosDot$Art;-><init>(Landroid/content/Context;F)V

    .line 102
    iget v2, v9, Lcom/keymouse/tool/PosDot$Art;->win:I

    sput v2, Lcom/keymouse/tool/PosDot;->sWin:I

    .line 103
    const/4 v2, 0x4

    invoke-virtual {v9, v2}, Lcom/keymouse/tool/PosDot$Art;->setVisibility(I)V

    .line 106
    new-instance v2, Landroid/view/WindowManager$LayoutParams;

    sget v3, Lcom/keymouse/tool/PosDot;->sWin:I

    sget v4, Lcom/keymouse/tool/PosDot;->sWin:I

    const/16 v5, 0x7f6

    const/16 v6, 0x318

    const/4 v7, -0x3

    invoke-direct/range {v2 .. v7}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 107
    const/16 v3, 0x33

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 108
    invoke-interface {v8, v9, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    sput-object v8, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    .line 111
    sput-object v9, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    .line 112
    sput-object v2, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    .line 113
    const/4 v2, 0x0

    sput-boolean v2, Lcom/keymouse/tool/PosDot;->sVisible:Z

    .line 114
    const v2, -0x1869f

    sput v2, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 115
    const v2, -0x1869f

    sput v2, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 116
    const-wide/16 v2, 0x0

    sput-wide v2, Lcom/keymouse/tool/PosDot;->sCfgAt:J

    .line 117
    const-wide/16 v2, 0x0

    sput-wide v2, Lcom/keymouse/tool/PosDot;->sOkAt:J

    .line 118
    const-wide/16 v2, 0x0

    sput-wide v2, Lcom/keymouse/tool/PosDot;->sBeatAt:J

    .line 119
    sget-object v2, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-nez v2, :cond_1

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    .line 120
    :cond_1
    sget-object v2, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v3, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 121
    sget-object v2, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v3, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 122
    :catch_0
    move-exception v2

    .line 123
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
    .line 129
    :try_start_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 130
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

    .line 134
    :cond_1
    :goto_0
    const/4 v0, 0x0

    sput-object v0, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    .line 135
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sVisible:Z

    .line 136
    return-void

    .line 131
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static tick()V
    .locals 20

    .prologue
    .line 194
    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-nez v0, :cond_1

    .line 311
    :cond_0
    :goto_0
    return-void

    .line 195
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 196
    invoke-static {v12, v13}, Lcom/keymouse/tool/PosDot;->refreshCursorFlags(J)V

    .line 197
    invoke-static {v12, v13}, Lcom/keymouse/tool/PosDot;->refreshTheme(J)V

    .line 201
    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorOn:Z

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorHide:Z

    if-eqz v0, :cond_2

    sget-wide v0, Lcom/keymouse/tool/PosDot;->sBeatAt:J

    sub-long v0, v12, v0

    const-wide/16 v2, 0xfa

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 202
    sput-wide v12, Lcom/keymouse/tool/PosDot;->sBeatAt:J

    .line 203
    invoke-static {}, Lcom/keymouse/tool/PosDot;->touchBeat()V

    .line 205
    :cond_2
    const/4 v7, 0x0

    .line 206
    const/4 v6, 0x1

    .line 207
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v0, 0x0

    .line 208
    sget-object v1, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    sub-long v14, v12, v8

    .line 210
    const-wide/16 v8, 0x0

    cmp-long v1, v14, v8

    if-ltz v1, :cond_1b

    const-wide/16 v8, 0x3a98

    cmp-long v1, v14, v8

    if-gtz v1, :cond_1b

    .line 211
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    sget-object v8, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    invoke-direct {v1, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 212
    sget-object v8, Lcom/keymouse/tool/PosDot;->BUF:[B

    invoke-virtual {v1, v8}, Ljava/io/FileInputStream;->read([B)I

    move-result v8

    .line 213
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 214
    const/16 v1, 0x18

    if-lt v8, v1, :cond_1b

    .line 215
    new-instance v1, Ljava/lang/String;

    sget-object v9, Lcom/keymouse/tool/PosDot;->BUF:[B

    const/4 v10, 0x0

    invoke-direct {v1, v9, v10, v8}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v8, " +"

    invoke-virtual {v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 216
    array-length v1, v8

    const/4 v9, 0x5

    if-lt v1, v9, :cond_1b

    const-string v1, "1"

    const/4 v9, 0x0

    aget-object v9, v8, v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 217
    const/4 v1, 0x1

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 218
    const/4 v1, 0x2

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 219
    const/4 v1, 0x3

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 220
    const/4 v1, 0x4

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 221
    array-length v1, v8

    const/4 v7, 0x6

    if-lt v1, v7, :cond_1a

    const/4 v1, 0x5

    aget-object v1, v8, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 222
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

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_2
    move v6, v0

    .line 223
    :cond_3
    const/4 v0, 0x1

    if-le v3, v0, :cond_c

    const/4 v0, 0x1

    if-le v2, v0, :cond_c

    const/4 v0, 0x1

    :goto_3
    move v7, v0

    :goto_4
    move v8, v1

    move v9, v2

    move v10, v5

    move v11, v6

    .line 230
    :goto_5
    if-eqz v7, :cond_d

    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorOn:Z

    if-eqz v0, :cond_d

    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sCursorHide:Z

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    move v6, v0

    .line 231
    :goto_6
    if-eqz v7, :cond_e

    if-eqz v11, :cond_e

    const/4 v0, 0x1

    move v5, v0

    .line 232
    :goto_7
    if-nez v6, :cond_4

    if-eqz v5, :cond_f

    :cond_4
    const/4 v0, 0x1

    .line 235
    :goto_8
    if-eqz v0, :cond_17

    .line 236
    :try_start_2
    sget-object v1, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 237
    new-instance v7, Landroid/graphics/Point;

    invoke-direct {v7}, Landroid/graphics/Point;-><init>()V

    .line 238
    invoke-virtual {v1, v7}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 239
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v11

    .line 240
    int-to-float v1, v10

    add-int/lit8 v2, v3, -0x1

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-static {v1}, Lcom/keymouse/tool/PosDot;->clamp01(F)F

    move-result v2

    .line 241
    int-to-float v1, v4

    add-int/lit8 v3, v9, -0x1

    int-to-float v3, v3

    div-float/2addr v1, v3

    invoke-static {v1}, Lcom/keymouse/tool/PosDot;->clamp01(F)F

    move-result v3

    .line 244
    const/4 v1, 0x1

    if-ne v11, v1, :cond_10

    .line 245
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v2

    move v4, v3

    .line 253
    :goto_9
    iget v2, v7, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    mul-float/2addr v2, v4

    float-to-int v3, v2

    .line 254
    iget v2, v7, Landroid/graphics/Point;->y:I

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    .line 256
    sget-object v2, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v16

    sub-long v16, v12, v16

    .line 257
    const-wide/16 v18, 0x0

    cmp-long v2, v16, v18

    if-ltz v2, :cond_19

    const-wide/16 v18, 0xbb8

    cmp-long v2, v16, v18

    if-gtz v2, :cond_19

    .line 258
    sget-object v2, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    invoke-static {v2}, Lcom/keymouse/tool/PosDot;->readFirstLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    .line 259
    if-eqz v2, :cond_19

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v7, 0xa

    if-le v4, v7, :cond_19

    .line 260
    const-string v4, " +"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 261
    array-length v4, v2

    const/4 v7, 0x5

    if-lt v4, v7, :cond_19

    const/4 v4, 0x0

    aget-object v4, v2, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v11, :cond_19

    .line 262
    const/4 v1, 0x3

    aget-object v1, v2, v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    float-to-int v3, v1

    .line 263
    const/4 v1, 0x4

    aget-object v1, v2, v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    float-to-int v1, v1

    move v2, v1

    .line 267
    :goto_a
    sget v1, Lcom/keymouse/tool/PosDot;->sWin:I

    div-int/lit8 v1, v1, 0x2

    sub-int v4, v3, v1

    .line 268
    sget v1, Lcom/keymouse/tool/PosDot;->sWin:I

    div-int/lit8 v1, v1, 0x2

    sub-int v7, v2, v1

    .line 270
    const-wide/16 v10, 0x37dc

    cmp-long v1, v14, v10

    if-lez v1, :cond_13

    .line 271
    const/4 v1, 0x0

    const-wide/16 v10, 0x3a98

    sub-long/2addr v10, v14

    long-to-float v9, v10

    const/high16 v10, 0x442f0000    # 700.0f

    div-float/2addr v9, v10

    invoke-static {v1, v9}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 272
    :goto_b
    sget-object v9, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-virtual {v9, v1}, Lcom/keymouse/tool/PosDot$Art;->setAlpha(F)V

    .line 273
    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-virtual {v1, v6, v5}, Lcom/keymouse/tool/PosDot$Art;->configure(ZZ)V

    .line 276
    const/4 v1, 0x0

    .line 277
    sget-boolean v5, Lcom/keymouse/tool/PosDot;->sThemeOn:Z

    if-eqz v5, :cond_7

    if-eqz v6, :cond_7

    .line 278
    sget-boolean v1, Lcom/keymouse/tool/PosDot;->sSmart:Z

    if-eqz v1, :cond_14

    invoke-static {v3, v2, v12, v13}, Lcom/keymouse/tool/CursorHit;->poll(IIJ)I

    move-result v1

    .line 279
    :goto_c
    if-lez v8, :cond_5

    sget v2, Lcom/keymouse/tool/PosDot;->sPrevPress:I

    if-nez v2, :cond_5

    .line 280
    sput-wide v12, Lcom/keymouse/tool/PosDot;->sPressAt:J

    .line 281
    sput v1, Lcom/keymouse/tool/PosDot;->sLatched:I

    .line 284
    :cond_5
    if-lez v8, :cond_6

    .line 285
    sget v1, Lcom/keymouse/tool/PosDot;->sLatched:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_15

    const/4 v1, 0x2

    .line 287
    :cond_6
    :goto_d
    invoke-static {v1}, Lcom/keymouse/tool/PosDot;->pickSet(I)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v1

    .line 289
    :cond_7
    sput v8, Lcom/keymouse/tool/PosDot;->sPrevPress:I

    .line 290
    sget-object v2, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    sget v3, Lcom/keymouse/tool/PosDot;->sSizeDp:I

    int-to-float v3, v3

    sget v5, Lcom/keymouse/tool/PosDot;->sDensity:F

    mul-float/2addr v3, v5

    invoke-virtual {v2, v1, v3}, Lcom/keymouse/tool/PosDot$Art;->setSet(Lcom/keymouse/tool/CurLoader$Set;F)V

    .line 291
    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-virtual {v1, v8}, Lcom/keymouse/tool/PosDot$Art;->setPress(I)V

    .line 292
    sget v1, Lcom/keymouse/tool/PosDot;->sLastX:I

    if-ne v4, v1, :cond_8

    sget v1, Lcom/keymouse/tool/PosDot;->sLastY:I

    if-eq v7, v1, :cond_9

    .line 293
    :cond_8
    sget-object v1, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    iput v4, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 294
    sget-object v1, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    iput v7, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 295
    sget-object v1, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    sget-object v2, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    sget-object v3, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v1, v2, v3}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 296
    sput v4, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 297
    sput v7, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 303
    :cond_9
    :goto_e
    sget-boolean v1, Lcom/keymouse/tool/PosDot;->sVisible:Z

    if-eq v0, v1, :cond_a

    .line 304
    sget-object v2, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-eqz v0, :cond_18

    const/4 v1, 0x0

    :goto_f
    invoke-virtual {v2, v1}, Lcom/keymouse/tool/PosDot$Art;->setVisibility(I)V

    .line 305
    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sVisible:Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 310
    :cond_a
    :goto_10
    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    const-wide/16 v2, 0x21

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 222
    :cond_b
    const/4 v0, 0x0

    goto/16 :goto_2

    .line 223
    :cond_c
    const/4 v0, 0x0

    goto/16 :goto_3

    .line 227
    :catch_0
    move-exception v1

    .line 228
    :goto_11
    const/4 v7, 0x0

    move v8, v0

    move v9, v2

    move v10, v5

    move v11, v6

    goto/16 :goto_5

    .line 230
    :cond_d
    const/4 v0, 0x0

    move v6, v0

    goto/16 :goto_6

    .line 231
    :cond_e
    const/4 v0, 0x0

    move v5, v0

    goto/16 :goto_7

    .line 232
    :cond_f
    const/4 v0, 0x0

    goto/16 :goto_8

    .line 246
    :cond_10
    const/4 v1, 0x2

    if-ne v11, v1, :cond_11

    .line 247
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v2, v1, v2

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v3

    move v4, v2

    goto/16 :goto_9

    .line 248
    :cond_11
    const/4 v1, 0x3

    if-ne v11, v1, :cond_12

    .line 249
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v3, v1, v3

    move v1, v2

    move v4, v3

    goto/16 :goto_9

    :cond_12
    move v1, v3

    move v4, v2

    .line 251
    goto/16 :goto_9

    .line 271
    :cond_13
    const/high16 v1, 0x3f800000    # 1.0f

    goto/16 :goto_b

    .line 278
    :cond_14
    const/4 v1, 0x0

    goto/16 :goto_c

    .line 285
    :cond_15
    :try_start_3
    sget-wide v2, Lcom/keymouse/tool/PosDot;->sPressAt:J

    sub-long v2, v12, v2

    sget v1, Lcom/keymouse/tool/PosDot;->sGrabMs:I

    int-to-long v10, v1

    cmp-long v1, v2, v10

    if-ltz v1, :cond_16

    const/4 v1, 0x3

    goto/16 :goto_d

    :cond_16
    sget v1, Lcom/keymouse/tool/PosDot;->sLatched:I

    goto/16 :goto_d

    .line 300
    :cond_17
    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Lcom/keymouse/tool/PosDot$Art;

    invoke-virtual {v1}, Lcom/keymouse/tool/PosDot$Art;->reset()V

    .line 301
    const/4 v1, 0x0

    sput v1, Lcom/keymouse/tool/PosDot;->sPrevPress:I
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_e

    .line 307
    :catch_1
    move-exception v0

    goto :goto_10

    .line 304
    :cond_18
    const/4 v1, 0x4

    goto :goto_f

    .line 227
    :catch_2
    move-exception v0

    move v0, v1

    goto :goto_11

    :cond_19
    move v2, v1

    goto/16 :goto_a

    :cond_1a
    move v1, v0

    goto/16 :goto_1

    :cond_1b
    move v1, v0

    goto/16 :goto_4
.end method

.method private static touchBeat()V
    .locals 4

    .prologue
    .line 315
    :try_start_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 316
    new-instance v0, Ljava/io/FileOutputStream;

    sget-object v1, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 317
    const/16 v1, 0x31

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write(I)V

    .line 318
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 319
    sget-object v0, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setReadable(ZZ)Z

    .line 321
    :cond_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sBeat:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/io/File;->setLastModified(J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 325
    :goto_0
    return-void

    .line 322
    :catch_0
    move-exception v0

    goto :goto_0
.end method
