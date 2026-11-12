.class public Lcom/keymouse/tool/OverlayDismiss;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "OverlayDismiss.java"


# instance fields
.field private mWm:Landroid/view/WindowManager;

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/WindowManager;Landroid/view/View;)V
    .locals 0
    .param p1, "wm"    # Landroid/view/WindowManager;
    .param p2, "view"    # Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/keymouse/tool/OverlayDismiss;->mWm:Landroid/view/WindowManager;

    iput-object p2, p0, Lcom/keymouse/tool/OverlayDismiss;->mView:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/keymouse/tool/OverlayDismiss;->mWm:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/keymouse/tool/OverlayDismiss;->mView:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    return-void
.end method
