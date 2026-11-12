.class Lcom/keymouse/tool/KmExclActivity$1;
.super Ljava/lang/Object;
.source "KmExclActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


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
    .line 98
    iput-object p1, p0, Lcom/keymouse/tool/KmExclActivity$1;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 3

    .prologue
    .line 106
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$1;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # invokes: Lcom/keymouse/tool/KmExclActivity;->refilter()V
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$000(Lcom/keymouse/tool/KmExclActivity;)V

    .line 107
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .prologue
    .line 100
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .prologue
    .line 103
    return-void
.end method
