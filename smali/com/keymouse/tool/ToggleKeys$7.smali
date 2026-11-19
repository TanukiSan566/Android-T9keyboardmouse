.class Lcom/keymouse/tool/ToggleKeys$7;
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
.method constructor <init>(Ljava/io/File;[Z[JLandroid/widget/Switch;[JLandroid/widget/Switch;Landroid/widget/Button;Landroid/app/Activity;Landroid/widget/TextView;Landroid/os/Handler;[Ljava/lang/Runnable;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 333
    iput-object p1, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dir:Ljava/io/File;

    iput-object p2, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$guard:[Z

    iput-object p3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$lastMouse:[J

    iput-object p4, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$mouseSw:Landroid/widget/Switch;

    iput-object p5, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$lastDot:[J

    iput-object p6, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dotSw:Landroid/widget/Switch;

    iput-object p7, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$setBtn:Landroid/widget/Button;

    iput-object p8, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    iput-object p9, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$info:Landroid/widget/TextView;

    iput-object p10, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$h:Landroid/os/Handler;

    iput-object p11, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$tick:[Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 13

    .prologue
    const-wide/16 v10, 0x5dc

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 335
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 336
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dir:Ljava/io/File;

    # invokes: Lcom/keymouse/tool/ToggleKeys;->readState(Ljava/io/File;)[I
    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->access$100(Ljava/io/File;)[I

    move-result-object v6

    .line 337
    if-eqz v6, :cond_85

    aget v0, v6, v1

    if-ne v0, v1, :cond_85

    move v0, v1

    .line 338
    :goto_15
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$guard:[Z

    aput-boolean v1, v3, v2

    .line 339
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$lastMouse:[J

    aget-wide v8, v3, v2

    sub-long v8, v4, v8

    cmp-long v3, v8, v10

    if-lez v3, :cond_2f

    .line 340
    iget-object v7, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$mouseSw:Landroid/widget/Switch;

    if-eqz v6, :cond_87

    aget v3, v6, v2

    if-ne v3, v1, :cond_87

    move v3, v1

    :goto_2c
    invoke-virtual {v7, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 342
    :cond_2f
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$lastDot:[J

    aget-wide v8, v3, v2

    sub-long/2addr v4, v8

    cmp-long v3, v4, v10

    if-lez v3, :cond_45

    .line 343
    iget-object v4, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dotSw:Landroid/widget/Switch;

    if-eqz v6, :cond_41

    const/4 v3, 0x2

    aget v3, v6, v3

    if-nez v3, :cond_89

    :cond_41
    move v3, v1

    :goto_42
    invoke-virtual {v4, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 345
    :cond_45
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$guard:[Z

    aput-boolean v2, v3, v2

    # 软开关文字跟随开关状态: 已开启 / 已关闭
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$mouseSw:Landroid/widget/Switch;

    invoke-virtual {v3}, Landroid/widget/Switch;->isChecked()Z

    move-result v4

    iget-object v5, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    if-eqz v4, :cond_mtxt_off

    const-string v6, "Mouse on"

    const-string v7, "\u041c\u044b\u0448\u044c \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u0430"

    const-string v8, "\u30de\u30a6\u30b9 \u30aa\u30f3"

    const-string v9, "\u9f20\u6807\u5df2\u5f00\u542f"

    goto :cond_mtxt_set

    :cond_mtxt_off
    const-string v6, "Mouse off"

    const-string v7, "\u041c\u044b\u0448\u044c \u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d\u0430"

    const-string v8, "\u30de\u30a6\u30b9 \u30aa\u30d5"

    const-string v9, "\u9f20\u6807\u5df2\u5173\u95ed"

    :cond_mtxt_set
    invoke-static {v5, v6, v7, v8, v9}, Lcom/keymouse/tool/ToggleKeys;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 346
    iget-object v4, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$setBtn:Landroid/widget/Button;

    if-eqz v0, :cond_8b

    .line 347
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    const-string v5, "Cancel"

    const-string v6, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const-string v7, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v8, "\u53d6\u6d88"

    # invokes: Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v5, v6, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 346
    :goto_5b
    invoke-virtual {v4, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 349
    if-nez v0, :cond_11a

    .line 350
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dir:Ljava/io/File;

    # invokes: Lcom/keymouse/tool/ToggleKeys;->readKeys(Ljava/io/File;)[I
    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->access$300(Ljava/io/File;)[I

    move-result-object v4

    .line 351
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move v0, v2

    .line 352
    :goto_6c
    array-length v3, v4

    if-ge v0, v3, :cond_9d

    .line 353
    if-lez v0, :cond_9a

    const-string v3, " + "

    :goto_73
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    aget v7, v4, v0

    invoke-static {v6, v7}, Lcom/keymouse/tool/ToggleKeys;->keyName(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    add-int/lit8 v0, v0, 0x1

    goto :goto_6c

    :cond_85
    move v0, v2

    .line 337
    goto :goto_15

    :cond_87
    move v3, v2

    .line 340
    goto :goto_2c

    :cond_89
    move v3, v2

    .line 343
    goto :goto_42

    .line 348
    :cond_8b
    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    const-string v5, "Set toggle key(s)"

    const-string v6, "\u0417\u0430\u0434\u0430\u0442\u044c \u043a\u043b\u0430\u0432\u0438\u0448\u0438"

    const-string v7, "\u5207\u66ff\u30ad\u30fc\u3092\u8a2d\u5b9a"

    const-string v8, "\u8bbe\u7f6e\u5f00\u5173\u952e"

    # invokes: Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v5, v6, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_5b

    .line 353
    :cond_9a
    const-string v3, ""

    goto :goto_73

    .line 355
    :cond_9d
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dir:Ljava/io/File;

    # invokes: Lcom/keymouse/tool/ToggleKeys;->readToggleHold(Ljava/io/File;)I
    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->access$400(Ljava/io/File;)I

    move-result v3

    .line 356
    iget-object v6, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$info:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    const-string v8, "Toggle key: "

    const-string v9, "\u041a\u043b\u0430\u0432\u0438\u0448\u0430 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u044f: "

    const-string v10, "\u5207\u66ff\u30ad\u30fc: "

    const-string v11, "\u5f00\u5173\u952e: "

    # invokes: Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v7, v8, v9, v10, v11}, Lcom/keymouse/tool/ToggleKeys;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 357
    array-length v0, v4

    if-le v0, v1, :cond_12e

    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    const-string v1, " (hold together)"

    const-string v4, " (\u0432\u043c\u0435\u0441\u0442\u0435)"

    const-string v7, " (\u540c\u6642\u62bc\u3057)"

    const-string v8, "\uff08\u540c\u65f6\u6309\u4f4f\uff09"

    # invokes: Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1, v4, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_d1
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    const-string v4, "Hold time: "

    const-string v5, "\u0412\u0440\u0435\u043c\u044f \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044f: "

    const-string v7, "\u9577\u62bc\u3057\u6642\u9593: "

    const-string v8, "\u957f\u6309\u65f6\u95f4: "

    .line 358
    # invokes: Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v4, v5, v7, v8}, Lcom/keymouse/tool/ToggleKeys;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

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

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    const-string v3, " s (adjust in \"Long-press time\" below)"

    const-string v4, " \u0441 (\u043f\u043e\u043b\u0437\u0443\u043d\u043e\u043a \u043d\u0438\u0436\u0435)"

    const-string v5, " \u79d2 (\u4e0b\u306e\u300c\u9577\u62bc\u3057\u6642\u9593\u300d\u3067\u8abf\u6574)"

    const-string v7, " \u79d2\uff08\u5728\u4e0b\u65b9\u201c\u957f\u6309\u65f6\u95f4\u201d\u91cc\u8c03\u6574\uff09"

    .line 360
    # invokes: Lcom/keymouse/tool/ToggleKeys;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v3, v4, v5, v7}, Lcom/keymouse/tool/ToggleKeys;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 356
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 363
    :cond_11a
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$info:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_12d

    .line 364
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$h:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$tick:[Ljava/lang/Runnable;

    aget-object v1, v1, v2

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 366
    :cond_12d
    return-void

    .line 357
    :cond_12e
    const-string v0, ""

    goto :goto_d1
.end method
