.class Lcom/keymouse/tool/ToggleKeys$8;
.super Ljava/lang/Object;
.source "ToggleKeys.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/ToggleKeys;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$h:Landroid/os/Handler;

.field final synthetic val$tick:[Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/os/Handler;[Ljava/lang/Runnable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 368
    iput-object p1, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$h:Landroid/os/Handler;

    iput-object p2, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$tick:[Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 370
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$tick:[Ljava/lang/Runnable;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 371
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$tick:[Ljava/lang/Runnable;

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 372
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 5

    .prologue
    .line 375
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$tick:[Ljava/lang/Runnable;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 376
    return-void
.end method
