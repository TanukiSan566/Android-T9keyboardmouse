.class Lcom/keymouse/tool/DebugLog$1;
.super Ljava/lang/Object;
.source "DebugLog.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/DebugLog;->build(Landroid/app/Activity;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 94
    iput-object p1, p0, Lcom/keymouse/tool/DebugLog$1;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/keymouse/tool/DebugLog$1;->val$a:Landroid/app/Activity;

    invoke-static {v0, p2}, Lcom/keymouse/tool/DebugLog;->access$000(Landroid/content/Context;Z)V

    .line 97
    return-void
.end method
