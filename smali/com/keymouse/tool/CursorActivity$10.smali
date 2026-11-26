.class Lcom/keymouse/tool/CursorActivity$10;
.super Landroid/widget/BaseAdapter;
.source "CursorActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->showThemeDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;

.field final synthetic val$cur:Ljava/lang/String;

.field final synthetic val$items:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 446
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-object p2, p0, Lcom/keymouse/tool/CursorActivity$10;->val$items:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/keymouse/tool/CursorActivity$10;->val$cur:Ljava/lang/String;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$10;->val$items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 452
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$10;->val$items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    .prologue
    .line 456
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10

    .prologue
    const/16 v9, 0x8

    const/4 v8, 0x6

    const/4 v7, 0x1

    const/16 v5, 0xa

    const/4 v6, 0x0

    .line 464
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$10;->val$items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 465
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 466
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 467
    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 468
    const/high16 v2, 0x3f400000    # 0.75f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 469
    const v2, 0x22808080

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 470
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v2, v5}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v2

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v3, v8}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v3

    iget-object v4, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v4, v5}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v4

    iget-object v5, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v5, v8}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 471
    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v0, v1

    .line 490
    :goto_0
    return-object v0

    .line 474
    :cond_0
    check-cast v0, [Ljava/lang/String;

    .line 475
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 476
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 477
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v2, v5}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v2

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v3, v9}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v3

    iget-object v4, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v4, v5}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v4

    iget-object v5, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v5, v9}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 478
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 479
    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 480
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    const/4 v4, 0x4

    invoke-static {v3, v4}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v3

    invoke-virtual {v2, v6, v6, v6, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 481
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v3, v0}, Lcom/keymouse/tool/CursorCfg;->themeName(Landroid/content/Context;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 482
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 483
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    aget-object v4, v0, v6

    invoke-static {v3, v4}, Lcom/keymouse/tool/CursorActivity;->access$1000(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)[Landroid/graphics/Bitmap;

    move-result-object v3

    const/16 v4, 0x1e

    invoke-static {v2, v3, v4}, Lcom/keymouse/tool/CursorActivity;->access$1100(Lcom/keymouse/tool/CursorActivity;[Landroid/graphics/Bitmap;I)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 484
    aget-object v0, v0, v6

    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$10;->val$cur:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 485
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 486
    const v2, 0x331b8a3a

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 487
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$10;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v2, v7}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;I)I

    move-result v2

    const v3, -0xe475c6

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 488
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    move-object v0, v1

    .line 490
    goto/16 :goto_0
.end method

.method public isEnabled(I)Z
    .locals 1

    .prologue
    .line 460
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$10;->val$items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, [Ljava/lang/String;

    return v0
.end method
