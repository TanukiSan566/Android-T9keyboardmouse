.class public final Lcom/keymouse/tool/HoldSliders;
.super Ljava/lang/Object;
.source "HoldSliders.java"


# static fields
.field private static final ITEMS:[[Ljava/lang/Object;

.field private static sTouch:Z


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 26
    new-array v0, v8, [[Ljava/lang/Object;

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "dragHold"

    aput-object v2, v1, v4

    const-string v2, "Hold OK = drag"

    aput-object v2, v1, v5

    const-string v2, "OK \u0443\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0442\u044c = \u043f\u0435\u0440\u0435\u0442\u0430\u0441\u043a\u0438\u0432\u0430\u043d\u0438\u0435"

    aput-object v2, v1, v6

    const-string v2, "OK\u9577\u62bc\u3057=\u30c9\u30e9\u30c3\u30b0"

    aput-object v2, v1, v7

    const-string v2, "\u957f\u6309\u786e\u8ba4\u952e=\u62d6\u52a8"

    aput-object v2, v1, v8

    const/4 v2, 0x5

    const/16 v3, 0xbb8

    .line 27
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0x50

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    aput-object v1, v0, v4

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "autoMenu"

    aput-object v2, v1, v4

    const-string v2, "Copy menu after drag release (right-click)"

    aput-object v2, v1, v5

    const-string v2, "\u041c\u0435\u043d\u044e \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f \u043f\u043e\u0441\u043b\u0435 \u043e\u0442\u043f\u0443\u0441\u043a\u0430\u043d\u0438\u044f (\u041f\u041a\u041c)"

    aput-object v2, v1, v6

    const-string v2, "\u30c9\u30e9\u30c3\u30b0\u5f8c\u306b\u30b3\u30d4\u30fc\u30e1\u30cb\u30e5\u30fc(\u53f3\u30af\u30ea\u30c3\u30af)"

    aput-object v2, v1, v7

    const-string v2, "\u62d6\u52a8\u677e\u624b\u540e\u81ea\u52a8\u5f39\u590d\u5236\u83dc\u5355(\u53f3\u952e)"

    aput-object v2, v1, v8

    const/4 v2, 0x5

    const/16 v3, 0x3e8

    .line 28
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0x1e

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    aput-object v1, v0, v5

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "toggleHold"

    aput-object v2, v1, v4

    const-string v2, "Hold toggle key = mouse on/off"

    aput-object v2, v1, v5

    const-string v2, "\u0423\u0434\u0435\u0440\u0436. \u043a\u043d\u043e\u043f\u043a\u0443 = \u0432\u043a\u043b/\u0432\u044b\u043a\u043b \u043c\u044b\u0448\u044c"

    aput-object v2, v1, v6

    const-string v2, "\u5207\u66ff\u30ad\u30fc\u9577\u62bc\u3057=\u30de\u30a6\u30b9\u5165/\u5207"

    aput-object v2, v1, v7

    const-string v2, "\u957f\u6309\u5f00\u5173\u952e=\u5f00/\u5173\u9f20\u6807"

    aput-object v2, v1, v8

    const/4 v2, 0x5

    const/16 v3, 0x1f4

    .line 29
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0x1e

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    aput-object v1, v0, v6

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "scrollHold"

    aput-object v2, v1, v4

    const-string v2, "Hold scroll key = continuous"

    aput-object v2, v1, v5

    const-string v2, "\u0423\u0434\u0435\u0440\u0436. \u043f\u0440\u043e\u043a\u0440\u0443\u0442\u043a\u0443 = \u043d\u0435\u043f\u0440\u0435\u0440\u044b\u0432\u043d\u043e"

    aput-object v2, v1, v6

    const-string v2, "\u30b9\u30af\u30ed\u30fc\u30eb\u30ad\u30fc\u9577\u62bc\u3057=\u9023\u7d9a"

    aput-object v2, v1, v7

    const-string v2, "\u957f\u6309\u6eda\u52a8\u952e=\u8fde\u7eed\u6ed1\u52a8"

    aput-object v2, v1, v8

    const/4 v2, 0x5

    const/16 v3, 0x12c

    .line 30
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/16 v3, 0x14

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    aput-object v1, v0, v7

    sput-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

    .line 51
    sput-boolean v4, Lcom/keymouse/tool/HoldSliders;->sTouch:Z

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method static synthetic access$002(Z)Z
    .registers 1

    .prologue
    .line 21
    sput-boolean p0, Lcom/keymouse/tool/HoldSliders;->sTouch:Z

    return p0
.end method

.method static synthetic access$100(Landroid/content/Context;[I)V
    .registers 2

    .prologue
    .line 21
    invoke-static {p0, p1}, Lcom/keymouse/tool/HoldSliders;->save(Landroid/content/Context;[I)V

    return-void
.end method

.method static synthetic access$200(II)Ljava/lang/String;
    .registers 3

    .prologue
    .line 21
    invoke-static {p0, p1}, Lcom/keymouse/tool/HoldSliders;->fmt(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static build(Landroid/content/Context;I)Landroid/view/View;
    .registers 16

    .prologue
    const/4 v7, 0x2

    const/4 v13, 0x3

    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 80
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v9, v0, Landroid/util/DisplayMetrics;->density:F

    .line 81
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 82
    invoke-virtual {v10, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 83
    const/16 v0, 0x28

    const/16 v1, 0xa

    invoke-virtual {v10, v8, v0, v8, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 85
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 86
    if-ne p1, v6, :cond_7d

    const-string v0, "\u0412\u0440\u0435\u043c\u044f \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044f \u043a\u043b\u0430\u0432\u0438\u0448"

    :goto_26
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 88
    invoke-virtual {v10, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 90
    invoke-static {p0}, Lcom/keymouse/tool/HoldSliders;->load(Landroid/content/Context;)Ljava/util/Properties;

    move-result-object v4

    .line 91
    const-string v0, "1"

    const-string v1, "touchMode"

    const-string v2, "0"

    invoke-virtual {v4, v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/keymouse/tool/HoldSliders;->sTouch:Z

    .line 92
    sget-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

    array-length v11, v0

    .line 93
    new-array v2, v11, [I

    move v3, v8

    .line 94
    :goto_4f
    if-ge v3, v11, :cond_8d

    .line 95
    sget-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v0, v0, v3

    const/4 v1, 0x5

    aget-object v0, v0, v1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 98
    :try_start_5e
    sget-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v0, v0, v3

    const/4 v5, 0x0

    aget-object v0, v0, v5

    check-cast v0, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_76
    .catch Ljava/lang/Throwable; {:try_start_5e .. :try_end_76} :catch_8a

    move-result v0

    .line 101
    :goto_77
    aput v0, v2, v3

    .line 94
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_4f

    .line 86
    :cond_7d
    if-ne p1, v7, :cond_82

    const-string v0, "\u9577\u62bc\u3057\u6642\u9593"

    goto :goto_26

    :cond_82
    if-ne p1, v13, :cond_87

    const-string v0, "\u957f\u6309\u65f6\u95f4(\u62d6\u52a8\u5373\u65f6\u751f\u6548)"

    goto :goto_26

    :cond_87
    const-string v0, "Long-press time"

    goto :goto_26

    .line 99
    :catch_8a
    move-exception v0

    move v0, v1

    goto :goto_77

    .line 105
    :cond_8d
    new-instance v4, Landroid/widget/Switch;

    invoke-direct {v4, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 106
    sget-boolean v0, Lcom/keymouse/tool/HoldSliders;->sTouch:Z

    invoke-virtual {v4, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 107
    new-instance v0, Lcom/keymouse/tool/HoldSliders$1;

    invoke-direct {v0, p0, v2}, Lcom/keymouse/tool/HoldSliders$1;-><init>(Landroid/content/Context;[I)V

    invoke-virtual {v4, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 113
    if-ne p1, v6, :cond_13e

    const-string v0, "\u0420\u0435\u0436\u0438\u043c \u043a\u0430\u0441\u0430\u043d\u0438\u044f (\u043a\u043b\u0438\u043a/\u043f\u0435\u0440\u0435\u0442\u0430\u0441\u043a\u0438\u0432\u0430\u043d\u0438\u0435 \u043a\u0430\u043a \u043f\u0430\u043b\u044c\u0446\u0435\u043c: \u0432\u044b\u0434\u0435\u043b\u0435\u043d\u0438\u0435 \u0442\u0435\u043a\u0441\u0442\u0430, \u043c\u0435\u043d\u044e)"

    move-object v3, v0

    .line 117
    :goto_a4
    if-ne p1, v6, :cond_151

    const-string v0, "\u0412\u043a\u043b"

    move-object v1, v0

    .line 118
    :goto_a9
    if-ne p1, v6, :cond_164

    const-string v0, "\u0412\u044b\u043a\u043b"

    .line 119
    :goto_ad
    invoke-static {p0, v3, v1, v0, v4}, Lcom/keymouse/tool/ChoiceRow;->build(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/CompoundButton;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move v3, v8

    .line 121
    :goto_b5
    if-ge v3, v11, :cond_17a

    .line 123
    sget-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v0, v0, v3

    const/4 v1, 0x6

    aget-object v0, v0, v1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 124
    sget-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v0, v0, v3

    const/4 v1, 0x7

    aget-object v0, v0, v1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 125
    sget-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

    aget-object v4, v0, v3

    if-ltz p1, :cond_177

    if-gt p1, v13, :cond_177

    if-nez p1, :cond_174

    move v0, v8

    :goto_dc
    add-int/lit8 v0, v0, 0x1

    aget-object v5, v4, v0

    check-cast v5, Ljava/lang/String;

    .line 126
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 127
    const/high16 v0, 0x41600000    # 14.0f

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 128
    const/high16 v0, 0x41000000    # 8.0f

    mul-float/2addr v0, v9

    float-to-int v0, v0

    invoke-virtual {v4, v8, v0, v8, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, ": "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    aget v7, v2, v3

    invoke-static {v7, p1}, Lcom/keymouse/tool/HoldSliders;->fmt(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    invoke-virtual {v10, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 132
    new-instance v12, Landroid/widget/SeekBar;

    invoke-direct {v12, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 133
    invoke-virtual {v12, v6}, Landroid/widget/SeekBar;->setMax(I)V

    .line 134
    aget v0, v2, v3

    div-int/lit8 v0, v0, 0x64

    invoke-static {v6, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {v12, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 135
    new-instance v0, Lcom/keymouse/tool/HoldSliders$2;

    move v6, p1

    move-object v7, p0

    invoke-direct/range {v0 .. v7}, Lcom/keymouse/tool/HoldSliders$2;-><init>(I[IILandroid/widget/TextView;Ljava/lang/String;ILandroid/content/Context;)V

    invoke-virtual {v12, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 152
    invoke-virtual {v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 121
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_b5

    .line 114
    :cond_13e
    if-ne p1, v7, :cond_145

    const-string v0, "\u30bf\u30c3\u30c1\u64cd\u4f5c\u30e2\u30fc\u30c9(\u30af\u30ea\u30c3\u30af/\u30c9\u30e9\u30c3\u30b0\u3092\u6307\u306e\u64cd\u4f5c\u3068\u3057\u3066\u6271\u3046: \u30c6\u30ad\u30b9\u30c8\u9078\u629e\u30fb\u30e1\u30cb\u30e5\u30fc)"

    move-object v3, v0

    goto/16 :goto_a4

    .line 115
    :cond_145
    if-ne p1, v13, :cond_14c

    const-string v0, "\u89e6\u6478\u70b9\u51fb\u6a21\u5f0f(\u786e\u8ba4\u952e/\u62d6\u52a8\u6309\u624b\u6307\u89e6\u6478\u5904\u7406\uff1a\u62d6\u9009\u6587\u5b57\u3001\u70b9\u9009\u533a\u5de5\u5177\u680f)"

    move-object v3, v0

    goto/16 :goto_a4

    .line 116
    :cond_14c
    const-string v0, "Touch-tap mode (click/drag act like a finger: text selection, toolbar)"

    move-object v3, v0

    goto/16 :goto_a4

    .line 117
    :cond_151
    if-ne p1, v7, :cond_158

    const-string v0, "\u30aa\u30f3"

    move-object v1, v0

    goto/16 :goto_a9

    :cond_158
    if-ne p1, v13, :cond_15f

    const-string v0, "\u5f00\u542f"

    move-object v1, v0

    goto/16 :goto_a9

    :cond_15f
    const-string v0, "On"

    move-object v1, v0

    goto/16 :goto_a9

    .line 118
    :cond_164
    if-ne p1, v7, :cond_16a

    const-string v0, "\u30aa\u30d5"

    goto/16 :goto_ad

    :cond_16a
    if-ne p1, v13, :cond_170

    const-string v0, "\u5173\u95ed"

    goto/16 :goto_ad

    :cond_170
    const-string v0, "Off"

    goto/16 :goto_ad

    :cond_174
    move v0, p1

    .line 125
    goto/16 :goto_dc

    :cond_177
    move v0, v8

    goto/16 :goto_dc

    .line 154
    :cond_17a
    return-object v10
.end method

.method private static cfgFile(Landroid/content/Context;)Ljava/io/File;
    .registers 4

    .prologue
    .line 34
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "keymouse_hold.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static fmt(II)Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 72
    if-gtz p0, :cond_17

    .line 73
    if-ne p1, v2, :cond_a

    const-string v0, "\u0432\u044b\u043a\u043b"

    .line 76
    :goto_9
    return-object v0

    .line 73
    :cond_a
    if-ne p1, v3, :cond_f

    const-string v0, "\u30aa\u30d5"

    goto :goto_9

    :cond_f
    if-ne p1, v4, :cond_14

    const-string v0, "\u5173\u95ed"

    goto :goto_9

    :cond_14
    const-string v0, "off"

    goto :goto_9

    .line 75
    :cond_17
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

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-ne p1, v2, :cond_4a

    const-string v0, " \u0441"

    :goto_41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    :cond_4a
    if-ne p1, v3, :cond_4f

    const-string v0, " \u79d2"

    goto :goto_41

    :cond_4f
    if-ne p1, v4, :cond_54

    const-string v0, " \u79d2"

    goto :goto_41

    :cond_54
    const-string v0, " s"

    goto :goto_41
.end method

.method private static load(Landroid/content/Context;)Ljava/util/Properties;
    .registers 4

    .prologue
    .line 38
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 40
    :try_start_5
    new-instance v1, Ljava/io/FileInputStream;

    invoke-static {p0}, Lcom/keymouse/tool/HoldSliders;->cfgFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_e} :catch_1a

    .line 42
    :try_start_e
    invoke-virtual {v0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_15

    .line 44
    :try_start_11
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 48
    :goto_14
    return-object v0

    .line 44
    :catchall_15
    move-exception v2

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 45
    throw v2
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_1a} :catch_1a

    .line 46
    :catch_1a
    move-exception v1

    goto :goto_14
.end method

.method private static save(Landroid/content/Context;[I)V
    .registers 7

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 55
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    const-string v3, "touchMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-boolean v4, Lcom/keymouse/tool/HoldSliders;->sTouch:Z

    if-eqz v4, :cond_42

    :goto_11
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v1, v0

    .line 57
    :goto_1b
    sget-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

    array-length v0, v0

    if-ge v1, v0, :cond_44

    .line 58
    sget-object v0, Lcom/keymouse/tool/HoldSliders;->ITEMS:[[Ljava/lang/Object;

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

    .line 57
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1b

    :cond_42
    move v1, v0

    .line 56
    goto :goto_11

    .line 60
    :cond_44
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-static {p0}, Lcom/keymouse/tool/HoldSliders;->cfgFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_4d} :catch_6a

    .line 62
    :try_start_4d
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_58
    .catchall {:try_start_4d .. :try_end_58} :catchall_65

    .line 64
    :try_start_58
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 66
    invoke-static {p0}, Lcom/keymouse/tool/HoldSliders;->cfgFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setReadable(ZZ)Z

    .line 69
    :goto_64
    return-void

    .line 64
    :catchall_65
    move-exception v0

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 65
    throw v0
    :try_end_6a
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_6a} :catch_6a

    .line 67
    :catch_6a
    move-exception v0

    goto :goto_64
.end method
