.class Lcom/keymouse/tool/CursorActivity$1;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    .line 109
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$1;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3

    .prologue
    .line 111
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$1;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$000(Lcom/keymouse/tool/CursorActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 112
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$1;->this$0:Lcom/keymouse/tool/CursorActivity;

    const-string v2, "on"

    if-eqz p2, :cond_1

    const-string v0, "1"

    :goto_0
    invoke-static {v1, v2, v0}, Lcom/keymouse/tool/CursorActivity;->access$100(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    :cond_0
    return-void

    .line 112
    :cond_1
    const-string v0, "0"

    goto :goto_0
.end method
