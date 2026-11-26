.class Lcom/keymouse/tool/KeyCustomActivity$6;
.super Ljava/lang/Object;
.source "KeyCustomActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KeyCustomActivity;->rebuildList()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KeyCustomActivity;

.field final synthetic val$e:[I


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KeyCustomActivity;[I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 300
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity$6;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    iput-object p2, p0, Lcom/keymouse/tool/KeyCustomActivity$6;->val$e:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
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
    const/4 v2, 0x0

    .line 302
    invoke-static {}, Lcom/keymouse/tool/KeyCustomActivity;->access$700()[I

    move-result-object v0

    aget v0, v0, p3

    .line 303
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$6;->val$e:[I

    aget v1, v1, v2

    if-eq v1, v0, :cond_0

    .line 304
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity$6;->val$e:[I

    aput v0, v1, v2

    .line 305
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity$6;->this$0:Lcom/keymouse/tool/KeyCustomActivity;

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->access$400(Lcom/keymouse/tool/KeyCustomActivity;)V

    .line 307
    :cond_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 310
    return-void
.end method
