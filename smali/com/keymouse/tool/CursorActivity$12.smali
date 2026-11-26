.class Lcom/keymouse/tool/CursorActivity$12;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->rebuildSlots()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;

.field final synthetic val$slot:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 519
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$12;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-object p2, p0, Lcom/keymouse/tool/CursorActivity$12;->val$slot:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 521
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$12;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$12;->val$slot:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->access$100(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 522
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$12;->this$0:Lcom/keymouse/tool/CursorActivity;

    const-string v1, "theme"

    invoke-static {v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->access$100(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$12;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$1100(Lcom/keymouse/tool/CursorActivity;)V

    .line 524
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$12;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$1200(Lcom/keymouse/tool/CursorActivity;)V

    .line 525
    return-void
.end method
