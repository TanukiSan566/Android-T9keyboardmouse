.class Lcom/keymouse/tool/CursorActivity$9;
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
    .line 360
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$9;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-object p2, p0, Lcom/keymouse/tool/CursorActivity$9;->val$slot:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 362
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$9;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$9;->val$slot:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/keymouse/tool/CursorActivity;->access$700(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    .line 363
    return-void
.end method
