.class Lcom/keymouse/tool/KeepAliveService$1;
.super Ljava/lang/Object;
.source "KeepAliveService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keymouse/tool/KeepAliveService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KeepAliveService;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KeepAliveService;)V
    .registers 2

    .prologue
    .line 23
    iput-object p1, p0, Lcom/keymouse/tool/KeepAliveService$1;->this$0:Lcom/keymouse/tool/KeepAliveService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 26
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/keymouse/tool/KeepAliveService$1;->this$0:Lcom/keymouse/tool/KeepAliveService;

    # getter for: Lcom/keymouse/tool/KeepAliveService;->alive:Ljava/io/File;
    invoke-static {v1}, Lcom/keymouse/tool/KeepAliveService;->access$000(Lcom/keymouse/tool/KeepAliveService;)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 28
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 29
    iget-object v0, p0, Lcom/keymouse/tool/KeepAliveService$1;->this$0:Lcom/keymouse/tool/KeepAliveService;

    # getter for: Lcom/keymouse/tool/KeepAliveService;->alive:Ljava/io/File;
    invoke-static {v0}, Lcom/keymouse/tool/KeepAliveService;->access$000(Lcom/keymouse/tool/KeepAliveService;)Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setReadable(ZZ)Z
    :try_end_37
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_37} :catch_4b

    .line 33
    :goto_37
    iget-object v0, p0, Lcom/keymouse/tool/KeepAliveService$1;->this$0:Lcom/keymouse/tool/KeepAliveService;

    # getter for: Lcom/keymouse/tool/KeepAliveService;->h:Landroid/os/Handler;
    invoke-static {v0}, Lcom/keymouse/tool/KeepAliveService;->access$100(Lcom/keymouse/tool/KeepAliveService;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_4a

    iget-object v0, p0, Lcom/keymouse/tool/KeepAliveService$1;->this$0:Lcom/keymouse/tool/KeepAliveService;

    # getter for: Lcom/keymouse/tool/KeepAliveService;->h:Landroid/os/Handler;
    invoke-static {v0}, Lcom/keymouse/tool/KeepAliveService;->access$100(Lcom/keymouse/tool/KeepAliveService;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 34
    :cond_4a
    return-void

    .line 30
    :catch_4b
    move-exception v0

    goto :goto_37
.end method
