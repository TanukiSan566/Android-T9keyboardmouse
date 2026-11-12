.class public Lcom/keymouse/tool/DebounceActivity;
.super Landroid/app/Activity;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/content/DialogInterface$OnKeyListener;
.source "DebounceActivity.java"


# instance fields
.field private mAdvBox:Landroid/widget/LinearLayout;

.field private mKeysBox:Landroid/widget/LinearLayout;

.field private mParent:Landroid/widget/LinearLayout;

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mRoot:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "lang"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_not_ru

    return-object p2

    :cond_not_ru
    const/4 v1, 0x2

    if-ne v0, v1, :cond_not_ja

    return-object p3

    :cond_not_ja
    const/4 v1, 0x3

    if-ne v0, v1, :cond_not_zh

    return-object p4

    :cond_not_zh
    return-object p1
.end method

.method private cardBg(Z)Landroid/graphics/drawable/Drawable;
    .locals 3

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    if-eqz p1, :cond_off

    const v1, -0xe0b2bb

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v1, 0x2

    const v2, -0xff5772

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    goto :cond_set

    :cond_off
    const v1, -0xc5c5c6

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    :cond_set
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method private addToParent(Landroid/view/View;)V
    .locals 4

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v1, 0x0

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/keymouse/tool/DebounceActivity;->mParent:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private textCol(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 5

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const v2, -0x616162

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private weightParams()Landroid/widget/LinearLayout$LayoutParams;
    .locals 4

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, 0x0

    const/4 v2, -0x2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    return-object v0
.end method

.method private rowCard()Landroid/widget/LinearLayout;
    .locals 3

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v1, 0xe

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    return-object v0
.end method

.method private addSwitchCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p3, p4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->rowCard()Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-direct {p0, v0}, Lcom/keymouse/tool/DebounceActivity;->cardBg(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0, p1, p2}, Lcom/keymouse/tool/DebounceActivity;->textCol(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->weightParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/Switch;

    invoke-direct {v2, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    invoke-virtual {v2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0, v1}, Lcom/keymouse/tool/DebounceActivity;->addToParent(Landroid/view/View;)V

    return-void
.end method

.method private addCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->rowCard()Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/keymouse/tool/DebounceActivity;->cardBg(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    new-array v4, v2, [I

    const v5, 0x0101009c

    const/4 v6, 0x0

    aput v5, v4, v6

    invoke-virtual {v1, v4, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v4, v2, [I

    const v5, 0x010100a7

    aput v5, v4, v6

    invoke-virtual {v1, v4, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-direct {p0, v6}, Lcom/keymouse/tool/DebounceActivity;->cardBg(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    new-array v4, v6, [I

    invoke-virtual {v1, v4, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0, p1, p2}, Lcom/keymouse/tool/DebounceActivity;->textCol(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->weightParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "\u203a"

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41e00000    # 28.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const v3, -0xff5772

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0, v0}, Lcom/keymouse/tool/DebounceActivity;->addToParent(Landroid/view/View;)V

    return-void
.end method

.method private addSlider(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 8

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p2, p3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0xe

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/keymouse/tool/DebounceActivity;->cardBg(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const v3, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/SeekBar;

    invoke-direct {v2, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    div-int/lit8 v3, p4, 0x5

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setMax(I)V

    div-int/lit8 v3, v0, 0x5

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setProgress(I)V

    invoke-virtual {v2, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v2, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0, v1}, Lcom/keymouse/tool/DebounceActivity;->addToParent(Landroid/view/View;)V

    return-void
.end method

.method private addKeyEntry(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 9

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->rowCard()Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-direct {p0, p2}, Lcom/keymouse/tool/DebounceActivity;->cardBg(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const-string v1, "Scan code "

    const-string v2, "\u0421\u043a\u0430\u043d-\u043a\u043e\u0434 "

    const-string v3, "\u30b9\u30ad\u30e3\u30f3\u30b3\u30fc\u30c9 "

    const-string v4, "\u626b\u63cf\u7801 "

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5


    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p3, v6}, Lcom/keymouse/tool/DebounceActivity;->textCol(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->weightParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "k:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v1, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v2, "\u00d7"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41b00000    # 22.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const v2, -0x616162

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v2, 0xc

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setClickable(Z)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "x:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0, v0}, Lcom/keymouse/tool/DebounceActivity;->addToParent(Landroid/view/View;)V

    return-void
.end method

.method private keyOp(Ljava/lang/String;ILjava/lang/String;)V
    .locals 10

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "debKeys"

    const-string v2, "2:1:1,3:1:2,4:1:3,5:1:4,6:1:5,7:1:6,8:1:7,9:1:8,10:1:9,11:1:0,227:1:*,228:1:#"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_loop
    array-length v7, v3

    if-ge v5, v7, :cond_done

    aget-object v7, v3, v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :goto_loop

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    aget-object v9, v8, v9

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_keep_old

    const/4 v6, 0x1

    const/4 v9, 0x2

    if-eq p2, v9, :goto_loop

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-eqz v9, :cond_nc1

    const-string v9, ","

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_nc1
    const/4 v9, 0x0

    aget-object v9, v8, v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ":"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p2, :cond_flag_on

    const-string v9, "0"

    goto :cond_flag_done

    :cond_flag_on
    const-string v9, "1"

    :cond_flag_done
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v9, v8

    const/4 v7, 0x2

    if-le v9, v7, :goto_loop

    const-string v9, ":"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v9, 0x2

    aget-object v9, v8, v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_loop

    :cond_keep_old
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-eqz v9, :cond_nc2

    const-string v9, ","

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_nc2
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_loop

    :cond_done
    const/4 v9, 0x3

    if-ne p2, v9, :cond_save

    if-nez v6, :cond_save

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-eqz v9, :cond_nc3

    const-string v9, ","

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_nc3
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ":1:"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_save
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private buildKeyEntries()V
    .locals 8

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "debKeys"

    const-string v2, "2:1:1,3:1:2,4:1:3,5:1:4,6:1:5,7:1:6,8:1:7,9:1:8,10:1:9,11:1:0,227:1:*,228:1:#"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_loop
    array-length v2, v0

    if-ge v1, v2, :cond_done

    aget-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x2

    if-lt v3, v4, :goto_loop

    const/4 v4, 0x0

    aget-object v4, v2, v4

    const/4 v5, 0x1

    aget-object v5, v2, v5

    const-string v6, "1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x2

    if-le v3, v6, :cond_nolabel

    aget-object v6, v2, v6

    goto :cond_hl

    :cond_nolabel
    move-object v6, v4

    :cond_hl
    invoke-direct {p0, v4, v5, v6}, Lcom/keymouse/tool/DebounceActivity;->addKeyEntry(Ljava/lang/String;ZLjava/lang/String;)V

    goto :goto_loop

    :cond_done
    return-void
.end method

.method private syncEff()V
    .locals 6

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "debAdv"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const/16 v2, 0x78

    const/16 v3, 0x1e

    const/4 v4, 0x1

    if-eqz v1, :cond_write

    const-string v5, "debMs"

    invoke-interface {v0, v5, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    const-string v5, "debGhost"

    invoke-interface {v0, v5, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    const-string v5, "debAll"

    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    :cond_write
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v5, "debMsEff"

    invoke-interface {v0, v5, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v5, "debGhostEff"

    invoke-interface {v0, v5, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v5, "debAllEff"

    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private updateAppsCard()V
    .locals 4

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "debAll"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/keymouse/tool/DebounceActivity;->mRoot:Landroid/widget/LinearLayout;

    const-string v2, "apps"

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_end

    xor-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setFocusable(Z)V

    if-eqz v2, :cond_dim

    const/high16 v3, 0x3f800000    # 1.0f

    goto :cond_set

    :cond_dim
    const v3, 0x3ecccccd    # 0.4f

    :cond_set
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    :cond_end
    return-void
.end method

.method private applyAdv()V
    .locals 3

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "debAdv"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/keymouse/tool/DebounceActivity;->mAdvBox:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_hide

    const/4 v2, 0x0

    goto :cond_set

    :cond_hide
    const/16 v2, 0x8

    :cond_set
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private applyKeysOpen()V
    .locals 5

    iget-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "debKeysOpen"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iget-object v1, p0, Lcom/keymouse/tool/DebounceActivity;->mKeysBox:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_closed

    const/4 v2, 0x0

    const/high16 v3, 0x42b40000    # 90.0f

    goto :cond_set

    :cond_closed
    const/16 v2, 0x8

    const/4 v3, 0x0

    :cond_set
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lcom/keymouse/tool/DebounceActivity;->mRoot:Landroid/widget/LinearLayout;

    const-string v2, "toggle:keys"

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_end

    check-cast v1, Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setRotation(F)V

    :cond_end
    return-void
.end method

.method private showAddDialog()V
    .locals 10

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Add a debounced key"

    const-string v2, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u043a\u043b\u0430\u0432\u0438\u0448\u0443"

    const-string v3, "\u9632\u6296\u30ad\u30fc\u3092\u8ffd\u52a0"

    const-string v4, "\u6dfb\u52a0\u9632\u6296\u6309\u952e"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5


    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Press the key to add..."

    const-string v2, "\u041d\u0430\u0436\u043c\u0438\u0442\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0443..."

    const-string v3, "\u8ffd\u52a0\u3059\u308b\u30ad\u30fc\u3092\u62bc\u3057\u3066\u304f\u3060\u3055\u3044..."

    const-string v4, "\u8bf7\u6309\u4e0b\u8981\u52a0\u5165\u7684\u6309\u952e..."

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5


    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    const-string v1, "Cancel"

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v4, "\u53d6\u6d88"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5


    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string v0, "keymouse"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    new-instance v9, Landroid/widget/ScrollView;

    invoke-direct {v9, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v0, 0x10

    invoke-virtual {v10, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    iput-object v10, p0, Lcom/keymouse/tool/DebounceActivity;->mRoot:Landroid/widget/LinearLayout;

    iput-object v10, p0, Lcom/keymouse/tool/DebounceActivity;->mParent:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const-string v1, "Worn keys can chatter: one press turns into several. Choose per key: a release followed by a press of the same key within the set time is ignored as bounce."

    const-string v2, "\u0418\u0437\u043d\u043e\u0448\u0435\u043d\u043d\u044b\u0435 \u043a\u043d\u043e\u043f\u043a\u0438 \u00ab\u0434\u0440\u0435\u0431\u0435\u0437\u0436\u0430\u0442\u00bb: \u043e\u0434\u043d\u043e \u043d\u0430\u0436\u0430\u0442\u0438\u0435 \u043f\u0440\u0435\u0432\u0440\u0430\u0449\u0430\u0435\u0442\u0441\u044f \u0432 \u043d\u0435\u0441\u043a\u043e\u043b\u044c\u043a\u043e. \u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0438: \u00ab\u043e\u0442\u043f\u0443\u0441\u043a\u0430\u043d\u0438\u0435 \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u043d\u043e\u0435 \u043d\u0430\u0436\u0430\u0442\u0438\u0435\u00bb \u0442\u043e\u0439 \u0436\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 \u0437\u0430 \u0437\u0430\u0434\u0430\u043d\u043d\u043e\u0435 \u0432\u0440\u0435\u043c\u044f \u0438\u0433\u043d\u043e\u0440\u0438\u0440\u0443\u0435\u0442\u0441\u044f."

    const-string v3, "\u30ad\u30fc\u306e\u63a5\u89e6\u4e0d\u826f\u30671\u56de\u306e\u62bc\u4e0b\u304c\u9023\u6253\u306b\u306a\u308b\u3053\u3068\u304c\u3042\u308a\u307e\u3059\u3002\u30ad\u30fc\u3054\u3068\u306b\u9078\u3079\u307e\u3059: \u8a2d\u5b9a\u6642\u9593\u5185\u306e\u540c\u3058\u30ad\u30fc\u306e\u300c\u96e2\u3059\u2192\u62bc\u3059\u300d\u306f\u6296\u52d5\u3068\u3057\u3066\u7121\u8996\u3057\u307e\u3059\u3002"

    const-string v4, "\u6309\u952e\u63a5\u89e6\u4e0d\u826f\u4f1a\u8ba9\u4e00\u6b21\u6309\u538b\u53d8\u6210\u591a\u6b21\u8fde\u51fb\u3002\u8fd9\u91cc\u6309\u300c\u6309\u952e\u300d\u9009\u62e9\u8981\u9632\u6296\u7684\u952e\uff1a\u540c\u4e00\u4e2a\u952e\u5728\u8bbe\u5b9a\u65f6\u95f4\u5185\u7684\u300c\u677e\u5f00\u53c8\u6309\u4e0b\u300d\u4f1a\u88ab\u5f53\u6210\u6296\u52a8\u5ffd\u7565\u3002"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5


    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41500000    # 13.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const v7, -0x616162

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v10, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v1, "Use key-map debounce (global)"

    const-string v2, "\u0417\u0430\u0449\u0438\u0442\u0430 \u043f\u043e \u0441\u043f\u0438\u0441\u043a\u0443 \u043a\u043b\u0430\u0432\u0438\u0448 (\u0433\u043b\u043e\u0431\u0430\u043b\u044c\u043d\u043e)"

    const-string v3, "\u30ad\u30fc\u5272\u308a\u5f53\u3066\u9632\u6296\u3092\u4f7f\u3046(\u5168\u4f53)"

    const-string v4, "\u4f7f\u7528\u6309\u952e\u6620\u5c04\u9632\u6296(\u5168\u5c40)"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "On: the ticked keys below are debounced even when mouse mode is off (grabs the keypad and forwards through a cloned keyboard; turn it off if typing misbehaves)"

    const-string v2, "\u0412\u043a\u043b: \u043e\u0442\u043c\u0435\u0447\u0435\u043d\u043d\u044b\u0435 \u043d\u0438\u0436\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 \u0437\u0430\u0449\u0438\u0449\u0435\u043d\u044b \u0438 \u043f\u0440\u0438 \u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d\u043d\u043e\u0439 \u043c\u044b\u0448\u0438 (\u043f\u0435\u0440\u0435\u0445\u0432\u0430\u0442 \u043a\u043b\u0430\u0432\u0438\u0430\u0442\u0443\u0440\u044b \u0438 \u043a\u043b\u043e\u043d; \u043f\u0440\u0438 \u0441\u0431\u043e\u044f\u0445 \u0432\u044b\u043a\u043b\u044e\u0447\u0438\u0442\u0435)"

    const-string v3, "\u30aa\u30f3: \u30de\u30a6\u30b9\u30e2\u30fc\u30c9\u304c\u30aa\u30d5\u3067\u3082\u4e0b\u3067\u30c1\u30a7\u30c3\u30af\u3057\u305f\u30ad\u30fc\u3092\u9632\u6296(\u30ad\u30fc\u30d1\u30c3\u30c9\u5360\u6709\uff0b\u30af\u30ed\u30fc\u30f3\u8ee2\u9001\u3002\u5165\u529b\u304c\u304a\u304b\u3057\u3051\u308c\u3070\u30aa\u30d5\u306b)"

    const-string v4, "\u5f00\u542f: \u9f20\u6807\u6a21\u5f0f\u5173\u95ed\u65f6\uff0c\u4e0b\u9762\u52fe\u9009\u7684\u6309\u952e\u4e5f\u9632\u6296(\u72ec\u5360\u4e3b\u952e\u76d8\u5e76\u7528\u514b\u9686\u952e\u76d8\u8f6c\u53d1\uff0c\u82e5\u8f93\u5165\u5f02\u5e38\u8bf7\u5173\u95ed)"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "debGlobal"

    const/4 v8, 0x0

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/keymouse/tool/DebounceActivity;->addSwitchCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V


    const-string v1, "Also debounce in mouse mode"

    const-string v2, "\u0417\u0430\u0449\u0438\u0442\u0430 \u0438 \u0432 \u0440\u0435\u0436\u0438\u043c\u0435 \u043c\u044b\u0448\u0438"

    const-string v3, "\u30de\u30a6\u30b9\u30e2\u30fc\u30c9\u4e2d\u3082\u9632\u6296\u3059\u308b"

    const-string v4, "\u9f20\u6807\u6a21\u5f0f\u4e0b\u4e5f\u4f7f\u7528\u9632\u6296"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "On: the ticked keys (incl. 2468 long-press) are debounced in mouse mode too. Arrows/OK are not in the list by default, so the pointer stays responsive and fast double-taps work"

    const-string v2, "\u0412\u043a\u043b: \u043e\u0442\u043c\u0435\u0447\u0435\u043d\u043d\u044b\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 (\u0432 \u0442.\u0447. 2468) \u0437\u0430\u0449\u0438\u0449\u0435\u043d\u044b \u0438 \u0432 \u0440\u0435\u0436\u0438\u043c\u0435 \u043c\u044b\u0448\u0438. \u0421\u0442\u0440\u0435\u043b\u043a\u0438/OK \u043f\u043e \u0443\u043c\u043e\u043b\u0447\u0430\u043d\u0438\u044e \u043d\u0435 \u0432 \u0441\u043f\u0438\u0441\u043a\u0435 \u2014 \u043a\u0443\u0440\u0441\u043e\u0440 \u043e\u0442\u0437\u044b\u0432\u0447\u0438\u0432, \u0431\u044b\u0441\u0442\u0440\u044b\u0439 \u0434\u0432\u043e\u0439\u043d\u043e\u0439 \u0442\u0430\u043f \u0440\u0430\u0431\u043e\u0442\u0430\u0435\u0442"

    const-string v3, "\u30aa\u30f3: \u30de\u30a6\u30b9\u30e2\u30fc\u30c9\u4e2d\u3082\u30c1\u30a7\u30c3\u30af\u3057\u305f\u30ad\u30fc(2468\u9577\u62bc\u3057\u542b\u3080)\u3092\u9632\u6296\u3002\u65b9\u5411\u30ad\u30fc\u30fb\u6c7a\u5b9a\u306f\u65e2\u5b9a\u3067\u5bfe\u8c61\u5916\u306a\u306e\u3067\u3001\u30ab\u30fc\u30bd\u30eb\u304c\u6a5f\u654f\u3067\u7d20\u65e9\u3044\u30c0\u30d6\u30eb\u30bf\u30c3\u30d7\u3082\u53ef\u80fd"

    const-string v4, "\u5f00\u542f: \u9f20\u6807\u6a21\u5f0f\u4e2d\uff0c\u4e0b\u9762\u52fe\u9009\u7684\u6309\u952e(\u542b 2468 \u957f\u6309)\u540c\u6837\u9632\u6296\u3002\u65b9\u5411\u952e/\u786e\u8ba4\u952e\u9ed8\u8ba4\u4e0d\u5728\u5217\u8868\u91cc\uff0c\u9f20\u6807\u624d\u8ddf\u624b\u3001\u4e5f\u80fd\u5feb\u901f\u53cc\u51fb"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "debMouse"

    const/4 v8, 0x1

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/keymouse/tool/DebounceActivity;->addSwitchCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V


    const-string v1, "Key-map debounce"

    const-string v2, "\u0421\u043f\u0438\u0441\u043e\u043a \u043a\u043b\u0430\u0432\u0438\u0448"

    const-string v3, "\u30ad\u30fc\u5272\u308a\u5f53\u3066\u9632\u6296"

    const-string v4, "\u6309\u952e\u6620\u5c04\u9632\u6296"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "Tap to choose which keys are debounced (default 0-9, *, #)"

    const-string v2, "\u041d\u0430\u0436\u043c\u0438\u0442\u0435, \u0447\u0442\u043e\u0431\u044b \u0432\u044b\u0431\u0440\u0430\u0442\u044c \u043a\u043b\u0430\u0432\u0438\u0448\u0438 (\u043f\u043e \u0443\u043c\u043e\u043b\u0447\u0430\u043d\u0438\u044e 0-9, *, #)"

    const-string v3, "\u30bf\u30c3\u30d7\u3057\u3066\u9632\u6296\u3059\u308b\u30ad\u30fc\u3092\u9078\u629e(\u65e2\u5b9a 0-9\u3001*\u3001#)"

    const-string v4, "\u70b9\u5f00\u9009\u62e9\u54ea\u4e9b\u6309\u952e\u9632\u6296(\u9ed8\u8ba4 0-9\u3001*\u3001#)"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "toggle:keys"

    invoke-direct {p0, v5, v6, v7}, Lcom/keymouse/tool/DebounceActivity;->addCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V


    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iput-object v11, p0, Lcom/keymouse/tool/DebounceActivity;->mKeysBox:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iput-object v11, p0, Lcom/keymouse/tool/DebounceActivity;->mParent:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->buildKeyEntries()V

    const-string v1, "Add a key  +"

    const-string v2, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u043a\u043b\u0430\u0432\u0438\u0448\u0443  +"

    const-string v3, "\u30ad\u30fc\u3092\u8ffd\u52a0  +"

    const-string v4, "\u6dfb\u52a0\u6309\u952e  +"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "Then press the key to add. Arrows/OK/2468 are taken by mouse mode while it is on - turn it off first"

    const-string v2, "\u0417\u0430\u0442\u0435\u043c \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0443. \u0421\u0442\u0440\u0435\u043b\u043a\u0438/OK/2468 \u0437\u0430\u043d\u044f\u0442\u044b \u0440\u0435\u0436\u0438\u043c\u043e\u043c \u043c\u044b\u0448\u0438 \u2014 \u0441\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u044b\u043a\u043b\u044e\u0447\u0438\u0442\u0435 \u0435\u0433\u043e"

    const-string v3, "\u62bc\u3057\u305f\u30ad\u30fc\u3092\u8ffd\u52a0\u3002\u65b9\u5411\u30ad\u30fc\u30fb\u6c7a\u5b9a\u30fb2468 \u306f\u30de\u30a6\u30b9\u30e2\u30fc\u30c9\u4e2d\u306f\u4f7f\u308f\u308c\u308b\u305f\u3081\u3001\u5148\u306b\u30aa\u30d5\u306b\u3057\u3066\u304f\u3060\u3055\u3044"

    const-string v4, "\u70b9\u51fb\u540e\u6309\u4e0b\u8981\u52a0\u5165\u7684\u6309\u952e\u3002\u65b9\u5411\u952e/\u786e\u8ba4\u952e/2468 \u5728\u9f20\u6807\u6a21\u5f0f\u5f00\u7740\u65f6\u4f1a\u88ab\u5360\u7528\uff0c\u8bf7\u5148\u5173\u95ed\u9f20\u6807\u6a21\u5f0f"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "add"

    invoke-direct {p0, v5, v6, v7}, Lcom/keymouse/tool/DebounceActivity;->addCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V


    iput-object v10, p0, Lcom/keymouse/tool/DebounceActivity;->mParent:Landroid/widget/LinearLayout;

    const-string v1, "Advanced debounce options"

    const-string v2, "\u0414\u043e\u043f\u043e\u043b\u043d\u0438\u0442\u0435\u043b\u044c\u043d\u043e"

    const-string v3, "\u9632\u6296\u306e\u8a73\u7d30\u8a2d\u5b9a"

    const-string v4, "\u9632\u6296\u9ad8\u7ea7\u9009\u9879"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "On: set the times yourself and limit to chosen apps. Off: recommended values (120 ms / 30 ms, all apps)"

    const-string v2, "\u0412\u043a\u043b: \u0441\u0432\u043e\u0438 \u0432\u0440\u0435\u043c\u0435\u043d\u0430 \u0438 \u0432\u044b\u0431\u043e\u0440 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0439. \u0412\u044b\u043a\u043b: \u0440\u0435\u043a\u043e\u043c\u0435\u043d\u0434\u0443\u0435\u043c\u044b\u0435 (120 \u043c\u0441 / 30 \u043c\u0441, \u0432\u0441\u0435)"

    const-string v3, "\u30aa\u30f3: \u6642\u9593\u3068\u30a2\u30d7\u30ea\u3092\u81ea\u5206\u3067\u8a2d\u5b9a\u3002\u30aa\u30d5: \u63a8\u5968\u5024(120ms / 30ms\u3001\u5168\u30a2\u30d7\u30ea)"

    const-string v4, "\u5f00\u542f\u540e\u53ef\u81ea\u5df1\u8c03\u9632\u6296\u65f6\u95f4\u3001\u6309\u5e94\u7528\u9632\u6296\uff1b\u5173\u95ed\u5219\u7528\u63a8\u8350\u503c(120ms / 30ms\uff0c\u6240\u6709\u5e94\u7528)"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "debAdv"

    const/4 v8, 0x0

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/keymouse/tool/DebounceActivity;->addSwitchCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V


    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iput-object v12, p0, Lcom/keymouse/tool/DebounceActivity;->mAdvBox:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iput-object v12, p0, Lcom/keymouse/tool/DebounceActivity;->mParent:Landroid/widget/LinearLayout;

    const-string v1, "Debounce time (recommended 120 ms, 0 = off)"

    const-string v2, "\u0412\u0440\u0435\u043c\u044f \u0437\u0430\u0449\u0438\u0442\u044b (\u0440\u0435\u043a\u043e\u043c\u0435\u043d\u0434\u0443\u0435\u0442\u0441\u044f 120 \u043c\u0441, 0 = \u0432\u044b\u043a\u043b)"

    const-string v3, "\u9632\u6296\u6642\u9593(\u63a8\u5968120ms\u30010=\u30aa\u30d5)"

    const-string v4, "\u9632\u6296\u65f6\u95f4(\u63a8\u8350120ms\uff0c0=\u5173\u95ed)"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "debMs"

    const/16 v7, 0x78

    const/16 v8, 0x12c

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/keymouse/tool/DebounceActivity;->addSlider(Ljava/lang/String;Ljava/lang/String;II)V


    const-string v1, "Ghost-press filter (recommended 30 ms, 0 = off)"

    const-string v2, "\u0424\u0438\u043b\u044c\u0442\u0440 \u043b\u043e\u0436\u043d\u044b\u0445 \u043a\u0430\u0441\u0430\u043d\u0438\u0439 (\u0440\u0435\u043a\u043e\u043c\u0435\u043d\u0434\u0443\u0435\u0442\u0441\u044f 30 \u043c\u0441, 0 = \u0432\u044b\u043a\u043b)"

    const-string v3, "\u30b4\u30fc\u30b9\u30c8\u62bc\u4e0b\u30d5\u30a3\u30eb\u30bf\u30fc(\u63a8\u596830ms\u30010=\u30aa\u30d5)"

    const-string v4, "\u5e7d\u7075\u77ed\u6309\u8fc7\u6ee4(\u63a8\u835030ms\uff0c0=\u5173\u95ed)"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "debGhost"

    const/16 v7, 0x1e

    const/16 v8, 0x64

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/keymouse/tool/DebounceActivity;->addSlider(Ljava/lang/String;Ljava/lang/String;II)V


    const-string v1, "Debounce in all apps"

    const-string v2, "\u0412\u043e \u0432\u0441\u0435\u0445 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f\u0445"

    const-string v3, "\u3059\u3079\u3066\u306e\u30a2\u30d7\u30ea\u3067\u9632\u6296"

    const-string v4, "\u6240\u6709\u5e94\u7528\u90fd\u9632\u6296"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "When off, only the apps chosen below are debounced"

    const-string v2, "\u0415\u0441\u043b\u0438 \u0432\u044b\u043a\u043b \u2014 \u0442\u043e\u043b\u044c\u043a\u043e \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435 \u043d\u0438\u0436\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f"

    const-string v3, "\u30aa\u30d5\u306b\u3059\u308b\u3068\u3001\u4e0b\u3067\u9078\u3093\u3060\u30a2\u30d7\u30ea\u3060\u3051\u9632\u6296\u3057\u307e\u3059"

    const-string v4, "\u5173\u95ed\u540e\uff0c\u53ea\u5728\u4e0b\u9762\u300c\u9009\u62e9\u9632\u6296\u7684\u5e94\u7528\u300d\u91cc\u7684\u5e94\u7528\u4e2d\u9632\u6296"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "debAll"

    const/4 v8, 0x1

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/keymouse/tool/DebounceActivity;->addSwitchCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V


    const-string v1, "Choose apps to debounce..."

    const-string v2, "\u0412\u044b\u0431\u0440\u0430\u0442\u044c \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f..."

    const-string v3, "\u9632\u6296\u3059\u308b\u30a2\u30d7\u30ea\u3092\u9078\u3076..."

    const-string v4, "\u9009\u62e9\u9632\u6296\u7684\u5e94\u7528..."

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "With icons; used only when \"all apps\" is off"

    const-string v2, "\u0421 \u0438\u043a\u043e\u043d\u043a\u0430\u043c\u0438; \u0442\u043e\u043b\u044c\u043a\u043e \u0435\u0441\u043b\u0438 \u00ab\u0432\u0441\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f\u00bb \u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d\u043e"

    const-string v3, "\u30a2\u30a4\u30b3\u30f3\u4ed8\u304d\u3002\u300c\u3059\u3079\u3066\u306e\u30a2\u30d7\u30ea\u300d\u304c\u30aa\u30d5\u306e\u3068\u304d\u306e\u307f\u6709\u52b9"

    const-string v4, "\u5e26\u56fe\u6807\uff1b\u4ec5\u5728\u300c\u6240\u6709\u5e94\u7528\u90fd\u9632\u6296\u300d\u5173\u95ed\u65f6\u751f\u6548"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "apps"

    invoke-direct {p0, v5, v6, v7}, Lcom/keymouse/tool/DebounceActivity;->addCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V


    iput-object v10, p0, Lcom/keymouse/tool/DebounceActivity;->mParent:Landroid/widget/LinearLayout;

    const-string v1, "Restore recommended settings"

    const-string v2, "\u0412\u0435\u0440\u043d\u0443\u0442\u044c \u0440\u0435\u043a\u043e\u043c\u0435\u043d\u0434\u0443\u0435\u043c\u044b\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438"

    const-string v3, "\u63a8\u5968\u8a2d\u5b9a\u306b\u623b\u3059"

    const-string v4, "\u6062\u590d\u63a8\u8350\u8bbe\u7f6e"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "All switches, times and the key list go back to the recommended values"

    const-string v2, "\u0412\u0441\u0435 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0442\u0435\u043b\u0438, \u0432\u0440\u0435\u043c\u0435\u043d\u0430 \u0438 \u0441\u043f\u0438\u0441\u043e\u043a \u043a\u043b\u0430\u0432\u0438\u0448 \u2014 \u043f\u043e \u0443\u043c\u043e\u043b\u0447\u0430\u043d\u0438\u044e"

    const-string v3, "\u30b9\u30a4\u30c3\u30c1\u30fb\u6642\u9593\u30fb\u30ad\u30fc\u4e00\u89a7\u3092\u3059\u3079\u3066\u63a8\u5968\u5024\u306b\u623b\u3057\u307e\u3059"

    const-string v4, "\u5168\u90e8\u5f00\u5173\u3001\u65f6\u95f4\u548c\u6309\u952e\u5217\u8868\u6062\u590d\u4e3a\u63a8\u8350\u503c"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "reset"

    invoke-direct {p0, v5, v6, v7}, Lcom/keymouse/tool/DebounceActivity;->addCard(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V


    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->applyKeysOpen()V

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->applyAdv()V

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->updateAppsCard()V

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->syncEff()V

    invoke-virtual {p0, v9}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    const-string v1, "Debounce settings"

    const-string v2, "\u0417\u0430\u0449\u0438\u0442\u0430 \u043e\u0442 \u0434\u0440\u0435\u0431\u0435\u0437\u0433\u0430"

    const-string v3, "\u30c1\u30e3\u30bf\u30ea\u30f3\u30b0\u9632\u6b62\u8a2d\u5b9a"

    const-string v4, "\u9632\u6296\u8bbe\u7f6e"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/DebounceActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5


    invoke-virtual {p0, v5}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "reset"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_not_reset

    iget-object v1, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debGlobal"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debMouse"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debToggle"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debAll"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debMs"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debGhost"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debAdv"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debKeys"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "debKeysOpen"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1


    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->syncEff()V

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    return-void

    :cond_not_reset
    const-string v1, "apps"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_not_apps

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/keymouse/tool/DebAppsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_not_apps
    const-string v1, "add"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_not_add

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->showAddDialog()V

    return-void

    :cond_not_add
    const-string v1, "toggle:keys"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_not_toggle

    iget-object v1, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "debKeysOpen"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->applyKeysOpen()V

    return-void

    :cond_not_toggle
    const-string v1, "x:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_end

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    const/4 v3, 0x2

    invoke-direct {p0, v1, v3, v2}, Lcom/keymouse/tool/DebounceActivity;->keyOp(Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    :cond_end
    return-void
.end method

.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 6

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_down

    const/4 v0, 0x0

    return v0

    :cond_down
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v0

    if-nez v0, :cond_has

    const/4 v0, 0x1

    return v0

    :cond_has
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Landroid/view/KeyEvent;->keyCodeToString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "KEYCODE_"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-direct {p0, v1, v3, v2}, Lcom/keymouse/tool/DebounceActivity;->keyOp(Ljava/lang/String;ILjava/lang/String;)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    const/4 v0, 0x1

    return v0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 6

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "k:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_plain

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    if-eqz p2, :cond_off

    const/4 v3, 0x1

    goto :cond_do

    :cond_off
    const/4 v3, 0x0

    :cond_do
    invoke-direct {p0, v1, v3, v2}, Lcom/keymouse/tool/DebounceActivity;->keyOp(Ljava/lang/String;ILjava/lang/String;)V

    goto :cond_bg

    :cond_plain
    iget-object v1, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_bg
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-direct {p0, p2}, Lcom/keymouse/tool/DebounceActivity;->cardBg(Z)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const-string v2, "debAdv"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_noadv

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->applyAdv()V

    :cond_noadv
    const-string v2, "debAll"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_noall

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->updateAppsCard()V

    :cond_noall
    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->syncEff()V

    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 8

    mul-int/lit8 v0, p2, 0x5

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/keymouse/tool/DebounceActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " ms"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/keymouse/tool/DebounceActivity;->syncEff()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
