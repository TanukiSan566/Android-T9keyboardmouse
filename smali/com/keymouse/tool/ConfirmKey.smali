.class public final Lcom/keymouse/tool/ConfirmKey;
.super Ljava/lang/Object;
.source "ConfirmKey.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 16
    const-string v0, "keymouse"

    invoke-virtual {p0, v0, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "lang"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 17
    const/4 v1, 0x1

    if-ne v0, v1, :cond_11

    :goto_10
    return-object p2

    :cond_11
    const/4 v1, 0x2

    if-ne v0, v1, :cond_16

    move-object p2, p3

    goto :goto_10

    :cond_16
    const/4 v1, 0x3

    if-ne v0, v1, :cond_1b

    move-object p2, p4

    goto :goto_10

    :cond_1b
    move-object p2, p1

    goto :goto_10
.end method

.method static synthetic access$000(Ljava/io/File;)I
    .registers 2

    .prologue
    .line 12
    invoke-static {p0}, Lcom/keymouse/tool/ConfirmKey;->readInt(Ljava/io/File;)I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .prologue
    .line 12
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/ConfirmKey;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 10

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x0

    .line 32
    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 34
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 35
    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 36
    const/16 v2, 0x28

    invoke-virtual {v1, v6, v2, v6, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 37
    const-string v2, "Center key mapping"

    const-string v3, "\u041d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0435 \u0446\u0435\u043d\u0442\u0440\u0430\u043b\u044c\u043d\u043e\u0439 \u043a\u043b\u0430\u0432\u0438\u0448\u0438"

    const-string v4, "\u4e2d\u592e\u30ad\u30fc\u306e\u5272\u308a\u5f53\u3066"

    const-string v5, "\u4e2d\u95f4\u952e\u6620\u5c04"

    invoke-static {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/ConfirmKey;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 40
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 41
    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 42
    const/4 v2, 0x6

    invoke-virtual {v1, v6, v7, v6, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 43
    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 45
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Runnable;

    .line 46
    new-instance v3, Lcom/keymouse/tool/ConfirmKey$1;

    invoke-direct {v3, v0, p0, v1, v2}, Lcom/keymouse/tool/ConfirmKey$1;-><init>(Ljava/io/File;Landroid/app/Activity;Landroid/widget/TextView;[Ljava/lang/Runnable;)V

    aput-object v3, v2, v6

    .line 58
    aget-object v2, v2, v6

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 60
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 61
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 62
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 63
    const-string v4, "Set center key"

    const-string v5, "\u0417\u0430\u0434\u0430\u0442\u044c"

    const-string v6, "\u4e2d\u592e\u30ad\u30fc\u3092\u8a2d\u5b9a"

    const-string v7, "\u8bbe\u7f6e\u4e2d\u95f4\u952e"

    invoke-static {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/ConfirmKey;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 64
    new-instance v4, Lcom/keymouse/tool/ConfirmKey$2;

    invoke-direct {v4, v0, v1, p0}, Lcom/keymouse/tool/ConfirmKey$2;-><init>(Ljava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 74
    const-string v4, "Clear"

    const-string v5, "\u0421\u0431\u0440\u043e\u0441"

    const-string v6, "\u6d88\u53bb"

    const-string v7, "\u6e05\u9664"

    invoke-static {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/ConfirmKey;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 75
    new-instance v4, Lcom/keymouse/tool/ConfirmKey$3;

    invoke-direct {v4, v0}, Lcom/keymouse/tool/ConfirmKey$3;-><init>(Ljava/io/File;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 87
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 88
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 90
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 91
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 92
    const-string v1, "If the center key does not click, turn the main switch on, tap \"Set center key\" and press it."

    const-string v2, "\u0415\u0441\u043b\u0438 \u0446\u0435\u043d\u0442\u0440 \u043d\u0435 \u043a\u043b\u0438\u043a\u0430\u0435\u0442: \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u0435 \u0433\u043b\u0430\u0432\u043d\u044b\u0439 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0442\u0435\u043b\u044c, \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u0417\u0430\u0434\u0430\u0442\u044c\u00bb \u0438 \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0443."

    const-string v3, "\u4e2d\u592e\u30ad\u30fc\u3067\u30af\u30ea\u30c3\u30af\u3067\u304d\u306a\u3044\u5834\u5408: \u30e1\u30a4\u30f3\u30b9\u30a4\u30c3\u30c1\u3092\u30aa\u30f3\u306b\u3057\u3001\u300c\u4e2d\u592e\u30ad\u30fc\u3092\u8a2d\u5b9a\u300d\u3092\u62bc\u3057\u3066\u304b\u3089\u305d\u306e\u30ad\u30fc\u3092\u62bc\u3057\u307e\u3059\u3002"

    const-string v4, "\u4e2d\u95f4\u952e\u70b9\u4e0d\u4e86\u65f6: \u5148\u6253\u5f00\u603b\u5f00\u5173\uff0c\u70b9\u201c\u8bbe\u7f6e\u4e2d\u95f4\u952e\u201d\uff0c\u518d\u6309\u4e00\u4e0b\u4f60\u624b\u673a\u7684\u4e2d\u95f4\u952e\u5373\u53ef(\u4e0d\u540c\u624b\u673a\u952e\u7801\u4e0d\u540c)\u3002"

    invoke-static {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/ConfirmKey;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 97
    return-void
.end method

.method private static readInt(Ljava/io/File;)I
    .registers 4

    .prologue
    .line 22
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 23
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 24
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_1d} :catch_1f

    move-result v0

    .line 27
    :goto_1e
    return v0

    .line 26
    :catch_1f
    move-exception v0

    .line 27
    const/4 v0, 0x0

    goto :goto_1e
.end method
