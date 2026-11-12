.class Lcom/keymouse/tool/KmExclActivity$6;
.super Ljava/lang/Object;
.source "KmExclActivity.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KmExclActivity;->refilter()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/keymouse/tool/KmExclActivity$Item;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KmExclActivity;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KmExclActivity;)V
    .registers 2

    .prologue
    .line 267
    iput-object p1, p0, Lcom/keymouse/tool/KmExclActivity$6;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/keymouse/tool/KmExclActivity$Item;Lcom/keymouse/tool/KmExclActivity$Item;)I
    .registers 6

    .prologue
    .line 269
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$6;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$500(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p1, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 270
    iget-object v1, p0, Lcom/keymouse/tool/KmExclActivity$6;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;
    invoke-static {v1}, Lcom/keymouse/tool/KmExclActivity;->access$500(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/Set;

    move-result-object v1

    iget-object v2, p2, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    .line 271
    if-eq v0, v1, :cond_20

    .line 272
    if-eqz v0, :cond_1e

    const/4 v0, -0x1

    .line 274
    :goto_1d
    return v0

    .line 272
    :cond_1e
    const/4 v0, 0x1

    goto :goto_1d

    .line 274
    :cond_20
    iget-object v0, p1, Lcom/keymouse/tool/KmExclActivity$Item;->label:Ljava/lang/String;

    iget-object v1, p2, Lcom/keymouse/tool/KmExclActivity$Item;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    goto :goto_1d
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 267
    check-cast p1, Lcom/keymouse/tool/KmExclActivity$Item;

    check-cast p2, Lcom/keymouse/tool/KmExclActivity$Item;

    invoke-virtual {p0, p1, p2}, Lcom/keymouse/tool/KmExclActivity$6;->compare(Lcom/keymouse/tool/KmExclActivity$Item;Lcom/keymouse/tool/KmExclActivity$Item;)I

    move-result v0

    return v0
.end method
