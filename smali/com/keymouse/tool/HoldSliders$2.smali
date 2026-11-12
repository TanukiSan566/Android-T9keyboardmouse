.class Lcom/keymouse/tool/HoldSliders$2;
.super Ljava/lang/Object;
.source "HoldSliders.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/HoldSliders;->build(Landroid/content/Context;I)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$idx:I

.field final synthetic val$lang:I

.field final synthetic val$lbl:Landroid/widget/TextView;

.field final synthetic val$min:I

.field final synthetic val$ms:[I

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(I[IILandroid/widget/TextView;Ljava/lang/String;ILandroid/content/Context;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 135
    iput p1, p0, Lcom/keymouse/tool/HoldSliders$2;->val$min:I

    iput-object p2, p0, Lcom/keymouse/tool/HoldSliders$2;->val$ms:[I

    iput p3, p0, Lcom/keymouse/tool/HoldSliders$2;->val$idx:I

    iput-object p4, p0, Lcom/keymouse/tool/HoldSliders$2;->val$lbl:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/keymouse/tool/HoldSliders$2;->val$name:Ljava/lang/String;

    iput p6, p0, Lcom/keymouse/tool/HoldSliders$2;->val$lang:I

    iput-object p7, p0, Lcom/keymouse/tool/HoldSliders$2;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 8

    .prologue
    .line 137
    iget v0, p0, Lcom/keymouse/tool/HoldSliders$2;->val$min:I

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 138
    iget-object v1, p0, Lcom/keymouse/tool/HoldSliders$2;->val$ms:[I

    iget v2, p0, Lcom/keymouse/tool/HoldSliders$2;->val$idx:I

    mul-int/lit8 v0, v0, 0x64

    aput v0, v1, v2

    .line 139
    iget-object v0, p0, Lcom/keymouse/tool/HoldSliders$2;->val$lbl:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/keymouse/tool/HoldSliders$2;->val$name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/keymouse/tool/HoldSliders$2;->val$ms:[I

    iget v3, p0, Lcom/keymouse/tool/HoldSliders$2;->val$idx:I

    aget v2, v2, v3

    iget v3, p0, Lcom/keymouse/tool/HoldSliders$2;->val$lang:I

    # invokes: Lcom/keymouse/tool/HoldSliders;->fmt(II)Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/keymouse/tool/HoldSliders;->access$200(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    if-eqz p3, :cond_41

    .line 141
    iget-object v0, p0, Lcom/keymouse/tool/HoldSliders$2;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/keymouse/tool/HoldSliders$2;->val$ms:[I

    # invokes: Lcom/keymouse/tool/HoldSliders;->save(Landroid/content/Context;[I)V
    invoke-static {v0, v1}, Lcom/keymouse/tool/HoldSliders;->access$100(Landroid/content/Context;[I)V

    .line 143
    :cond_41
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .prologue
    .line 146
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 4

    .prologue
    .line 149
    iget-object v0, p0, Lcom/keymouse/tool/HoldSliders$2;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/keymouse/tool/HoldSliders$2;->val$ms:[I

    # invokes: Lcom/keymouse/tool/HoldSliders;->save(Landroid/content/Context;[I)V
    invoke-static {v0, v1}, Lcom/keymouse/tool/HoldSliders;->access$100(Landroid/content/Context;[I)V

    .line 150
    return-void
.end method
