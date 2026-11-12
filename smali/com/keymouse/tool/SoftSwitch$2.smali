.class Lcom/keymouse/tool/SoftSwitch$2;
.super Ljava/lang/Object;
.source "SoftSwitch.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

.field final synthetic val$guard:[Z

.field final synthetic val$lastAction:[J


# direct methods
.method constructor <init>([Z[JLandroid/app/Activity;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 154
    iput-object p1, p0, Lcom/keymouse/tool/SoftSwitch$2;->val$guard:[Z

    iput-object p2, p0, Lcom/keymouse/tool/SoftSwitch$2;->val$lastAction:[J

    iput-object p3, p0, Lcom/keymouse/tool/SoftSwitch$2;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 156
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$2;->val$guard:[Z

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_8

    .line 159
    :goto_7
    return-void

    .line 157
    :cond_8
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$2;->val$lastAction:[J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 158
    iget-object v1, p0, Lcom/keymouse/tool/SoftSwitch$2;->val$a:Landroid/app/Activity;

    if-eqz p2, :cond_1a

    const-string v0, "on"

    :goto_16
    # invokes: Lcom/keymouse/tool/SoftSwitch;->send(Landroid/app/Activity;Ljava/lang/String;)V
    invoke-static {v1, v0}, Lcom/keymouse/tool/SoftSwitch;->access$000(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_7

    :cond_1a
    const-string v0, "off"

    goto :goto_16
.end method
