.class Lcom/keymouse/tool/CursorActivity$9;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->rebuildBuiltin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 426
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$9;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$9;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->installAllThemes(Landroid/content/Context;)V

    .line 429
    return-void
.end method
