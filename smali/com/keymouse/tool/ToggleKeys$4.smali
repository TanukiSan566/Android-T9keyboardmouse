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
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dir:Ljava/io/File;

.field final synthetic val$guard:[Z

.field final synthetic val$info:Landroid/widget/TextView;

.field final synthetic val$lastMouse:[J


# direct methods
.method constructor <init>([Z[JLjava/io/File;Landroid/widget/TextView;Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 312
    iput-object p1, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$guard:[Z

    iput-object p2, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$lastMouse:[J

    iput-object p3, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$dir:Ljava/io/File;

    iput-object p4, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$info:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 8

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 314
    iget-object v2, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$guard:[Z

    aget-boolean v2, v2, v1

    if-eqz v2, :cond_0

    .line 327
    :goto_0
    return-void

    .line 317
    :cond_0
    iget-object v2, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$lastMouse:[J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    aput-wide v4, v2, v1

    .line 318
    iget-object v2, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$dir:Ljava/io/File;

    invoke-static {v2}, Lcom/keymouse/tool/ToggleKeys;->access$200(Ljava/io/File;)[I

    move-result-object v2

    if-nez v2, :cond_2

    .line 319
    iget-object v2, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$info:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$a:Landroid/app/Activity;

    const-string v4, "Turn on the main switch first."

    const-string v5, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u0435 \u0433\u043b\u0430\u0432\u043d\u044b\u0439 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0442\u0435\u043b\u044c."

    const-string v6, "\u5148\u306b\u30e1\u30a4\u30f3\u30b9\u30a4\u30c3\u30c1\u3092\u30aa\u30f3\u306b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    const-string v7, "\u8bf7\u5148\u6253\u5f00\u4e0a\u65b9\u7684\u9f20\u6807\u603b\u5f00\u5173\u3002"

    invoke-static {v3, v4, v5, v6, v7}, Lcom/keymouse/tool/ToggleKeys;->access$300(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 321
    iget-object v2, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$guard:[Z

    aput-boolean v0, v2, v1

    .line 322
    if-nez p2, :cond_1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 323
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$guard:[Z

    aput-boolean v1, v0, v1

    goto :goto_0

    :cond_1
    move v0, v1

    .line 322
    goto :goto_1

    .line 326
    :cond_2
    iget-object v1, p0, Lcom/keymouse/tool/ToggleKeys$4;->val$dir:Ljava/io/File;

    if-eqz p2, :cond_3

    const-string v0, "on"

    :goto_2
    invoke-static {v1, v0}, Lcom/keymouse/tool/ToggleKeys;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v0, "off"

    goto :goto_2
.end method
