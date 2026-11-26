.class Lcom/keymouse/tool/CursorActivity$6;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 227
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$6;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$6;->this$0:Lcom/keymouse/tool/CursorActivity;

    check-cast p1, Landroid/widget/Button;

    invoke-static {v0, p1}, Lcom/keymouse/tool/CursorActivity;->access$600(Lcom/keymouse/tool/CursorActivity;Landroid/widget/Button;)V

    .line 230
    return-void
.end method
