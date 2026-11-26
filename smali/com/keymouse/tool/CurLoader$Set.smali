.class final Lcom/keymouse/tool/CurLoader$Set;
.super Ljava/lang/Object;
.source "CurLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keymouse/tool/CurLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Set"
.end annotation


# instance fields
.field baseH:I

.field baseW:I

.field delay:[I

.field frames:[Landroid/graphics/Bitmap;

.field hx:[I

.field hy:[I

.field seq:[I

.field total:I


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method animated()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 33
    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    array-length v1, v1

    if-le v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method frameAt(J)I
    .locals 7

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0}, Lcom/keymouse/tool/CurLoader$Set;->animated()Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/keymouse/tool/CurLoader$Set;->total:I

    if-gtz v1, :cond_2

    .line 39
    :cond_0
    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    array-length v1, v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    aget v0, v1, v0

    .line 48
    :cond_1
    :goto_0
    return v0

    .line 41
    :cond_2
    iget v1, p0, Lcom/keymouse/tool/CurLoader$Set;->total:I

    int-to-long v2, v1

    rem-long v2, p1, v2

    .line 42
    :goto_1
    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    array-length v1, v1

    if-ge v0, v1, :cond_4

    .line 43
    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->delay:[I

    aget v1, v1, v0

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-gez v1, :cond_3

    .line 44
    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    aget v0, v1, v0

    goto :goto_0

    .line 46
    :cond_3
    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->delay:[I

    aget v1, v1, v0

    int-to-long v4, v1

    sub-long/2addr v2, v4

    .line 42
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 48
    :cond_4
    iget-object v0, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    goto :goto_0
.end method
