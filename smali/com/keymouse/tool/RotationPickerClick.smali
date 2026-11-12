.class public Lcom/keymouse/tool/RotationPickerClick;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;
.source "RotationPickerClick.java"


# instance fields
.field private mWm:Landroid/view/WindowManager;

.field private mRoot:Landroid/view/View;

.field private mPath:Ljava/lang/String;

.field private mValue:I


# direct methods
.method public constructor <init>(Landroid/view/WindowManager;Landroid/view/View;Ljava/lang/String;I)V
    .locals 0
    .param p1, "wm"    # Landroid/view/WindowManager;
    .param p2, "root"    # Landroid/view/View;
    .param p3, "path"    # Ljava/lang/String;
    .param p4, "value"    # I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/keymouse/tool/RotationPickerClick;->mWm:Landroid/view/WindowManager;

    iput-object p2, p0, Lcom/keymouse/tool/RotationPickerClick;->mRoot:Landroid/view/View;

    iput-object p3, p0, Lcom/keymouse/tool/RotationPickerClick;->mPath:Ljava/lang/String;

    iput p4, p0, Lcom/keymouse/tool/RotationPickerClick;->mValue:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    :try_start_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/keymouse/tool/RotationPickerClick;->mPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget v2, p0, Lcom/keymouse/tool/RotationPickerClick;->mValue:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :do_remove
    :try_start_1
    iget-object v0, p0, Lcom/keymouse/tool/RotationPickerClick;->mWm:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/keymouse/tool/RotationPickerClick;->mRoot:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_0
    move-exception v0

    goto :do_remove

    :catch_1
    move-exception v0

    return-void
.end method
