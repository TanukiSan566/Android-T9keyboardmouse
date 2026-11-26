.class Lcom/keymouse/tool/KeyCustomCard$1;
.super Ljava/lang/Object;
.source "KeyCustomCard.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KeyCustomCard;->build(Landroid/app/Activity;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 86
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomCard$1;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .prologue
    .line 88
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomCard$1;->val$a:Landroid/app/Activity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomCard$1;->val$a:Landroid/app/Activity;

    const-class v3, Lcom/keymouse/tool/KeyCustomActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 89
    return-void
.end method
