.class public Lcom/keymouse/tool/KeepAliveService;
.super Landroid/app/Service;
.source "KeepAliveService.java"


# instance fields
.field private alive:Ljava/io/File;

.field private final beat:Ljava/lang/Runnable;

.field private h:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 23
    new-instance v0, Lcom/keymouse/tool/KeepAliveService$1;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/KeepAliveService$1;-><init>(Lcom/keymouse/tool/KeepAliveService;)V

    iput-object v0, p0, Lcom/keymouse/tool/KeepAliveService;->beat:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/keymouse/tool/KeepAliveService;)Ljava/io/File;
    .registers 2

    .prologue
    .line 20
    iget-object v0, p0, Lcom/keymouse/tool/KeepAliveService;->alive:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$100(Lcom/keymouse/tool/KeepAliveService;)Landroid/os/Handler;
    .registers 2

    .prologue
    .line 20
    iget-object v0, p0, Lcom/keymouse/tool/KeepAliveService;->h:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3

    .prologue
    .line 39
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 6

    .prologue
    .line 44
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 45
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/keymouse/tool/KeepAliveService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "keymouse_app_alive"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/keymouse/tool/KeepAliveService;->alive:Ljava/io/File;

    .line 46
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/keymouse/tool/KeepAliveService;->h:Landroid/os/Handler;

    .line 48
    :try_start_1b
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/keymouse/tool/KeepAliveService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 49
    new-instance v1, Landroid/app/NotificationChannel;

    const-string v2, "km_keepalive"

    const-string v3, "KeyMouse"

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 51
    new-instance v0, Landroid/app/Notification$Builder;

    const-string v1, "km_keepalive"

    invoke-direct {v0, p0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const v1, 0x1080039

    .line 52
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    const-string v1, "KeyMouse"

    .line 53
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 54
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 55
    const/4 v1, 0x7

    invoke-virtual {p0, v1, v0}, Lcom/keymouse/tool/KeepAliveService;->startForeground(ILandroid/app/Notification;)V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_4c} :catch_57

    .line 59
    :goto_4c
    iget-object v0, p0, Lcom/keymouse/tool/KeepAliveService;->h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/KeepAliveService;->beat:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 60
    invoke-static {p0}, Lcom/keymouse/tool/PosDot;->start(Landroid/content/Context;)V

    .line 61
    return-void

    .line 56
    :catch_57
    move-exception v0

    goto :goto_4c
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 71
    iget-object v0, p0, Lcom/keymouse/tool/KeepAliveService;->h:Landroid/os/Handler;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/keymouse/tool/KeepAliveService;->h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/KeepAliveService;->beat:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 72
    :cond_b
    invoke-static {}, Lcom/keymouse/tool/PosDot;->stop()V

    .line 73
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 74
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 5

    .prologue
    .line 65
    invoke-static {p0}, Lcom/keymouse/tool/PosDot;->start(Landroid/content/Context;)V

    .line 66
    const/4 v0, 0x1

    return v0
.end method
