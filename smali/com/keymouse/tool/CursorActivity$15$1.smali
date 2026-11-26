.class Lcom/keymouse/tool/CursorActivity$15$1;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity$15;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keymouse/tool/CursorActivity$15;

.field final synthetic val$ok:Z


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity$15;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 575
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$15$1;->this$1:Lcom/keymouse/tool/CursorActivity$15;

    iput-boolean p2, p0, Lcom/keymouse/tool/CursorActivity$15$1;->val$ok:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 577
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$15$1;->this$1:Lcom/keymouse/tool/CursorActivity$15;

    iget-object v0, v0, Lcom/keymouse/tool/CursorActivity$15;->val$btn:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 578
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$15$1;->this$1:Lcom/keymouse/tool/CursorActivity$15;

    iget-object v0, v0, Lcom/keymouse/tool/CursorActivity$15;->val$btn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$15$1;->this$1:Lcom/keymouse/tool/CursorActivity$15;

    iget-object v1, v1, Lcom/keymouse/tool/CursorActivity$15;->val$old:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 579
    iget-boolean v0, p0, Lcom/keymouse/tool/CursorActivity$15$1;->val$ok:Z

    if-nez v0, :cond_0

    .line 580
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$15$1;->this$1:Lcom/keymouse/tool/CursorActivity$15;

    iget-object v0, v0, Lcom/keymouse/tool/CursorActivity$15;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$15$1;->this$1:Lcom/keymouse/tool/CursorActivity$15;

    iget-object v1, v1, Lcom/keymouse/tool/CursorActivity$15;->this$0:Lcom/keymouse/tool/CursorActivity;

    const-string v2, "\u5bfc\u5165\u5931\u8d25(\u6ca1\u6709 root \u6743\u9650\uff1f)"

    const-string v3, "\u53d6\u308a\u8fbc\u307f\u5931\u6557(root \u6a29\u9650\u306a\u3057\uff1f)"

    const-string v4, "Import failed (no root?)"

    invoke-static {v1, v2, v3, v4}, Lcom/keymouse/tool/CursorActivity;->access$400(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 582
    :cond_0
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$15$1;->this$1:Lcom/keymouse/tool/CursorActivity$15;

    iget-object v0, v0, Lcom/keymouse/tool/CursorActivity$15;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$1500(Lcom/keymouse/tool/CursorActivity;)V

    .line 583
    return-void
.end method
