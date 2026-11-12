.class public final Lcom/keymouse/tool/KeyCustomCard;
.super Ljava/lang/Object;
.source "KeyCustomCard.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    return-void
.end method

.method public static build(Landroid/app/Activity;)Landroid/view/View;
    .registers 13

    .prologue
    const/high16 v11, 0x41600000    # 14.0f

    const v10, -0xff5772

    const/high16 v9, 0x41800000    # 16.0f

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 19
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->ensure(Landroid/content/Context;)V

    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 22
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 23
    const v2, -0xc5c5c6

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 24
    mul-float v2, v9, v0

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 25
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 26
    const v3, -0xe0b2bb

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 27
    mul-float v3, v9, v0

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 28
    const/4 v3, 0x2

    invoke-virtual {v2, v3, v10}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 29
    new-instance v3, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 30
    new-array v4, v7, [I

    const v5, 0x10100a7

    aput v5, v4, v8

    invoke-virtual {v3, v4, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 31
    new-array v4, v7, [I

    const v5, 0x101009c

    aput v5, v4, v8

    invoke-virtual {v3, v4, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 32
    new-array v2, v8, [I

    invoke-virtual {v3, v2, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 34
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 35
    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 36
    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 37
    mul-float v2, v11, v0

    float-to-int v2, v2

    .line 38
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 39
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 40
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 41
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setFocusable(Z)V

    .line 43
    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 44
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 45
    invoke-virtual {v3, v7}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 46
    invoke-virtual {v3, v10}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 47
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 48
    const/high16 v3, 0x41100000    # 9.0f

    mul-float/2addr v3, v0

    float-to-int v3, v3

    .line 49
    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 50
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "ic_menu_edit"

    const-string v5, "drawable"

    const-string v6, "android"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 51
    if-eqz v3, :cond_a1

    .line 52
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 54
    :cond_a1
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42300000    # 44.0f

    mul-float/2addr v4, v0

    float-to-int v4, v4

    const/high16 v5, 0x42300000    # 44.0f

    mul-float/2addr v5, v0

    float-to-int v5, v5

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 55
    mul-float v4, v11, v0

    float-to-int v4, v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 56
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 59
    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 60
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 61
    const-string v4, "Key customization"

    const-string v5, "\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u043a\u043b\u0430\u0432\u0438\u0448"

    const-string v6, "\u30ad\u30fc\u306e\u30ab\u30b9\u30bf\u30de\u30a4\u30ba"

    const-string v7, "\u6309\u952e\u81ea\u5b9a\u4e49"

    invoke-static {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 63
    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 64
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 65
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 66
    const-string v4, "Menu / Back / * long-press actions, hold time, lock screen, excluded apps"

    const-string v5, "\u041c\u0435\u043d\u044e / \u041d\u0430\u0437\u0430\u0434 / * \u043f\u043e \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044e, \u0432\u0440\u0435\u043c\u044f, \u044d\u043a\u0440\u0430\u043d \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438, \u0438\u0441\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u044f"

    const-string v6, "\u30e1\u30cb\u30e5\u30fc/\u623b\u308b/* \u9577\u62bc\u3057\u52d5\u4f5c\u30fb\u6642\u9593\u30fb\u30ed\u30c3\u30af\u753b\u9762\u30fb\u9664\u5916\u30a2\u30d7\u30ea"

    const-string v7, "\u83dc\u5355/\u8fd4\u56de/*\u952e \u957f\u6309\u6620\u5c04 \u00b7 \u957f\u6309\u65f6\u95f4 \u00b7 \u9501\u5c4f/\u606f\u5c4f \u00b7 \u6392\u9664\u5e94\u7528"

    invoke-static {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    const/high16 v4, 0x41400000    # 12.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 71
    const v4, -0x616162

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 73
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v8, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 76
    const-string v3, "\u203a"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    const/high16 v3, 0x41e00000    # 28.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 78
    invoke-virtual {v2, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 79
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 81
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 83
    mul-float v3, v9, v0

    float-to-int v3, v3

    mul-float/2addr v0, v9

    float-to-int v0, v0

    invoke-virtual {v2, v8, v3, v8, v0}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 84
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    new-instance v0, Lcom/keymouse/tool/KeyCustomCard$1;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/KeyCustomCard$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    return-object v1
.end method
