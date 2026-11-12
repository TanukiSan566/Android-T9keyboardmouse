.class Lcom/keymouse/tool/SpeedSliders$1;
.super Ljava/lang/Object;
.source "SpeedSliders.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/SpeedSliders;->build(Landroid/content/Context;I)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$idx:I

.field final synthetic val$lbl:Landroid/widget/TextView;

.field final synthetic val$min:I

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$step:I

.field final synthetic val$unit:I

.field final synthetic val$vals:[I


# direct methods
.method constructor <init>([IIIILandroid/widget/TextView;Ljava/lang/String;ILandroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 122
    iput-object p1, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$vals:[I

    iput p2, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$idx:I

    iput p3, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$min:I

    iput p4, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$step:I

    iput-object p5, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$lbl:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$name:Ljava/lang/String;

    iput p7, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$unit:I

    iput-object p8, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    .prologue
    .line 124
    iget-object v0, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$vals:[I

    iget v1, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$idx:I

    iget v2, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$min:I

    iget v3, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$step:I

    mul-int/2addr v3, p2

    add-int/2addr v2, v3

    aput v2, v0, v1

    .line 125
    iget-object v0, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$lbl:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$vals:[I

    iget v3, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$idx:I

    aget v2, v2, v3

    iget v3, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$unit:I

    invoke-static {v2, v3}, Lcom/keymouse/tool/SpeedSliders;->access$000(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    if-eqz p3, :cond_0

    .line 127
    iget-object v0, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$vals:[I

    invoke-static {v0, v1}, Lcom/keymouse/tool/SpeedSliders;->access$100(Landroid/content/Context;[I)V

    .line 129
    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .prologue
    .line 132
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/keymouse/tool/SpeedSliders$1;->val$vals:[I

    invoke-static {v0, v1}, Lcom/keymouse/tool/SpeedSliders;->access$100(Landroid/content/Context;[I)V

    .line 136
    return-void
.end method
