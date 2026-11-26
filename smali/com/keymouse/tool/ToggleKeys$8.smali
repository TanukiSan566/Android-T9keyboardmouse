.class Lcom/keymouse/tool/ToggleKeys$8;
.super Ljava/lang/Object;
.source "ToggleKeys.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/ToggleKeys;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dir:Ljava/io/File;

.field final synthetic val$dotSw:Landroid/widget/Switch;

.field final synthetic val$guard:[Z

.field final synthetic val$h:Landroid/os/Handler;

.field final synthetic val$info:Landroid/widget/TextView;

.field final synthetic val$lastDot:[J

.field final synthetic val$lastMouse:[J

.field final synthetic val$mouseSw:Landroid/widget/Switch;

.field final synthetic val$setBtn:Landroid/widget/Button;

.field final synthetic val$tick:[Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/io/File;[Z[JLandroid/widget/Switch;[JLandroid/widget/Switch;Landroid/app/Activity;Landroid/widget/Button;Landroid/widget/TextView;Landroid/os/Handler;[Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 368
    iput-object p1, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$dir:Ljava/io/File;

    iput-object p2, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$guard:[Z

    iput-object p3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$lastMouse:[J

    iput-object p4, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$mouseSw:Landroid/widget/Switch;

    iput-object p5, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$lastDot:[J

    iput-object p6, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$dotSw:Landroid/widget/Switch;

    iput-object p7, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    iput-object p8, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$setBtn:Landroid/widget/Button;

    iput-object p9, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$info:Landroid/widget/TextView;

    iput-object p10, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$h:Landroid/os/Handler;

    iput-object p11, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$tick:[Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x5dc

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 370
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 371
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$dir:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->access$200(Ljava/io/File;)[I

    move-result-object v6

    .line 372
    if-eqz v6, :cond_3

    aget v0, v6, v1

    if-ne v0, v1, :cond_3

    move v0, v1

    .line 373
    :goto_0
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$guard:[Z

    aput-boolean v1, v3, v2

    .line 374
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$lastMouse:[J

    aget-wide v8, v3, v2

    sub-long v8, v4, v8

    cmp-long v3, v8, v10

    if-lez v3, :cond_0

    .line 375
    iget-object v7, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$mouseSw:Landroid/widget/Switch;

    if-eqz v6, :cond_4

    aget v3, v6, v2

    if-ne v3, v1, :cond_4

    move v3, v1

    :goto_1
    invoke-virtual {v7, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 377
    :cond_0
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$lastDot:[J

    aget-wide v8, v3, v2

    sub-long/2addr v4, v8

    cmp-long v3, v4, v10

    if-lez v3, :cond_2

    .line 378
    iget-object v4, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$dotSw:Landroid/widget/Switch;

    if-eqz v6, :cond_1

    const/4 v3, 0x2

    aget v3, v6, v3

    if-nez v3, :cond_5

    :cond_1
    move v3, v1

    :goto_2
    invoke-virtual {v4, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 380
    :cond_2
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$guard:[Z

    aput-boolean v2, v3, v2

    .line 382
    iget-object v4, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$mouseSw:Landroid/widget/Switch;

    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$mouseSw:Landroid/widget/Switch;

    invoke-virtual {v3}, Landroid/widget/Switch;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 383
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    const-string v5, "Mouse on"

    const-string v6, "\u041c\u044b\u0448\u044c \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u0430"

    const-string v7, "\u30de\u30a6\u30b9 \u30aa\u30f3"

    const-string v8, "\u9f20\u6807\u5df2\u5f00\u542f"

    invoke-static {v3, v5, v6, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 382
    :goto_3
    invoke-virtual {v4, v3}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 385
    iget-object v4, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$setBtn:Landroid/widget/Button;

    if-eqz v0, :cond_7

    .line 386
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    const-string v5, "Cancel"

    const-string v6, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const-string v7, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v8, "\u53d6\u6d88"

    invoke-static {v3, v5, v6, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 385
    :goto_4
    invoke-virtual {v4, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 388
    if-nez v0, :cond_a

    .line 389
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$dir:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->access$400(Ljava/io/File;)[I

    move-result-object v4

    .line 390
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move v0, v2

    .line 391
    :goto_5
    array-length v3, v4

    if-ge v0, v3, :cond_9

    .line 392
    if-lez v0, :cond_8

    const-string v3, " + "

    :goto_6
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    aget v7, v4, v0

    invoke-static {v6, v7}, Lcom/keymouse/tool/ToggleKeys;->keyName(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_3
    move v0, v2

    .line 372
    goto/16 :goto_0

    :cond_4
    move v3, v2

    .line 375
    goto :goto_1

    :cond_5
    move v3, v2

    .line 378
    goto :goto_2

    .line 384
    :cond_6
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    const-string v5, "Mouse off"

    const-string v6, "\u041c\u044b\u0448\u044c \u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d\u0430"

    const-string v7, "\u30de\u30a6\u30b9 \u30aa\u30d5"

    const-string v8, "\u9f20\u6807\u5df2\u5173\u95ed"

    invoke-static {v3, v5, v6, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 387
    :cond_7
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    const-string v5, "Set toggle key(s)"

    const-string v6, "\u0417\u0430\u0434\u0430\u0442\u044c \u043a\u043b\u0430\u0432\u0438\u0448\u0438"

    const-string v7, "\u5207\u66ff\u30ad\u30fc\u3092\u8a2d\u5b9a"

    const-string v8, "\u8bbe\u7f6e\u5f00\u5173\u952e"

    invoke-static {v3, v5, v6, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    .line 392
    :cond_8
    const-string v3, ""

    goto :goto_6

    .line 394
    :cond_9
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$dir:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->access$500(Ljava/io/File;)I

    move-result v3

    .line 395
    iget-object v6, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$info:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    const-string v8, "Toggle key: "

    const-string v9, "\u041a\u043b\u0430\u0432\u0438\u0448\u0430 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u044f: "

    const-string v10, "\u5207\u66ff\u30ad\u30fc: "

    const-string v11, "\u5f00\u5173\u952e: "

    invoke-static {v7, v8, v9, v10, v11}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 396
    array-length v0, v4

    if-le v0, v1, :cond_c

    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    const-string v1, " (hold together)"

    const-string v4, " (\u0432\u043c\u0435\u0441\u0442\u0435)"

    const-string v7, " (\u540c\u6642\u62bc\u3057)"

    const-string v8, "\uff08\u540c\u65f6\u6309\u4f4f\uff09"

    invoke-static {v0, v1, v4, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_7
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    const-string v4, "Hold time: "

    const-string v5, "\u0412\u0440\u0435\u043c\u044f \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044f: "

    const-string v7, "\u9577\u62bc\u3057\u6642\u9593: "

    const-string v8, "\u957f\u6309\u65f6\u95f4: "

    .line 397
    invoke-static {v1, v4, v5, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    div-int/lit16 v1, v3, 0x3e8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    rem-int/lit16 v1, v3, 0x3e8

    div-int/lit8 v1, v1, 0x64

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$a:Landroid/app/Activity;

    const-string v3, " s (adjust in \"Long-press time\" below)"

    const-string v4, " \u0441 (\u043f\u043e\u043b\u0437\u0443\u043d\u043e\u043a \u043d\u0438\u0436\u0435)"

    const-string v5, " \u79d2 (\u4e0b\u306e\u300c\u9577\u62bc\u3057\u6642\u9593\u300d\u3067\u8abf\u6574)"

    const-string v7, " \u79d2\uff08\u5728\u4e0b\u65b9\u201c\u957f\u6309\u65f6\u95f4\u201d\u91cc\u8c03\u6574\uff09"

    .line 399
    invoke-static {v1, v3, v4, v5, v7}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 395
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 402
    :cond_a
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$info:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 403
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$8;->val$tick:[Ljava/lang/Runnable;

    aget-object v1, v1, v2

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 405
    :cond_b
    return-void

    .line 396
    :cond_c
    const-string v0, ""

    goto :goto_7
.end method
