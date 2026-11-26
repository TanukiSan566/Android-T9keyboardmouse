.class public final Lcom/keymouse/tool/ToggleKeys;
.super Ljava/lang/Object;
.source "ToggleKeys.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method private static L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$000(Ljava/io/File;Z)V
    .locals 0

    .prologue
    .line 29
    invoke-static {p0, p1}, Lcom/keymouse/tool/ToggleKeys;->writeCursorOn(Ljava/io/File;Z)V

    return-void
.end method

.method static synthetic access$100(Ljava/io/File;Z)V
    .locals 0

    .prologue
    .line 29
    invoke-static {p0, p1}, Lcom/keymouse/tool/ToggleKeys;->writeLockAllow(Ljava/io/File;Z)V

    return-void
.end method

.method static synthetic access$200(Ljava/io/File;)[I
    .locals 1

    .prologue
    .line 29
    invoke-static {p0}, Lcom/keymouse/tool/ToggleKeys;->readState(Ljava/io/File;)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Ljava/io/File;)[I
    .locals 1

    .prologue
    .line 29
    invoke-static {p0}, Lcom/keymouse/tool/ToggleKeys;->readKeys(Ljava/io/File;)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/io/File;)I
    .locals 1

    .prologue
    .line 29
    invoke-static {p0}, Lcom/keymouse/tool/ToggleKeys;->readToggleHold(Ljava/io/File;)I

    move-result v0

    return v0
.end method

.method public static addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 21

    .prologue
    .line 241
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v7

    .line 242
    new-instance v19, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-direct {v0, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 243
    const/4 v4, 0x1

    new-array v5, v4, [Z

    const/4 v4, 0x0

    const/4 v6, 0x0

    aput-boolean v6, v5, v4

    .line 244
    const/4 v4, 0x1

    new-array v6, v4, [J

    const/4 v4, 0x0

    const-wide/16 v8, 0x0

    aput-wide v8, v6, v4

    .line 245
    const/4 v4, 0x1

    new-array v14, v4, [J

    const/4 v4, 0x0

    const-wide/16 v8, 0x0

    aput-wide v8, v14, v4

    .line 247
    new-instance v4, Landroid/widget/TextView;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 248
    const/high16 v8, 0x41800000    # 16.0f

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 249
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

    .line 250
    const-string v8, "Mouse mode (soft switch)"

    const-string v9, "\u0420\u0435\u0436\u0438\u043c \u043c\u044b\u0448\u0438 (\u043a\u043d\u043e\u043f\u043a\u0430)"

    const-string v10, "\u30de\u30a6\u30b9\u30e2\u30fc\u30c9(\u30bd\u30d5\u30c8\u30b9\u30a4\u30c3\u30c1)"

    const-string v11, "\u9f20\u6807\u8f6f\u5f00\u5173"

    move-object/from16 v0, p0

    invoke-static {v0, v8, v9, v10, v11}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 251
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 254
    new-instance v13, Landroid/widget/Switch;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 255
    const-string v4, "Mouse on"

    const-string v8, "\u041c\u044b\u0448\u044c \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u0430"

    const-string v9, "\u30de\u30a6\u30b9 \u30aa\u30f3"

    const-string v10, "\u9f20\u6807\u5df2\u5f00\u542f"

    move-object/from16 v0, p0

    invoke-static {v0, v4, v8, v9, v10}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v4}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 256
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 259
    const/16 v4, 0xa

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/keymouse/tool/ToggleKeys;->small(Landroid/app/Activity;I)Landroid/widget/TextView;

    move-result-object v8

    .line 260
    const/high16 v4, 0x41500000    # 13.0f

    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 261
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 263
    new-instance v4, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 264
    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 265
    new-instance v17, Landroid/widget/Button;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 266
    new-instance v10, Landroid/widget/Button;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 267
    const-string v9, "Reset to F1"

    const-string v11, "\u0412\u0435\u0440\u043d\u0443\u0442\u044c F1"

    const-string v12, "F1\u306b\u623b\u3059"

    const-string v15, "\u6062\u590d F1"

    move-object/from16 v0, p0

    invoke-static {v0, v9, v11, v12, v15}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 268
    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 269
    invoke-virtual {v4, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 270
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 272
    new-instance v15, Landroid/widget/Switch;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 273
    const-string v4, "Show red dot marker"

    const-string v9, "\u041f\u043e\u043a\u0430\u0437\u044b\u0432\u0430\u0442\u044c \u043a\u0440\u0430\u0441\u043d\u0443\u044e \u0442\u043e\u0447\u043a\u0443"

    const-string v11, "\u8d64\u3044\u70b9\u3092\u8868\u793a"

    const-string v12, "\u663e\u793a\u7ea2\u70b9\u6807\u8bb0"

    move-object/from16 v0, p0

    invoke-static {v0, v4, v9, v11, v12}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15, v4}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 274
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 277
    new-instance v4, Landroid/widget/Switch;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 278
    const-string v9, "Custom cursor (shrinks when pressed)"

    const-string v11, "\u0421\u0432\u043e\u0439 \u043a\u0443\u0440\u0441\u043e\u0440 (\u0443\u043c\u0435\u043d\u044c\u0448\u0430\u0435\u0442\u0441\u044f \u043f\u0440\u0438 \u043d\u0430\u0436\u0430\u0442\u0438\u0438)"

    const-string v12, "\u30aa\u30ea\u30b8\u30ca\u30eb\u30ab\u30fc\u30bd\u30eb(\u62bc\u3059\u3068\u7e2e\u3080)"

    const-string v16, "\u81ea\u7ed8\u5149\u6807\uff08\u6309\u4e0b\u4f1a\u7f29\u5c0f\uff09"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-static {v0, v9, v11, v12, v1}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 280
    invoke-static {v7}, Lcom/keymouse/tool/ToggleKeys;->readCursorOn(Ljava/io/File;)Z

    move-result v9

    invoke-virtual {v4, v9}, Landroid/widget/Switch;->setChecked(Z)V

    .line 281
    new-instance v9, Lcom/keymouse/tool/ToggleKeys$2;

    invoke-direct {v9, v7}, Lcom/keymouse/tool/ToggleKeys$2;-><init>(Ljava/io/File;)V

    invoke-virtual {v4, v9}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 286
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 287
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/keymouse/tool/ToggleKeys;->small(Landroid/app/Activity;I)Landroid/widget/TextView;

    move-result-object v4

    .line 288
    const-string v9, "On: the system arrow is hidden and a sharp yellow-red arrow is drawn instead; it shrinks with the red dot when the center key is pressed. Off: system arrow."

    const-string v11, "\u0412\u043a\u043b: \u0441\u0438\u0441\u0442\u0435\u043c\u043d\u0430\u044f \u0441\u0442\u0440\u0435\u043b\u043a\u0430 \u0441\u043a\u0440\u044b\u0442\u0430, \u0432\u043c\u0435\u0441\u0442\u043e \u043d\u0435\u0451 \u0440\u0438\u0441\u0443\u0435\u0442\u0441\u044f \u0436\u0451\u043b\u0442\u043e-\u043a\u0440\u0430\u0441\u043d\u0430\u044f; \u0443\u043c\u0435\u043d\u044c\u0448\u0430\u0435\u0442\u0441\u044f \u0432\u043c\u0435\u0441\u0442\u0435 \u0441 \u043a\u0440\u0430\u0441\u043d\u043e\u0439 \u0442\u043e\u0447\u043a\u043e\u0439 \u043f\u0440\u0438 \u043d\u0430\u0436\u0430\u0442\u0438\u0438. \u0412\u044b\u043a\u043b: \u0441\u0438\u0441\u0442\u0435\u043c\u043d\u0430\u044f \u0441\u0442\u0440\u0435\u043b\u043a\u0430."

    const-string v12, "\u30aa\u30f3: \u30b7\u30b9\u30c6\u30e0\u306e\u77e2\u5370\u3092\u96a0\u3057\u3001\u9ec4\u301c\u8d64\u306e\u5c16\u3063\u305f\u77e2\u5370\u3092\u8868\u793a\u3002\u4e2d\u592e\u30ad\u30fc\u3092\u62bc\u3059\u3068\u8d64\u3044\u70b9\u3068\u4e00\u7dd2\u306b\u7e2e\u307f\u307e\u3059\u3002\u30aa\u30d5: \u30b7\u30b9\u30c6\u30e0\u306e\u77e2\u5370\u3002"

    const-string v16, "\u5f00\u542f: \u9690\u85cf\u7cfb\u7edf\u7bad\u5934\uff0c\u6539\u753b\u9ec4\u2192\u7ea2\u6e10\u53d8\u7684\u5c16\u89d2\u7bad\u5934\uff1b\u6309\u4f4f\u4e2d\u95f4\u952e\u65f6\u548c\u7ea2\u70b9\u4e00\u8d77\u7f29\u5c0f\u3001\u677e\u5f00\u5f39\u56de\u3002\u5173\u95ed: \u7528\u7cfb\u7edf\u81ea\u5e26\u7bad\u5934\u3002"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-static {v0, v9, v11, v12, v1}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 295
    new-instance v4, Landroid/widget/Switch;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 296
    invoke-static {v7}, Lcom/keymouse/tool/ToggleKeys;->readLockAllow(Ljava/io/File;)Z

    move-result v9

    invoke-virtual {v4, v9}, Landroid/widget/Switch;->setChecked(Z)V

    .line 297
    new-instance v9, Lcom/keymouse/tool/ToggleKeys$3;

    invoke-direct {v9, v7}, Lcom/keymouse/tool/ToggleKeys$3;-><init>(Ljava/io/File;)V

    invoke-virtual {v4, v9}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 302
    const-string v9, "Mouse on lock screen"

    const-string v11, "\u041c\u044b\u0448\u044c \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438"

    const-string v12, "\u30ed\u30c3\u30af\u753b\u9762\u3067\u3082\u30de\u30a6\u30b9\u3092\u6709\u52b9"

    const-string v16, "\u9501\u5c4f\u754c\u9762\u4e5f\u542f\u7528\u9f20\u6807"

    .line 303
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-static {v0, v9, v11, v12, v1}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v11, "On"

    const-string v12, "\u0412\u043a\u043b"

    const-string v16, "\u30aa\u30f3"

    const-string v18, "\u5f00\u542f"

    .line 304
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v18

    invoke-static {v0, v11, v12, v1, v2}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "Off"

    const-string v16, "\u0412\u044b\u043a\u043b"

    const-string v18, "\u30aa\u30d5"

    const-string v20, "\u5173\u95ed"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v18

    move-object/from16 v3, v20

    invoke-static {v0, v12, v1, v2, v3}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 302
    move-object/from16 v0, p0

    invoke-static {v0, v9, v11, v12, v4}, Lcom/keymouse/tool/ChoiceRow;->build(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/CompoundButton;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 305
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/keymouse/tool/ToggleKeys;->small(Landroid/app/Activity;I)Landroid/widget/TextView;

    move-result-object v4

    .line 306
    const-string v9, "Off (default): the mouse pauses on the lock screen and resumes after unlock, so you can type the PIN."

    const-string v11, "\u0412\u044b\u043a\u043b (\u043f\u043e \u0443\u043c\u043e\u043b\u0447\u0430\u043d\u0438\u044e): \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 \u043c\u044b\u0448\u044c \u043d\u0430 \u043f\u0430\u0443\u0437\u0435, \u043f\u043e\u0441\u043b\u0435 \u0440\u0430\u0437\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 \u0432\u043e\u0437\u043e\u0431\u043d\u043e\u0432\u043b\u044f\u0435\u0442\u0441\u044f."

    const-string v12, "\u30aa\u30d5(\u521d\u671f\u5024): \u30ed\u30c3\u30af\u753b\u9762\u3067\u306f\u30de\u30a6\u30b9\u3092\u4e00\u6642\u505c\u6b62\u3057\u3001\u89e3\u9664\u5f8c\u306b\u81ea\u52d5\u3067\u518d\u958b\u3057\u307e\u3059\u3002"

    const-string v16, "\u5173\u95ed(\u9ed8\u8ba4): \u9501\u5c4f\u754c\u9762\u81ea\u52a8\u6682\u505c\u9f20\u6807\uff0c\u89e3\u9501\u540e\u81ea\u52a8\u6062\u590d\uff0c\u8fd9\u6837\u53ef\u4ee5\u6b63\u5e38\u8f93\u5165\u6570\u5b57\u5bc6\u7801\u3002"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-static {v0, v9, v11, v12, v1}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 310
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 312
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$4;

    move-object/from16 v9, p0

    invoke-direct/range {v4 .. v9}, Lcom/keymouse/tool/ToggleKeys$4;-><init>([Z[JLjava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V

    invoke-virtual {v13, v4}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 329
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$5;

    invoke-direct {v4, v5, v14, v7}, Lcom/keymouse/tool/ToggleKeys$5;-><init>([Z[JLjava/io/File;)V

    invoke-virtual {v15, v4}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 338
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$6;

    invoke-direct {v4, v7}, Lcom/keymouse/tool/ToggleKeys$6;-><init>(Ljava/io/File;)V

    invoke-virtual {v10, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 350
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$7;

    move-object/from16 v0, p0

    invoke-direct {v4, v7, v8, v0}, Lcom/keymouse/tool/ToggleKeys$7;-><init>(Ljava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 367
    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/Runnable;

    move-object/from16 v20, v0

    .line 368
    const/4 v4, 0x0

    new-instance v9, Lcom/keymouse/tool/ToggleKeys$8;

    move-object v10, v7

    move-object v11, v5

    move-object v12, v6

    move-object/from16 v16, p0

    move-object/from16 v18, v8

    invoke-direct/range {v9 .. v20}, Lcom/keymouse/tool/ToggleKeys$8;-><init>(Ljava/io/File;[Z[JLandroid/widget/Switch;[JLandroid/widget/Switch;Landroid/app/Activity;Landroid/widget/Button;Landroid/widget/TextView;Landroid/os/Handler;[Ljava/lang/Runnable;)V

    aput-object v9, v20, v4

    .line 407
    new-instance v4, Lcom/keymouse/tool/ToggleKeys$9;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v4, v0, v1}, Lcom/keymouse/tool/ToggleKeys$9;-><init>(Landroid/os/Handler;[Ljava/lang/Runnable;)V

    invoke-virtual {v8, v4}, Landroid/widget/TextView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 417
    return-void
.end method

.method private static dp(Landroid/app/Activity;I)I
    .locals 2

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
    .locals 5

    .prologue
    .line 42
    const/16 v0, 0x3b

    if-lt p1, v0, :cond_0

    const/16 v0, 0x44

    if-gt p1, v0, :cond_0

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
    :goto_0
    return-object v0

    .line 45
    :cond_0
    const/16 v0, 0x57

    if-ne p1, v0, :cond_1

    .line 46
    const-string v0, "F11"

    goto :goto_0

    .line 48
    :cond_1
    const/16 v0, 0x58

    if-ne p1, v0, :cond_2

    .line 49
    const-string v0, "F12"

    goto :goto_0

    .line 51
    :cond_2
    const/16 v0, 0x72

    if-ne p1, v0, :cond_3

    .line 52
    const-string v0, "Volume-"

    const-string v1, "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c-"

    const-string v2, "\u97f3\u91cf-"

    const-string v3, "\u97f3\u91cf-"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 54
    :cond_3
    const/16 v0, 0x73

    if-ne p1, v0, :cond_4

    .line 55
    const-string v0, "Volume+"

    const-string v1, "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c+"

    const-string v2, "\u97f3\u91cf+"

    const-string v3, "\u97f3\u91cf+"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 57
    :cond_4
    const/4 v0, 0x2

    if-lt p1, v0, :cond_5

    const/16 v0, 0xa

    if-gt p1, v0, :cond_5

    .line 58
    add-int/lit8 v0, p1, -0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 60
    :cond_5
    const/16 v0, 0xb

    if-ne p1, v0, :cond_6

    .line 61
    const-string v0, "0"

    goto :goto_0

    .line 63
    :cond_6
    const/16 v0, 0x37

    if-ne p1, v0, :cond_7

    .line 64
    const-string v0, "*"

    goto :goto_0

    .line 66
    :cond_7
    const/16 v0, 0x160

    if-eq p1, v0, :cond_8

    const/16 v0, 0x161

    if-ne p1, v0, :cond_9

    .line 67
    :cond_8
    const-string v0, "Center(OK)"

    const-string v1, "\u0426\u0435\u043d\u0442\u0440(OK)"

    const-string v2, "\u4e2d\u592e(OK)"

    const-string v3, "\u4e2d\u95f4\u952e(\u786e\u5b9a)"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 69
    :cond_9
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

    goto :goto_0
.end method

.method private static readCursorOn(Ljava/io/File;)Z
    .locals 2

    .prologue
    .line 105
    new-instance v0, Ljava/io/File;

    const-string v1, "keymouse_cursor"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->readLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 106
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static readKeys(Ljava/io/File;)[I
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 122
    new-array v5, v9, [I

    .line 124
    new-instance v0, Ljava/io/File;

    const-string v1, "keymouse_toggle_keys"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->readLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 126
    if-eqz v0, :cond_0

    .line 127
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move v4, v3

    move v1, v3

    :goto_0
    if-ge v4, v7, :cond_4

    :try_start_1
    aget-object v0, v6, v4

    .line 128
    if-ge v1, v9, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_6

    .line 129
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v8

    .line 130
    if-lez v8, :cond_6

    .line 131
    add-int/lit8 v0, v1, 0x1

    :try_start_2
    aput v8, v5, v1
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 127
    :goto_1
    add-int/lit8 v4, v4, 0x1

    move v1, v0

    goto :goto_0

    .line 136
    :cond_0
    const/4 v0, 0x2

    :try_start_3
    new-array v6, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "keymouse_toggle_key"

    aput-object v1, v6, v0

    const/4 v0, 0x1

    const-string v1, "keymouse_toggle_key2"

    aput-object v1, v6, v0
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    move v4, v3

    move v0, v3

    .line 137
    :goto_2
    if-ge v4, v8, :cond_3

    .line 138
    :try_start_4
    new-instance v1, Ljava/io/File;

    aget-object v7, v6, v4

    invoke-direct {v1, p0, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/keymouse/tool/ToggleKeys;->readLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 139
    if-eqz v1, :cond_2

    .line 140
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 141
    if-lez v7, :cond_2

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    aget v1, v5, v1
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2

    if-eq v7, v1, :cond_2

    .line 142
    :cond_1
    add-int/lit8 v1, v0, 0x1

    :try_start_5
    aput v7, v5, v0
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1

    move v0, v1

    .line 137
    :cond_2
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_2

    :cond_3
    move v1, v0

    :cond_4
    move v0, v1

    .line 149
    :goto_3
    if-nez v0, :cond_5

    .line 150
    const/16 v0, 0x3b

    aput v0, v5, v3

    move v0, v2

    .line 153
    :cond_5
    new-array v1, v0, [I

    .line 154
    invoke-static {v5, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 155
    return-object v1

    .line 147
    :catch_0
    move-exception v0

    move v0, v3

    goto :goto_3

    :catch_1
    move-exception v0

    move v0, v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_3

    :cond_6
    move v0, v1

    goto :goto_1
.end method

.method private static readLine(Ljava/io/File;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 92
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 96
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 99
    :goto_0
    return-object v0

    .line 96
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 97
    throw v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 98
    :catch_0
    move-exception v0

    .line 99
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static readLockAllow(Ljava/io/File;)Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 202
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v3, Ljava/io/FileInputStream;

    new-instance v4, Ljava/io/File;

    const-string v5, "keymouse_lock.cfg"

    invoke-direct {v4, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 206
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 207
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 208
    const-string v4, "lockAllow="

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 209
    const-string v0, "0"

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0

    .line 214
    :cond_2
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    move v1, v0

    .line 217
    :goto_1
    return v1

    .line 214
    :catchall_0
    move-exception v0

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 215
    throw v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 216
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private static readState(Ljava/io/File;)[I
    .locals 6

    .prologue
    const/4 v5, 0x4

    const/4 v0, 0x0

    .line 161
    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v2, "keymouse.pid"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 175
    :cond_0
    :goto_0
    return-object v0

    .line 164
    :cond_1
    new-instance v1, Ljava/io/File;

    const-string v2, "keymouse_state"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/keymouse/tool/ToggleKeys;->readLine(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 165
    if-eqz v1, :cond_0

    .line 168
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, " +"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 169
    const/4 v1, 0x4

    new-array v1, v1, [I

    .line 170
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v5, :cond_2

    array-length v4, v3

    if-ge v2, v4, :cond_2

    .line 171
    aget-object v4, v3, v2

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    aput v4, v1, v2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    move-object v0, v1

    .line 173
    goto :goto_0

    .line 174
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static readToggleHold(Ljava/io/File;)I
    .locals 4

    .prologue
    .line 181
    :try_start_0
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 182
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v2, Ljava/io/File;

    const-string v3, "keymouse_hold.cfg"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :try_start_1
    invoke-virtual {v0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 186
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 188
    const-string v1, "toggleHold"

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 189
    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 191
    const/16 v1, 0x64

    if-lt v0, v1, :cond_0

    .line 197
    :goto_0
    return v0

    .line 186
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 187
    throw v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 195
    :catch_0
    move-exception v0

    .line 197
    :cond_0
    const/16 v0, 0x1f4

    goto :goto_0
.end method

.method static sendCmd(Ljava/io/File;Ljava/lang/String;)V
    .locals 2

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
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 233
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 234
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 235
    const/high16 v1, 0x3f400000    # 0.75f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 236
    invoke-static {p0, p1}, Lcom/keymouse/tool/ToggleKeys;->dp(Landroid/app/Activity;I)I

    move-result v1

    const/4 v2, 0x4

    invoke-static {p0, v2}, Lcom/keymouse/tool/ToggleKeys;->dp(Landroid/app/Activity;I)I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 237
    return-object v0
.end method

.method private static writeCursorOn(Ljava/io/File;Z)V
    .locals 3

    .prologue
    .line 111
    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v0, "keymouse_cursor"

    invoke-direct {v1, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 112
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 113
    if-eqz p1, :cond_0

    const-string v0, "1\n"

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 114
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 115
    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Ljava/io/File;->setReadable(ZZ)Z

    .line 118
    :goto_1
    return-void

    .line 113
    :cond_0
    const-string v0, "0\n"
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 116
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private static writeLockAllow(Ljava/io/File;Z)V
    .locals 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 223
    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v3, "keymouse_lock.cfg"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 224
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 225
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "lockAllow="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz p1, :cond_0

    :goto_0
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

    .line 226
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 227
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {v2, v0, v1}, Ljava/io/File;->setReadable(ZZ)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 225
    goto :goto_0

    .line 228
    :catch_0
    move-exception v0

    goto :goto_1
.end method
