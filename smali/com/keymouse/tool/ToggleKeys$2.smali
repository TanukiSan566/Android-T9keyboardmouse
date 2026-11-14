.class Lcom/keymouse/tool/ToggleKeys$2;
.super Ljava/lang/Object;
.source "ToggleKeys.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 262
    iput-object p1, p0, Lcom/keymouse/tool/ToggleKeys$2;->val$dir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 4

    .prologue
    .line 264
    iget-object v0, p0, Lcom/keymouse/tool/ToggleKeys$2;->val$dir:Ljava/io/File;

    # invokes: Lcom/keymouse/tool/ToggleKeys;->writeLockAllow(Ljava/io/File;Z)V
    invoke-static {v0, p2}, Lcom/keymouse/tool/ToggleKeys;->access$000(Ljava/io/File;Z)V

    .line 265
    return-void
.end method
