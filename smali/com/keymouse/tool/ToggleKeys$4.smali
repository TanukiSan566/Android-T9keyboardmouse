.class Lcom/keymouse/tool/ToggleKeys$4;
.super Ljava/lang/Object;
.source "ToggleKeys.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/ToggleKeys;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dir:Ljava/io/File;

.field final synthetic val$guard:[Z

.field final synthetic val$lastDot:[J


# direct methods
.method constructor <init>([Z[JLjava/io/File;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 294
    iput-object p1, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$guard:[Z

    iput-object p2, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$lastDot:[J

    iput-object p3, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$dir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 296
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$guard:[Z

    aget-boolean v0, v0, v1

    if-eqz v0, :cond_8

    .line 301
    :goto_7
    return-void

    .line 299
    :cond_8
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$lastDot:[J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 300
    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$dir:Ljava/io/File;

    if-eqz p2, :cond_1a

    const-string v0, "dot_on"

    :goto_16
    invoke-static {v1, v0}, Lcom/keymouse/tool/ToggleKeys;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_7

    :cond_1a
    const-string v0, "dot_off"

    goto :goto_16
.end method
