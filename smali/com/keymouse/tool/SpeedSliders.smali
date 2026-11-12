.class public final Lcom/keymouse/tool/SpeedSliders;
.super Ljava/lang/Object;
.source "SpeedSliders.java"


# static fields
.field private static final ITEMS:[[Ljava/lang/Object;

.field private static final MAXV:[I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 26
    new-array v0, v7, [[Ljava/lang/Object;

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "glideSpeed"

    aput-object v2, v1, v4

    const-string v2, "2468 hold scroll: continuous scroll speed"

    aput-object v2, v1, v5

    const-string v2, "2468 \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u0435: \u0441\u043a\u043e\u0440\u043e\u0441\u0442\u044c \u043d\u0435\u043f\u0440\u0435\u0440\u044b\u0432\u043d\u043e\u0439 \u043f\u0440\u043e\u043a\u0440\u0443\u0442\u043a\u0438"

    aput-object v2, v1, v6

    const-string v2, "2468\u9577\u62bc\u3057\u30b9\u30af\u30ed\u30fc\u30eb\u306e\u9023\u7d9a\u30b9\u30af\u30ed\u30fc\u30eb\u901f\u5ea6"

    aput-object v2, v1, v8

    const-string v2, "2468\u957f\u6309\u6eda\u52a8\u7684\u8fde\u7eed\u6eda\u52a8\u901f\u5ea6"

    aput-object v2, v1, v7

    const/4 v2, 0x5

    const/16 v3, 0x12c

    .line 28
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0x3c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    aput-object v1, v0, v4

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "pinchMs"

    aput-object v2, v1, v4

    const-string v2, "Keys 1/3 zoom time (longer = slower)"

    aput-object v2, v1, v5

    const-string v2, "\u041a\u043b\u0430\u0432\u0438\u0448\u0438 1/3: \u0432\u0440\u0435\u043c\u044f \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u0430 (\u0431\u043e\u043b\u044c\u0448\u0435 = \u043c\u0435\u0434\u043b\u0435\u043d\u043d\u0435\u0435)"

    aput-object v2, v1, v6

    const-string v2, "1/3\u30ad\u30fc \u30ba\u30fc\u30e0\u6642\u9593(\u9577\u3044\u307b\u3069\u3086\u3063\u304f\u308a)"

    aput-object v2, v1, v8

    const-string v2, "1/3 \u952e\u7f29\u653e\u7528\u65f6(\u8d8a\u5927\u8d8a\u6162)"

    aput-object v2, v1, v7

    const/4 v2, 0x5

    const/16 v3, 0x5dc

    .line 30
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0x1f4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const/16 v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    aput-object v1, v0, v5

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "fastDist"

    aput-object v2, v1, v4

    const-string v2, "Tap scroll key: distance"

    aput-object v2, v1, v5

    const-string v2, "\u041d\u0430\u0436\u0430\u0442\u0438\u0435: \u0440\u0430\u0441\u0441\u0442\u043e\u044f\u043d\u0438\u0435"

    aput-object v2, v1, v6

    const-string v2, "\u30bf\u30c3\u30d7\u30b9\u30af\u30ed\u30fc\u30eb: \u8ddd\u96e2"

    aput-object v2, v1, v8

    const-string v2, "\u5355\u51fb\u6eda\u52a8\u952e\uff1a\u6ed1\u52a8\u8ddd\u79bb"

    aput-object v2, v1, v7

    const/4 v2, 0x5

    const/16 v3, 0x96

    .line 32
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0x28

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    aput-object v1, v0, v6

    const/16 v1, 0x9

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "fastSpeed"

    aput-object v2, v1, v4

    const-string v2, "Tap scroll key: speed"

    aput-object v2, v1, v5

    const-string v2, "\u041d\u0430\u0436\u0430\u0442\u0438\u0435: \u0441\u043a\u043e\u0440\u043e\u0441\u0442\u044c"

    aput-object v2, v1, v6

    const-string v2, "\u30bf\u30c3\u30d7\u30b9\u30af\u30ed\u30fc\u30eb: \u901f\u5ea6"

    aput-object v2, v1, v8

    const-string v2, "\u5355\u51fb\u6eda\u52a8\u952e\uff1a\u6ed1\u52a8\u901f\u5ea6"

    aput-object v2, v1, v7

    const/4 v2, 0x5

    const/16 v3, 0x640

    .line 34
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0xc8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const/16 v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/16 v2, 0x8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    aput-object v1, v0, v8

    sput-object v0, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    .line 36
    new-array v0, v7, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keymouse/tool/SpeedSliders;->MAXV:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x384
        0xfa0
        0x1b8
        0xfa0
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method static synthetic access$000(II)Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    invoke-static {p0, p1}, Lcom/keymouse/tool/SpeedSliders;->fmt(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;[I)V
    .locals 0

    .prologue
    .line 21
    invoke-static {p0, p1}, Lcom/keymouse/tool/SpeedSliders;->save(Landroid/content/Context;[I)V

    return-void
.end method

.method public static build(Landroid/content/Context;I)Landroid/view/View;
    .locals 16

    .prologue
    .line 81
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v10, v1, Landroid/util/DisplayMetrics;->density:F

    .line 82
    new-instance v11, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 83
    const/4 v1, 0x1

    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 84
    const/4 v1, 0x0

    const/16 v2, 0x28

    const/4 v3, 0x0

    const/16 v4, 0xa

    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 86
    new-instance v2, Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 87
    const/4 v1, 0x1

    move/from16 v0, p1

    if-ne v0, v1, :cond_0

    const-string v1, "\u0421\u043a\u043e\u0440\u043e\u0441\u0442\u044c \u043f\u0440\u043e\u043a\u0440\u0443\u0442\u043a\u0438 \u0438 \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u0430"

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 91
    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 93
    invoke-static/range {p0 .. p0}, Lcom/keymouse/tool/SpeedSliders;->load(Landroid/content/Context;)Ljava/util/Properties;

    move-result-object v5

    .line 94
    sget-object v1, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    array-length v12, v1

    .line 95
    new-array v2, v12, [I

    .line 96
    const/4 v1, 0x0

    move v4, v1

    :goto_1
    if-ge v4, v12, :cond_3

    .line 97
    sget-object v1, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v1, v1, v4

    const/4 v3, 0x5

    aget-object v1, v1, v3

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 100
    :try_start_0
    sget-object v1, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v1, v1, v4

    const/4 v6, 0x0

    aget-object v1, v1, v6

    check-cast v1, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v1, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 103
    :goto_2
    aput v1, v2, v4

    .line 96
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_1

    .line 88
    :cond_0
    const/4 v1, 0x2

    move/from16 v0, p1

    if-ne v0, v1, :cond_1

    const-string v1, "\u30b9\u30af\u30ed\u30fc\u30eb/\u30ba\u30fc\u30e0\u306e\u901f\u5ea6"

    goto :goto_0

    .line 89
    :cond_1
    const/4 v1, 0x3

    move/from16 v0, p1

    if-ne v0, v1, :cond_2

    const-string v1, "\u6eda\u52a8 / \u7f29\u653e\u901f\u5ea6(\u62d6\u52a8\u5373\u65f6\u751f\u6548)"

    goto :goto_0

    :cond_2
    const-string v1, "Scroll / zoom speed"

    goto :goto_0

    .line 101
    :catch_0
    move-exception v1

    move v1, v3

    goto :goto_2

    .line 106
    :cond_3
    const/4 v3, 0x0

    :goto_3
    if-ge v3, v12, :cond_5

    .line 108
    sget-object v1, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v1, v1, v3

    const/4 v4, 0x6

    aget-object v1, v1, v4

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 109
    sget-object v1, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v1, v1, v3

    const/4 v5, 0x7

    aget-object v1, v1, v5

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 110
    sget-object v1, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v1, v1, v3

    const/16 v6, 0x8

    aget-object v1, v1, v6

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 111
    sget-object v1, Lcom/keymouse/tool/SpeedSliders;->MAXV:[I

    aget v1, v1, v3

    sub-int/2addr v1, v4

    div-int v9, v1, v5

    .line 112
    sget-object v1, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v6, v1, v3

    const/4 v1, 0x1

    move/from16 v0, p1

    if-lt v0, v1, :cond_4

    const/4 v1, 0x3

    move/from16 v0, p1

    if-gt v0, v1, :cond_4

    move/from16 v1, p1

    :goto_4
    add-int/lit8 v1, v1, 0x1

    aget-object v7, v6, v1

    check-cast v7, Ljava/lang/String;

    .line 113
    new-instance v6, Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 114
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 115
    const/4 v1, 0x0

    const/high16 v13, 0x41000000    # 8.0f

    mul-float/2addr v13, v10

    float-to-int v13, v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v6, v1, v13, v14, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 116
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v13, ": "

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget v13, v2, v3

    invoke-static {v13, v8}, Lcom/keymouse/tool/SpeedSliders;->fmt(II)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    invoke-virtual {v11, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 119
    new-instance v13, Landroid/widget/SeekBar;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 120
    invoke-virtual {v13, v9}, Landroid/widget/SeekBar;->setMax(I)V

    .line 121
    const/4 v1, 0x0

    aget v14, v2, v3

    sub-int/2addr v14, v4

    div-int/2addr v14, v5

    invoke-static {v9, v14}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v1, v9}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v13, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 122
    new-instance v1, Lcom/keymouse/tool/SpeedSliders$1;

    move-object/from16 v9, p0

    invoke-direct/range {v1 .. v9}, Lcom/keymouse/tool/SpeedSliders$1;-><init>([IIIILandroid/widget/TextView;Ljava/lang/String;ILandroid/content/Context;)V

    invoke-virtual {v13, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 138
    invoke-virtual {v11, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 106
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_3

    .line 112
    :cond_4
    const/4 v1, 0x0

    goto :goto_4

    .line 140
    :cond_5
    return-object v11
.end method

.method private static cfgFile(Landroid/content/Context;)Ljava/io/File;
    .locals 3

    .prologue
    .line 39
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "keymouse_speed.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static fmt(II)Ljava/lang/String;
    .locals 2

    .prologue
    .line 74
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit16 v1, p0, 0x3e8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    rem-int/lit16 v1, p0, 0x3e8

    div-int/lit8 v1, v1, 0x64

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 77
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    const-string v0, " px"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, " px/s"

    goto :goto_1
.end method

.method private static load(Landroid/content/Context;)Ljava/util/Properties;
    .locals 3

    .prologue
    .line 43
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 45
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-static {p0}, Lcom/keymouse/tool/SpeedSliders;->cfgFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :try_start_1
    invoke-virtual {v0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 53
    :goto_0
    return-object v0

    .line 49
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 50
    throw v2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 51
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static save(Landroid/content/Context;[I)V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 58
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v0

    .line 59
    :goto_0
    sget-object v0, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    array-length v0, v0

    if-ge v1, v0, :cond_0

    .line 60
    sget-object v0, Lcom/keymouse/tool/SpeedSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v0, v0, v1

    const/4 v3, 0x0

    aget-object v0, v0, v3

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    aget v3, p1, v1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 62
    :cond_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-static {p0}, Lcom/keymouse/tool/SpeedSliders;->cfgFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 68
    invoke-static {p0}, Lcom/keymouse/tool/SpeedSliders;->cfgFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setReadable(ZZ)Z

    .line 71
    :goto_1
    return-void

    .line 66
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 67
    throw v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 69
    :catch_0
    move-exception v0

    goto :goto_1
.end method
