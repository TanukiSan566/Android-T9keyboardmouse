.class public final Lcom/keymouse/tool/ChoiceRow;
.super Ljava/lang/Object;
.source "ChoiceRow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keymouse/tool/ChoiceRow$Click;
    }
.end annotation


# static fields
.field private static final OFF_BG:I = 0x33808080

.field private static final SEL_BG:I = -0xd182ce

.field private static final SEL_FG:I = -0x1


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    return-void
.end method

.method public static build(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/CompoundButton;)Landroid/view/View;
    .registers 16

    .prologue
    .line 30
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v4, v0, Landroid/util/DisplayMetrics;->density:F

    .line 32
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 33
    const/4 v0, 0x1

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 34
    const/4 v0, 0x0

    const/16 v1, 0x28

    const/4 v2, 0x0

    const/16 v3, 0xa

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 36
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 37
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 39
    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 41
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 42
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 43
    const/4 v2, 0x0

    const/high16 v3, 0x40c00000    # 6.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    const/4 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual {v1, v2, v3, v5, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 45
    invoke-static {p0, p2, v4}, Lcom/keymouse/tool/ChoiceRow;->tab(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v2

    .line 46
    invoke-static {p0, p3, v4}, Lcom/keymouse/tool/ChoiceRow;->tab(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;

    move-result-object v3

    .line 47
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v8, -0x2

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v5, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 48
    const/high16 v7, 0x40800000    # 4.0f

    mul-float/2addr v7, v4

    float-to-int v7, v7

    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 49
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 50
    const/high16 v8, 0x40800000    # 4.0f

    mul-float/2addr v8, v4

    float-to-int v8, v8

    iput v8, v7, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 51
    invoke-virtual {v1, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    invoke-virtual {v1, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    invoke-virtual {v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 55
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v5

    .line 56
    invoke-virtual {p4}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v0

    invoke-static {v2, v3, v0, v4, v5}, Lcom/keymouse/tool/ChoiceRow;->paint(Landroid/widget/TextView;Landroid/widget/TextView;ZFI)V

    .line 58
    new-instance v0, Lcom/keymouse/tool/ChoiceRow$Click;

    move-object v1, p4

    invoke-direct/range {v0 .. v5}, Lcom/keymouse/tool/ChoiceRow$Click;-><init>(Landroid/widget/CompoundButton;Landroid/widget/TextView;Landroid/widget/TextView;FI)V

    .line 59
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    return-object v6
.end method

.method static paint(Landroid/widget/TextView;Landroid/widget/TextView;ZFI)V
    .registers 6

    .prologue
    .line 90
    invoke-static {p0, p2, p3, p4}, Lcom/keymouse/tool/ChoiceRow;->style(Landroid/widget/TextView;ZFI)V

    .line 91
    if-nez p2, :cond_a

    const/4 v0, 0x1

    :goto_6
    invoke-static {p1, v0, p3, p4}, Lcom/keymouse/tool/ChoiceRow;->style(Landroid/widget/TextView;ZFI)V

    .line 92
    return-void

    .line 91
    :cond_a
    const/4 v0, 0x0

    goto :goto_6
.end method

.method private static style(Landroid/widget/TextView;ZFI)V
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 76
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 77
    const/high16 v0, 0x40c00000    # 6.0f

    mul-float/2addr v0, p2

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 78
    if-eqz p1, :cond_22

    const v0, -0xd182ce

    :goto_11
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 79
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    if-eqz p1, :cond_26

    .line 81
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    const/4 v0, 0x1

    invoke-virtual {p0, v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 87
    :goto_21
    return-void

    .line 78
    :cond_22
    const v0, 0x33808080

    goto :goto_11

    .line 84
    :cond_26
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 85
    const/4 v0, 0x0

    invoke-virtual {p0, v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_21
.end method

.method private static tab(Landroid/content/Context;Ljava/lang/String;F)Landroid/widget/TextView;
    .registers 5

    .prologue
    .line 65
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 66
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 68
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 69
    const/high16 v1, 0x41200000    # 10.0f

    mul-float/2addr v1, p2

    float-to-int v1, v1

    .line 70
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 71
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setClickable(Z)V

    .line 72
    return-object v0
.end method
