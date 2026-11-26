.class Lcom/keymouse/tool/KeyCustomActivity$7;
.super Ljava/lang/Object;
.source "KeyCustomActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keymouse/tool/KeyCustomActivity;
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
    .line 373
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 375
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$800(Lcom/keymouse/tool/KeyCustomActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 393
    :goto_0
    return-void

    .line 378
    :cond_0
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$900(Lcom/keymouse/tool/KeyCustomActivity;)[Ljava/lang/String;

    move-result-object v0

    .line 379
    if-eqz v0, :cond_1

    array-length v1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_1

    aget-object v1, v0, v4

    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v2}, Lcom/keymouse/tool/KeyCustomActivity;->access$1000(Lcom/keymouse/tool/KeyCustomActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 380
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    aget-object v2, v0, v4

    invoke-static {v1, v2}, Lcom/keymouse/tool/KeyCustomActivity;->access$1002(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 381
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v1, v4}, Lcom/keymouse/tool/KeyCustomActivity;->access$802(Lcom/keymouse/tool/KeyCustomActivity;Z)Z

    .line 382
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v1, v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$1100(Lcom/keymouse/tool/KeyCustomActivity;[Ljava/lang/String;)V

    .line 383
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$600(Lcom/keymouse/tool/KeyCustomActivity;)V

    goto :goto_0

    .line 386
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v2}, Lcom/keymouse/tool/KeyCustomActivity;->access$1200(Lcom/keymouse/tool/KeyCustomActivity;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x2710

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 388
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->access$802(Lcom/keymouse/tool/KeyCustomActivity;Z)Z

    .line 389
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$600(Lcom/keymouse/tool/KeyCustomActivity;)V

    goto :goto_0

    .line 392
    :cond_2
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$7;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$1300(Lcom/keymouse/tool/KeyCustomActivity;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
