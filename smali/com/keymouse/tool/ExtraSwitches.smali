.class public final Lcom/keymouse/tool/ExtraSwitches;
.super Ljava/lang/Object;
.source "ExtraSwitches.java"


.field static until:J

.field static since:J

# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 28
    invoke-static {p0}, Lcom/keymouse/tool/ExtraSwitches;->lang(Landroid/app/Activity;)I

    move-result v0

    .line 29
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    :goto_0
    return-object p2

    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    move-object p2, p3

    goto :goto_0

    :cond_1
    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    move-object p2, p4

    goto :goto_0

    :cond_2
    move-object p2, p1

    goto :goto_0
.end method

.method static synthetic access$000(Ljava/io/File;)I
    .locals 1

    .prologue
    .line 19
    invoke-static {p0}, Lcom/keymouse/tool/ExtraSwitches;->readInt(Ljava/io/File;)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/io/File;)I
    .locals 1

    .prologue
    .line 19
    invoke-static {p0}, Lcom/keymouse/tool/ExtraSwitches;->readToggleHold(Ljava/io/File;)I

    move-result v0

    return v0
.end method

.method static synthetic access$300(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    invoke-static {p0}, Lcom/keymouse/tool/ExtraSwitches;->fmtSec(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .locals 10

    .prologue
    const/16 v9, 0xa

    const/4 v8, 0x0

    .line 123
    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 126
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 127
    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 128
    const/4 v2, 0x6

    invoke-virtual {v1, v8, v9, v8, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 129
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 131
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Runnable;

    .line 132
    new-instance v3, Lcom/keymouse/tool/ExtraSwitches$2;

    invoke-direct {v3, v0, p0, v1, v2}, Lcom/keymouse/tool/ExtraSwitches$2;-><init>(Ljava/io/File;Landroid/app/Activity;Landroid/widget/TextView;[Ljava/lang/Runnable;)V

    aput-object v3, v2, v8

    .line 148
    aget-object v2, v2, v8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 151
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 152
    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 153
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 154
    const-string v4, "Set 2nd key"

    const-string v5, "\u0417\u0430\u0434\u0430\u0442\u044c 2-\u044e"

    const-string v6, "2\u3064\u76ee\u3092\u8a2d\u5b9a"

    const-string v7, "\u8bbe\u7b2c\u4e8c\u952e"

    invoke-static {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 155
    new-instance v4, Lcom/keymouse/tool/ExtraSwitches$3;

    invoke-direct {v4, v0, v1, p0}, Lcom/keymouse/tool/ExtraSwitches$3;-><init>(Ljava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 163
    const-string v4, "Clear 2nd key"

    const-string v5, "\u0423\u0431\u0440\u0430\u0442\u044c 2-\u044e"

    const-string v6, "2\u3064\u76ee\u3092\u6d88\u53bb"

    const-string v7, "\u6e05\u9664\u7b2c\u4e8c\u952e"

    invoke-static {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 164
    new-instance v4, Lcom/keymouse/tool/ExtraSwitches$4;

    invoke-direct {v4, v0}, Lcom/keymouse/tool/ExtraSwitches$4;-><init>(Ljava/io/File;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 177
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 178
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 181
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 182
    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 183
    const/16 v2, 0x28

    invoke-virtual {v1, v8, v2, v8, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 184
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 185
    const-string v3, "Mouse on lock screen"

    const-string v4, "\u041c\u044b\u0448\u044c \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438"

    const-string v5, "\u30ed\u30c3\u30af\u753b\u9762\u3067\u3082\u30de\u30a6\u30b9\u3092\u6709\u52b9"

    const-string v6, "\u9501\u5c4f\u754c\u9762\u4e5f\u542f\u7528\u9f20\u6807"

    invoke-static {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 188
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 189
    new-instance v2, Landroid/widget/Switch;

    invoke-direct {v2, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 190
    invoke-static {v0}, Lcom/keymouse/tool/ExtraSwitches;->readLockAllow(Ljava/io/File;)Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 191
    new-instance v3, Lcom/keymouse/tool/ExtraSwitches$5;

    invoke-direct {v3, v0}, Lcom/keymouse/tool/ExtraSwitches$5;-><init>(Ljava/io/File;)V

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 196
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 197
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 199
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 200
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 201
    const-string v1, "Off (default): the mouse pauses on the lock screen and resumes after unlock, so you can type the PIN."

    const-string v2, "\u0412\u044b\u043a\u043b (\u043f\u043e \u0443\u043c\u043e\u043b\u0447\u0430\u043d\u0438\u044e): \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 \u043c\u044b\u0448\u044c \u043d\u0430 \u043f\u0430\u0443\u0437\u0435, \u043f\u043e\u0441\u043b\u0435 \u0440\u0430\u0437\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 \u0432\u043e\u0437\u043e\u0431\u043d\u043e\u0432\u043b\u044f\u0435\u0442\u0441\u044f."

    const-string v3, "\u30aa\u30d5(\u521d\u671f\u5024): \u30ed\u30c3\u30af\u753b\u9762\u3067\u306f\u30de\u30a6\u30b9\u3092\u4e00\u6642\u505c\u6b62\u3057\u3001\u89e3\u9664\u5f8c\u306b\u81ea\u52d5\u3067\u518d\u958b\u3057\u307e\u3059\u3002"

    const-string v4, "\u5173\u95ed(\u9ed8\u8ba4): \u9501\u5c4f\u754c\u9762\u81ea\u52a8\u6682\u505c\u9f20\u6807\uff0c\u89e3\u9501\u540e\u81ea\u52a8\u6062\u590d\uff0c\u8fd9\u6837\u53ef\u4ee5\u6b63\u5e38\u8f93\u5165\u6570\u5b57\u5bc6\u7801\u3002"

    invoke-static {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 206
    return-void
.end method

.method private static fmtSec(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 119
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

    return-object v0
.end method

.method static keyName(Landroid/app/Activity;I)Ljava/lang/String;
    .locals 5

    .prologue
    .line 33
    const/16 v0, 0x3b

    if-lt p1, v0, :cond_0

    const/16 v0, 0x44

    if-gt p1, v0, :cond_0

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

    .line 43
    :goto_0
    return-object v0

    .line 34
    :cond_0
    const/16 v0, 0x57

    if-ne p1, v0, :cond_1

    const-string v0, "F11"

    goto :goto_0

    .line 35
    :cond_1
    const/16 v0, 0x58

    if-ne p1, v0, :cond_2

    const-string v0, "F12"

    goto :goto_0

    .line 36
    :cond_2
    const/16 v0, 0x72

    if-ne p1, v0, :cond_3

    const-string v0, "Volume-"

    const-string v1, "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c-"

    const-string v2, "\u97f3\u91cf-"

    const-string v3, "\u97f3\u91cf-"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 37
    :cond_3
    const/16 v0, 0x73

    if-ne p1, v0, :cond_4

    const-string v0, "Volume+"

    const-string v1, "\u0413\u0440\u043e\u043c\u043a\u043e\u0441\u0442\u044c+"

    const-string v2, "\u97f3\u91cf+"

    const-string v3, "\u97f3\u91cf+"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 38
    :cond_4
    const/4 v0, 0x2

    if-lt p1, v0, :cond_5

    const/16 v0, 0xa

    if-gt p1, v0, :cond_5

    add-int/lit8 v0, p1, -0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 39
    :cond_5
    const/16 v0, 0xb

    if-ne p1, v0, :cond_6

    const-string v0, "0"

    goto :goto_0

    .line 40
    :cond_6
    const/16 v0, 0x37

    if-ne p1, v0, :cond_7

    const-string v0, "*"

    goto :goto_0

    .line 41
    :cond_7
    const/16 v0, 0x160

    if-eq p1, v0, :cond_8

    const/16 v0, 0x161

    if-ne p1, v0, :cond_9

    .line 42
    :cond_8
    const-string v0, "Center(OK)"

    const-string v1, "\u0426\u0435\u043d\u0442\u0440(OK)"

    const-string v2, "\u4e2d\u592e(OK)"

    const-string v3, "\u4e2d\u95f4\u952e(\u786e\u5b9a)"

    invoke-static {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 43
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "key code "

    const-string v2, "\u043a\u043e\u0434 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 "

    const-string v3, "\u30ad\u30fc\u30b3\u30fc\u30c9 "

    const-string v4, "\u952e\u7801 "

    invoke-static {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/ExtraSwitches;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static lang(Landroid/app/Activity;)I
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 23
    const-string v0, "keymouse"

    invoke-virtual {p0, v0, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 24
    const-string v1, "lang"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private static readInt(Ljava/io/File;)I
    .locals 3

    .prologue
    .line 48
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 49
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 50
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 53
    :goto_0
    return v0

    .line 52
    :catch_0
    move-exception v0

    .line 53
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static readLockAllow(Ljava/io/File;)Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 75
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

    move v0, v1

    .line 78
    :cond_0
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 79
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 80
    const-string v4, "lockAllow="

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v0, "0"

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0

    .line 82
    :cond_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v0

    .line 85
    :goto_1
    return v1

    .line 84
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private static readToggleHold(Ljava/io/File;)I
    .locals 4

    .prologue
    .line 59
    :try_start_0
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 60
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v2, Ljava/io/File;

    const-string v3, "keymouse_hold.cfg"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 61
    invoke-virtual {v0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 62
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 63
    const-string v1, "toggleHold"

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 66
    const/16 v1, 0x64

    if-lt v0, v1, :cond_0

    .line 70
    :goto_0
    return v0

    .line 68
    :catch_0
    move-exception v0

    .line 70
    :cond_0
    const/16 v0, 0x1f4

    goto :goto_0
.end method

.method static sendCmd(Ljava/io/File;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 102
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/keymouse/tool/ExtraSwitches$1;

    invoke-direct {v1, p0, p1}, Lcom/keymouse/tool/ExtraSwitches$1;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 115
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 116
    return-void
.end method

.method static writeLockAllow(Ljava/io/File;Z)V
    .locals 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 91
    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v3, "keymouse_lock.cfg"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 92
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 93
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

    .line 94
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 95
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {v2, v0, v1}, Ljava/io/File;->setReadable(ZZ)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 93
    goto :goto_0

    .line 96
    :catch_0
    move-exception v0

    goto :goto_1
.end method
