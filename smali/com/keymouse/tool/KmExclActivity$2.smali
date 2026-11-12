.class Lcom/keymouse/tool/KmExclActivity$2;
.super Ljava/lang/Object;
.source "KmExclActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    .line 115
    iput-object p1, p0, Lcom/keymouse/tool/KmExclActivity$2;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 4

    .prologue
    .line 117
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$2;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # setter for: Lcom/keymouse/tool/KmExclActivity;->mShowHidden:Z
    invoke-static {v0, p2}, Lcom/keymouse/tool/KmExclActivity;->access$102(Lcom/keymouse/tool/KmExclActivity;Z)Z

    .line 118
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$2;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # invokes: Lcom/keymouse/tool/KmExclActivity;->load()V
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$200(Lcom/keymouse/tool/KmExclActivity;)V

    .line 119
    return-void
.end method
