.class Lcom/keymouse/tool/CursorActivity$16$1;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity$16;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keymouse/tool/CursorActivity$16;

.field final synthetic val$ok:Z


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity$16;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 595
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$16$1;->this$1:Lcom/keymouse/tool/CursorActivity$16;

    iput-boolean p2, p0, Lcom/keymouse/tool/CursorActivity$16$1;->val$ok:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 597
    iget-boolean v0, p0, Lcom/keymouse/tool/CursorActivity$16$1;->val$ok:Z

    if-nez v0, :cond_0

    .line 598
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$16$1;->this$1:Lcom/keymouse/tool/CursorActivity$16;

    iget-object v0, v0, Lcom/keymouse/tool/CursorActivity$16;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$16$1;->this$1:Lcom/keymouse/tool/CursorActivity$16;

    iget-object v1, v1, Lcom/keymouse/tool/CursorActivity$16;->this$0:Lcom/keymouse/tool/CursorActivity;

    const-string v2, "\u81ea\u52a8\u5f00\u542f\u65e0\u969c\u788d\u5931\u8d25(\u6ca1\u6709 root \u6743\u9650\uff1f)\uff0c\u8bf7\u624b\u52a8\u5230 \u7cfb\u7edf\u8bbe\u7f6e > \u65e0\u969c\u788d \u5f00\u542f KeyMouse"

    const-string v3, "\u81ea\u52d5\u6709\u52b9\u5316\u306b\u5931\u6557(root \u306a\u3057\uff1f)\u3002\u8a2d\u5b9a > \u30e6\u30fc\u30b6\u30fc\u88dc\u52a9 \u3067 KeyMouse \u3092\u6709\u52b9\u306b\u3057\u3066\u304f\u3060\u3055\u3044"

    const-string v4, "Auto-enable failed (no root?). Enable KeyMouse in Settings > Accessibility."

    invoke-static {v1, v2, v3, v4}, Lcom/keymouse/tool/CursorActivity;->access$400(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 600
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 602
    :cond_0
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$16$1;->this$1:Lcom/keymouse/tool/CursorActivity$16;

    iget-object v0, v0, Lcom/keymouse/tool/CursorActivity$16;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$1600(Lcom/keymouse/tool/CursorActivity;)V

    .line 603
    return-void
.end method
