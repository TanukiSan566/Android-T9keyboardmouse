.class Lcom/keymouse/tool/CursorActivity$13;
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
    .line 530
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$13;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-object p2, p0, Lcom/keymouse/tool/CursorActivity$13;->val$slot:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .prologue
    .line 532
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$13;->this$0:Lcom/keymouse/tool/CursorActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hs_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$13;->val$slot:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$13;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity$13;->val$slot:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/keymouse/tool/CursorActivity;->access$1300(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    rem-int/lit8 v2, v2, 0x3

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->access$100(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$13;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$1100(Lcom/keymouse/tool/CursorActivity;)V

    .line 534
    return-void
.end method
