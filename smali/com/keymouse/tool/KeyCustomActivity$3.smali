.class Lcom/keymouse/tool/KeyCustomActivity$3;
.super Ljava/lang/Object;
.source "KeyCustomActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KeyCustomActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KeyCustomActivity;

.field final synthetic val$holdWord:Ljava/lang/String;

.field final synthetic val$lbl:Landroid/widget/TextView;

.field final synthetic val$msKey:Ljava/lang/String;

.field final synthetic val$secWord:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KeyCustomActivity;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 131
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    iput-object p2, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->val$lbl:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->val$holdWord:Ljava/lang/String;

    iput-object p4, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->val$secWord:Ljava/lang/String;

    iput-object p5, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->val$msKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 8

    .prologue
    .line 133
    add-int/lit8 v0, p2, 0x5

    mul-int/lit8 v0, v0, 0x64

    .line 134
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->val$lbl:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->val$holdWord:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # invokes: Lcom/keymouse/tool/KeyCustomActivity;->fmt(I)Ljava/lang/String;
    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$100(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->val$secWord:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    if-eqz p3, :cond_39

    .line 136
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity$3;->val$msKey:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    # invokes: Lcom/keymouse/tool/KeyCustomActivity;->put(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v2, v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$000(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    :cond_39
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .prologue
    .line 141
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .prologue
    .line 144
    return-void
.end method
