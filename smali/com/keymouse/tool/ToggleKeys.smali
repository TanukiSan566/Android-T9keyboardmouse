.class public final Lcom/keymouse/tool/ToggleKeys;
.super Ljava/lang/Object;
.source "ToggleKeys.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method private static L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .prologue
    .line 34
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$000(Ljava/io/File;Z)V
    .registers 2

    .prologue
    .line 29
    invoke-static {p0, p1}, Lcom/keymouse/tool/ToggleKeys;->writeLockAllow(Ljava/io/File;Z)V

    return-void
.end method

.method static synthetic access$100(Ljava/io/File;)[I
    .registers 2

    .prologue
    .line 29
    invoke-static {p0}, Lcom/keymouse/tool/ToggleKeys;->readState(Ljava/io/File;)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .prologue
    .line 29
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Ljava/io/File;)[I
    .registers 2

    .prologue
    .line 29
    invoke-static {p0}, Lcom/keymouse/tool/ToggleKeys;->readKeys(Ljava/io/File;)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Ljava/io/File;)I
    .registers 2

    .prologue
    .line 29
    invoke-static {p0}, Lcom/keymouse/tool/ToggleKeys;->readToggleHold(Ljava/io/File;)I

    move-result v0

    return v0
.end method

.method public static addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 23

    .prologue
    .line 224
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v7

    .line 225
    new-instance v19, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-direct {v0, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 226
    const/4 v4, 0x1

    new-array v5, v4, [Z

    const/4 v4, 0x0

    const/4 v6, 0x0

    aput-boolean v6, v5, v4

    .line 227
    const/4 v4, 0x1

    new-array v6, v4, [J

    const/4 v4, 0x0

    const-wide/16 v8, 0x0

    aput-wide v8, v6, v4

    .line 228
    const/4 v4, 0x1

    new-array v14, v4, [J

    const/4 v4, 0x0

    const-wide/16 v8, 0x0

    aput-wide v8, v14, v4

    .line 230
    new-instance v4, Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 231
    const/high16 v8, 0x41800000    # 16.0f

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 232
    const/4 v8, 0x0

    const/16 v9, 0x14

    move-object/from16 v0, p0

    invoke-static {v0, v9}, Lcom/keymouse/tool/ToggleKeys;->dp(Landroid/app/Activity;I)I

    move-result v9

    const/4 v10, 0x0

    const/4 v11, 0x4

    move-object/from16 v0, p0

    invoke-static {v0, v11}, Lcom/keymouse/tool/ToggleKeys;->dp(Landroid/app/Activity;I)I

    move-result v11

    invoke-virtual {v4, v8, v9, v10, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 233
    const-string v8, "Mouse mode (soft switch)"

    const-string v9, "\u0420\u0435\u0436\u0438\u043c \u043c\u044b\u0448\u0438 (\u043a\u043d\u043e\u043f\u043a\u0430)"

    const-string v10, "\u30de\u30a6\u30b9\u30e2\u30fc\u30c9(\u30bd\u30d5\u30c8\u30b9\u30a4\u30c3\u30c1)"

    const-string v11, "\u9f20\u6807\u8f6f\u5f00\u5173"

    move-object/from16 v0, p0

    invoke-static {v0, v8, v9, v10, v11}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 234
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 237
    new-instance v13, Landroid/widget/Switch;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 238
    const-string v4, "Mouse on"

    const-string v8, "\u041c\u044b\u0448\u044c \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u0430"

    const-string v9, "\u30de\u30a6\u30b9 \u30aa\u30f3"

    const-string v10, "\u9f20\u6807\u5df2\u5f00\u542f"

    move-object/from16 v0, p0

    invoke-static {v0, v4, v8, v9, v10}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v4}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 239
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 242
    const/16 v4, 0xa

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/keymouse/tool/ToggleKeys;->small(Landroid/app/Activity;I)Landroid/widget/TextView;

    move-result-object v8

    .line 243
    const/high16 v4, 0x41500000    # 13.0f

    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 244
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 246
    new-instance v4, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 247
    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 248
    new-instance v16, Landroid/widget/Button;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 249
    new-instance v10, Landroid/widget/Button;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 250
    const-string v9, "Reset to F1"

    const-string v11, "\u0412\u0435\u0440\u043d\u0443\u0442\u044c F1"

    const-string v12, "F1\u306b\u623b\u3059"

    const-string v15, "\u6062\u590d F1"

    move-object/from16 v0, p0

    invoke-static {v0, v9, v11, v12, v15}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 251
    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 252
    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 253
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 255
    new-instance v15, Landroid/widget/Switch;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 256
    const-string v4, "Show red dot marker"

    const-string v9, "\u041f\u043e\u043a\u0430\u0437\u044b\u0432\u0430\u0442\u044c \u043a\u0440\u0430\u0441\u043d\u0443\u044e \u0442\u043e\u0447\u043a\u0443"

    const-string v11, "\u8d64\u3044\u70b9\u3092\u8868\u793a"

    const-string v12, "\u663e\u793a\u7ea2\u70b9\u6807\u8bb0"

    move-object/from16 v0, p0

    invoke-static {v0, v4, v9, v11, v12}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 257
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 260
    new-instance v4, Landroid/widget/Switch;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 261
    invoke-static {v7}, Lcom/keymouse/tool/ToggleKeys;->readLockAllow(Ljava/io/File;)Z

    move-result v9

    invoke-virtual {v4, v9}, Landroid/widget/Switch;->setChecked(Z)V

    .line 262
    new-instance v9, Lcom/keymouse/tool/ToggleKeys$2;

    invoke-direct {v9, v7}, Lcom/keymouse/tool/ToggleKeys$2;-><init>(Ljava/io/File;)V

    invoke-virtual {v4, v9}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 267
    const-string v9, "Mouse on lock screen"

    const-string v11, "\u041c\u044b\u0448\u044c \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438"

    const-string v12, "\u30ed\u30c3\u30af\u753b\u9762\u3067\u3082\u30de\u30a6\u30b9\u3092\u6709\u52b9"

    const-string v17, "\u9501\u5c4f\u754c\u9762\u4e5f\u542f\u7528\u9f20\u6807"

    .line 268
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v9, v11, v12, v1}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v11, "On"

    const-string v12, "\u0412\u043a\u043b"

    const-string v17, "\u30aa\u30f3"

    const-string v18, "\u5f00\u542f"

    .line 269
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-static {v0, v11, v12, v1, v2}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "Off"

    const-string v17, "\u0412\u044b\u043a\u043b"

    const-string v18, "\u30aa\u30d5"

    const-string v20, "\u5173\u95ed"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v20

    invoke-static {v0, v12, v1, v2, v3}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 267
    move-object/from16 v0, p0

    invoke-static {v0, v9, v11, v12, v4}, Lcom/keymouse/tool/ChoiceRow;->build(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/CompoundButton;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 270
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/keymouse/tool/ToggleKeys;->small(Landroid/app/Activity;I)Landroid/widget/TextView;

    move-result-object v4

    .line 271
    const-string v9, "Off (default): the mouse pauses on the lock screen and resumes after unlock, so you can type the PIN."

    const-string v11, "\u0412\u044b\u043a\u043b (\u043f\u043e \u0443\u043c\u043e\u043b\u0447\u0430\u043d\u0438\u044e): \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 \u043c\u044b\u0448\u044c \u043d\u0430 \u043f\u0430\u0443\u0437\u0435, \u043f\u043e\u0441\u043b\u0435 \u0440\u0430\u0437\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 \u0432\u043e\u0437\u043e\u0431\u043d\u043e\u0432\u043b\u044f\u0435\u0442\u0441\u044f."

    const-string v12, "\u30aa\u30d5(\u521d\u671f\u5024): \u30ed\u30c3\u30af\u753b\u9762\u3067\u306f\u30de\u30a6\u30b9\u3092\u4e00\u6642\u505c\u6b62\u3057\u3001\u89e3\u9664\u5f8c\u306b\u81ea\u52d5\u3067\u518d\u958b\u3057\u307e\u3059\u3002"

    const-string v17, "\u5173\u95ed(\u9ed8\u8ba4): \u9501\u5c4f\u754c\u9762\u81ea\u52a8\u6682\u505c\u9f20\u6807\uff0c\u89e3\u9501\u540e\u81ea\u52a8\u6062\u590d\uff0c\u8fd9\u6837\u53ef\u4ee5\u6b63\u5e38\u8f93\u5165\u6570\u5b57\u5bc6\u7801\u3002"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v9, v11, v12, v1}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 277
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$3;

    move-object/from16 v9, p0

    invoke-direct/range {v4 .. v9}, Lcom/keymouse/tool/ToggleKeys$3;-><init>([Z[JLjava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V

    invoke-virtual {v13, v4}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 294
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$4;

    invoke-direct {v4, v5, v14, v7}, Lcom/keymouse/tool/ToggleKeys$4;-><init>([Z[JLjava/io/File;)V

    invoke-virtual {v15, v4}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 303
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$5;

    invoke-direct {v4, v7}, Lcom/keymouse/tool/ToggleKeys$5;-><init>(Ljava/io/File;)V

    invoke-virtual {v10, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 315
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$6;

    move-object/from16 v0, p0

    invoke-direct {v4, v7, v8, v0}, Lcom/keymouse/tool/ToggleKeys$6;-><init>(Ljava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 332
    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/Runnable;

    move-object/from16 v20, v0

    .line 333
    const/4 v4, 0x0

    new-instance v9, Lcom/keymouse/tool/ToggleKeys$7;

    move-object v10, v7

    move-object v11, v5

    move-object v12, v6

    move-object/from16 v17, p0

    move-object/from16 v18, v8

    invoke-direct/range {v9 .. v20}, Lcom/keymouse/tool/ToggleKeys$7;-><init>(Ljava/io/File;[Z[JLandroid/widget/Switch;[JLandroid/widget/Switch;Landroid/widget/Button;Landroid/app/Activity;Landroid/widget/TextView;Landroid/os/Handler;[Ljava/lang/Runnable;)V

    aput-object v9, v20, v4

    .line 368
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$8;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v4, v0, v1}, Lcom/keymouse/tool/ToggleKeys$8;-><init>(Landroid/os/Handler;[Ljava/lang/Runnable;)V

    invoke-virtual {v8, v4}, Landroid/widget/TextView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 378
    return-void
.end method

.method private static dp(Landroid/app/Activity;I)I
    .registers 4

    .prologue
    .line 38
    int-to-float v0, p1

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method static keyName(Landroid/app/Activity;I)Ljava/lang/String;
    .registers 7

    .prologue
    .line 42
    const/16 v0, 0x3b

    if-lt p1, v0, :cond_20

    const/16 v0, 0x44

    if-gt p1, v0, :cond_20

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "F"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, p1, -0x3b

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    :goto_1f
    return-object v0

    .line 45
    :cond_20
    const/16 v0, 0x57

    if-ne p1, v0, :cond_27

    .line 46
    const-string v0, "F11"

    goto :goto_1f

    .line 48
    :cond_27
    const/16 v0, 0x58

    if-ne p1, v0, :cond_2e

    .line 49
    const-string v0, "F12"

    goto :goto_1f

    .line 51
    :cond_2e
    const/16 v0, 0x72

    if-ne p1, v0, :cond_3f

    .line 52
    const-string v0, "Volume-"

    const-string v1, "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c-"

    const-string v2, "\u97f3\u91cf-"

    const-string v3, "\u97f3\u91cf-"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    .line 54
    :cond_3f
    const/16 v0, 0x73

    if-ne p1, v0, :cond_50

    .line 55
    const-string v0, "Volume+"

    const-string v1, "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c+"

    const-string v2, "\u97f3\u91cf+"

    const-string v3, "\u97f3\u91cf+"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    .line 57
    :cond_50
    const/4 v0, 0x2

    if-lt p1, v0, :cond_5e

    const/16 v0, 0xa

    if-gt p1, v0, :cond_5e

    .line 58
    add-int/lit8 v0, p1, -0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    .line 60
    :cond_5e
    const/16 v0, 0xb

    if-ne p1, v0, :cond_65

    .line 61
    const-string v0, "0"

    goto :goto_1f

    .line 63
    :cond_65
    const/16 v0, 0x37

    if-ne p1, v0, :cond_6c

    .line 64
    const-string v0, "*"

    goto :goto_1f

    .line 66
    :cond_6c
    const/16 v0, 0x160

    if-eq p1, v0, :cond_74

    const/16 v0, 0x161

    if-ne p1, v0, :cond_81

    .line 67
    :cond_74
    const-string v0, "Center(OK)"

    const-string v1, "\u0426\u0435\u043d\u0442\u0440(OK)"

    const-string v2, "\u4e2d\u592e(OK)"

    const-string v3, "\u4e2d\u95f4\u952e(\u786e\u5b9a)"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    .line 69
    :cond_81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "key code "

    const-string v2, "\u043a\u043e\u0434 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 "

    const-string v3, "\u30ad\u30fc\u30b3\u30fc\u30c9 "

    const-string v4, "\u952e\u7801 "

    invoke-static {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1f
.end method

.method private static readKeys(Ljava/io/File;)[I
    .registers 11

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 105
    new-array v5, v9, [I

    .line 107
    new-instance v0, Ljava/io/File;

    const-string v1, "keymouse_toggle_keys"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->readLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 109
    if-eqz v0, :cond_3a

    .line 110
    :try_start_13
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_1e} :catch_81

    move v4, v3

    move v1, v3

    :goto_20
    if-ge v4, v7, :cond_73

    :try_start_22
    aget-object v0, v6, v4

    .line 111
    if-ge v1, v9, :cond_89

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_89

    .line 112
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_2f} :catch_84

    move-result v8

    .line 113
    if-lez v8, :cond_89

    .line 114
    add-int/lit8 v0, v1, 0x1

    :try_start_34
    aput v8, v5, v1
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_34 .. :try_end_36} :catch_87

    .line 110
    :goto_36
    add-int/lit8 v4, v4, 0x1

    move v1, v0

    goto :goto_20

    .line 119
    :cond_3a
    const/4 v0, 0x2

    :try_start_3b
    new-array v6, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "keymouse_toggle_key"

    aput-object v1, v6, v0

    const/4 v0, 0x1

    const-string v1, "keymouse_toggle_key2"

    aput-object v1, v6, v0
    :try_end_47
    .catch Ljava/lang/Throwable; {:try_start_3b .. :try_end_47} :catch_81

    move v4, v3

    move v0, v3

    .line 120
    :goto_49
    if-ge v4, v8, :cond_72

    .line 121
    :try_start_4b
    new-instance v1, Ljava/io/File;

    aget-object v7, v6, v4

    invoke-direct {v1, p0, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/keymouse/tool/ToggleKeys;->readLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 122
    if-eqz v1, :cond_6e

    .line 123
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 124
    if-lez v7, :cond_6e

    if-eqz v0, :cond_69

    const/4 v1, 0x0

    aget v1, v5, v1
    :try_end_67
    .catch Ljava/lang/Throwable; {:try_start_4b .. :try_end_67} :catch_87

    if-eq v7, v1, :cond_6e

    .line 125
    :cond_69
    add-int/lit8 v1, v0, 0x1

    :try_start_6b
    aput v7, v5, v0
    :try_end_6d
    .catch Ljava/lang/Throwable; {:try_start_6b .. :try_end_6d} :catch_84

    move v0, v1

    .line 120
    :cond_6e
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_49

    :cond_72
    move v1, v0

    :cond_73
    move v0, v1

    .line 132
    :goto_74
    if-nez v0, :cond_7b

    .line 133
    const/16 v0, 0x3b

    aput v0, v5, v3

    move v0, v2

    .line 136
    :cond_7b
    new-array v1, v0, [I

    .line 137
    invoke-static {v5, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 138
    return-object v1

    .line 130
    :catch_81
    move-exception v0

    move v0, v3

    goto :goto_74

    :catch_84
    move-exception v0

    move v0, v1

    goto :goto_74

    :catch_87
    move-exception v1

    goto :goto_74

    :cond_89
    move v0, v1

    goto :goto_36
.end method

.method private static readLine(Ljava/io/File;)Ljava/lang/String;
    .registers 4

    .prologue
    .line 92
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_f} :catch_1c

    .line 94
    :try_start_f
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_12
    .catchall {:try_start_f .. :try_end_12} :catchall_17

    move-result-object v0

    .line 96
    :try_start_13
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 99
    :goto_16
    return-object v0

    .line 96
    :catchall_17
    move-exception v0

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 97
    throw v0
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_1c} :catch_1c

    .line 98
    :catch_1c
    move-exception v0

    .line 99
    const/4 v0, 0x0

    goto :goto_16
.end method

.method private static readLockAllow(Ljava/io/File;)Z
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 185
    :try_start_1
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v3, Ljava/io/FileInputStream;

    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_lock.cfg"

    invoke-direct {v4, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_17} :catch_4a

    move v0, v1

    .line 189
    :cond_18
    :goto_18
    :try_start_18
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_40

    .line 190
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 191
    const-string v4, "lockAllow="

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 192
    const-string v0, "0"

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_39
    .catchall {:try_start_18 .. :try_end_39} :catchall_45

    move-result v0

    if-nez v0, :cond_3e

    const/4 v0, 0x1

    goto :goto_18

    :cond_3e
    move v0, v1

    goto :goto_18

    .line 197
    :cond_40
    :try_start_40
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    move v1, v0

    .line 200
    :goto_44
    return v1

    .line 197
    :catchall_45
    move-exception v0

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 198
    throw v0
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_40 .. :try_end_4a} :catch_4a

    .line 199
    :catch_4a
    move-exception v0

    goto :goto_44
.end method

.method private static readState(Ljava/io/File;)[I
    .registers 7

    .prologue
    const/4 v5, 0x4

    const/4 v0, 0x0

    .line 144
    :try_start_2
    new-instance v1, Ljava/io/File;

    const-string v2, "keymouse.pid"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_10

    .line 158
    :cond_f
    :goto_f
    return-object v0

    .line 147
    :cond_10
    new-instance v1, Ljava/io/File;

    const-string v2, "keymouse_state"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/keymouse/tool/ToggleKeys;->readLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 148
    if-eqz v1, :cond_f

    .line 151
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, " +"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 152
    const/4 v1, 0x4

    new-array v1, v1, [I

    .line 153
    const/4 v2, 0x0

    :goto_2b
    if-ge v2, v5, :cond_3b

    array-length v4, v3

    if-ge v2, v4, :cond_3b

    .line 154
    aget-object v4, v3, v2

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v1, v2
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_38} :catch_3d

    .line 153
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    :cond_3b
    move-object v0, v1

    .line 156
    goto :goto_f

    .line 157
    :catch_3d
    move-exception v1

    goto :goto_f
.end method

.method private static readToggleHold(Ljava/io/File;)I
    .registers 5

    .prologue
    .line 164
    :try_start_0
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 165
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v2, Ljava/io/File;

    const-string v3, "keymouse_hold.cfg"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_11} :catch_31

    .line 167
    :try_start_11
    invoke-virtual {v0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_2c

    .line 169
    :try_start_14
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 171
    const-string v1, "toggleHold"

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 172
    if-eqz v0, :cond_32

    .line 173
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 174
    const/16 v1, 0x64

    if-lt v0, v1, :cond_32

    .line 180
    :goto_2b
    return v0

    .line 169
    :catchall_2c
    move-exception v0

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 170
    throw v0
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_31} :catch_31

    .line 178
    :catch_31
    move-exception v0

    .line 180
    :cond_32
    const/16 v0, 0x1f4

    goto :goto_2b
.end method

.method static sendCmd(Ljava/io/File;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 74
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/keymouse/tool/ToggleKeys$1;

    invoke-direct {v1, p0, p1}, Lcom/keymouse/tool/ToggleKeys$1;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 87
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 88
    return-void
.end method

.method private static small(Landroid/app/Activity;I)Landroid/widget/TextView;
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 216
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 217
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 218
    const/high16 v1, 0x3f400000    # 0.75f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 219
    invoke-static {p0, p1}, Lcom/keymouse/tool/ToggleKeys;->dp(Landroid/app/Activity;I)I

    move-result v1

    const/4 v2, 0x4

    invoke-static {p0, v2}, Lcom/keymouse/tool/ToggleKeys;->dp(Landroid/app/Activity;I)I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 220
    return-object v0
.end method

.method private static writeLockAllow(Ljava/io/File;Z)V
    .registers 8

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 206
    :try_start_2
    new-instance v2, Ljava/io/File;

    const-string v3, "keymouse_lock.cfg"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 207
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 208
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "lockAllow="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz p1, :cond_39

    :goto_1b
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 209
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 210
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {v2, v0, v1}, Ljava/io/File;->setReadable(ZZ)Z
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_38} :catch_3b

    .line 213
    :goto_38
    return-void

    :cond_39
    move v0, v1

    .line 208
    goto :goto_1b

    .line 211
    :catch_3b
    move-exception v0

    goto :goto_38
.end method
