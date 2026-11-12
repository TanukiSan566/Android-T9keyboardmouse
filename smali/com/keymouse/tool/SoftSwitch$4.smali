.class Lcom/keymouse/tool/SoftSwitch$4;
.super Ljava/lang/Object;
.source "SoftSwitch.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/SoftSwitch;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$lastAction:[J

.field final synthetic val$learning:[Z


# direct methods
.method constructor <init>([Z[JLandroid/app/Activity;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 168
    iput-object p1, p0, Lcom/keymouse/tool/SoftSwitch$4;->val$learning:[Z

    iput-object p2, p0, Lcom/keymouse/tool/SoftSwitch$4;->val$lastAction:[J

    iput-object p3, p0, Lcom/keymouse/tool/SoftSwitch$4;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 170
    iget-object v2, p0, Lcom/keymouse/tool/SoftSwitch$4;->val$learning:[Z

    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$4;->val$learning:[Z

    aget-boolean v0, v0, v1

    if-nez v0, :cond_22

    const/4 v0, 0x1

    :goto_a
    aput-boolean v0, v2, v1

    .line 171
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$4;->val$lastAction:[J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 172
    iget-object v2, p0, Lcom/keymouse/tool/SoftSwitch$4;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$4;->val$learning:[Z

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_24

    const-string v0, "learn"

    :goto_1e
    # invokes: Lcom/keymouse/tool/SoftSwitch;->send(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {v2, v0}, Lcom/keymouse/tool/SoftSwitch;->access$000(Landroid/app/Activity;Ljava/lang/String;)V

    .line 173
    return-void

    :cond_22
    move v0, v1

    .line 170
    goto :goto_a

    .line 172
    :cond_24
    const-string v0, "learn_cancel"

    goto :goto_1e
.end method
