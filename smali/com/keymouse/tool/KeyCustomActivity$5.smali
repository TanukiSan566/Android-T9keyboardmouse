.class Lcom/keymouse/tool/KeyCustomActivity$5;
.super Ljava/lang/Object;
.source "KeyCustomActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KeyCustomActivity;->sceneRow(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KeyCustomActivity;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 205
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    iput-object p2, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 6

    .prologue
    .line 207
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity$5;->val$key:Ljava/lang/String;

    if-eqz p2, :cond_c

    const-string v0, "1"

    :goto_8
    # invokes: Lcom/keymouse/tool/KeyCustomActivity;->put(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v2, v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$000(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    return-void

    .line 207
    :cond_c
    const-string v0, "0"

    goto :goto_8
.end method
