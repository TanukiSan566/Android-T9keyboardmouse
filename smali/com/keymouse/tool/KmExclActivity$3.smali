.class Lcom/keymouse/tool/KmExclActivity$3;
.super Landroid/widget/BaseAdapter;
.source "KmExclActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KmExclActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KmExclActivity;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KmExclActivity;)V
    .registers 2

    .prologue
    .line 129
    iput-object p1, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$300(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 135
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$300(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4

    .prologue
    .line 139
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 144
    if-nez p2, :cond_f1

    .line 145
    new-instance p2, Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 146
    invoke-virtual {p2, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 147
    const/16 v0, 0x10

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 148
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    const/4 v1, 0x6

    # invokes: Lcom/keymouse/tool/KmExclActivity;->dp(I)I
    invoke-static {v0, v1}, Lcom/keymouse/tool/KmExclActivity;->access$400(Lcom/keymouse/tool/KmExclActivity;I)I

    move-result v0

    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    const/4 v2, 0x6

    # invokes: Lcom/keymouse/tool/KmExclActivity;->dp(I)I
    invoke-static {v1, v2}, Lcom/keymouse/tool/KmExclActivity;->access$400(Lcom/keymouse/tool/KmExclActivity;I)I

    move-result v1

    invoke-virtual {p2, v5, v0, v5, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 149
    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 150
    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setId(I)V

    .line 151
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    const/16 v3, 0x28

    # invokes: Lcom/keymouse/tool/KmExclActivity;->dp(I)I
    invoke-static {v2, v3}, Lcom/keymouse/tool/KmExclActivity;->access$400(Lcom/keymouse/tool/KmExclActivity;I)I

    move-result v2

    iget-object v3, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    const/16 v4, 0x28

    # invokes: Lcom/keymouse/tool/KmExclActivity;->dp(I)I
    invoke-static {v3, v4}, Lcom/keymouse/tool/KmExclActivity;->access$400(Lcom/keymouse/tool/KmExclActivity;I)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 153
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 154
    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    const/16 v2, 0xc

    # invokes: Lcom/keymouse/tool/KmExclActivity;->dp(I)I
    invoke-static {v1, v2}, Lcom/keymouse/tool/KmExclActivity;->access$400(Lcom/keymouse/tool/KmExclActivity;I)I

    move-result v1

    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    const/16 v3, 0x8

    # invokes: Lcom/keymouse/tool/KmExclActivity;->dp(I)I
    invoke-static {v2, v3}, Lcom/keymouse/tool/KmExclActivity;->access$400(Lcom/keymouse/tool/KmExclActivity;I)I

    move-result v2

    invoke-virtual {v0, v1, v5, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 155
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 156
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setId(I)V

    .line 157
    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 158
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 159
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 160
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setId(I)V

    .line 161
    const/high16 v3, 0x41300000    # 11.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 162
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 163
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 164
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 165
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v5, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    new-instance v0, Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 167
    invoke-virtual {v0, v9}, Landroid/widget/CheckBox;->setId(I)V

    .line 168
    invoke-virtual {v0, v5}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 169
    invoke-virtual {v0, v5}, Landroid/widget/CheckBox;->setFocusable(Z)V

    .line 170
    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 174
    :goto_ae
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$300(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keymouse/tool/KmExclActivity$Item;

    .line 175
    invoke-virtual {p2, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iget-object v2, v0, Lcom/keymouse/tool/KmExclActivity$Item;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 176
    invoke-virtual {p2, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, v0, Lcom/keymouse/tool/KmExclActivity$Item;->label:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    invoke-virtual {p2, v8}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, v0, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    invoke-virtual {p2, v9}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity$3;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;
    invoke-static {v2}, Lcom/keymouse/tool/KmExclActivity;->access$500(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/Set;

    move-result-object v2

    iget-object v0, v0, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 179
    return-object p2

    .line 172
    :cond_f1
    check-cast p2, Landroid/widget/LinearLayout;

    goto :goto_ae
.end method
