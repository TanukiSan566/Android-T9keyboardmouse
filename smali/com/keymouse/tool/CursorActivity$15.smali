.class Lcom/keymouse/tool/CursorActivity$15;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->doImport(Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;

.field final synthetic val$btn:Landroid/widget/Button;

.field final synthetic val$old:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;Landroid/widget/Button;Ljava/lang/CharSequence;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 572
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$15;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-object p2, p0, Lcom/keymouse/tool/CursorActivity$15;->val$btn:Landroid/widget/Button;

    iput-object p3, p0, Lcom/keymouse/tool/CursorActivity$15;->val$old:Ljava/lang/CharSequence;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 574
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$15;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->importLib(Landroid/content/Context;)Z

    move-result v0

    .line 575
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$15;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v1}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/keymouse/tool/CursorActivity$15$1;

    invoke-direct {v2, p0, v0}, Lcom/keymouse/tool/CursorActivity$15$1;-><init>(Lcom/keymouse/tool/CursorActivity$15;Z)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 585
    return-void
.end method
