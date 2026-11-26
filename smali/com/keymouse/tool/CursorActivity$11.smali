.class Lcom/keymouse/tool/CursorActivity$11;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->showThemeDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;

.field final synthetic val$items:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 495
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$11;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-object p2, p0, Lcom/keymouse/tool/CursorActivity$11;->val$items:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .prologue
    .line 497
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$11;->val$items:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 498
    instance-of v1, v0, [Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 499
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$11;->this$0:Lcom/keymouse/tool/CursorActivity;

    check-cast v0, [Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/keymouse/tool/CursorActivity;->access$1200(Lcom/keymouse/tool/CursorActivity;[Ljava/lang/String;)V

    .line 501
    :cond_0
    return-void
.end method
