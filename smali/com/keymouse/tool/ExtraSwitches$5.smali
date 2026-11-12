.class Lcom/keymouse/tool/ExtraSwitches$5;
.super Ljava/lang/Object;
.source "ExtraSwitches.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/ExtraSwitches;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V
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
    .line 191
    iput-object p1, p0, Lcom/keymouse/tool/ExtraSwitches$5;->val$dir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/keymouse/tool/ExtraSwitches$5;->val$dir:Ljava/io/File;

    invoke-static {v0, p2}, Lcom/keymouse/tool/ExtraSwitches;->writeLockAllow(Ljava/io/File;Z)V

    .line 194
    return-void
.end method
