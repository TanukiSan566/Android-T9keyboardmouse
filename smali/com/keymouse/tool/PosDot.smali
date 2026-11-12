.class public final Lcom/keymouse/tool/PosDot;
.super Ljava/lang/Object;
.source "PosDot.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keymouse/tool/PosDot$Tick;
    }
.end annotation


# static fields
.field private static final BUF:[B

.field private static final FADE_ANIM_MS:J = 0x2bcL

.field private static final FADE_MS:J = 0x3a98L

.field private static final POLL_MS:I = 0x21

.field private static final TICK:Lcom/keymouse/tool/PosDot$Tick;

.field private static sAlive:Ljava/io/File;

.field private static sDot:Landroid/view/View;

.field private static sFile:Ljava/io/File;

.field private static sHandler:Landroid/os/Handler;

.field private static sLastX:I

.field private static sLastY:I

.field private static sLp:Landroid/view/WindowManager$LayoutParams;

.field private static sPtr:Ljava/io/File;

.field private static sSize:I

.field private static sVisible:Z

.field private static sWm:Landroid/view/WindowManager;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const v1, -0x1869f

    .line 28
    new-instance v0, Lcom/keymouse/tool/PosDot$Tick;

    invoke-direct {v0}, Lcom/keymouse/tool/PosDot$Tick;-><init>()V

    sput-object v0, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    .line 39
    sput v1, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 40
    sput v1, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 41
    const/16 v0, 0x30

    new-array v0, v0, [B

    sput-object v0, Lcom/keymouse/tool/PosDot;->BUF:[B

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method private static clamp01(F)F
    .registers 4

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    .line 184
    cmpg-float v2, p0, v0

    if-gez v2, :cond_9

    move p0, v0

    :cond_8
    :goto_8
    return p0

    :cond_9
    cmpl-float v0, p0, v1

    if-lez v0, :cond_8

    move p0, v1

    goto :goto_8
.end method

.method public static start(Landroid/content/Context;)V
    .registers 10

    .prologue
    .line 47
    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    if-eqz v1, :cond_5

    .line 83
    :goto_4
    return-void

    .line 49
    :cond_5
    :try_start_5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 50
    if-nez v1, :cond_c3

    .line 51
    :goto_b
    const-string v1, "window"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroid/view/WindowManager;

    move-object v7, v0

    .line 52
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 53
    const/16 v2, 0xa

    const/high16 v3, 0x41400000    # 12.0f

    mul-float/2addr v3, v1

    float-to-int v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    sput v2, Lcom/keymouse/tool/PosDot;->sSize:I

    .line 54
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "keymouse_pos"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v2, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    .line 55
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "keymouse_dot_alive"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v2, Lcom/keymouse/tool/PosDot;->sAlive:Ljava/io/File;

    .line 56
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "keymouse_ptr"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v2, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    .line 58
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 59
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 60
    const/high16 v3, -0x10000

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 61
    const/4 v3, 0x1

    float-to-int v1, v1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v3, -0x1

    invoke-virtual {v2, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 62
    new-instance v8, Landroid/view/View;

    invoke-direct {v8, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 63
    invoke-virtual {v8, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 64
    const/4 v1, 0x4

    invoke-virtual {v8, v1}, Landroid/view/View;->setVisibility(I)V

    .line 67
    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    sget v2, Lcom/keymouse/tool/PosDot;->sSize:I

    sget v3, Lcom/keymouse/tool/PosDot;->sSize:I

    const/16 v4, 0x7f6

    const/16 v5, 0x318

    const/4 v6, -0x3

    invoke-direct/range {v1 .. v6}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 68
    const/16 v2, 0x33

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 69
    invoke-interface {v7, v8, v1}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    sput-object v7, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    .line 72
    sput-object v8, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    .line 73
    sput-object v1, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    .line 74
    const/4 v1, 0x0

    sput-boolean v1, Lcom/keymouse/tool/PosDot;->sVisible:Z

    .line 75
    const v1, -0x1869f

    sput v1, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 76
    const v1, -0x1869f

    sput v1, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 77
    sget-object v1, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-nez v1, :cond_ad

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    .line 78
    :cond_ad
    sget-object v1, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v2, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 79
    sget-object v1, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v2, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_bb
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_bb} :catch_bd

    goto/16 :goto_4

    .line 80
    :catch_bd
    move-exception v1

    .line 81
    const/4 v1, 0x0

    sput-object v1, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    goto/16 :goto_4

    :cond_c3
    move-object p0, v1

    goto/16 :goto_b
.end method

.method public static stop()V
    .registers 2

    .prologue
    .line 87
    :try_start_0
    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_b

    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 88
    :cond_b
    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    if-eqz v0, :cond_1a

    sget-object v0, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    if-eqz v0, :cond_1a

    sget-object v0, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    sget-object v1, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_1a} :catch_21

    .line 92
    :cond_1a
    :goto_1a
    const/4 v0, 0x0

    sput-object v0, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    .line 93
    const/4 v0, 0x0

    sput-boolean v0, Lcom/keymouse/tool/PosDot;->sVisible:Z

    .line 94
    return-void

    .line 89
    :catch_21
    move-exception v0

    goto :goto_1a
.end method

.method static tick()V
    .registers 16

    .prologue
    const/4 v7, 0x4

    const/4 v13, 0x3

    const/4 v1, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 97
    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    if-nez v0, :cond_b

    .line 181
    :cond_a
    :goto_a
    return-void

    .line 102
    :cond_b
    :try_start_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-object v0, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    sub-long/2addr v4, v10

    .line 103
    const-wide/16 v10, 0x0

    cmp-long v0, v4, v10

    if-ltz v0, :cond_1b4

    const-wide/16 v10, 0x3a98

    cmp-long v0, v4, v10

    if-gtz v0, :cond_1b4

    .line 104
    new-instance v0, Ljava/io/FileInputStream;

    sget-object v3, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 105
    sget-object v3, Lcom/keymouse/tool/PosDot;->BUF:[B

    invoke-virtual {v0, v3}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .line 106
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    .line 107
    const/16 v0, 0x18

    if-lt v3, v0, :cond_1b4

    .line 108
    new-instance v0, Ljava/lang/String;

    sget-object v4, Lcom/keymouse/tool/PosDot;->BUF:[B

    const/4 v5, 0x0

    invoke-direct {v0, v4, v5, v3}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v3, " +"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 109
    array-length v3, v0

    const/4 v4, 0x5

    if-lt v3, v4, :cond_1b4

    const-string v3, "1"

    const/4 v4, 0x0

    aget-object v4, v0, v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b4

    .line 110
    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_5d
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_5d} :catch_183

    move-result v6

    .line 111
    const/4 v3, 0x2

    :try_start_5f
    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_64
    .catch Ljava/lang/Throwable; {:try_start_5f .. :try_end_64} :catch_1a9

    move-result v5

    .line 112
    const/4 v3, 0x3

    :try_start_66
    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6b
    .catch Ljava/lang/Throwable; {:try_start_66 .. :try_end_6b} :catch_1ad

    move-result v4

    .line 113
    const/4 v3, 0x4

    :try_start_6d
    aget-object v0, v0, v3

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_72
    .catch Ljava/lang/Throwable; {:try_start_6d .. :try_end_72} :catch_1b0

    move-result v3

    .line 114
    if-le v4, v1, :cond_180

    if-le v3, v1, :cond_180

    move v0, v1

    :goto_78
    move v9, v3

    move v10, v0

    .line 123
    :goto_7a
    if-eqz v10, :cond_160

    .line 124
    :try_start_7c
    sget-object v0, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 125
    new-instance v11, Landroid/graphics/Point;

    invoke-direct {v11}, Landroid/graphics/Point;-><init>()V

    .line 126
    invoke-virtual {v0, v11}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 127
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v12

    .line 128
    int-to-float v0, v6

    add-int/lit8 v3, v4, -0x1

    int-to-float v3, v3

    div-float/2addr v0, v3

    invoke-static {v0}, Lcom/keymouse/tool/PosDot;->clamp01(F)F

    move-result v3

    .line 129
    int-to-float v0, v5

    add-int/lit8 v4, v9, -0x1

    int-to-float v4, v4

    div-float/2addr v0, v4

    invoke-static {v0}, Lcom/keymouse/tool/PosDot;->clamp01(F)F

    move-result v4

    .line 132
    if-ne v12, v1, :cond_18b

    .line 133
    sub-float v0, v8, v3

    move v1, v4

    .line 141
    :goto_a5
    iget v3, v11, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    mul-float/2addr v1, v3

    float-to-int v1, v1

    sget v3, Lcom/keymouse/tool/PosDot;->sSize:I

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v1, v3

    .line 142
    iget v3, v11, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    mul-float/2addr v0, v3

    float-to-int v0, v0

    sget v3, Lcom/keymouse/tool/PosDot;->sSize:I

    div-int/lit8 v3, v3, 0x2
    :try_end_b8
    .catch Ljava/lang/Throwable; {:try_start_7c .. :try_end_b8} :catch_1a7

    sub-int/2addr v0, v3

    .line 145
    :try_start_b9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-object v3, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v14

    sub-long/2addr v4, v14

    .line 146
    const-wide/16 v14, 0x0

    cmp-long v3, v4, v14

    if-ltz v3, :cond_11f

    const-wide/16 v14, 0xbb8

    cmp-long v3, v4, v14

    if-gtz v3, :cond_11f

    .line 147
    new-instance v3, Ljava/io/FileInputStream;

    sget-object v4, Lcom/keymouse/tool/PosDot;->sPtr:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 148
    sget-object v4, Lcom/keymouse/tool/PosDot;->BUF:[B

    invoke-virtual {v3, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    .line 149
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 150
    const/16 v3, 0xa

    if-le v4, v3, :cond_11f

    .line 151
    new-instance v3, Ljava/lang/String;

    sget-object v5, Lcom/keymouse/tool/PosDot;->BUF:[B

    const/4 v6, 0x0

    invoke-direct {v3, v5, v6, v4}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, " +"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 152
    array-length v4, v3

    const/4 v5, 0x5

    if-lt v4, v5, :cond_11f

    const/4 v4, 0x0

    aget-object v4, v3, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v12, :cond_11f

    .line 153
    const/4 v4, 0x3

    aget-object v4, v3, v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    sget v5, Lcom/keymouse/tool/PosDot;->sSize:I

    div-int/lit8 v1, v5, 0x2

    sub-int v1, v4, v1

    .line 154
    const/4 v4, 0x4

    aget-object v3, v3, v4

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    float-to-int v3, v3

    sget v4, Lcom/keymouse/tool/PosDot;->sSize:I

    div-int/lit8 v0, v4, 0x2
    :try_end_11d
    .catch Ljava/lang/Throwable; {:try_start_b9 .. :try_end_11d} :catch_1a1

    sub-int v0, v3, v0

    :cond_11f
    move v3, v0

    .line 161
    :goto_120
    :try_start_120
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sget-object v0, Lcom/keymouse/tool/PosDot;->sFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    sub-long/2addr v4, v12

    .line 163
    const-wide/16 v12, 0x37dc

    cmp-long v0, v4, v12

    if-lez v0, :cond_1b2

    const/4 v0, 0x0

    const-wide/16 v8, 0x3a98

    sub-long v4, v8, v4

    long-to-float v4, v4

    const/high16 v5, 0x442f0000    # 700.0f

    div-float/2addr v4, v5

    invoke-static {v0, v4}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 164
    :goto_13e
    sget-object v4, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    invoke-virtual {v4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 165
    sget v0, Lcom/keymouse/tool/PosDot;->sLastX:I

    if-ne v1, v0, :cond_14b

    sget v0, Lcom/keymouse/tool/PosDot;->sLastY:I

    if-eq v3, v0, :cond_160

    .line 166
    :cond_14b
    sget-object v0, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 167
    sget-object v0, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 168
    sget-object v0, Lcom/keymouse/tool/PosDot;->sWm:Landroid/view/WindowManager;

    sget-object v4, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    sget-object v5, Lcom/keymouse/tool/PosDot;->sLp:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v4, v5}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 169
    sput v1, Lcom/keymouse/tool/PosDot;->sLastX:I

    .line 170
    sput v3, Lcom/keymouse/tool/PosDot;->sLastY:I

    .line 173
    :cond_160
    sget-boolean v0, Lcom/keymouse/tool/PosDot;->sVisible:Z

    if-eq v10, v0, :cond_16d

    .line 174
    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    if-eqz v10, :cond_1a5

    :goto_168
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 175
    sput-boolean v10, Lcom/keymouse/tool/PosDot;->sVisible:Z
    :try_end_16d
    .catch Ljava/lang/Throwable; {:try_start_120 .. :try_end_16d} :catch_1a7

    .line 180
    :cond_16d
    :goto_16d
    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_a

    sget-object v0, Lcom/keymouse/tool/PosDot;->sDot:Landroid/view/View;

    if-eqz v0, :cond_a

    sget-object v0, Lcom/keymouse/tool/PosDot;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/keymouse/tool/PosDot;->TICK:Lcom/keymouse/tool/PosDot$Tick;

    const-wide/16 v2, 0x21

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_a

    :cond_180
    move v0, v2

    .line 114
    goto/16 :goto_78

    .line 118
    :catch_183
    move-exception v0

    move v4, v2

    move v5, v2

    move v6, v2

    :goto_187
    move v9, v2

    move v10, v2

    .line 119
    goto/16 :goto_7a

    .line 134
    :cond_18b
    const/4 v0, 0x2

    if-ne v12, v0, :cond_195

    .line 135
    sub-float v3, v8, v3

    sub-float v0, v8, v4

    move v1, v3

    goto/16 :goto_a5

    .line 136
    :cond_195
    if-ne v12, v13, :cond_19d

    .line 137
    sub-float v4, v8, v4

    move v0, v3

    move v1, v4

    goto/16 :goto_a5

    :cond_19d
    move v0, v4

    move v1, v3

    .line 139
    goto/16 :goto_a5

    .line 158
    :catch_1a1
    move-exception v3

    move v3, v0

    goto/16 :goto_120

    :cond_1a5
    move v2, v7

    .line 174
    goto :goto_168

    .line 177
    :catch_1a7
    move-exception v0

    goto :goto_16d

    .line 118
    :catch_1a9
    move-exception v0

    move v4, v2

    move v5, v2

    goto :goto_187

    :catch_1ad
    move-exception v0

    move v4, v2

    goto :goto_187

    :catch_1b0
    move-exception v0

    goto :goto_187

    :cond_1b2
    move v0, v8

    goto :goto_13e

    :cond_1b4
    move v3, v2

    move v4, v2

    move v5, v2

    move v6, v2

    move v0, v2

    goto/16 :goto_78
.end method
