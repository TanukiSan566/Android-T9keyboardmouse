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
    .locals 0

    .prologue
    .line 144
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity$1;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3

    .prologue
    .line 146
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$1;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    const-string v2, "kmOn"

    if-eqz p2, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-static {v1, v2, v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$000(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    return-void

    .line 146
    :cond_0
    const-string v0, "0"

    goto :goto_0
.end method
