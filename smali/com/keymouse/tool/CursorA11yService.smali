.class public Lcom/keymouse/tool/CursorA11yService;
.super Landroid/accessibilityservice/AccessibilityService;
.source "CursorA11yService.java"


# static fields
.field private static final BUDGET_NS:J = 0x8583b00L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/accessibilityservice/AccessibilityService;-><init>()V

    return-void
.end method

.method private classify(Landroid/view/accessibility/AccessibilityNodeInfo;J)I
    .locals 10

    .prologue
    const/4 v0, 0x0

    .line 142
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    move v1, v0

    .line 144
    :goto_0
    const/16 v3, 0x8

    if-ge v1, v3, :cond_0

    if-eqz p1, :cond_0

    .line 145
    invoke-static {p1}, Lcom/keymouse/tool/CursorA11yService;->isText(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 146
    const/4 v0, 0x2

    .line 157
    :cond_0
    :goto_1
    return v0

    .line 148
    :cond_1
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 149
    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 150
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-long v6, v3

    mul-long/2addr v4, v6

    .line 151
    const-wide/16 v6, 0x6

    mul-long/2addr v6, p2

    const-wide/16 v8, 0xa

    div-long/2addr v6, v8

    cmp-long v3, v4, v6

    if-gez v3, :cond_2

    .line 152
    const/4 v0, 0x1

    goto :goto_1

    .line 155
    :cond_2
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParent()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    .line 144
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private deepest(Landroid/view/accessibility/AccessibilityNodeInfo;II[IJ)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 9

    .prologue
    const/4 v6, 0x0

    .line 105
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 106
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_0

    .line 107
    aget v2, p4, v6

    if-lez v2, :cond_0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v2, p5

    const-wide/32 v4, 0x8583b00

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 120
    :cond_0
    :goto_1
    return-object p1

    .line 110
    :cond_1
    aget v2, p4, v6

    add-int/lit8 v2, v2, -0x1

    aput v2, p4, v6

    .line 111
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    .line 112
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    move-result v3

    if-nez v3, :cond_3

    .line 106
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 115
    :cond_3
    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 116
    invoke-virtual {v1, p2, p3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v3

    if-eqz v3, :cond_2

    move-object v1, p0

    move v3, p2

    move v4, p3

    move-object v5, p4

    move-wide v6, p5

    .line 117
    invoke-direct/range {v1 .. v7}, Lcom/keymouse/tool/CursorA11yService;->deepest(Landroid/view/accessibility/AccessibilityNodeInfo;II[IJ)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    goto :goto_1
.end method

.method private static isText(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 125
    :try_start_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 138
    :cond_0
    :goto_0
    return v0

    .line 128
    :cond_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v1

    .line 129
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "EditText"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 132
    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_3

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isTextSelectable()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-nez v1, :cond_0

    .line 138
    :cond_3
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public onAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .prologue
    .line 39
    return-void
.end method

.method public onInterrupt()V
    .locals 0

    .prologue
    .line 43
    return-void
.end method

.method protected onServiceConnected()V
    .locals 0

    .prologue
    .line 24
    invoke-super {p0}, Landroid/accessibilityservice/AccessibilityService;->onServiceConnected()V

    .line 25
    sput-object p0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    .line 26
    return-void
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    if-ne v0, p0, :cond_0

    .line 31
    const/4 v0, 0x0

    sput-object v0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    .line 33
    :cond_0
    invoke-static {}, Lcom/keymouse/tool/CursorHit;->reset()V

    .line 34
    invoke-super {p0, p1}, Landroid/accessibilityservice/AccessibilityService;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method probe(II)I
    .locals 12

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 48
    invoke-virtual {p0}, Lcom/keymouse/tool/CursorA11yService;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 49
    invoke-virtual {p0}, Lcom/keymouse/tool/CursorA11yService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 50
    int-to-long v4, v0

    int-to-long v2, v2

    mul-long v8, v4, v2

    .line 53
    :try_start_0
    invoke-virtual {p0}, Lcom/keymouse/tool/CursorA11yService;->getWindows()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 57
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 58
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 59
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 60
    new-instance v0, Lcom/keymouse/tool/CursorA11yService$1;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/CursorA11yService$1;-><init>(Lcom/keymouse/tool/CursorA11yService;)V

    invoke-static {v3, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 65
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 66
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    .line 67
    invoke-virtual {v0, v4}, Landroid/view/accessibility/AccessibilityWindowInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 68
    invoke-virtual {v4, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 71
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->getRoot()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    .line 72
    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 54
    :catch_0
    move-exception v0

    .line 55
    const/4 v0, 0x0

    goto :goto_0

    .line 77
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 78
    invoke-virtual {p0}, Lcom/keymouse/tool/CursorA11yService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 84
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 85
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long/2addr v4, v6

    const-wide/32 v10, 0x8583b00

    cmp-long v4, v4, v10

    if-lez v4, :cond_5

    :cond_4
    move v0, v1

    .line 101
    :goto_2
    return v0

    .line 89
    :cond_5
    invoke-virtual {p0}, Lcom/keymouse/tool/CursorA11yService;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v4

    if-eqz v4, :cond_3

    .line 92
    :cond_6
    invoke-virtual {v2, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 93
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 96
    const/4 v0, 0x1

    new-array v5, v0, [I

    const/16 v0, 0x2bc

    aput v0, v5, v1

    move-object v1, p0

    move v3, p1

    move v4, p2

    .line 97
    invoke-direct/range {v1 .. v7}, Lcom/keymouse/tool/CursorA11yService;->deepest(Landroid/view/accessibility/AccessibilityNodeInfo;II[IJ)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    .line 98
    invoke-direct {p0, v0, v8, v9}, Lcom/keymouse/tool/CursorA11yService;->classify(Landroid/view/accessibility/AccessibilityNodeInfo;J)I

    move-result v0

    goto :goto_2
.end method
