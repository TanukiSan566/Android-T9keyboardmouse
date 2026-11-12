.class final Lcom/keymouse/tool/ChoiceRow$Click;
.super Ljava/lang/Object;
.source "ChoiceRow.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keymouse/tool/ChoiceRow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Click"
.end annotation


# instance fields
.field private final d:F

.field private final fg:I

.field private final off:Landroid/widget/TextView;

.field private final on:Landroid/widget/TextView;

.field private final sw:Landroid/widget/CompoundButton;


# direct methods
.method constructor <init>(Landroid/widget/CompoundButton;Landroid/widget/TextView;Landroid/widget/TextView;FI)V
    .registers 6

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput p5, p0, Lcom/keymouse/tool/ChoiceRow$Click;->fg:I

    .line 102
    iput-object p1, p0, Lcom/keymouse/tool/ChoiceRow$Click;->sw:Landroid/widget/CompoundButton;

    .line 103
    iput-object p2, p0, Lcom/keymouse/tool/ChoiceRow$Click;->on:Landroid/widget/TextView;

    .line 104
    iput-object p3, p0, Lcom/keymouse/tool/ChoiceRow$Click;->off:Landroid/widget/TextView;

    .line 105
    iput p4, p0, Lcom/keymouse/tool/ChoiceRow$Click;->d:F

    .line 106
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7

    .prologue
    .line 109
    iget-object v0, p0, Lcom/keymouse/tool/ChoiceRow$Click;->on:Landroid/widget/TextView;

    if-ne p1, v0, :cond_16

    const/4 v0, 0x1

    .line 110
    :goto_5
    iget-object v1, p0, Lcom/keymouse/tool/ChoiceRow$Click;->sw:Landroid/widget/CompoundButton;

    invoke-virtual {v1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 111
    iget-object v1, p0, Lcom/keymouse/tool/ChoiceRow$Click;->on:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/keymouse/tool/ChoiceRow$Click;->off:Landroid/widget/TextView;

    iget v3, p0, Lcom/keymouse/tool/ChoiceRow$Click;->d:F

    iget v4, p0, Lcom/keymouse/tool/ChoiceRow$Click;->fg:I

    invoke-static {v1, v2, v0, v3, v4}, Lcom/keymouse/tool/ChoiceRow;->paint(Landroid/widget/TextView;Landroid/widget/TextView;ZFI)V

    .line 112
    return-void

    .line 109
    :cond_16
    const/4 v0, 0x0

    goto :goto_5
.end method
