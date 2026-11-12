.class Lcom/keymouse/tool/ExtraSwitches$2;
.super Ljava/lang/Object;
.source "ExtraSwitches.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/ExtraSwitches;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
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
    .line 132
    iput-object p1, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$dir:Ljava/io/File;

    iput-object p2, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$info:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$tick:[Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/keymouse/tool/ExtraSwitches;->until:J

    cmp-long v4, v0, v2

    if-gez v4, :guard_go

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$dir:Ljava/io/File;

    const-string v6, "keymouse_toggle_key2"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    sget-wide v6, Lcom/keymouse/tool/ExtraSwitches;->since:J

    cmp-long v4, v4, v6

    if-gez v4, :guard_go

    iget-object v0, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$info:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$tick:[Ljava/lang/Runnable;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :guard_go
    .line 134
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$dir:Ljava/io/File;

    const-string v2, "keymouse_toggle_key2"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/keymouse/tool/ExtraSwitches;->access$000(Ljava/io/File;)I

    move-result v0

    .line 135
    if-lez v0, :cond_1

    iget-object v1, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$a:Landroid/app/Activity;

    invoke-static {v1, v0}, Lcom/keymouse/tool/ExtraSwitches;->keyName(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v0

    .line 137
    :goto_0
    iget-object v1, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$dir:Ljava/io/File;

    invoke-static {v1}, Lcom/keymouse/tool/ExtraSwitches;->access$200(Ljava/io/File;)I

    move-result v1

    .line 138
    iget-object v2, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$info:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$a:Landroid/app/Activity;

    const-string v5, "2nd toggle key (optional, hold both): "

    const-string v6, "\u0412\u0442\u043e\u0440\u0430\u044f \u043a\u043b\u0430\u0432\u0438\u0448\u0430 (\u043d\u0435\u043e\u0431\u044f\u0437\u0430\u0442\u0435\u043b\u044c\u043d\u043e, \u0434\u0435\u0440\u0436\u0430\u0442\u044c \u043e\u0431\u0435): "

    const-string v7, "2\u3064\u76ee\u306e\u30ad\u30fc(\u4efb\u610f\u30fb\u540c\u6642\u9577\u62bc\u3057): "

    const-string v8, "\u7b2c\u4e8c\u5f00\u5173\u952e(\u53ef\u9009\uff0c\u4e24\u952e\u540c\u65f6\u6309\u4f4f\u624d\u89e6\u53d1): "

    .line 139
    invoke-static {v4, v5, v6, v7, v8}, Lcom/keymouse/tool/ExtraSwitches;->access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$a:Landroid/app/Activity;

    const-string v4, "Hold time: "

    const-string v5, "\u0412\u0440\u0435\u043c\u044f \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044f: "

    const-string v6, "\u9577\u62bc\u3057\u6642\u9593: "

    const-string v7, "\u957f\u6309\u65f6\u95f4: "

    .line 142
    invoke-static {v3, v4, v5, v6, v7}, Lcom/keymouse/tool/ExtraSwitches;->access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 143
    invoke-static {v1}, Lcom/keymouse/tool/ExtraSwitches;->access$300(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$a:Landroid/app/Activity;

    const-string v3, " s (0.1-3 s, drag the \"Hold toggle key\" slider below)"

    const-string v4, " \u0441 (0,1-3 \u0441, \u043f\u043e\u043b\u0437\u0443\u043d\u043e\u043a \u043d\u0438\u0436\u0435)"

    const-string v5, " \u79d2 (0.1-3\u79d2\u3001\u4e0b\u306e\u30b9\u30e9\u30a4\u30c0\u30fc\u3067\u8abf\u6574)"

    const-string v6, " \u79d2 (0.1-3 \u79d2\uff0c\u5728\u4e0b\u65b9\u201c\u957f\u6309\u65f6\u95f4\u201d\u91cc\u62d6\u52a8\u201c\u957f\u6309\u5f00\u5173\u952e\u201d\u8c03\u6574)"

    invoke-static {v1, v3, v4, v5, v6}, Lcom/keymouse/tool/ExtraSwitches;->access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    iget-object v0, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$info:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$info:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$tick:[Ljava/lang/Runnable;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 146
    :cond_0
    return-void

    .line 136
    :cond_1
    iget-object v0, p0, Lcom/keymouse/tool/ExtraSwitches$2;->val$a:Landroid/app/Activity;

    const-string v1, "none"

    const-string v2, "\u043d\u0435\u0442"

    const-string v3, "\u306a\u3057"

    const-string v4, "\u65e0"

    invoke-static {v0, v1, v2, v3, v4}, Lcom/keymouse/tool/ExtraSwitches;->access$100(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
