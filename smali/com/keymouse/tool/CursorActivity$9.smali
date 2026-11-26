.class Lcom/keymouse/tool/CursorActivity$9;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->rebuildBuiltin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;

.field final synthetic val$fl:Ljava/util/ArrayList;

.field final synthetic val$thumbs:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 394
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$9;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-object p2, p0, Lcom/keymouse/tool/CursorActivity$9;->val$fl:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/keymouse/tool/CursorActivity$9;->val$thumbs:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v3, 0x0

    .line 396
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$9;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->installAllThemes(Landroid/content/Context;)V

    move v2, v3

    .line 397
    :goto_0
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$9;->val$fl:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v2, v0, :cond_2

    .line 398
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$9;->val$thumbs:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/widget/ImageView;

    move v4, v3

    .line 399
    :goto_1
    const/4 v1, 0x4

    if-ge v4, v1, :cond_1

    .line 400
    sget-object v1, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    aget-object v5, v1, v4

    .line 401
    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lcom/keymouse/tool/CursorActivity$9;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$9;->val$fl:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    aget-object v1, v1, v3

    invoke-static {v7, v1}, Lcom/keymouse/tool/CursorCfg;->themeDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".cur"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v1, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 402
    invoke-static {v5}, Lcom/keymouse/tool/CursorCfg;->defHotspot(Ljava/lang/String;)I

    move-result v1

    invoke-static {v6, v1}, Lcom/keymouse/tool/CurLoader;->load(Ljava/io/File;I)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v1

    .line 403
    if-nez v1, :cond_0

    .line 399
    :goto_2
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_1

    .line 406
    :cond_0
    iget-object v5, v1, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    const-wide/16 v6, 0x0

    invoke-virtual {v1, v6, v7}, Lcom/keymouse/tool/CurLoader$Set;->frameAt(J)I

    move-result v1

    aget-object v1, v5, v1

    .line 407
    aget-object v5, v0, v4

    .line 408
    iget-object v6, p0, Lcom/keymouse/tool/CursorActivity$9;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v6}, Lcom/keymouse/tool/CursorActivity;->access$900(Lcom/keymouse/tool/CursorActivity;)Landroid/os/Handler;

    move-result-object v6

    new-instance v7, Lcom/keymouse/tool/CursorActivity$9$1;

    invoke-direct {v7, p0, v5, v1}, Lcom/keymouse/tool/CursorActivity$9$1;-><init>(Lcom/keymouse/tool/CursorActivity$9;Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    invoke-virtual {v6, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    .line 397
    :cond_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    .line 415
    :cond_2
    return-void
.end method
