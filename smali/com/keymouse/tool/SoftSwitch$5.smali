.class Lcom/keymouse/tool/SoftSwitch$5;
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
    .line 175
    iput-object p1, p0, Lcom/keymouse/tool/SoftSwitch$5;->val$learning:[Z

    iput-object p2, p0, Lcom/keymouse/tool/SoftSwitch$5;->val$lastAction:[J

    iput-object p3, p0, Lcom/keymouse/tool/SoftSwitch$5;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 177
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$5;->val$learning:[Z

    aput-boolean v1, v0, v1

    .line 178
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$5;->val$lastAction:[J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 179
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$5;->val$a:Landroid/app/Activity;

    const-string v1, "reset"

    # invokes: Lcom/keymouse/tool/SoftSwitch;->send(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/keymouse/tool/SoftSwitch;->access$000(Landroid/app/Activity;Ljava/lang/String;)V

    .line 180
    return-void
.end method
