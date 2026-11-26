.class final Lcom/keymouse/tool/PosDot$Art;
.super Landroid/view/View;
.source "PosDot.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keymouse/tool/PosDot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Art"
.end annotation


# static fields
.field private static final SHAPE:[F


# instance fields
.field private final bmp:Landroid/graphics/Bitmap;

.field private final bmpPaint:Landroid/graphics/Paint;

.field private cs:Lcom/keymouse/tool/CurLoader$Set;

.field private csPx:F

.field private csStart:J

.field private final cursorH:F

.field private final dotEdge:Landroid/graphics/Paint;

.field private final dotFill:Landroid/graphics/Paint;

.field private final dotR:F

.field private drawCursor:Z

.field private drawDot:Z

.field private nextDur:J

.field private nextTo:F

.field private final pad:F

.field private press:I

.field private scale:F

.field private segDur:J

.field private segFrom:F

.field private segStart:J

.field private segTo:F

.field final win:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 348
    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keymouse/tool/PosDot$Art;->SHAPE:[F

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x3f3851ec    # 0.72f
        0x3f47ae14    # 0.78f
        0x3e99999a    # 0.3f
        0x3f3851ec    # 0.72f
        0x3df5c28f    # 0.12f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method constructor <init>(Landroid/content/Context;F)V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    .line 372
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 354
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->bmpPaint:Landroid/graphics/Paint;

    .line 355
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotFill:Landroid/graphics/Paint;

    .line 356
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotEdge:Landroid/graphics/Paint;

    .line 357
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->cs:Lcom/keymouse/tool/CurLoader$Set;

    .line 358
    const/4 v0, 0x0

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->csPx:F

    .line 359
    iput-wide v4, p0, Lcom/keymouse/tool/PosDot$Art;->csStart:J

    .line 360
    iput-boolean v3, p0, Lcom/keymouse/tool/PosDot$Art;->drawCursor:Z

    .line 361
    iput-boolean v3, p0, Lcom/keymouse/tool/PosDot$Art;->drawDot:Z

    .line 362
    const/4 v0, 0x0

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->press:I

    .line 363
    iput v2, p0, Lcom/keymouse/tool/PosDot$Art;->scale:F

    .line 364
    iput v2, p0, Lcom/keymouse/tool/PosDot$Art;->segFrom:F

    .line 365
    iput v2, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    .line 366
    iput-wide v4, p0, Lcom/keymouse/tool/PosDot$Art;->segStart:J

    .line 367
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/keymouse/tool/PosDot$Art;->segDur:J

    .line 368
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->nextTo:F

    .line 369
    iput-wide v4, p0, Lcom/keymouse/tool/PosDot$Art;->nextDur:J

    .line 373
    const/high16 v0, 0x41c00000    # 24.0f

    mul-float/2addr v0, p2

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->cursorH:F

    .line 374
    const/high16 v0, 0x40800000    # 4.0f

    mul-float/2addr v0, p2

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->pad:F

    .line 375
    const/high16 v0, 0x40a00000    # 5.0f

    const/high16 v1, 0x40c00000    # 6.0f

    mul-float/2addr v1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotR:F

    .line 377
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->cursorH:F

    const/high16 v1, 0x42900000    # 72.0f

    mul-float/2addr v1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const/high16 v1, 0x3fa00000    # 1.25f

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/keymouse/tool/PosDot$Art;->pad:F

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->win:I

    .line 378
    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotFill:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 379
    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotFill:Landroid/graphics/Paint;

    const/high16 v1, -0x10000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 380
    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotEdge:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 381
    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotEdge:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 382
    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotEdge:Landroid/graphics/Paint;

    invoke-static {v2, p2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 383
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->cursorH:F

    iget v1, p0, Lcom/keymouse/tool/PosDot$Art;->pad:F

    invoke-static {v0, v1, p2}, Lcom/keymouse/tool/PosDot$Art;->makeCursor(FFF)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->bmp:Landroid/graphics/Bitmap;

    .line 384
    return-void
.end method

.method private currentScale(J)F
    .locals 9

    .prologue
    const/4 v0, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    .line 430
    iget-wide v4, p0, Lcom/keymouse/tool/PosDot$Art;->segDur:J

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-gtz v1, :cond_0

    move v1, v2

    .line 431
    :goto_0
    cmpl-float v3, v1, v2

    if-ltz v3, :cond_2

    .line 432
    iget v1, p0, Lcom/keymouse/tool/PosDot$Art;->nextTo:F

    cmpg-float v1, v1, v0

    if-gez v1, :cond_1

    .line 433
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->scale:F

    .line 434
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->scale:F

    .line 446
    :goto_1
    return v0

    .line 430
    :cond_0
    iget-wide v4, p0, Lcom/keymouse/tool/PosDot$Art;->segStart:J

    sub-long v4, p1, v4

    long-to-float v1, v4

    iget-wide v4, p0, Lcom/keymouse/tool/PosDot$Art;->segDur:J

    long-to-float v3, v4

    div-float/2addr v1, v3

    goto :goto_0

    .line 437
    :cond_1
    iget v1, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    iput v1, p0, Lcom/keymouse/tool/PosDot$Art;->segFrom:F

    .line 438
    iget v1, p0, Lcom/keymouse/tool/PosDot$Art;->nextTo:F

    iput v1, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    .line 439
    iget-wide v4, p0, Lcom/keymouse/tool/PosDot$Art;->nextDur:J

    iput-wide v4, p0, Lcom/keymouse/tool/PosDot$Art;->segDur:J

    .line 440
    iput-wide p1, p0, Lcom/keymouse/tool/PosDot$Art;->segStart:J

    .line 441
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/keymouse/tool/PosDot$Art;->nextTo:F

    .line 444
    :goto_2
    sub-float v1, v2, v0

    sub-float v0, v2, v0

    mul-float/2addr v0, v1

    sub-float v0, v2, v0

    .line 445
    iget v1, p0, Lcom/keymouse/tool/PosDot$Art;->segFrom:F

    iget v2, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    iget v3, p0, Lcom/keymouse/tool/PosDot$Art;->segFrom:F

    sub-float/2addr v2, v3

    mul-float/2addr v0, v2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->scale:F

    .line 446
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->scale:F

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_2
.end method

.method private static makeCursor(FFF)Landroid/graphics/Bitmap;
    .locals 15

    .prologue
    .line 492
    const v0, 0x3f3851ec    # 0.72f

    mul-float v8, p0, v0

    .line 493
    const/high16 v0, 0x40000000    # 2.0f

    mul-float v0, v0, p1

    add-float/2addr v0, v8

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v9, v0

    .line 494
    const/high16 v0, 0x40000000    # 2.0f

    mul-float v0, v0, p1

    add-float/2addr v0, p0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v10, v0

    .line 496
    const/4 v0, 0x2

    .line 497
    mul-int v1, v9, v0

    mul-int v2, v10, v0

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 498
    new-instance v12, Landroid/graphics/Canvas;

    invoke-direct {v12, v11}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 499
    int-to-float v1, v0

    int-to-float v0, v0

    invoke-virtual {v12, v1, v0}, Landroid/graphics/Canvas;->scale(FF)V

    .line 500
    new-instance v13, Landroid/graphics/Path;

    invoke-direct {v13}, Landroid/graphics/Path;-><init>()V

    .line 501
    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/keymouse/tool/PosDot$Art;->SHAPE:[F

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 502
    sget-object v1, Lcom/keymouse/tool/PosDot$Art;->SHAPE:[F

    aget v1, v1, v0

    mul-float/2addr v1, p0

    add-float v1, v1, p1

    .line 503
    sget-object v2, Lcom/keymouse/tool/PosDot$Art;->SHAPE:[F

    add-int/lit8 v3, v0, 0x1

    aget v2, v2, v3

    mul-float/2addr v2, p0

    add-float v2, v2, p1

    .line 504
    if-nez v0, :cond_0

    invoke-virtual {v13, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 501
    :goto_1
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 504
    :cond_0
    invoke-virtual {v13, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_1

    .line 506
    :cond_1
    invoke-virtual {v13}, Landroid/graphics/Path;->close()V

    .line 509
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 510
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 511
    const/high16 v1, 0x55000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 512
    new-instance v1, Landroid/graphics/CornerPathEffect;

    const v2, 0x3f99999a    # 1.2f

    mul-float v2, v2, p2

    invoke-direct {v1, v2}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 513
    invoke-virtual {v12}, Landroid/graphics/Canvas;->save()I

    .line 514
    const v1, 0x3f99999a    # 1.2f

    mul-float v1, v1, p2

    const v2, 0x3fe66666    # 1.8f

    mul-float v2, v2, p2

    invoke-virtual {v12, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 515
    invoke-virtual {v12, v13, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 516
    invoke-virtual {v12}, Landroid/graphics/Canvas;->restore()V

    .line 519
    new-instance v14, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {v14, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 520
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v14, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 521
    new-instance v0, Landroid/graphics/CornerPathEffect;

    const v1, 0x3f99999a    # 1.2f

    mul-float v1, v1, p2

    invoke-direct {v0, v1}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    invoke-virtual {v14, v0}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 522
    new-instance v0, Landroid/graphics/LinearGradient;

    const v1, 0x3d4ccccd    # 0.05f

    mul-float/2addr v1, p0

    add-float v2, p1, v1

    add-float v3, p1, v8

    const v1, 0x3f59999a    # 0.85f

    mul-float/2addr v1, p0

    add-float v4, p1, v1

    const/4 v1, 0x3

    new-array v5, v1, [I

    fill-array-data v5, :array_0

    const/4 v1, 0x3

    new-array v6, v1, [F

    fill-array-data v6, :array_1

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move/from16 v1, p1

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v14, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 525
    invoke-virtual {v12, v13, v14}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 528
    invoke-virtual {v12}, Landroid/graphics/Canvas;->save()I

    .line 529
    invoke-virtual {v12, v13}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 530
    new-instance v1, Ljava/util/Random;

    const-wide/16 v2, 0x7

    invoke-direct {v1, v2, v3}, Ljava/util/Random;-><init>(J)V

    .line 531
    new-instance v2, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {v2, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 532
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 533
    const/4 v0, 0x0

    :goto_2
    const/16 v3, 0x46

    if-ge v0, v3, :cond_2

    .line 534
    const v3, 0x3eb33333    # 0.35f

    const v4, 0x3f19999a    # 0.6f

    invoke-virtual {v1}, Ljava/util/Random;->nextFloat()F

    move-result v5

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    mul-float/2addr v3, v8

    add-float v3, v3, p1

    .line 535
    const/high16 v4, 0x3e800000    # 0.25f

    const v5, 0x3f266666    # 0.65f

    invoke-virtual {v1}, Ljava/util/Random;->nextFloat()F

    move-result v6

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    mul-float/2addr v4, p0

    add-float v4, v4, p1

    .line 536
    const/16 v5, 0x3c

    invoke-virtual {v1, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x3c

    const/16 v6, 0xf0

    const/16 v7, 0x38

    const/16 v14, 0x1e

    invoke-static {v5, v6, v7, v14}, Landroid/graphics/Color;->argb(IIII)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 537
    const v5, 0x3e99999a    # 0.3f

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-virtual {v1}, Ljava/util/Random;->nextFloat()F

    move-result v7

    mul-float/2addr v6, v7

    add-float/2addr v5, v6

    mul-float v5, v5, p2

    invoke-virtual {v12, v3, v4, v5, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 533
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 539
    :cond_2
    invoke-virtual {v12}, Landroid/graphics/Canvas;->restore()V

    .line 542
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 543
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 544
    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 545
    const/high16 v1, 0x3f800000    # 1.0f

    const v2, 0x3f8ccccd    # 1.1f

    mul-float v2, v2, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 546
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 547
    new-instance v1, Landroid/graphics/CornerPathEffect;

    const v2, 0x3f99999a    # 1.2f

    mul-float v2, v2, p2

    invoke-direct {v1, v2}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 548
    invoke-virtual {v12, v13, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 550
    const/4 v0, 0x1

    invoke-static {v11, v9, v10, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 551
    if-eq v0, v11, :cond_3

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->recycle()V

    .line 552
    :cond_3
    return-object v0

    .line 522
    :array_0
    .array-data 4
        -0x2de1
        -0x65e6
        -0xdc7e2
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method configure(ZZ)V
    .locals 1

    .prologue
    .line 387
    iget-boolean v0, p0, Lcom/keymouse/tool/PosDot$Art;->drawCursor:Z

    if-ne p1, v0, :cond_0

    iget-boolean v0, p0, Lcom/keymouse/tool/PosDot$Art;->drawDot:Z

    if-eq p2, v0, :cond_1

    .line 388
    :cond_0
    iput-boolean p1, p0, Lcom/keymouse/tool/PosDot$Art;->drawCursor:Z

    .line 389
    iput-boolean p2, p0, Lcom/keymouse/tool/PosDot$Art;->drawDot:Z

    .line 390
    invoke-virtual {p0}, Lcom/keymouse/tool/PosDot$Art;->invalidate()V

    .line 392
    :cond_1
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    const/4 v9, 0x0

    .line 461
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 462
    invoke-direct {p0, v0, v1}, Lcom/keymouse/tool/PosDot$Art;->currentScale(J)F

    move-result v2

    .line 463
    invoke-virtual {p0}, Lcom/keymouse/tool/PosDot$Art;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v5

    .line 464
    invoke-virtual {p0}, Lcom/keymouse/tool/PosDot$Art;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v5

    .line 465
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 466
    invoke-virtual {p1, v2, v2, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 467
    iget-boolean v5, p0, Lcom/keymouse/tool/PosDot$Art;->drawCursor:Z

    if-eqz v5, :cond_2

    .line 468
    iget-object v5, p0, Lcom/keymouse/tool/PosDot$Art;->cs:Lcom/keymouse/tool/CurLoader$Set;

    .line 469
    if-eqz v5, :cond_6

    iget-object v6, v5, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    array-length v6, v6

    if-lez v6, :cond_6

    .line 470
    iget-wide v6, p0, Lcom/keymouse/tool/PosDot$Art;->csStart:J

    sub-long/2addr v0, v6

    invoke-virtual {v5, v0, v1}, Lcom/keymouse/tool/CurLoader$Set;->frameAt(J)I

    move-result v0

    .line 471
    if-ltz v0, :cond_0

    iget-object v1, v5, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    array-length v1, v1

    if-lt v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 472
    :cond_1
    iget v1, p0, Lcom/keymouse/tool/PosDot$Art;->csPx:F

    const/4 v6, 0x1

    iget v7, v5, Lcom/keymouse/tool/CurLoader$Set;->baseW:I

    iget v8, v5, Lcom/keymouse/tool/CurLoader$Set;->baseH:I

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v1, v6

    .line 473
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 474
    iget-object v6, v5, Lcom/keymouse/tool/CurLoader$Set;->hx:[I

    aget v6, v6, v0

    int-to-float v6, v6

    mul-float/2addr v6, v1

    sub-float v6, v3, v6

    iget-object v7, v5, Lcom/keymouse/tool/CurLoader$Set;->hy:[I

    aget v7, v7, v0

    int-to-float v7, v7

    mul-float/2addr v7, v1

    sub-float v7, v4, v7

    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 475
    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 476
    iget-object v1, v5, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    aget-object v0, v1, v0

    iget-object v1, p0, Lcom/keymouse/tool/PosDot$Art;->bmpPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v9, v9, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 477
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 482
    :cond_2
    :goto_0
    iget-boolean v0, p0, Lcom/keymouse/tool/PosDot$Art;->drawDot:Z

    if-eqz v0, :cond_3

    .line 483
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotR:F

    iget-object v1, p0, Lcom/keymouse/tool/PosDot$Art;->dotFill:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 484
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->dotR:F

    iget-object v1, p0, Lcom/keymouse/tool/PosDot$Art;->dotEdge:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 486
    :cond_3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 487
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    cmpl-float v0, v2, v0

    if-nez v0, :cond_4

    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->nextTo:F

    cmpl-float v0, v0, v9

    if-gez v0, :cond_4

    iget-boolean v0, p0, Lcom/keymouse/tool/PosDot$Art;->drawCursor:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->cs:Lcom/keymouse/tool/CurLoader$Set;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->cs:Lcom/keymouse/tool/CurLoader$Set;

    invoke-virtual {v0}, Lcom/keymouse/tool/CurLoader$Set;->animated()Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    invoke-virtual {p0}, Lcom/keymouse/tool/PosDot$Art;->postInvalidateOnAnimation()V

    .line 488
    :cond_5
    return-void

    .line 479
    :cond_6
    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->bmp:Landroid/graphics/Bitmap;

    iget v1, p0, Lcom/keymouse/tool/PosDot$Art;->pad:F

    sub-float v1, v3, v1

    iget v5, p0, Lcom/keymouse/tool/PosDot$Art;->pad:F

    sub-float v5, v4, v5

    iget-object v6, p0, Lcom/keymouse/tool/PosDot$Art;->bmpPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method reset()V
    .locals 2

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 451
    const/4 v0, 0x0

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->press:I

    .line 452
    iput v1, p0, Lcom/keymouse/tool/PosDot$Art;->scale:F

    .line 453
    iput v1, p0, Lcom/keymouse/tool/PosDot$Art;->segFrom:F

    .line 454
    iput v1, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    .line 455
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/keymouse/tool/PosDot$Art;->segDur:J

    .line 456
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->nextTo:F

    .line 457
    return-void
.end method

.method setPress(I)V
    .locals 5

    .prologue
    const/4 v4, 0x2

    .line 408
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->press:I

    if-ne p1, v0, :cond_1

    .line 427
    :cond_0
    :goto_0
    return-void

    .line 409
    :cond_1
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->press:I

    .line 410
    iput p1, p0, Lcom/keymouse/tool/PosDot$Art;->press:I

    .line 411
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 412
    invoke-direct {p0, v2, v3}, Lcom/keymouse/tool/PosDot$Art;->currentScale(J)F

    move-result v1

    .line 413
    iput v1, p0, Lcom/keymouse/tool/PosDot$Art;->segFrom:F

    .line 414
    iput-wide v2, p0, Lcom/keymouse/tool/PosDot$Art;->segStart:J

    .line 415
    if-nez p1, :cond_2

    .line 416
    if-eqz v0, :cond_0

    .line 417
    const v0, 0x3f99999a    # 1.2f

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    .line 418
    const-wide/16 v0, 0x5a

    iput-wide v0, p0, Lcom/keymouse/tool/PosDot$Art;->segDur:J

    .line 419
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->nextTo:F

    .line 420
    const-wide/16 v0, 0x6e

    iput-wide v0, p0, Lcom/keymouse/tool/PosDot$Art;->nextDur:J

    .line 426
    :goto_1
    invoke-virtual {p0}, Lcom/keymouse/tool/PosDot$Art;->postInvalidateOnAnimation()V

    goto :goto_0

    .line 422
    :cond_2
    if-ne p1, v4, :cond_3

    const v0, 0x3ecccccd    # 0.4f

    :goto_2
    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->segTo:F

    .line 423
    if-ne p1, v4, :cond_4

    const-wide/16 v0, 0x8c

    :goto_3
    iput-wide v0, p0, Lcom/keymouse/tool/PosDot$Art;->segDur:J

    .line 424
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/keymouse/tool/PosDot$Art;->nextTo:F

    goto :goto_1

    .line 422
    :cond_3
    const/high16 v0, 0x3f000000    # 0.5f

    goto :goto_2

    .line 423
    :cond_4
    const-wide/16 v0, 0x46

    goto :goto_3
.end method

.method setSet(Lcom/keymouse/tool/CurLoader$Set;F)V
    .locals 2

    .prologue
    .line 396
    iget-object v0, p0, Lcom/keymouse/tool/PosDot$Art;->cs:Lcom/keymouse/tool/CurLoader$Set;

    if-eq p1, v0, :cond_0

    .line 397
    iput-object p1, p0, Lcom/keymouse/tool/PosDot$Art;->cs:Lcom/keymouse/tool/CurLoader$Set;

    .line 398
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/keymouse/tool/PosDot$Art;->csStart:J

    .line 399
    invoke-virtual {p0}, Lcom/keymouse/tool/PosDot$Art;->invalidate()V

    .line 401
    :cond_0
    iget v0, p0, Lcom/keymouse/tool/PosDot$Art;->csPx:F

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_1

    .line 402
    iput p2, p0, Lcom/keymouse/tool/PosDot$Art;->csPx:F

    .line 403
    invoke-virtual {p0}, Lcom/keymouse/tool/PosDot$Art;->invalidate()V

    .line 405
    :cond_1
    return-void
.end method
