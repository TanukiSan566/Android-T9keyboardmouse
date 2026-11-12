.class Lcom/keymouse/tool/SoftSwitch$7;
.super Ljava/lang/Object;
.source "SoftSwitch.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/SoftSwitch;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$h:Landroid/os/Handler;

.field final synthetic val$poll:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 223
    iput-object p1, p0, Lcom/keymouse/tool/SoftSwitch$7;->val$h:Landroid/os/Handler;

    iput-object p2, p0, Lcom/keymouse/tool/SoftSwitch$7;->val$poll:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 4

    .prologue
    .line 225
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$7;->val$h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/SoftSwitch$7;->val$poll:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 226
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$7;->val$h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/SoftSwitch$7;->val$poll:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 227
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 4

    .prologue
    .line 230
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$7;->val$h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/SoftSwitch$7;->val$poll:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 231
    return-void
.end method
