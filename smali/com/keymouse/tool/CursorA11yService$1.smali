.class Lcom/keymouse/tool/CursorA11yService$1;
.super Ljava/lang/Object;
.source "CursorA11yService.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/CursorA11yService;->probe(II)I
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
        "Landroid/view/accessibility/AccessibilityWindowInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/CursorA11yService;


# direct methods
.method constructor <init>(Lcom/keymouse/tool/CursorA11yService;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lcom/keymouse/tool/CursorA11yService$1;->this$0:Lcom/keymouse/tool/CursorA11yService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/view/accessibility/AccessibilityWindowInfo;Landroid/view/accessibility/AccessibilityWindowInfo;)I
    .locals 2

    .prologue
    .line 62
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityWindowInfo;->getLayer()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityWindowInfo;->getLayer()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 60
    check-cast p1, Landroid/view/accessibility/AccessibilityWindowInfo;

    check-cast p2, Landroid/view/accessibility/AccessibilityWindowInfo;

    invoke-virtual {p0, p1, p2}, Lcom/keymouse/tool/CursorA11yService$1;->compare(Landroid/view/accessibility/AccessibilityWindowInfo;Landroid/view/accessibility/AccessibilityWindowInfo;)I

    move-result v0

    return v0
.end method
