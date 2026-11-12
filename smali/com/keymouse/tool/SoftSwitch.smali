.class public final Lcom/keymouse/tool/SoftSwitch;
.super Ljava/lang/Object;
.source "SoftSwitch.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .prologue
    const/4 v0, 0x0

    .line 32
    .line 34
    :try_start_1
    const-string v1, "keymouse"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "lang"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_e} :catch_18

    move-result v0

    .line 38
    :goto_f
    packed-switch v0, :pswitch_data_1a

    move-object p2, p1

    .line 42
    :goto_13
    :pswitch_13
    return-object p2

    :pswitch_14
    move-object p2, p3

    .line 40
    goto :goto_13

    :pswitch_16
    move-object p2, p4

    .line 41
    goto :goto_13

    .line 35
    :catch_18
    move-exception v1

    goto :goto_f

    .line 38
    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_13
        :pswitch_14
        :pswitch_16
    .end packed-switch
.end method

.method static synthetic access$000(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 28
    invoke-static {p0, p1}, Lcom/keymouse/tool/SoftSwitch;->send(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Ljava/io/File;)[I
    .registers 2

    .prologue
    .line 28
    invoke-static {p0}, Lcom/keymouse/tool/SoftSwitch;->readState(Ljava/io/File;)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .prologue
    .line 28
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Ljava/io/File;)I
    .registers 2

    .prologue
    .line 28
    invoke-static {p0}, Lcom/keymouse/tool/SoftSwitch;->readToggleKey(Ljava/io/File;)I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Landroid/app/Activity;I)Ljava/lang/String;
    .registers 3

    .prologue
    .line 28
    invoke-static {p0, p1}, Lcom/keymouse/tool/SoftSwitch;->keyName(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 16

    .prologue
    .line 112
    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    .line 114
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 115
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 116
    const/4 v2, 0x0

    const/16 v3, 0xc

    invoke-static {p0, v3}, Lcom/keymouse/tool/SoftSwitch;->dp(Landroid/app/Activity;I)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x4

    invoke-static {p0, v5}, Lcom/keymouse/tool/SoftSwitch;->dp(Landroid/app/Activity;I)I

    move-result v5

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 117
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 118
    const-string v3, "Mouse mode (soft switch)"

    const-string v4, "\u0420\u0435\u0436\u0438\u043c \u043c\u044b\u0448\u0438 (\u043a\u043d\u043e\u043f\u043a\u0430)"

    const-string v5, "\u30de\u30a6\u30b9\u30e2\u30fc\u30c9(\u30bd\u30d5\u30c8\u30b9\u30a4\u30c3\u30c1)"

    const-string v6, "\u9f20\u6807\u8f6f\u5f00\u5173"

    invoke-static {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 120
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 122
    new-instance v3, Landroid/widget/Switch;

    invoke-direct {v3, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 123
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 124
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 126
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 127
    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 128
    const v0, 0x3f333333    # 0.7f

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 129
    invoke-virtual {p1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 131
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 132
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 133
    const/4 v2, 0x0

    const/4 v4, 0x4

    invoke-static {p0, v4}, Lcom/keymouse/tool/SoftSwitch;->dp(Landroid/app/Activity;I)I

    move-result v4

    const/4 v5, 0x0

    const/16 v7, 0x8

    invoke-static {p0, v7}, Lcom/keymouse/tool/SoftSwitch;->dp(Landroid/app/Activity;I)I

    move-result v7

    invoke-virtual {v0, v2, v4, v5, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 134
    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 135
    const-string v2, "Change toggle key"

    const-string v5, "\u0421\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043b\u0430\u0432\u0438\u0448\u0443"

    const-string v7, "\u5207\u66ff\u30ad\u30fc\u3092\u5909\u66f4"

    const-string v8, "\u4fee\u6539\u5f00\u5173\u952e"

    invoke-static {p0, v2, v5, v7, v8}, Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 136
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 137
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 138
    const-string v2, "Reset to F1"

    const-string v5, "\u0412\u0435\u0440\u043d\u0443\u0442\u044c F1"

    const-string v8, "F1\u306b\u623b\u3059"

    const-string v9, "\u6062\u590d F1"

    invoke-static {p0, v2, v5, v8, v9}, Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 139
    const/4 v2, 0x0

    invoke-virtual {v7, v2}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 140
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 141
    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 142
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 144
    new-instance v5, Landroid/widget/Switch;

    invoke-direct {v5, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 145
    const-string v0, "Show red dot marker"

    const-string v2, "\u041f\u043e\u043a\u0430\u0437\u044b\u0432\u0430\u0442\u044c \u043a\u0440\u0430\u0441\u043d\u0443\u044e \u0442\u043e\u0447\u043a\u0443"

    const-string v8, "\u8d64\u3044\u70b9\u3092\u8868\u793a"

    const-string v9, "\u663e\u793a\u7ea2\u70b9\u6807\u8bb0"

    invoke-static {p0, v0, v2, v8, v9}, Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 146
    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 148
    new-instance v11, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v11, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 149
    const/4 v0, 0x1

    new-array v8, v0, [Z

    const/4 v0, 0x0

    const/4 v2, 0x0

    aput-boolean v2, v8, v0

    .line 150
    const/4 v0, 0x1

    new-array v2, v0, [J

    const/4 v0, 0x0

    const-wide/16 v12, 0x0

    aput-wide v12, v2, v0

    .line 151
    const/4 v0, 0x1

    new-array v9, v0, [Z

    const/4 v0, 0x0

    const/4 v10, 0x0

    aput-boolean v10, v9, v0

    .line 152
    const/4 v0, 0x1

    new-array v10, v0, [J

    const/4 v0, 0x0

    const-wide/16 v12, 0x0

    aput-wide v12, v10, v0

    .line 154
    new-instance v0, Lcom/keymouse/tool/SoftSwitch$2;

    invoke-direct {v0, v8, v2, p0}, Lcom/keymouse/tool/SoftSwitch$2;-><init>([Z[JLandroid/app/Activity;)V

    invoke-virtual {v3, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 161
    new-instance v0, Lcom/keymouse/tool/SoftSwitch$3;

    invoke-direct {v0, v8, v10, p0}, Lcom/keymouse/tool/SoftSwitch$3;-><init>([Z[JLandroid/app/Activity;)V

    invoke-virtual {v5, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 168
    new-instance v0, Lcom/keymouse/tool/SoftSwitch$4;

    invoke-direct {v0, v9, v2, p0}, Lcom/keymouse/tool/SoftSwitch$4;-><init>([Z[JLandroid/app/Activity;)V

    invoke-virtual {v4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    new-instance v0, Lcom/keymouse/tool/SoftSwitch$5;

    invoke-direct {v0, v9, v2, p0}, Lcom/keymouse/tool/SoftSwitch$5;-><init>([Z[JLandroid/app/Activity;)V

    invoke-virtual {v7, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    new-instance v0, Lcom/keymouse/tool/SoftSwitch$6;

    move-object v7, p0

    invoke-direct/range {v0 .. v11}, Lcom/keymouse/tool/SoftSwitch$6;-><init>(Ljava/io/File;[JLandroid/widget/Switch;Landroid/widget/Button;Landroid/widget/Switch;Landroid/widget/TextView;Landroid/app/Activity;[Z[Z[JLandroid/os/Handler;)V

    .line 223
    new-instance v1, Lcom/keymouse/tool/SoftSwitch$7;

    invoke-direct {v1, v11, v0}, Lcom/keymouse/tool/SoftSwitch$7;-><init>(Landroid/os/Handler;Ljava/lang/Runnable;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 233
    invoke-virtual {v11, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 234
    return-void
.end method

.method private static dp(Landroid/app/Activity;I)I
    .registers 4

    .prologue
    .line 108
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

.method private static keyName(Landroid/app/Activity;I)Ljava/lang/String;
    .registers 7

    .prologue
    .line 47
    const/16 v0, 0x3b

    if-lt p1, v0, :cond_1e

    const/16 v0, 0x44

    if-gt p1, v0, :cond_1e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "F"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, p1, -0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 55
    :goto_1d
    return-object v0

    .line 48
    :cond_1e
    const/16 v0, 0x57

    if-ne p1, v0, :cond_25

    const-string v0, "F11"

    goto :goto_1d

    .line 49
    :cond_25
    const/16 v0, 0x58

    if-ne p1, v0, :cond_2c

    const-string v0, "F12"

    goto :goto_1d

    .line 50
    :cond_2c
    const/16 v0, 0x72

    if-ne p1, v0, :cond_3d

    const-string v0, "Volume-"

    const-string v1, "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c-"

    const-string v2, "\u97f3\u91cf-"

    const-string v3, "\u97f3\u91cf-"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1d

    .line 51
    :cond_3d
    const/16 v0, 0x73

    if-ne p1, v0, :cond_4e

    const-string v0, "Volume+"

    const-string v1, "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c+"

    const-string v2, "\u97f3\u91cf+"

    const-string v3, "\u97f3\u91cf+"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1d

    .line 52
    :cond_4e
    const/4 v0, 0x2

    if-lt p1, v0, :cond_5c

    const/16 v0, 0xa

    if-gt p1, v0, :cond_5c

    add-int/lit8 v0, p1, -0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1d

    .line 53
    :cond_5c
    const/16 v0, 0xb

    if-ne p1, v0, :cond_63

    const-string v0, "0"

    goto :goto_1d

    .line 54
    :cond_63
    const/16 v0, 0x37

    if-ne p1, v0, :cond_6a

    const-string v0, "*"

    goto :goto_1d

    .line 55
    :cond_6a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "key code "

    const-string v2, "\u043a\u043e\u0434 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 "

    const-string v3, "\u30ad\u30fc\u30b3\u30fc\u30c9 "

    const-string v4, "\u952e\u7801 "

    invoke-static {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method

.method private static readState(Ljava/io/File;)[I
    .registers 10

    .prologue
    const/4 v0, 0x0

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 73
    :try_start_5
    new-instance v1, Ljava/io/File;

    const-string v3, "keymouse.pid"

    invoke-direct {v1, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_13

    .line 83
    :cond_12
    :goto_12
    return-object v0

    .line 74
    :cond_13
    new-instance v1, Ljava/io/File;

    const-string v3, "keymouse_state"

    invoke-direct {v1, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 75
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 76
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 77
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 78
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 79
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v3, " +"

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 80
    const/4 v1, 0x4

    new-array v1, v1, [I

    const/4 v3, 0x0

    const/4 v5, 0x0

    aget-object v5, v4, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    aput v5, v1, v3

    const/4 v5, 0x1

    array-length v3, v4

    if-le v3, v6, :cond_76

    const/4 v3, 0x1

    aget-object v3, v4, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    :goto_58
    aput v3, v1, v5

    const/4 v5, 0x2

    .line 81
    array-length v3, v4

    if-le v3, v7, :cond_78

    const/4 v3, 0x2

    aget-object v3, v4, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    :goto_65
    aput v3, v1, v5

    const/4 v3, 0x3

    array-length v5, v4

    if-le v5, v8, :cond_72

    const/4 v2, 0x3

    aget-object v2, v4, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    :cond_72
    aput v2, v1, v3
    :try_end_74
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_74} :catch_7a

    move-object v0, v1

    .line 80
    goto :goto_12

    :cond_76
    move v3, v2

    goto :goto_58

    :cond_78
    move v3, v2

    .line 81
    goto :goto_65

    .line 82
    :catch_7a
    move-exception v1

    goto :goto_12
.end method

.method private static readToggleKey(Ljava/io/File;)I
    .registers 5

    .prologue
    .line 60
    :try_start_0
    new-instance v0, Ljava/io/File;

    const-string v1, "keymouse_toggle_key"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 61
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 62
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 63
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 64
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_24} :catch_26

    move-result v0

    .line 66
    :goto_25
    return v0

    .line 65
    :catch_26
    move-exception v0

    .line 66
    const/16 v0, 0x3b

    goto :goto_25
.end method

.method private static send(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 88
    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 89
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/keymouse/tool/SoftSwitch$1;

    invoke-direct {v2, v0, p1}, Lcom/keymouse/tool/SoftSwitch$1;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 104
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 105
    return-void
.end method
