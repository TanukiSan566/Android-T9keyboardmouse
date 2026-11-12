.class public Lcom/keymouse/tool/BootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BootReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    const-string v0, "keymouse"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "autostart"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_no_autostart

    const-string v1, "moveStep"

    const/4 v2, 0x5

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .local v1, "mv":I
    const-string v2, "scrollStep"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .local v2, "sc":I
    new-instance v3, Lcom/keymouse/tool/Daemon;

    const/4 v4, 0x0

    invoke-direct {v3, p1, v1, v2, v4}, Lcom/keymouse/tool/Daemon;-><init>(Landroid/content/Context;III)V

    invoke-virtual {v3}, Lcom/keymouse/tool/Daemon;->start()V

    :cond_no_autostart
    return-void
.end method
