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
    .registers 5
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
    .registers 9

    .prologue
    .line 48
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$dir:Ljava/io/File;

    const-string v2, "keymouse_confirm_key"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    # invokes: Lcom/keymouse/tool/ConfirmKey;->readInt(Ljava/io/File;)I
    invoke-static {v0}, Lcom/keymouse/tool/ConfirmKey;->access$000(Ljava/io/File;)I

    move-result v0

    .line 49
    if-lez v0, :cond_5b

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
    :goto_22
    iget-object v1, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$info:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$a:Landroid/app/Activity;

    const-string v4, "Built in: Select(353) / Enter(28) / KPEnter(96) / OK(352)\nCustom: "

    const-string v5, "\u0412\u0441\u0442\u0440\u043e\u0435\u043d\u043e: Select(353) / Enter(28) / KPEnter(96) / OK(352)\n\u0421\u0432\u043e\u044f: "

    const-string v6, "\u5185\u8535: Select(353) / Enter(28) / KPEnter(96) / OK(352)\n\u30ab\u30b9\u30bf\u30e0: "

    const-string v7, "\u5185\u7f6e: Select(353) / Enter(28) / KPEnter(96) / OK(352)\n\u81ea\u5b9a\u4e49: "

    # invokes: Lcom/keymouse/tool/ConfirmKey;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
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

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$info:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$tick:[Ljava/lang/Runnable;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 56
    :cond_5a
    return-void

    .line 49
    :cond_5b
    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$1;->val$a:Landroid/app/Activity;

    const-string v1, "none"

    const-string v2, "\u043d\u0435\u0442"

    const-string v3, "\u306a\u3057"

    const-string v4, "\u65e0"

    # invokes: Lcom/keymouse/tool/ConfirmKey;->L(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v1, v2, v3, v4}, Lcom/keymouse/tool/ConfirmKey;->access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_22
.end method
