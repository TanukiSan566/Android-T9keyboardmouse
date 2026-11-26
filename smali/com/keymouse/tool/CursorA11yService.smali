.class public Lcom/keymouse/tool/CursorA11yService;
.super Landroid/accessibilityservice/AccessibilityService;
.source "CursorA11yService.java"


# static fields
.field private static final ACTION_CLICK:I = 0x10

.field private static final BUDGET_NS:J = 0xd1cef00L

.field private static final MAX_NODES:I = 0x3e8


# instance fields
.field private mLastSig:Ljava/lang/String;

.field private mLogAt:J

.field private mLogBurst:I

.field private mWhy:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/accessibilityservice/AccessibilityService;-><init>()V

    .line 35
    const-string v0, ""

    iput-object v0, p0, Lcom/keymouse/tool/CursorA11yService;->mLastSig:Ljava/lang/String;

    .line 36
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keymouse/tool/CursorA11yService;->mLogAt:J

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lcom/keymouse/tool/CursorA11yService;->mLogBurst:I

    .line 268
    const-string v0, ""

    iput-object v0, p0, Lcom/keymouse/tool/CursorA11yService;->mWhy:Ljava/lang/String;

    return-void
.end method

.method private classify(Ljava/util/ArrayList;J)[I
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;J)[I"
        }
    .end annotation

    .prologue
    .line 224
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v3, v0, -0x1

    .line 225
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 226
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    move v2, v3

    .line 228
    :goto_0
    if-ltz v2, :cond_1

    add-int/lit8 v1, v3, -0x3

    if-lt v2, v1, :cond_1

    .line 229
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 230
    invoke-static {v1}, Lcom/keymouse/tool/CursorA11yService;->isEditable(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "edit@"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sub-int v2, v3, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/CursorA11yService;->mWhy:Ljava/lang/String;

    .line 232
    const/4 v0, 0x2

    invoke-direct {p0, v0, v1}, Lcom/keymouse/tool/CursorA11yService;->pack(ILandroid/view/accessibility/AccessibilityNodeInfo;)[I

    move-result-object v0

    .line 265
    :goto_1
    return-object v0

    .line 228
    :cond_0
    add-int/lit8 v1, v2, -0x1

    move v2, v1

    goto :goto_0

    :cond_1
    move v2, v3

    .line 236
    :goto_2
    if-ltz v2, :cond_2

    add-int/lit8 v1, v3, -0x6

    if-lt v2, v1, :cond_2

    .line 237
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 238
    if-ge v2, v3, :cond_4

    invoke-static {v1}, Lcom/keymouse/tool/CursorA11yService;->isWebView(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 251
    :cond_2
    invoke-static {v0}, Lcom/keymouse/tool/CursorA11yService;->hasText(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 252
    const/4 v2, 0x0

    .line 253
    :goto_3
    if-ltz v3, :cond_9

    .line 254
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo;

    invoke-static {v1}, Lcom/keymouse/tool/CursorA11yService;->isWebView(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 255
    const/4 v1, 0x1

    .line 259
    :goto_4
    invoke-static {v0}, Lcom/keymouse/tool/CursorA11yService;->selectable(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v2

    if-nez v2, :cond_3

    if-eqz v1, :cond_8

    .line 260
    :cond_3
    invoke-static {v0}, Lcom/keymouse/tool/CursorA11yService;->selectable(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "text-sel"

    :goto_5
    iput-object v1, p0, Lcom/keymouse/tool/CursorA11yService;->mWhy:Ljava/lang/String;

    .line 261
    const/4 v1, 0x2

    invoke-direct {p0, v1, v0}, Lcom/keymouse/tool/CursorA11yService;->pack(ILandroid/view/accessibility/AccessibilityNodeInfo;)[I

    move-result-object v0

    goto :goto_1

    .line 241
    :cond_4
    invoke-static {v1}, Lcom/keymouse/tool/CursorA11yService;->looksClickable(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 242
    invoke-virtual {v1, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 243
    const/4 v5, 0x0

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-long v6, v5

    const/4 v5, 0x0

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v8

    invoke-static {v5, v8}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-long v8, v5

    mul-long/2addr v6, v8

    .line 244
    const-wide/16 v8, 0x6

    mul-long/2addr v8, p2

    const-wide/16 v10, 0xa

    div-long/2addr v8, v10

    cmp-long v5, v6, v8

    if-gez v5, :cond_5

    .line 245
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "click@"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sub-int v2, v3, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/CursorA11yService;->mWhy:Ljava/lang/String;

    .line 246
    const/4 v0, 0x1

    invoke-direct {p0, v0, v1}, Lcom/keymouse/tool/CursorA11yService;->pack(ILandroid/view/accessibility/AccessibilityNodeInfo;)[I

    move-result-object v0

    goto/16 :goto_1

    .line 236
    :cond_5
    add-int/lit8 v1, v2, -0x1

    move v2, v1

    goto/16 :goto_2

    .line 253
    :cond_6
    add-int/lit8 v1, v3, -0x1

    move v3, v1

    goto :goto_3

    .line 260
    :cond_7
    const-string v1, "text-web"

    goto :goto_5

    .line 264
    :cond_8
    const-string v1, "plain"

    iput-object v1, p0, Lcom/keymouse/tool/CursorA11yService;->mWhy:Ljava/lang/String;

    .line 265
    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/keymouse/tool/CursorA11yService;->pack(ILandroid/view/accessibility/AccessibilityNodeInfo;)[I

    move-result-object v0

    goto/16 :goto_1

    :cond_9
    move v1, v2

    goto :goto_4
.end method

.method private descend(Landroid/view/accessibility/AccessibilityNodeInfo;II[IJLjava/util/ArrayList;Z)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            "II[IJ",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 127
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 128
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_0
    if-ltz v2, :cond_0

    .line 129
    const/4 v4, 0x0

    aget v4, p4, v4

    if-lez v4, :cond_0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long v4, v4, p5

    const-wide/32 v6, 0xd1cef00

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 150
    :cond_0
    :goto_1
    return-void

    .line 132
    :cond_1
    const/4 v4, 0x0

    aget v5, p4, v4

    add-int/lit8 v5, v5, -0x1

    aput v5, p4, v4

    .line 133
    invoke-virtual {p1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChild(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v4

    .line 134
    if-nez v4, :cond_3

    .line 128
    :cond_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 137
    :cond_3
    invoke-virtual {v4, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 138
    move/from16 v0, p3

    invoke-virtual {v3, p2, v0}, Landroid/graphics/Rect;->contains(II)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 141
    if-nez p8, :cond_4

    invoke-static {v4}, Lcom/keymouse/tool/CursorA11yService;->isWebView(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v5

    if-eqz v5, :cond_6

    :cond_4
    const/4 v11, 0x1

    .line 143
    :goto_2
    if-nez v11, :cond_5

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 146
    :cond_5
    move-object/from16 v0, p7

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v3, p0

    move v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    move-wide/from16 v8, p5

    move-object/from16 v10, p7

    .line 147
    invoke-direct/range {v3 .. v11}, Lcom/keymouse/tool/CursorA11yService;->descend(Landroid/view/accessibility/AccessibilityNodeInfo;II[IJLjava/util/ArrayList;Z)V

    goto :goto_1

    .line 141
    :cond_6
    const/4 v11, 0x0

    goto :goto_2
.end method

.method private dlog(Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 299
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 300
    iget-wide v2, p0, Lcom/keymouse/tool/CursorA11yService;->mLogAt:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 301
    iput-wide v0, p0, Lcom/keymouse/tool/CursorA11yService;->mLogAt:J

    .line 302
    const/4 v0, 0x0

    iput v0, p0, Lcom/keymouse/tool/CursorA11yService;->mLogBurst:I

    .line 304
    :cond_0
    iget v0, p0, Lcom/keymouse/tool/CursorA11yService;->mLogBurst:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/keymouse/tool/CursorA11yService;->mLogBurst:I

    const/4 v1, 0x6

    if-le v0, v1, :cond_2

    .line 323
    :cond_1
    :goto_0
    return-void

    .line 307
    :cond_2
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/keymouse/tool/CursorA11yService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "keymouse.log"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 308
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 311
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 312
    const-string v2, "[%02d:%02d:%02d] [hit] %s\n"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/16 v5, 0xb

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const/16 v5, 0xc

    .line 313
    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const/16 v5, 0xd

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v4

    const/4 v1, 0x3

    aput-object p1, v3, v1

    .line 312
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 314
    new-instance v2, Ljava/io/FileOutputStream;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 316
    :try_start_1
    const-string v0, "UTF-8"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 318
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    goto :goto_0

    .line 320
    :catch_0
    move-exception v0

    goto :goto_0

    .line 318
    :catchall_0
    move-exception v0

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 319
    throw v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method private static hasText(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 202
    :try_start_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 203
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    .line 205
    :cond_0
    :goto_0
    return v0

    .line 204
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static isEditable(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 163
    :try_start_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 169
    :cond_0
    :goto_0
    return v0

    .line 166
    :cond_1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v2

    .line 167
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "EditText"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0

    .line 168
    :catch_0
    move-exception v0

    move v0, v1

    .line 169
    goto :goto_0
.end method

.method private static isWebView(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 154
    :try_start_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v1

    .line 155
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "WebView"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 157
    :cond_0
    :goto_0
    return v0

    .line 156
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private logProbe(IILjava/util/ArrayList;[IJILjava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;[IJI",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v1, 0x0

    .line 276
    :try_start_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 277
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 278
    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 279
    if-ltz v3, :cond_4

    .line 280
    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    move-object v3, v2

    .line 282
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    aget v4, p4, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "|"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/keymouse/tool/CursorA11yService;->mWhy:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "|"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "|"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 283
    iget-object v4, p0, Lcom/keymouse/tool/CursorA11yService;->mLastSig:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 295
    :goto_1
    return-void

    .line 286
    :cond_0
    iput-object v2, p0, Lcom/keymouse/tool/CursorA11yService;->mLastSig:Ljava/lang/String;

    .line 287
    const/4 v2, 0x0

    aget v2, p4, v2

    if-ne v2, v5, :cond_1

    const-string v2, "\u624b\u578b"

    .line 288
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u5224\u5b9a "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " \u539f\u56e0="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/keymouse/tool/CursorA11yService;->mWhy:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " \u70b9=("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ") \u63a7\u4ef6="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u70b9\u51fb="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 289
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u6587\u5b57\u957f\u5ea6="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    if-nez v3, :cond_3

    move v0, v1

    :goto_3
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u5c42\u6570="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 290
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u8303\u56f4=["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    aget v1, p4, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x2

    aget v1, p4, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    aget v1, p4, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x4

    aget v1, p4, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] \u8017\u65f6="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ms \u8bbf\u95ee\u8282\u70b9="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u5305="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 288
    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorA11yService;->dlog(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 292
    :catch_0
    move-exception v0

    goto/16 :goto_1

    .line 287
    :cond_1
    const/4 v2, 0x0

    aget v2, p4, v2

    if-ne v2, v6, :cond_2

    const-string v2, "I\u578b"

    goto/16 :goto_2

    :cond_2
    const-string v2, "\u7bad\u5934"

    goto/16 :goto_2

    .line 289
    :cond_3
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto/16 :goto_3

    :cond_4
    move-object v3, v2

    goto/16 :goto_0
.end method

.method private static looksClickable(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 6

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 175
    :try_start_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    .line 197
    :goto_0
    return v0

    .line 178
    :cond_0
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getActionList()Ljava/util/List;

    move-result-object v4

    .line 179
    if-eqz v4, :cond_2

    move v3, v2

    .line 180
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    if-ge v3, v0, :cond_2

    .line 181
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getId()I

    move-result v0

    const/16 v5, 0x10

    if-ne v0, v5, :cond_1

    move v0, v1

    .line 182
    goto :goto_0

    .line 180
    :cond_1
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_1

    .line 186
    :cond_2
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getClassName()Ljava/lang/CharSequence;

    move-result-object v0

    .line 187
    if-eqz v0, :cond_4

    .line 188
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 189
    const-string v3, "Button"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "CheckBox"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "Switch"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "RadioButton"

    .line 190
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "Spinner"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    move v0, v1

    .line 191
    goto :goto_0

    .line 194
    :catch_0
    move-exception v0

    :cond_4
    move v0, v2

    .line 197
    goto :goto_0
.end method

.method private pack(ILandroid/view/accessibility/AccessibilityNodeInfo;)[I
    .locals 4

    .prologue
    .line 218
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 219
    invoke-virtual {p2, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 220
    const/4 v1, 0x5

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    iget v3, v0, Landroid/graphics/Rect;->left:I

    aput v3, v1, v2

    const/4 v2, 0x2

    iget v3, v0, Landroid/graphics/Rect;->top:I

    aput v3, v1, v2

    const/4 v2, 0x3

    iget v3, v0, Landroid/graphics/Rect;->right:I

    aput v3, v1, v2

    const/4 v2, 0x4

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    aput v0, v1, v2

    return-object v1
.end method

.method private static selectable(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 211
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_0

    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isTextSelectable()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 213
    :cond_0
    :goto_0
    return v0

    .line 212
    :catch_0
    move-exception v1

    goto :goto_0
.end method


# virtual methods
.method public onAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .prologue
    .line 58
    return-void
.end method

.method public onInterrupt()V
    .locals 0

    .prologue
    .line 62
    return-void
.end method

.method protected onServiceConnected()V
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Landroid/accessibilityservice/AccessibilityService;->onServiceConnected()V

    .line 42
    sput-object p0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    .line 43
    const-string v0, "\u65e0\u969c\u788d\u670d\u52a1\u5df2\u8fde\u63a5"

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorA11yService;->dlog(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    if-ne v0, p0, :cond_0

    .line 49
    const/4 v0, 0x0

    sput-object v0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    .line 51
    :cond_0
    invoke-static {}, Lcom/keymouse/tool/CursorHit;->reset()V

    .line 52
    const-string v0, "\u65e0\u969c\u788d\u670d\u52a1\u5df2\u65ad\u5f00"

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorA11yService;->dlog(Ljava/lang/String;)V

    .line 53
    invoke-super {p0, p1}, Landroid/accessibilityservice/AccessibilityService;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method probe(II)[I
    .locals 16

    .prologue
    .line 66
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 67
    invoke-virtual/range {p0 .. p0}, Lcom/keymouse/tool/CursorA11yService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 68
    iget v3, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-long v4, v3

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-long v2, v2

    mul-long v12, v4, v2

    .line 71
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/keymouse/tool/CursorA11yService;->getWindows()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 75
    :goto_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 76
    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 77
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 78
    new-instance v2, Lcom/keymouse/tool/CursorA11yService$1;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/keymouse/tool/CursorA11yService$1;-><init>(Lcom/keymouse/tool/CursorA11yService;)V

    invoke-static {v4, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 83
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 84
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/accessibility/AccessibilityWindowInfo;

    .line 85
    invoke-virtual {v2, v5}, Landroid/view/accessibility/AccessibilityWindowInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 86
    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v5, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 89
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityWindowInfo;->getRoot()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    .line 90
    if-eqz v2, :cond_0

    .line 91
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 72
    :catch_0
    move-exception v2

    .line 73
    const/4 v2, 0x0

    goto :goto_0

    .line 95
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 96
    invoke-virtual/range {p0 .. p0}, Lcom/keymouse/tool/CursorA11yService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v2

    .line 97
    if-eqz v2, :cond_2

    .line 98
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_2
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 102
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 103
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    sub-long/2addr v6, v8

    const-wide/32 v10, 0xd1cef00

    cmp-long v5, v6, v10

    if-lez v5, :cond_5

    .line 122
    :cond_4
    const/4 v2, 0x5

    new-array v11, v2, [I

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v3, v11, v2

    const/4 v2, 0x1

    aput p1, v11, v2

    const/4 v2, 0x2

    aput p2, v11, v2

    const/4 v2, 0x3

    add-int/lit8 v3, p1, 0x1

    aput v3, v11, v2

    const/4 v2, 0x4

    add-int/lit8 v3, p2, 0x1

    aput v3, v11, v2

    :goto_2
    return-object v11

    .line 107
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/keymouse/tool/CursorA11yService;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildCount()I

    move-result v5

    if-eqz v5, :cond_3

    .line 110
    :cond_6
    invoke-virtual {v4, v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 111
    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 114
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 115
    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    const/4 v2, 0x1

    new-array v7, v2, [I

    const/4 v2, 0x0

    const/16 v3, 0x3e8

    aput v3, v7, v2

    .line 117
    invoke-static {v4}, Lcom/keymouse/tool/CursorA11yService;->isWebView(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    move-result v11

    move-object/from16 v3, p0

    move/from16 v5, p1

    move/from16 v6, p2

    invoke-direct/range {v3 .. v11}, Lcom/keymouse/tool/CursorA11yService;->descend(Landroid/view/accessibility/AccessibilityNodeInfo;II[IJLjava/util/ArrayList;Z)V

    .line 118
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v12, v13}, Lcom/keymouse/tool/CursorA11yService;->classify(Ljava/util/ArrayList;J)[I

    move-result-object v11

    .line 119
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v2, v8

    const-wide/32 v8, 0xf4240

    div-long v12, v2, v8

    const/4 v2, 0x0

    aget v2, v7, v2

    rsub-int v14, v2, 0x3e8

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v7, p0

    move/from16 v8, p1

    move/from16 v9, p2

    invoke-direct/range {v7 .. v15}, Lcom/keymouse/tool/CursorA11yService;->logProbe(IILjava/util/ArrayList;[IJILjava/lang/String;)V

    goto :goto_2
.end method
