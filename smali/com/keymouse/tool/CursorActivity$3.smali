.class Lcom/keymouse/tool/CursorActivity$3;
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
    .line 149
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$3;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$3;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$000(Lcom/keymouse/tool/CursorActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$3;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0, p2}, Lcom/keymouse/tool/CursorActivity;->access$200(Lcom/keymouse/tool/CursorActivity;Z)V

    .line 154
    :cond_0
    return-void
.end method
