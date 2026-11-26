.class Lcom/keymouse/tool/CursorActivity$18;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->smartToggled(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;

.field final synthetic val$c:Z


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 697
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$18;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-boolean p2, p0, Lcom/keymouse/tool/CursorActivity$18;->val$c:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 699
    iget-boolean v0, p0, Lcom/keymouse/tool/CursorActivity$18;->val$c:Z

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->setA11y(Z)Z

    move-result v0

    .line 700
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$18;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v1}, Lcom/keymouse/tool/CursorActivity;->access$1900(Lcom/keymouse/tool/CursorActivity;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/keymouse/tool/CursorActivity$18$1;

    invoke-direct {v2, p0, v0}, Lcom/keymouse/tool/CursorActivity$18$1;-><init>(Lcom/keymouse/tool/CursorActivity$18;Z)V

    const-wide/16 v4, 0x320

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 710
    return-void
.end method
