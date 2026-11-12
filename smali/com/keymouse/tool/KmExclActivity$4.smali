.class Lcom/keymouse/tool/KmExclActivity$4;
.super Ljava/lang/Object;
.source "KmExclActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KmExclActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KmExclActivity;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KmExclActivity;)V
    .registers 2

    .prologue
    .line 183
    iput-object p1, p0, Lcom/keymouse/tool/KmExclActivity$4;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 185
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$4;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$300(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keymouse/tool/KmExclActivity$Item;

    .line 186
    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$4;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;
    invoke-static {v1}, Lcom/keymouse/tool/KmExclActivity;->access$500(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/Set;

    move-result-object v1

    iget-object v2, v0, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_25

    .line 187
    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$4;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;
    invoke-static {v1}, Lcom/keymouse/tool/KmExclActivity;->access$500(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/Set;

    move-result-object v1

    iget-object v0, v0, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 189
    :cond_25
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$4;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # invokes: Lcom/keymouse/tool/KmExclActivity;->saveSel()V
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$600(Lcom/keymouse/tool/KmExclActivity;)V

    .line 190
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$4;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mAdapter:Landroid/widget/BaseAdapter;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$700(Lcom/keymouse/tool/KmExclActivity;)Landroid/widget/BaseAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 191
    return-void
.end method
