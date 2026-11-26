.class Lcom/keymouse/tool/ToggleKeys$7;
.super Ljava/lang/Object;
.source "ToggleKeys.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$info:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Ljava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 350
    iput-object p1, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dir:Ljava/io/File;

    iput-object p2, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$info:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 352
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dir:Ljava/io/File;

    invoke-static {v0}, Lcom/keymouse/tool/ToggleKeys;->access$200(Ljava/io/File;)[I

    move-result-object v1

    .line 353
    if-nez v1, :cond_0

    .line 354
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$info:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    const-string v2, "Turn on the main switch first."

    const-string v3, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u0435 \u0433\u043b\u0430\u0432\u043d\u044b\u0439 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0442\u0435\u043b\u044c."

    const-string v4, "\u5148\u306b\u30e1\u30a4\u30f3\u30b9\u30a4\u30c3\u30c1\u3092\u30aa\u30f3\u306b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    const-string v5, "\u8bf7\u5148\u6253\u5f00\u4e0a\u65b9\u7684\u9f20\u6807\u603b\u5f00\u5173\u3002"

    invoke-static {v1, v2, v3, v4, v5}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 364
    :goto_0
    return-void

    .line 358
    :cond_0
    iget-object v2, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$dir:Ljava/io/File;

    aget v0, v1, v3

    if-ne v0, v3, :cond_1

    const-string v0, "learn_cancel"

    :goto_1
    invoke-static {v2, v0}, Lcom/keymouse/tool/ToggleKeys;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    .line 359
    iget-object v2, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$info:Landroid/widget/TextView;

    aget v0, v1, v3

    if-ne v0, v3, :cond_2

    const-string v0, ""

    :goto_2
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 358
    :cond_1
    const-string v0, "learn"

    goto :goto_1

    .line 359
    :cond_2
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$7;->val$a:Landroid/app/Activity;

    const-string v1, "Hold the key(s) you want (1-4 keys together), then release all (within 8 s)..."

    const-string v3, "\u0417\u0430\u0436\u043c\u0438\u0442\u0435 \u043d\u0443\u0436\u043d\u044b\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 (1-4 \u0432\u043c\u0435\u0441\u0442\u0435), \u0437\u0430\u0442\u0435\u043c \u043e\u0442\u043f\u0443\u0441\u0442\u0438\u0442\u0435 \u0432\u0441\u0435 (8 \u0441)..."

    const-string v4, "\u4f7f\u3044\u305f\u3044\u30ad\u30fc\u3092\u540c\u6642\u306b\u62bc\u3057\u7d9a\u3051(1\u301c4\u500b)\u3001\u3059\u3079\u3066\u96e2\u3057\u3066\u304f\u3060\u3055\u3044(8\u79d2\u4ee5\u5185)..."

    const-string v5, "\u8bf7\u540c\u65f6\u6309\u4f4f\u60f3\u7528\u7684\u952e\uff081~4 \u4e2a\uff09\uff0c\u7136\u540e\u5168\u90e8\u677e\u5f00\uff088 \u79d2\u5185\uff09\u2026"

    invoke-static {v0, v1, v3, v4, v5}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2
.end method
