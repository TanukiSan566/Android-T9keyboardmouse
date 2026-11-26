.class Lcom/keymouse/tool/CursorHit$1;
.super Ljava/lang/Object;
.source "CursorHit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorHit;->startQuery(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 63
    iput p1, p0, Lcom/keymouse/tool/CursorHit$1;->val$x:I

    iput p2, p0, Lcom/keymouse/tool/CursorHit$1;->val$y:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 65
    .line 67
    :try_start_0
    sget-object v0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    .line 68
    if-eqz v0, :cond_0

    .line 69
    iget v2, p0, Lcom/keymouse/tool/CursorHit$1;->val$x:I

    iget v3, p0, Lcom/keymouse/tool/CursorHit$1;->val$y:I

    invoke-virtual {v0, v2, v3}, Lcom/keymouse/tool/CursorA11yService;->probe(II)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 74
    :goto_0
    invoke-static {v0}, Lcom/keymouse/tool/CursorHit;->access$002(I)I

    .line 75
    iget v0, p0, Lcom/keymouse/tool/CursorHit$1;->val$x:I

    invoke-static {v0}, Lcom/keymouse/tool/CursorHit;->access$102(I)I

    .line 76
    iget v0, p0, Lcom/keymouse/tool/CursorHit$1;->val$y:I

    invoke-static {v0}, Lcom/keymouse/tool/CursorHit;->access$202(I)I

    .line 77
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/keymouse/tool/CursorHit;->access$302(J)J

    .line 78
    invoke-static {v1}, Lcom/keymouse/tool/CursorHit;->access$402(Z)Z

    .line 79
    return-void

    .line 71
    :catch_0
    move-exception v0

    move v0, v1

    .line 72
    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_0
.end method
