.class Lcom/keymouse/tool/CursorActivity$5;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 206
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$5;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .prologue
    .line 208
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$5;->this$0:Lcom/keymouse/tool/CursorActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/keymouse/tool/CursorCfg;->applyDefaultCfg(Landroid/content/Context;Z)V

    .line 209
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$5;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$5;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v1}, Lcom/keymouse/tool/CursorCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/keymouse/tool/CursorActivity;->access$302(Lcom/keymouse/tool/CursorActivity;Ljava/util/Map;)Ljava/util/Map;

    .line 210
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$5;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$5;->this$0:Lcom/keymouse/tool/CursorActivity;

    const-string v2, "\u5df2\u6062\u590d\u9ed8\u8ba4\u6307\u9488"

    const-string v3, "\u623b\u3057\u307e\u3057\u305f"

    const-string v4, "Restored"

    invoke-static {v1, v2, v3, v4}, Lcom/keymouse/tool/CursorActivity;->access$400(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 211
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$5;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$500(Lcom/keymouse/tool/CursorActivity;)V

    .line 212
    return-void
.end method
