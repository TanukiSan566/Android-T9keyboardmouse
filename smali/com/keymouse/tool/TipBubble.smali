.class public final Lcom/keymouse/tool/TipBubble;
.super Ljava/lang/Object;
.source "TipBubble.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keymouse/tool/TipBubble$Remover;
    }
.end annotation


# static fields
.field private static sHandler:Landroid/os/Handler;

.field private static sRemover:Lcom/keymouse/tool/TipBubble$Remover;

.field private static sView:Landroid/view/View;

.field private static sWm:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static dismiss()V
    .locals 2

    .prologue
    .line 30
    :try_start_0
    sget-object v0, Lcom/keymouse/tool/TipBubble;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keymouse/tool/TipBubble;->sRemover:Lcom/keymouse/tool/TipBubble$Remover;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/keymouse/tool/TipBubble;->sHandler:Landroid/os/Handler;

    sget-object v1, Lcom/keymouse/tool/TipBubble;->sRemover:Lcom/keymouse/tool/TipBubble$Remover;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 31
    :cond_0
    sget-object v0, Lcom/keymouse/tool/TipBubble;->sWm:Landroid/view/WindowManager;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/keymouse/tool/TipBubble;->sView:Landroid/view/View;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/keymouse/tool/TipBubble;->sWm:Landroid/view/WindowManager;

    sget-object v1, Lcom/keymouse/tool/TipBubble;->sView:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    :cond_1
    :goto_0
    const/4 v0, 0x0

    sput-object v0, Lcom/keymouse/tool/TipBubble;->sView:Landroid/view/View;

    .line 35
    return-void

    .line 32
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static label(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 76
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    const-string p1, "?"

    .line 84
    :cond_1
    :goto_0
    return-object p1

    .line 78
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 79
    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 81
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_1

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    goto :goto_0

    .line 82
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static show(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12

    .prologue
    const/high16 v4, 0x41c00000    # 24.0f

    .line 38
    invoke-static {p0, p1, p2}, Lcom/keymouse/tool/TipBubble;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 39
    if-nez v9, :cond_0

    .line 73
    :goto_0
    return-void

    .line 41
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/keymouse/tool/TipBubble;->dismiss()V

    .line 42
    const-string v2, "window"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/view/WindowManager;

    move-object v8, v0

    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v10, v2, Landroid/util/DisplayMetrics;->density:F

    .line 44
    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 45
    invoke-virtual {v11, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    const/4 v2, -0x1

    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 48
    const/16 v2, 0x11

    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 49
    const/high16 v2, 0x41800000    # 16.0f

    mul-float/2addr v2, v10

    float-to-int v2, v2

    const/high16 v3, 0x41100000    # 9.0f

    mul-float/2addr v3, v10

    float-to-int v3, v3

    .line 50
    invoke-virtual {v11, v2, v3, v2, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 51
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-float v3, v4, v10

    float-to-int v3, v3

    sub-int/2addr v2, v3

    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 52
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 53
    const v3, -0x19ddddde

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 54
    mul-float v3, v4, v10

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 55
    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 56
    new-instance v2, Landroid/view/WindowManager$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x2

    const/16 v5, 0x7f6

    const/16 v6, 0x18

    const/4 v7, -0x3

    invoke-direct/range {v2 .. v7}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 61
    const/16 v3, 0x51

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 62
    const/high16 v3, 0x42600000    # 56.0f

    mul-float/2addr v3, v10

    float-to-int v3, v3

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 63
    invoke-interface {v8, v11, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    sput-object v8, Lcom/keymouse/tool/TipBubble;->sWm:Landroid/view/WindowManager;

    .line 65
    sput-object v11, Lcom/keymouse/tool/TipBubble;->sView:Landroid/view/View;

    .line 66
    sget-object v2, Lcom/keymouse/tool/TipBubble;->sHandler:Landroid/os/Handler;

    if-nez v2, :cond_1

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/keymouse/tool/TipBubble;->sHandler:Landroid/os/Handler;

    .line 67
    :cond_1
    sget-object v2, Lcom/keymouse/tool/TipBubble;->sRemover:Lcom/keymouse/tool/TipBubble$Remover;

    if-nez v2, :cond_2

    new-instance v2, Lcom/keymouse/tool/TipBubble$Remover;

    invoke-direct {v2}, Lcom/keymouse/tool/TipBubble$Remover;-><init>()V

    sput-object v2, Lcom/keymouse/tool/TipBubble;->sRemover:Lcom/keymouse/tool/TipBubble$Remover;

    .line 68
    :cond_2
    sget-object v2, Lcom/keymouse/tool/TipBubble;->sHandler:Landroid/os/Handler;

    sget-object v3, Lcom/keymouse/tool/TipBubble;->sRemover:Lcom/keymouse/tool/TipBubble$Remover;

    const-wide/16 v4, 0x898

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 69
    :catch_0
    move-exception v2

    .line 71
    const/4 v2, 0x0

    invoke-static {p0, v9, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x3

    const/4 v2, 0x2

    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 88
    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 116
    :goto_0
    return-object v0

    .line 89
    :cond_0
    const-string v0, "keymouse"

    invoke-virtual {p0, v0, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v5, "lang"

    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 90
    if-ne v0, v1, :cond_1

    move v0, v1

    .line 91
    :goto_1
    const-string v5, "menu"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 92
    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "Recent apps"

    aput-object v6, v5, v4

    const-string v4, "\u041d\u0435\u0434\u0430\u0432\u043d\u0438\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f"

    aput-object v4, v5, v1

    const-string v1, "\u6700\u8fd1\u306e\u30bf\u30b9\u30af"

    aput-object v1, v5, v2

    const-string v1, "\u6700\u8fd1\u4efb\u52a1\u5217\u8868"

    aput-object v1, v5, v3

    aget-object v0, v5, v0

    goto :goto_0

    .line 90
    :cond_1
    if-ne v0, v2, :cond_2

    move v0, v2

    goto :goto_1

    :cond_2
    if-ne v0, v3, :cond_3

    move v0, v3

    goto :goto_1

    :cond_3
    move v0, v4

    goto :goto_1

    .line 95
    :cond_4
    const-string v5, "kill"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 96
    invoke-static {p0, p2}, Lcom/keymouse/tool/TipBubble;->label(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 97
    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "Foreground \"%s\" force-closed"

    aput-object v7, v6, v4

    const-string v7, "\u041f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0435 \u00ab%s\u00bb \u043f\u0440\u0438\u043d\u0443\u0434\u0438\u0442\u0435\u043b\u044c\u043d\u043e \u0437\u0430\u043a\u0440\u044b\u0442\u043e"

    aput-object v7, v6, v1

    const-string v7, "\u524d\u9762\u306e\u300c%s\u300d\u3092\u5f37\u5236\u7d42\u4e86\u3057\u307e\u3057\u305f"

    aput-object v7, v6, v2

    const-string v2, "\u524d\u53f0\u201c%s\u201d\u5df2\u5f3a\u5236\u5173\u95ed"

    aput-object v2, v6, v3

    .line 101
    aget-object v0, v6, v0

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v5, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 103
    :cond_5
    const-string v5, "torch_on"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 104
    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "Flashlight on"

    aput-object v6, v5, v4

    const-string v4, "\u0424\u043e\u043d\u0430\u0440\u0438\u043a \u0432\u043a\u043b\u044e\u0447\u0451\u043d"

    aput-object v4, v5, v1

    const-string v1, "\u30e9\u30a4\u30c8\u3092\u30aa\u30f3\u306b\u3057\u307e\u3057\u305f"

    aput-object v1, v5, v2

    const-string v1, "\u624b\u7535\u7b52\u5df2\u5f00"

    aput-object v1, v5, v3

    aget-object v0, v5, v0

    goto :goto_0

    .line 107
    :cond_6
    const-string v5, "torch_off"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 108
    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "Flashlight off"

    aput-object v6, v5, v4

    const-string v4, "\u0424\u043e\u043d\u0430\u0440\u0438\u043a \u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d"

    aput-object v4, v5, v1

    const-string v1, "\u30e9\u30a4\u30c8\u3092\u30aa\u30d5\u306b\u3057\u307e\u3057\u305f"

    aput-object v1, v5, v2

    const-string v1, "\u624b\u7535\u7b52\u5df2\u5173"

    aput-object v1, v5, v3

    aget-object v0, v5, v0

    goto/16 :goto_0

    .line 111
    :cond_7
    const-string v5, "torch_fail"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 112
    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "Flashlight failed to turn on"

    aput-object v6, v5, v4

    const-string v4, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u0444\u043e\u043d\u0430\u0440\u0438\u043a"

    aput-object v4, v5, v1

    const-string v1, "\u30e9\u30a4\u30c8\u3092\u30aa\u30f3\u306b\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    aput-object v1, v5, v2

    const-string v1, "\u624b\u7535\u7b52\u6253\u5f00\u5931\u8d25"

    aput-object v1, v5, v3

    aget-object v0, v5, v0

    goto/16 :goto_0

    :cond_8
    :cond_d0
    const-string v5, "drag_on"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d1

    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "Mouse held (dragging)"

    aput-object v6, v5, v4

    const-string v4, "\u041c\u044b\u0448\u044c \u0437\u0430\u0436\u0430\u0442\u0430 (\u043f\u0435\u0440\u0435\u0442\u0430\u0441\u043a\u0438\u0432\u0430\u043d\u0438\u0435)"

    aput-object v4, v5, v1

    const-string v1, "\u30de\u30a6\u30b9\u9577\u62bc\u3057(\u30c9\u30e9\u30c3\u30b0\u4e2d)"

    aput-object v1, v5, v2

    const-string v1, "\u9f20\u6807\u5df2\u957f\u6309(\u62d6\u52a8\u4e2d)"

    aput-object v1, v5, v3

    aget-object v0, v5, v0

    goto/16 :goto_0

    :cond_d1
    const-string v5, "drag_off"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d2

    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "Mouse released"

    aput-object v6, v5, v4

    const-string v4, "\u041c\u044b\u0448\u044c \u043e\u0442\u043f\u0443\u0449\u0435\u043d\u0430"

    aput-object v4, v5, v1

    const-string v1, "\u30de\u30a6\u30b9\u3092\u96e2\u3057\u307e\u3057\u305f"

    aput-object v1, v5, v2

    const-string v1, "\u9f20\u6807\u5df2\u677e\u624b"

    aput-object v1, v5, v3

    aget-object v0, v5, v0

    goto/16 :goto_0

    :cond_d2
    const-string v5, "keyset"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d3

    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "Done: key set to %s"

    aput-object v6, v5, v4

    const-string v4, "\u0413\u043e\u0442\u043e\u0432\u043e: \u043a\u043b\u0430\u0432\u0438\u0448\u0430 %s"

    aput-object v4, v5, v1

    const-string v4, "\u8a2d\u5b9a\u5b8c\u4e86: \u30ad\u30fc\u306f %s"

    aput-object v4, v5, v2

    const-string v4, "\u8bbe\u7f6e\u5b8c\u6210\uff0c\u952e\u4f4d\u4e3a %s"

    aput-object v4, v5, v3

    aget-object v0, v5, v0

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_d3
    const-string v5, "hidden"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d4

    new-array v5, v6, [Ljava/lang/String;

    const-string v6, "Mouse hidden for this app"

    aput-object v6, v5, v4

    const-string v4, "\u041c\u044b\u0448\u044c \u0441\u043a\u0440\u044b\u0442\u0430 \u0432 \u044d\u0442\u043e\u043c \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438"

    aput-object v4, v5, v1

    const-string v1, "\u3053\u306e\u30a2\u30d7\u30ea\u3067\u306f\u30de\u30a6\u30b9\u3092\u975e\u8868\u793a\u306b\u3057\u307e\u3057\u305f"

    aput-object v1, v5, v2

    const-string v1, "\u6b64\u5e94\u7528\u9f20\u6807\u5df2\u88ab\u9690\u85cf"

    aput-object v1, v5, v3

    aget-object v0, v5, v0

    goto/16 :goto_0

    :cond_d4
    const/4 v0, 0x0

    goto/16 :goto_0
.end method
