.class Lcom/keymouse/tool/KmExclActivity$5$1;
.super Ljava/lang/Object;
.source "KmExclActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KmExclActivity$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keymouse/tool/KmExclActivity$5;

.field final synthetic val$out:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KmExclActivity$5;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 246
    iput-object p1, p0, Lcom/keymouse/tool/KmExclActivity$5$1;->this$1:Lcom/keymouse/tool/KmExclActivity$5;

    iput-object p2, p0, Lcom/keymouse/tool/KmExclActivity$5$1;->val$out:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 248
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$5$1;->this$1:Lcom/keymouse/tool/KmExclActivity$5;

    iget-object v0, v0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mAll:Ljava/util/List;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$800(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 249
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$5$1;->this$1:Lcom/keymouse/tool/KmExclActivity$5;

    iget-object v0, v0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mAll:Ljava/util/List;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$800(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$5$1;->val$out:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 250
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$5$1;->this$1:Lcom/keymouse/tool/KmExclActivity$5;

    iget-object v0, v0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mLoading:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$900(Lcom/keymouse/tool/KmExclActivity;)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 251
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$5$1;->this$1:Lcom/keymouse/tool/KmExclActivity$5;

    iget-object v0, v0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # invokes: Lcom/keymouse/tool/KmExclActivity;->refilter()V
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$000(Lcom/keymouse/tool/KmExclActivity;)V

    .line 252
    return-void
.end method
