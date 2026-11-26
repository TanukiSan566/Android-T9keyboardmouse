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
    .line 82
    iput p1, p0, Lcom/keymouse/tool/CursorHit$1;->val$x:I

    iput p2, p0, Lcom/keymouse/tool/CursorHit$1;->val$y:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 84
    .line 86
    :try_start_0
    sget-object v1, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    .line 87
    if-eqz v1, :cond_0

    .line 88
    iget v2, p0, Lcom/keymouse/tool/CursorHit$1;->val$x:I

    iget v3, p0, Lcom/keymouse/tool/CursorHit$1;->val$y:I

    invoke-virtual {v1, v2, v3}, Lcom/keymouse/tool/CursorA11yService;->probe(II)[I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 93
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 94
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 96
    :cond_1
    invoke-static {v0}, Lcom/keymouse/tool/CursorHit;->access$002([I)[I

    .line 97
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/keymouse/tool/CursorHit;->access$102(J)J

    .line 98
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/keymouse/tool/CursorHit;->access$202(Z)Z

    .line 99
    return-void

    .line 90
    :catch_0
    move-exception v1

    goto :goto_0

    .line 94
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method
