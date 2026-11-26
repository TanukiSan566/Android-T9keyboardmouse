.class Lcom/keymouse/tool/KeyCustomActivity$5;
.super Ljava/lang/Object;
.source "KeyCustomActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KeyCustomActivity;->rebuildList()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KeyCustomActivity;

.field final synthetic val$e:[I


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KeyCustomActivity;[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 286
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    iput-object p2, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->val$e:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 288
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$300(Lcom/keymouse/tool/KeyCustomActivity;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->val$e:[I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 289
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$400(Lcom/keymouse/tool/KeyCustomActivity;)V

    .line 290
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$500(Lcom/keymouse/tool/KeyCustomActivity;)V

    .line 291
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$600(Lcom/keymouse/tool/KeyCustomActivity;)V

    .line 292
    return-void
.end method
