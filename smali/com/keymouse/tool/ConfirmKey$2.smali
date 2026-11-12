.class Lcom/keymouse/tool/ConfirmKey$2;
.super Ljava/lang/Object;
.source "ConfirmKey.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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


# direct methods
.method constructor <init>(Ljava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 64
    iput-object p1, p0, Lcom/keymouse/tool/ConfirmKey$2;->val$dir:Ljava/io/File;

    iput-object p2, p0, Lcom/keymouse/tool/ConfirmKey$2;->val$info:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/keymouse/tool/ConfirmKey$2;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .prologue
    .line 66
    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$2;->val$dir:Ljava/io/File;

    const-string v1, "learn_confirm"

    invoke-static {v0, v1}, Lcom/keymouse/tool/ExtraSwitches;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$2;->val$info:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/ConfirmKey$2;->val$a:Landroid/app/Activity;

    const-string v2, "Press your phone\'s center key within 8 s..."

    const-string v3, "\u041d\u0430\u0436\u043c\u0438\u0442\u0435 \u0446\u0435\u043d\u0442\u0440\u0430\u043b\u044c\u043d\u0443\u044e \u043a\u043b\u0430\u0432\u0438\u0448\u0443 (8 \u0441)..."

    const-string v4, "8\u79d2\u4ee5\u5185\u306b\u4e2d\u592e\u30ad\u30fc\u3092\u62bc\u3057\u3066\u304f\u3060\u3055\u3044..."

    const-string v5, "\u8bf7\u5728 8 \u79d2\u5185\u6309\u4e0b\u4f60\u624b\u673a\u7684\u4e2d\u95f4\u952e..."

    invoke-static {v1, v2, v3, v4, v5}, Lcom/keymouse/tool/ConfirmKey;->access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x1f40

    add-long/2addr v2, v0

    sput-wide v2, Lcom/keymouse/tool/ConfirmKey;->until:J

    const-wide/16 v2, 0x3e8

    sub-long/2addr v0, v2

    sput-wide v0, Lcom/keymouse/tool/ConfirmKey;->since:J

    .line 71
    return-void
.end method
