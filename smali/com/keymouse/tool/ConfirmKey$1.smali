.class Lcom/keymouse/tool/ConfirmKey$1;
.super Ljava/lang/Object;
.source "ConfirmKey.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/ConfirmKey;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dir:Ljava/io/File;

.field final synthetic val$info:Landroid/widget/TextView;

.field final synthetic val$tick:[Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/io/File;Landroid/app/Activity;Landroid/widget/TextView;[Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 46
    iput-object p1, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$dir:Ljava/io/File;

    iput-object p2, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$info:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$tick:[Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/keymouse/tool/ConfirmKey;->until:J

    cmp-long v4, v0, v2

    if-gez v4, :guard_go

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$dir:Ljava/io/File;

    const-string v6, "keymouse_confirm_key"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    sget-wide v6, Lcom/keymouse/tool/ConfirmKey;->since:J

    cmp-long v4, v4, v6

    if-gez v4, :guard_go

    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$info:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$tick:[Ljava/lang/Runnable;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :guard_go
    .line 48
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$dir:Ljava/io/File;

    const-string v2, "keymouse_confirm_key"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/keymouse/tool/ConfirmKey;->access$000(Ljava/io/File;)I

    move-result v0

    .line 49
    if-lez v0, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "key code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    :goto_0
    iget-object v1, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$info:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$a:Landroid/app/Activity;

    const-string v4, "Built in: Select(353) / Enter(28) / KPEnter(96) / OK(352)\nCustom: "

    const-string v5, "\u0412\u0441\u0442\u0440\u043e\u0435\u043d\u043e: Select(353) / Enter(28) / KPEnter(96) / OK(352)\n\u0421\u0432\u043e\u044f: "

    const-string v6, "\u5185\u8535: Select(353) / Enter(28) / KPEnter(96) / OK(352)\n\u30ab\u30b9\u30bf\u30e0: "

    const-string v7, "\u5185\u7f6e: Select(353) / Enter(28) / KPEnter(96) / OK(352)\n\u81ea\u5b9a\u4e49: "

    invoke-static {v3, v4, v5, v6, v7}, Lcom/keymouse/tool/ConfirmKey;->access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$info:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$info:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$tick:[Ljava/lang/Runnable;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 56
    :cond_0
    return-void

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$a:Landroid/app/Activity;

    const-string v1, "none"

    const-string v2, "\u043d\u0435\u0442"

    const-string v3, "\u306a\u3057"

    const-string v4, "\u65e0"

    invoke-static {v0, v1, v2, v3, v4}, Lcom/keymouse/tool/ConfirmKey;->access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
