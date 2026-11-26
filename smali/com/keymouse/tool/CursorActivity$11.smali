.class Lcom/keymouse/tool/CursorActivity$11;
.super Ljava/lang/Object;
.source "CursorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorActivity;->pickFile(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorActivity;

.field final synthetic val$arr:[Ljava/lang/String;

.field final synthetic val$slot:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 393
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity$11;->this$0:Lcom/keymouse/tool/CursorActivity;

    iput-object p2, p0, Lcom/keymouse/tool/CursorActivity$11;->val$slot:Ljava/lang/String;

    iput-object p3, p0, Lcom/keymouse/tool/CursorActivity$11;->val$arr:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .prologue
    .line 395
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$11;->this$0:Lcom/keymouse/tool/CursorActivity;

    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity$11;->val$slot:Ljava/lang/String;

    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity$11;->val$arr:[Ljava/lang/String;

    aget-object v2, v2, p2

    invoke-static {v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->access$100(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$11;->this$0:Lcom/keymouse/tool/CursorActivity;

    const-string v1, "on"

    const-string v2, "1"

    invoke-static {v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->access$100(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity$11;->this$0:Lcom/keymouse/tool/CursorActivity;

    invoke-static {v0}, Lcom/keymouse/tool/CursorActivity;->access$800(Lcom/keymouse/tool/CursorActivity;)V

    .line 398
    return-void
.end method
