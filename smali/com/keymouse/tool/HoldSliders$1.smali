.class Lcom/keymouse/tool/HoldSliders$1;
.super Ljava/lang/Object;
.source "HoldSliders.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/HoldSliders;->build(Landroid/content/Context;I)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$msRef:[I


# direct methods
.method constructor <init>(Landroid/content/Context;[I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 107
    iput-object p1, p0, Lcom/keymouse/tool/HoldSliders$1;->val$ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/keymouse/tool/HoldSliders$1;->val$msRef:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    .prologue
    .line 109
    # setter for: Lcom/keymouse/tool/HoldSliders;->sTouch:Z
    invoke-static {p2}, Lcom/keymouse/tool/HoldSliders;->access$002(Z)Z

    .line 110
    iget-object v0, p0, Lcom/keymouse/tool/HoldSliders$1;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/keymouse/tool/HoldSliders$1;->val$msRef:[I

    # invokes: Lcom/keymouse/tool/HoldSliders;->save(Landroid/content/Context;[I)V
    invoke-static {v0, v1}, Lcom/keymouse/tool/HoldSliders;->access$100(Landroid/content/Context;[I)V

    .line 111
    return-void
.end method
