.class Lcom/keymouse/tool/SoftSwitch$6;
.super Ljava/lang/Object;
.source "SoftSwitch.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$dir:Ljava/io/File;

.field final synthetic val$guard:[Z

.field final synthetic val$h:Landroid/os/Handler;

.field final synthetic val$hint:Landroid/widget/TextView;

.field final synthetic val$lastAction:[J

.field final synthetic val$lastAction2:[J

.field final synthetic val$learn:Landroid/widget/Button;

.field final synthetic val$learning:[Z

.field final synthetic val$sw:Landroid/widget/Switch;

.field final synthetic val$swDot:Landroid/widget/Switch;


# direct methods
.method constructor <init>(Ljava/io/File;[JLandroid/widget/Switch;Landroid/widget/Button;Landroid/widget/Switch;Landroid/widget/TextView;Landroid/app/Activity;[Z[Z[JLandroid/os/Handler;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 183
    iput-object p1, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$dir:Ljava/io/File;

    iput-object p2, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$lastAction:[J

    iput-object p3, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$sw:Landroid/widget/Switch;

    iput-object p4, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$learn:Landroid/widget/Button;

    iput-object p5, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$swDot:Landroid/widget/Switch;

    iput-object p6, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$hint:Landroid/widget/TextView;

    iput-object p7, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$a:Landroid/app/Activity;

    iput-object p8, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$guard:[Z

    iput-object p9, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$learning:[Z

    iput-object p10, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$lastAction2:[J

    iput-object p11, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$h:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    const-wide/16 v8, 0x5dc

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 185
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$dir:Ljava/io/File;

    # invokes: Lcom/keymouse/tool/SoftSwitch;->readState(Ljava/io/File;)[I
    invoke-static {v0}, Lcom/keymouse/tool/SoftSwitch;->access$100(Ljava/io/File;)[I

    move-result-object v3

    .line 186
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$lastAction:[J

    aget-wide v6, v0, v2

    sub-long/2addr v4, v6

    cmp-long v0, v4, v8

    if-gez v0, :cond_54

    move v0, v1

    .line 187
    :goto_18
    if-nez v3, :cond_56

    .line 188
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$sw:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 189
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$learn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 190
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$swDot:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 191
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$hint:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$a:Landroid/app/Activity;

    const-string v2, "Turn on the main switch first."

    const-string v3, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u0435 \u0433\u043b\u0430\u0432\u043d\u044b\u0439 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0442\u0435\u043b\u044c."

    const-string v4, "\u5148\u306b\u30e1\u30a4\u30f3\u30b9\u30a4\u30c3\u30c1\u3092\u30aa\u30f3\u306b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    const-string v5, "\u8bf7\u5148\u6253\u5f00\u4e0a\u65b9\u7684\u9f20\u6807\u603b\u5f00\u5173\u3002"

    # invokes: Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v2, v3, v4, v5}, Lcom/keymouse/tool/SoftSwitch;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    :goto_3c
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$hint:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_4c

    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$hint:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->isShown()Z

    move-result v0

    if-nez v0, :cond_53

    :cond_4c
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$h:Landroid/os/Handler;

    const-wide/16 v2, 0x2bc

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 221
    :cond_53
    return-void

    :cond_54
    move v0, v2

    .line 186
    goto :goto_18

    .line 194
    :cond_56
    iget-object v4, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$sw:Landroid/widget/Switch;

    invoke-virtual {v4, v1}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 195
    iget-object v4, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$learn:Landroid/widget/Button;

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 196
    if-nez v0, :cond_7d

    .line 197
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$guard:[Z

    aput-boolean v1, v0, v2

    .line 198
    iget-object v4, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$sw:Landroid/widget/Switch;

    aget v0, v3, v2

    if-ne v0, v1, :cond_d0

    move v0, v1

    :goto_6d
    invoke-virtual {v4, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 199
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$guard:[Z

    aput-boolean v2, v0, v2

    .line 200
    iget-object v4, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$learning:[Z

    aget v0, v3, v1

    if-ne v0, v1, :cond_d2

    move v0, v1

    :goto_7b
    aput-boolean v0, v4, v2

    .line 202
    :cond_7d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$lastAction2:[J

    aget-wide v6, v0, v2

    sub-long/2addr v4, v6

    cmp-long v0, v4, v8

    if-ltz v0, :cond_9d

    .line 203
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$guard:[Z

    aput-boolean v1, v0, v2

    .line 204
    iget-object v4, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$swDot:Landroid/widget/Switch;

    const/4 v0, 0x2

    aget v0, v3, v0

    if-nez v0, :cond_d4

    move v0, v1

    :goto_96
    invoke-virtual {v4, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 205
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$guard:[Z

    aput-boolean v2, v0, v2

    .line 207
    :cond_9d
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$swDot:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 208
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$learning:[Z

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_d6

    .line 209
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$hint:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$a:Landroid/app/Activity;

    const-string v2, "Press the key you want to use (within 8 s)..."

    const-string v3, "\u041d\u0430\u0436\u043c\u0438\u0442\u0435 \u043d\u0443\u0436\u043d\u0443\u044e \u043a\u043b\u0430\u0432\u0438\u0448\u0443 (\u0432 \u0442\u0435\u0447\u0435\u043d\u0438\u0435 8 \u0441)..."

    const-string v4, "\u4f7f\u3044\u305f\u3044\u30ad\u30fc\u3092\u62bc\u3057\u3066\u304f\u3060\u3055\u3044(8\u79d2\u4ee5\u5185)..."

    const-string v5, "\u8bf7\u6309\u4e0b\u60f3\u7528\u4f5c\u5f00\u5173\u7684\u952e(8 \u79d2\u5185)\u2026"

    # invokes: Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v2, v3, v4, v5}, Lcom/keymouse/tool/SoftSwitch;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$learn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$a:Landroid/app/Activity;

    const-string v2, "Cancel"

    const-string v3, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const-string v4, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v5, "\u53d6\u6d88"

    # invokes: Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v2, v3, v4, v5}, Lcom/keymouse/tool/SoftSwitch;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3c

    :cond_d0
    move v0, v2

    .line 198
    goto :goto_6d

    :cond_d2
    move v0, v2

    .line 200
    goto :goto_7b

    :cond_d4
    move v0, v2

    .line 204
    goto :goto_96

    .line 215
    :cond_d6
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$hint:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$a:Landroid/app/Activity;

    const-string v3, "Toggle key: "

    const-string v4, "\u041a\u043b\u0430\u0432\u0438\u0448\u0430 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u044f: "

    const-string v5, "\u5207\u66ff\u30ad\u30fc: "

    const-string v6, "\u5f00\u5173\u952e: "

    # invokes: Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v3, v4, v5, v6}, Lcom/keymouse/tool/SoftSwitch;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$dir:Ljava/io/File;

    .line 216
    # invokes: Lcom/keymouse/tool/SoftSwitch;->readToggleKey(Ljava/io/File;)I
    invoke-static {v3}, Lcom/keymouse/tool/SoftSwitch;->access$300(Ljava/io/File;)I

    move-result v3

    # invokes: Lcom/keymouse/tool/SoftSwitch;->keyName(Landroid/app/Activity;I)Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/keymouse/tool/SoftSwitch;->access$400(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 215
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    iget-object v0, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$learn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/keymouse/tool/SoftSwitch$6;->val$a:Landroid/app/Activity;

    const-string v2, "Change toggle key"

    const-string v3, "\u0421\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043b\u0430\u0432\u0438\u0448\u0443"

    const-string v4, "\u5207\u66ff\u30ad\u30fc\u3092\u5909\u66f4"

    const-string v5, "\u4fee\u6539\u5f00\u5173\u952e"

    # invokes: Lcom/keymouse/tool/SoftSwitch;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v2, v3, v4, v5}, Lcom/keymouse/tool/SoftSwitch;->access$200(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3c
.end method
