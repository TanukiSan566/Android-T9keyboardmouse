.class final Lcom/keymouse/tool/PosDot$Tick;
.super Ljava/lang/Object;
.source "PosDot.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keymouse/tool/PosDot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Tick"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 333
    invoke-static {}, Lcom/keymouse/tool/PosDot;->tick()V

    .line 334
    return-void
.end method
