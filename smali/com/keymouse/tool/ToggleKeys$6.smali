.class Lcom/keymouse/tool/ToggleKeys$6;
.super Ljava/lang/Object;
.source "ToggleKeys.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/ToggleKeys;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dir:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 338
    iput-object p1, p0, Lcom/keymouse/tool/ToggleKeys$6;->val$dir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .prologue
    .line 340
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$6;->val$dir:Ljava/io/File;

    const-string v1, "reset"

    invoke-static {v0, v1}, Lcom/keymouse/tool/ToggleKeys;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    .line 343
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/keymouse/tool/ToggleKeys$6;->val$dir:Ljava/io/File;

    const-string v3, "keymouse_toggle_keys"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 344
    const-string v1, "59\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 345
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 348
    :goto_0
    return-void

    .line 346
    :catch_0
    move-exception v0

    goto :goto_0
.end method
