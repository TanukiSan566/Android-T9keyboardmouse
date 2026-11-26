.class Lcom/keymouse/tool/KeyCustomActivity$4;
.super Ljava/lang/Object;
.source "KeyCustomActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 242
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity$4;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .prologue
    .line 244
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$4;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity$4;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    const-class v3, Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/keymouse/tool/KeyCustomActivity;->startActivity(Landroid/content/Intent;)V

    .line 245
    return-void
.end method
