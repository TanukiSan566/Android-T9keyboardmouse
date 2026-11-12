.class Lcom/keymouse/tool/KeyCustomActivity$1;
.super Ljava/lang/Object;
.source "KeyCustomActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KeyCustomActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KeyCustomActivity;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KeyCustomActivity;)V
    .registers 2

    .prologue
    .line 69
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity$1;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 6

    .prologue
    .line 71
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$1;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    const-string v2, "kmOn"

    if-eqz p2, :cond_c

    const-string v0, "1"

    :goto_8
    # invokes: Lcom/keymouse/tool/KeyCustomActivity;->put(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v2, v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$000(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    return-void

    .line 71
    :cond_c
    const-string v0, "0"

    goto :goto_8
.end method
