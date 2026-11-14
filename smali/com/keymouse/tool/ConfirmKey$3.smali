.class Lcom/keymouse/tool/ConfirmKey$3;
.super Ljava/lang/Object;
.source "ConfirmKey.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/ConfirmKey;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dir:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 75
    iput-object p1, p0, Lcom/keymouse/tool/ConfirmKey$3;->val$dir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    .prologue
    .line 77
    iget-object v0, p0, Lcom/keymouse/tool/ConfirmKey$3;->val$dir:Ljava/io/File;

    const-string v1, "clear_confirm"

    invoke-static {v0, v1}, Lcom/keymouse/tool/ToggleKeys;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    .line 79
    :try_start_7
    new-instance v0, Ljava/io/FileOutputStream;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/keymouse/tool/ConfirmKey$3;->val$dir:Ljava/io/File;

    const-string v3, "keymouse_confirm_key"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 80
    const-string v1, "0\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 81
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_21} :catch_22

    .line 84
    :goto_21
    return-void

    .line 82
    :catch_22
    move-exception v0

    goto :goto_21
.end method
