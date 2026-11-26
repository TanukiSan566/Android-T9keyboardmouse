.class final Lcom/keymouse/tool/CurLoader;
.super Ljava/lang/Object;
.source "CurLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keymouse/tool/CurLoader$Set;,
        Lcom/keymouse/tool/CurLoader$Frame;
    }
.end annotation


# static fields
.field private static final MAX_BYTES:I = 0xc00000

.field private static final MAX_FRAMES:I = 0xf0


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method private static decodeDib([BII)Landroid/graphics/Bitmap;
    .locals 21

    .prologue
    .line 304
    invoke-static/range {p0 .. p1}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v5

    .line 305
    const/16 v2, 0x28

    if-lt v5, v2, :cond_0

    add-int v2, p1, v5

    move-object/from16 v0, p0

    array-length v3, v0

    if-le v2, v3, :cond_1

    .line 306
    :cond_0
    const/4 v2, 0x0

    .line 390
    :goto_0
    return-object v2

    .line 308
    :cond_1
    add-int/lit8 v2, p1, 0x4

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v10

    .line 309
    add-int/lit8 v2, p1, 0x8

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v4

    .line 310
    add-int/lit8 v2, p1, 0xe

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/keymouse/tool/CurLoader;->u16([BI)I

    move-result v11

    .line 311
    add-int/lit8 v2, p1, 0x10

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v6

    .line 312
    add-int/lit8 v2, p1, 0x20

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v3

    .line 313
    if-lez v10, :cond_2

    const/16 v2, 0x400

    if-gt v10, v2, :cond_2

    if-eqz v4, :cond_2

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v2

    const/16 v7, 0x800

    if-le v2, v7, :cond_3

    .line 314
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 316
    :cond_3
    if-gez v4, :cond_4

    const/4 v2, 0x1

    .line 317
    :goto_1
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    div-int/lit8 v12, v4, 0x2

    .line 318
    if-gtz v12, :cond_5

    .line 319
    const/4 v2, 0x0

    goto :goto_0

    .line 316
    :cond_4
    const/4 v2, 0x0

    goto :goto_1

    .line 321
    :cond_5
    if-eqz v6, :cond_6

    const/4 v4, 0x3

    if-eq v6, v4, :cond_6

    .line 322
    const/4 v2, 0x0

    goto :goto_0

    .line 324
    :cond_6
    const/4 v4, 0x0

    .line 325
    const/16 v7, 0x8

    if-gt v11, v7, :cond_1d

    .line 326
    if-lez v3, :cond_7

    :goto_2
    move v9, v3

    .line 328
    :goto_3
    add-int v4, p1, v5

    const/4 v3, 0x3

    if-ne v6, v3, :cond_8

    const/16 v3, 0x28

    if-ne v5, v3, :cond_8

    const/16 v3, 0xc

    :goto_4
    add-int v13, v4, v3

    .line 329
    mul-int/lit8 v3, v9, 0x4

    add-int v14, v13, v3

    .line 330
    mul-int v3, v10, v11

    add-int/lit8 v3, v3, 0x1f

    div-int/lit8 v3, v3, 0x20

    mul-int/lit8 v15, v3, 0x4

    .line 331
    add-int/lit8 v3, v10, 0x1f

    div-int/lit8 v3, v3, 0x20

    mul-int/lit8 v16, v3, 0x4

    .line 332
    mul-int v3, v15, v12

    add-int v17, v14, v3

    .line 333
    mul-int v3, v16, v12

    add-int v3, v3, v17

    add-int v4, p1, p2

    add-int/lit8 v4, v4, 0x4

    if-gt v3, v4, :cond_9

    mul-int v3, v16, v12

    add-int v3, v3, v17

    move-object/from16 v0, p0

    array-length v4, v0

    if-gt v3, v4, :cond_9

    const/4 v3, 0x1

    .line 334
    :goto_5
    mul-int v4, v15, v12

    add-int/2addr v4, v14

    move-object/from16 v0, p0

    array-length v5, v0

    if-le v4, v5, :cond_a

    .line 335
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 326
    :cond_7
    const/4 v3, 0x1

    shl-int/2addr v3, v11

    goto :goto_2

    .line 328
    :cond_8
    const/4 v3, 0x0

    goto :goto_4

    .line 333
    :cond_9
    const/4 v3, 0x0

    goto :goto_5

    .line 337
    :cond_a
    mul-int v4, v10, v12

    new-array v0, v4, [I

    move-object/from16 v18, v0

    .line 338
    const/4 v8, 0x0

    .line 339
    const/4 v5, 0x0

    :goto_6
    if-ge v5, v12, :cond_14

    .line 340
    if-eqz v2, :cond_c

    move v4, v5

    .line 341
    :goto_7
    mul-int/2addr v4, v15

    add-int v19, v14, v4

    .line 342
    const/4 v6, 0x0

    move v7, v6

    move v4, v8

    :goto_8
    if-ge v7, v10, :cond_13

    .line 344
    const/16 v6, 0x20

    if-ne v11, v6, :cond_d

    .line 345
    mul-int/lit8 v6, v7, 0x4

    add-int v6, v6, v19

    .line 346
    add-int/lit8 v8, v6, 0x3

    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v8

    .line 347
    if-eqz v8, :cond_b

    .line 348
    const/4 v4, 0x1

    .line 350
    :cond_b
    shl-int/lit8 v8, v8, 0x18

    add-int/lit8 v20, v6, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v1}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v20

    shl-int/lit8 v20, v20, 0x10

    or-int v8, v8, v20

    add-int/lit8 v20, v6, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v1}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v20

    shl-int/lit8 v20, v20, 0x8

    or-int v8, v8, v20

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v6

    or-int/2addr v6, v8

    .line 365
    :goto_9
    mul-int v8, v5, v10

    add-int/2addr v8, v7

    aput v6, v18, v8

    .line 342
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    goto :goto_8

    .line 340
    :cond_c
    add-int/lit8 v4, v12, -0x1

    sub-int/2addr v4, v5

    goto :goto_7

    .line 351
    :cond_d
    const/16 v6, 0x18

    if-ne v11, v6, :cond_e

    .line 352
    mul-int/lit8 v6, v7, 0x3

    add-int v6, v6, v19

    .line 353
    const/high16 v8, -0x1000000

    add-int/lit8 v20, v6, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v1}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v20

    shl-int/lit8 v20, v20, 0x10

    or-int v8, v8, v20

    add-int/lit8 v20, v6, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v1}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v20

    shl-int/lit8 v20, v20, 0x8

    or-int v8, v8, v20

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v6

    or-int/2addr v6, v8

    .line 354
    goto :goto_9

    :cond_e
    const/16 v6, 0x8

    if-ne v11, v6, :cond_f

    .line 355
    add-int v6, v19, v7

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v6

    move-object/from16 v0, p0

    invoke-static {v0, v13, v6, v9}, Lcom/keymouse/tool/CurLoader;->palette([BIII)I

    move-result v6

    goto :goto_9

    .line 356
    :cond_f
    const/4 v6, 0x4

    if-ne v11, v6, :cond_11

    .line 357
    div-int/lit8 v6, v7, 0x2

    add-int v6, v6, v19

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v6

    .line 358
    and-int/lit8 v8, v7, 0x1

    if-nez v8, :cond_10

    shr-int/lit8 v6, v6, 0x4

    :goto_a
    move-object/from16 v0, p0

    invoke-static {v0, v13, v6, v9}, Lcom/keymouse/tool/CurLoader;->palette([BIII)I

    move-result v6

    goto :goto_9

    :cond_10
    and-int/lit8 v6, v6, 0xf

    goto :goto_a

    .line 359
    :cond_11
    const/4 v6, 0x1

    if-ne v11, v6, :cond_12

    .line 360
    div-int/lit8 v6, v7, 0x8

    add-int v6, v6, v19

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v6

    .line 361
    and-int/lit8 v8, v7, 0x7

    rsub-int/lit8 v8, v8, 0x7

    shr-int/2addr v6, v8

    and-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p0

    invoke-static {v0, v13, v6, v9}, Lcom/keymouse/tool/CurLoader;->palette([BIII)I

    move-result v6

    goto/16 :goto_9

    .line 363
    :cond_12
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 339
    :cond_13
    add-int/lit8 v5, v5, 0x1

    move v8, v4

    goto/16 :goto_6

    .line 368
    :cond_14
    if-eqz v3, :cond_1b

    .line 369
    const/4 v4, 0x0

    :goto_b
    if-ge v4, v12, :cond_1c

    .line 370
    if-eqz v2, :cond_16

    move v3, v4

    .line 371
    :goto_c
    mul-int v3, v3, v16

    add-int v6, v17, v3

    .line 372
    const/4 v3, 0x0

    move v5, v3

    :goto_d
    if-ge v5, v10, :cond_1a

    .line 373
    div-int/lit8 v3, v5, 0x8

    add-int/2addr v3, v6

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v3

    and-int/lit8 v7, v5, 0x7

    rsub-int/lit8 v7, v7, 0x7

    shr-int/2addr v3, v7

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_17

    const/4 v3, 0x1

    .line 374
    :goto_e
    mul-int v7, v4, v10

    add-int/2addr v7, v5

    .line 375
    const/16 v9, 0x20

    if-ne v11, v9, :cond_18

    if-eqz v8, :cond_18

    .line 372
    :cond_15
    :goto_f
    add-int/lit8 v3, v5, 0x1

    move v5, v3

    goto :goto_d

    .line 370
    :cond_16
    add-int/lit8 v3, v12, -0x1

    sub-int/2addr v3, v4

    goto :goto_c

    .line 373
    :cond_17
    const/4 v3, 0x0

    goto :goto_e

    .line 378
    :cond_18
    if-eqz v3, :cond_19

    .line 379
    const/4 v3, 0x0

    aput v3, v18, v7

    goto :goto_f

    .line 380
    :cond_19
    const/16 v3, 0x20

    if-ne v11, v3, :cond_15

    .line 381
    aget v3, v18, v7

    const/high16 v9, -0x1000000

    or-int/2addr v3, v9

    aput v3, v18, v7

    goto :goto_f

    .line 369
    :cond_1a
    add-int/lit8 v4, v4, 0x1

    goto :goto_b

    .line 385
    :cond_1b
    const/16 v2, 0x20

    if-ne v11, v2, :cond_1c

    if-nez v8, :cond_1c

    .line 386
    const/4 v2, 0x0

    :goto_10
    move-object/from16 v0, v18

    array-length v3, v0

    if-ge v2, v3, :cond_1c

    .line 387
    aget v3, v18, v2

    const/high16 v4, -0x1000000

    or-int/2addr v3, v4

    aput v3, v18, v2

    .line 386
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 390
    :cond_1c
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move-object/from16 v0, v18

    invoke-static {v0, v10, v12, v2}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    goto/16 :goto_0

    :cond_1d
    move v9, v4

    goto/16 :goto_3
.end method

.method private static decodeIco([BII)Lcom/keymouse/tool/CurLoader$Frame;
    .locals 12

    .prologue
    .line 244
    const/16 v0, 0x16

    if-ge p2, v0, :cond_0

    .line 245
    const/4 v0, 0x0

    .line 299
    :goto_0
    return-object v0

    .line 247
    :cond_0
    add-int/lit8 v0, p1, 0x2

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->u16([BI)I

    move-result v6

    .line 248
    add-int/lit8 v0, p1, 0x4

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->u16([BI)I

    move-result v7

    .line 249
    const/4 v0, 0x1

    if-eq v6, v0, :cond_1

    const/4 v0, 0x2

    if-ne v6, v0, :cond_2

    :cond_1
    if-lez v7, :cond_2

    add-int/lit8 v0, p1, 0x6

    mul-int/lit8 v1, v7, 0x10

    add-int/2addr v0, v1

    array-length v1, p0

    if-le v0, v1, :cond_3

    .line 250
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 252
    :cond_3
    const/4 v4, -0x1

    .line 253
    const-wide/16 v2, -0x1

    .line 254
    const/4 v5, 0x0

    :goto_1
    if-ge v5, v7, :cond_6

    .line 255
    add-int/lit8 v0, p1, 0x6

    mul-int/lit8 v1, v5, 0x10

    add-int v8, v0, v1

    .line 256
    invoke-static {p0, v8}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v1

    .line 257
    add-int/lit8 v0, v8, 0x1

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v0

    .line 258
    if-nez v1, :cond_4

    .line 259
    const/16 v1, 0x100

    .line 261
    :cond_4
    if-nez v0, :cond_5

    .line 262
    const/16 v0, 0x100

    .line 264
    :cond_5
    add-int/lit8 v8, v8, 0x6

    invoke-static {p0, v8}, Lcom/keymouse/tool/CurLoader;->u16([BI)I

    move-result v8

    .line 265
    int-to-long v10, v1

    int-to-long v0, v0

    mul-long/2addr v0, v10

    const-wide/16 v10, 0x64

    mul-long/2addr v0, v10

    int-to-long v8, v8

    add-long/2addr v0, v8

    .line 266
    cmp-long v8, v0, v2

    if-lez v8, :cond_c

    move v4, v5

    .line 254
    :goto_2
    add-int/lit8 v5, v5, 0x1

    move-wide v2, v0

    goto :goto_1

    .line 271
    :cond_6
    add-int/lit8 v0, p1, 0x6

    mul-int/lit8 v1, v4, 0x10

    add-int v2, v0, v1

    .line 272
    add-int/lit8 v0, v2, 0x8

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v0

    .line 273
    add-int/lit8 v1, v2, 0xc

    invoke-static {p0, v1}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v1

    add-int/2addr v1, p1

    .line 274
    if-lez v0, :cond_7

    if-lt v1, p1, :cond_7

    add-int v3, v1, v0

    array-length v4, p0

    if-le v3, v4, :cond_8

    .line 275
    :cond_7
    const/4 v0, 0x0

    goto :goto_0

    .line 280
    :cond_8
    const/16 v3, 0x8

    if-le v0, v3, :cond_9

    invoke-static {p0, v1}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v3

    const/16 v4, 0x89

    if-ne v3, v4, :cond_9

    add-int/lit8 v3, v1, 0x1

    aget-byte v3, p0, v3

    const/16 v4, 0x50

    if-ne v3, v4, :cond_9

    add-int/lit8 v3, v1, 0x2

    aget-byte v3, p0, v3

    const/16 v4, 0x4e

    if-ne v3, v4, :cond_9

    add-int/lit8 v3, v1, 0x3

    aget-byte v3, p0, v3

    const/16 v4, 0x47

    if-ne v3, v4, :cond_9

    .line 281
    invoke-static {p0, v1, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    move-object v3, v0

    .line 285
    :goto_3
    if-nez v3, :cond_a

    .line 286
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 283
    :cond_9
    invoke-static {p0, v1, v0}, Lcom/keymouse/tool/CurLoader;->decodeDib([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    move-object v3, v0

    goto :goto_3

    .line 288
    :cond_a
    const/4 v0, 0x2

    if-ne v6, v0, :cond_b

    .line 289
    add-int/lit8 v0, v2, 0x4

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->u16([BI)I

    move-result v1

    .line 290
    add-int/lit8 v0, v2, 0x6

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->u16([BI)I

    move-result v0

    .line 295
    :goto_4
    new-instance v2, Lcom/keymouse/tool/CurLoader$Frame;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Lcom/keymouse/tool/CurLoader$Frame;-><init>(Lcom/keymouse/tool/CurLoader$1;)V

    .line 296
    iput-object v3, v2, Lcom/keymouse/tool/CurLoader$Frame;->bmp:Landroid/graphics/Bitmap;

    .line 297
    const/4 v4, 0x0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v2, Lcom/keymouse/tool/CurLoader$Frame;->hx:I

    .line 298
    const/4 v1, 0x0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v2, Lcom/keymouse/tool/CurLoader$Frame;->hy:I

    move-object v0, v2

    .line 299
    goto/16 :goto_0

    .line 292
    :cond_b
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    div-int/lit8 v1, v0, 0x2

    .line 293
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    goto :goto_4

    :cond_c
    move-wide v0, v2

    goto/16 :goto_2
.end method

.method private static i32([BI)I
    .locals 2

    .prologue
    .line 130
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method private static isTag([BILjava/lang/String;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 236
    add-int/lit8 v2, p1, 0x4

    array-length v3, p0

    if-gt v2, v3, :cond_0

    aget-byte v2, p0, p1

    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v2, v3, :cond_0

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v2, v3, :cond_0

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    const/4 v3, 0x2

    .line 237
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v2, v3, :cond_0

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    const/4 v3, 0x3

    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v2, v3, :cond_0

    .line 236
    :goto_0
    return v0

    :cond_0
    move v0, v1

    .line 237
    goto :goto_0
.end method

.method static load(Ljava/io/File;I)Lcom/keymouse/tool/CurLoader$Set;
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v0, 0x0

    const/4 v5, 0x2

    const/4 v1, 0x0

    .line 58
    :try_start_0
    invoke-static {p0}, Lcom/keymouse/tool/CurLoader;->readAll(Ljava/io/File;)[B

    move-result-object v2

    .line 59
    if-eqz v2, :cond_0

    array-length v3, v2

    const/16 v4, 0xc

    if-ge v3, v4, :cond_1

    .line 80
    :cond_0
    :goto_0
    return-object v0

    .line 62
    :cond_1
    const/4 v3, 0x0

    aget-byte v3, v2, v3

    const/16 v4, 0x52

    if-ne v3, v4, :cond_2

    const/4 v3, 0x1

    aget-byte v3, v2, v3

    const/16 v4, 0x49

    if-ne v3, v4, :cond_2

    const/4 v3, 0x2

    aget-byte v3, v2, v3

    const/16 v4, 0x46

    if-ne v3, v4, :cond_2

    const/4 v3, 0x3

    aget-byte v3, v2, v3

    const/16 v4, 0x46

    if-ne v3, v4, :cond_2

    const/16 v3, 0x8

    aget-byte v3, v2, v3

    const/16 v4, 0x41

    if-ne v3, v4, :cond_2

    const/16 v3, 0x9

    aget-byte v3, v2, v3

    const/16 v4, 0x43

    if-ne v3, v4, :cond_2

    const/16 v3, 0xa

    aget-byte v3, v2, v3

    const/16 v4, 0x4f

    if-ne v3, v4, :cond_2

    const/16 v3, 0xb

    aget-byte v3, v2, v3

    const/16 v4, 0x4e

    if-ne v3, v4, :cond_2

    .line 64
    invoke-static {v2}, Lcom/keymouse/tool/CurLoader;->loadAni([B)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v0

    goto :goto_0

    .line 66
    :cond_2
    const/4 v3, 0x0

    aget-byte v3, v2, v3

    if-nez v3, :cond_4

    const/4 v3, 0x1

    aget-byte v3, v2, v3

    if-nez v3, :cond_4

    const/4 v3, 0x2

    aget-byte v3, v2, v3

    if-eq v3, v6, :cond_3

    const/4 v3, 0x2

    aget-byte v3, v2, v3

    if-ne v3, v5, :cond_4

    :cond_3
    const/4 v3, 0x3

    aget-byte v3, v2, v3

    if-nez v3, :cond_4

    .line 67
    const/4 v1, 0x0

    array-length v3, v2

    invoke-static {v2, v1, v3}, Lcom/keymouse/tool/CurLoader;->decodeIco([BII)Lcom/keymouse/tool/CurLoader$Frame;

    move-result-object v1

    .line 68
    if-eqz v1, :cond_0

    invoke-static {v1}, Lcom/keymouse/tool/CurLoader;->single(Lcom/keymouse/tool/CurLoader$Frame;)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v0

    goto :goto_0

    .line 70
    :cond_4
    const/4 v3, 0x0

    array-length v4, v2

    invoke-static {v2, v3, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 71
    if-eqz v3, :cond_0

    .line 74
    new-instance v4, Lcom/keymouse/tool/CurLoader$Frame;

    const/4 v2, 0x0

    invoke-direct {v4, v2}, Lcom/keymouse/tool/CurLoader$Frame;-><init>(Lcom/keymouse/tool/CurLoader$1;)V

    .line 75
    iput-object v3, v4, Lcom/keymouse/tool/CurLoader$Frame;->bmp:Landroid/graphics/Bitmap;

    .line 76
    if-ne p1, v5, :cond_6

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    :goto_1
    iput v2, v4, Lcom/keymouse/tool/CurLoader$Frame;->hx:I

    .line 77
    if-ne p1, v5, :cond_5

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    :cond_5
    iput v1, v4, Lcom/keymouse/tool/CurLoader$Frame;->hy:I

    .line 78
    invoke-static {v4}, Lcom/keymouse/tool/CurLoader;->single(Lcom/keymouse/tool/CurLoader$Frame;)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v0

    goto/16 :goto_0

    .line 76
    :cond_6
    if-ne p1, v6, :cond_7

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :cond_7
    move v2, v1

    goto :goto_1

    .line 79
    :catch_0
    move-exception v1

    goto/16 :goto_0
.end method

.method private static loadAni([B)Lcom/keymouse/tool/CurLoader$Set;
    .locals 15

    .prologue
    .line 136
    const/4 v6, 0x0

    .line 137
    const/4 v5, 0x0

    .line 138
    const/4 v4, 0x6

    .line 139
    const/4 v3, 0x1

    .line 140
    const/4 v2, 0x0

    .line 141
    const/4 v1, 0x0

    .line 142
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 143
    const/16 v0, 0xc

    .line 144
    :cond_0
    add-int/lit8 v7, v0, 0x8

    array-length v8, p0

    if-gt v7, v8, :cond_16

    .line 145
    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v8

    .line 146
    add-int/lit8 v7, v0, 0x4

    invoke-static {p0, v7}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v7

    .line 147
    add-int/lit8 v10, v0, 0x8

    .line 148
    if-ltz v7, :cond_1

    add-int v11, v10, v7

    array-length v12, p0

    if-le v11, v12, :cond_2

    .line 149
    :cond_1
    const/4 v7, 0x0

    array-length v11, p0

    sub-int/2addr v11, v10

    invoke-static {v7, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 151
    :cond_2
    const-string v11, "anih"

    invoke-static {p0, v0, v11}, Lcom/keymouse/tool/CurLoader;->isTag([BILjava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_5

    const/16 v11, 0x24

    if-lt v7, v11, :cond_5

    .line 152
    add-int/lit8 v0, v10, 0x4

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v6

    .line 153
    add-int/lit8 v0, v10, 0x8

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v5

    .line 154
    add-int/lit8 v0, v10, 0x1c

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v4

    .line 155
    add-int/lit8 v0, v10, 0x20

    invoke-static {p0, v0}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v3

    .line 185
    :cond_3
    add-int v0, v10, v7

    and-int/lit8 v10, v7, 0x1

    add-int/2addr v0, v10

    .line 186
    if-nez v8, :cond_0

    if-nez v7, :cond_0

    move-object v7, v1

    move-object v8, v2

    move v0, v6

    .line 190
    :goto_0
    and-int/lit8 v1, v3, 0x1

    if-eqz v1, :cond_4

    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 191
    :cond_4
    const/4 v0, 0x0

    .line 232
    :goto_1
    return-object v0

    .line 156
    :cond_5
    const-string v11, "rate"

    invoke-static {p0, v0, v11}, Lcom/keymouse/tool/CurLoader;->isTag([BILjava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 157
    div-int/lit8 v11, v7, 0x4

    .line 158
    new-array v2, v11, [I

    .line 159
    const/4 v0, 0x0

    :goto_2
    if-ge v0, v11, :cond_3

    .line 160
    mul-int/lit8 v12, v0, 0x4

    add-int/2addr v12, v10

    invoke-static {p0, v12}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v12

    aput v12, v2, v0

    .line 159
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 162
    :cond_6
    const-string v11, "seq "

    invoke-static {p0, v0, v11}, Lcom/keymouse/tool/CurLoader;->isTag([BILjava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 163
    div-int/lit8 v11, v7, 0x4

    .line 164
    new-array v1, v11, [I

    .line 165
    const/4 v0, 0x0

    :goto_3
    if-ge v0, v11, :cond_3

    .line 166
    mul-int/lit8 v12, v0, 0x4

    add-int/2addr v12, v10

    invoke-static {p0, v12}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v12

    aput v12, v1, v0

    .line 165
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 168
    :cond_7
    const-string v11, "LIST"

    invoke-static {p0, v0, v11}, Lcom/keymouse/tool/CurLoader;->isTag([BILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    if-lt v7, v0, :cond_3

    const-string v0, "fram"

    invoke-static {p0, v10, v0}, Lcom/keymouse/tool/CurLoader;->isTag([BILjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 169
    add-int/lit8 v0, v10, 0x4

    .line 170
    add-int v11, v10, v7

    .line 171
    :goto_4
    add-int/lit8 v12, v0, 0x8

    if-gt v12, v11, :cond_3

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v12

    const/16 v13, 0xf0

    if-ge v12, v13, :cond_3

    .line 172
    add-int/lit8 v12, v0, 0x4

    invoke-static {p0, v12}, Lcom/keymouse/tool/CurLoader;->i32([BI)I

    move-result v12

    .line 173
    if-ltz v12, :cond_3

    add-int/lit8 v13, v0, 0x8

    add-int/2addr v13, v12

    array-length v14, p0

    if-gt v13, v14, :cond_3

    .line 176
    const-string v13, "icon"

    invoke-static {p0, v0, v13}, Lcom/keymouse/tool/CurLoader;->isTag([BILjava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 177
    add-int/lit8 v13, v0, 0x8

    invoke-static {p0, v13, v12}, Lcom/keymouse/tool/CurLoader;->decodeIco([BII)Lcom/keymouse/tool/CurLoader$Frame;

    move-result-object v13

    .line 178
    if-eqz v13, :cond_8

    .line 179
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    :cond_8
    add-int/lit8 v13, v12, 0x8

    and-int/lit8 v12, v12, 0x1

    add-int/2addr v12, v13

    add-int/2addr v0, v12

    .line 183
    goto :goto_4

    .line 193
    :cond_9
    if-gtz v5, :cond_15

    .line 194
    if-lez v0, :cond_b

    .line 196
    :goto_5
    if-eqz v7, :cond_a

    array-length v1, v7

    if-lez v1, :cond_a

    .line 197
    array-length v0, v7

    .line 199
    :cond_a
    const/16 v1, 0xfa0

    if-le v0, v1, :cond_14

    .line 200
    const/16 v0, 0xfa0

    move v1, v0

    .line 202
    :goto_6
    new-instance v2, Lcom/keymouse/tool/CurLoader$Set;

    invoke-direct {v2}, Lcom/keymouse/tool/CurLoader$Set;-><init>()V

    .line 203
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 204
    new-array v0, v10, [Landroid/graphics/Bitmap;

    iput-object v0, v2, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    .line 205
    new-array v0, v10, [I

    iput-object v0, v2, Lcom/keymouse/tool/CurLoader$Set;->hx:[I

    .line 206
    new-array v0, v10, [I

    iput-object v0, v2, Lcom/keymouse/tool/CurLoader$Set;->hy:[I

    .line 207
    const/4 v0, 0x0

    move v3, v0

    :goto_7
    if-ge v3, v10, :cond_c

    .line 208
    iget-object v5, v2, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keymouse/tool/CurLoader$Frame;

    iget-object v0, v0, Lcom/keymouse/tool/CurLoader$Frame;->bmp:Landroid/graphics/Bitmap;

    aput-object v0, v5, v3

    .line 209
    iget-object v5, v2, Lcom/keymouse/tool/CurLoader$Set;->hx:[I

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keymouse/tool/CurLoader$Frame;

    iget v0, v0, Lcom/keymouse/tool/CurLoader$Frame;->hx:I

    aput v0, v5, v3

    .line 210
    iget-object v5, v2, Lcom/keymouse/tool/CurLoader$Set;->hy:[I

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keymouse/tool/CurLoader$Frame;

    iget v0, v0, Lcom/keymouse/tool/CurLoader$Frame;->hy:I

    aput v0, v5, v3

    .line 207
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_7

    .line 194
    :cond_b
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_5

    .line 212
    :cond_c
    new-array v0, v1, [I

    iput-object v0, v2, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    .line 213
    new-array v0, v1, [I

    iput-object v0, v2, Lcom/keymouse/tool/CurLoader$Set;->delay:[I

    .line 214
    const/4 v0, 0x0

    .line 215
    const/4 v5, 0x0

    move v6, v0

    :goto_8
    if-ge v5, v1, :cond_12

    .line 216
    if-eqz v7, :cond_f

    array-length v0, v7

    if-ge v5, v0, :cond_f

    aget v0, v7, v5

    .line 217
    :goto_9
    if-ltz v0, :cond_d

    if-lt v0, v10, :cond_13

    .line 218
    :cond_d
    const/4 v3, 0x0

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 v3, v10, -0x1

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    move v3, v0

    .line 220
    :goto_a
    if-eqz v8, :cond_10

    array-length v0, v8

    if-ge v5, v0, :cond_10

    aget v0, v8, v5

    .line 221
    :goto_b
    if-gtz v0, :cond_e

    .line 222
    if-lez v4, :cond_11

    move v0, v4

    .line 224
    :cond_e
    :goto_c
    const/16 v9, 0x10

    mul-int/lit16 v0, v0, 0x3e8

    div-int/lit8 v0, v0, 0x3c

    invoke-static {v9, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 225
    iget-object v9, v2, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    aput v3, v9, v5

    .line 226
    iget-object v3, v2, Lcom/keymouse/tool/CurLoader$Set;->delay:[I

    aput v0, v3, v5

    .line 227
    add-int/2addr v0, v6

    .line 215
    add-int/lit8 v5, v5, 0x1

    move v6, v0

    goto :goto_8

    :cond_f
    move v0, v5

    .line 216
    goto :goto_9

    :cond_10
    move v0, v4

    .line 220
    goto :goto_b

    .line 222
    :cond_11
    const/4 v0, 0x6

    goto :goto_c

    .line 229
    :cond_12
    iput v6, v2, Lcom/keymouse/tool/CurLoader$Set;->total:I

    .line 230
    iget-object v0, v2, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, v2, Lcom/keymouse/tool/CurLoader$Set;->baseW:I

    .line 231
    iget-object v0, v2, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, v2, Lcom/keymouse/tool/CurLoader$Set;->baseH:I

    move-object v0, v2

    .line 232
    goto/16 :goto_1

    :cond_13
    move v3, v0

    goto :goto_a

    :cond_14
    move v1, v0

    goto/16 :goto_6

    :cond_15
    move v0, v5

    goto/16 :goto_5

    :cond_16
    move-object v7, v1

    move-object v8, v2

    move v0, v6

    goto/16 :goto_0
.end method

.method private static palette([BIII)I
    .locals 3

    .prologue
    const/high16 v0, -0x1000000

    .line 394
    if-lt p2, p3, :cond_0

    .line 398
    :goto_0
    return v0

    .line 397
    :cond_0
    mul-int/lit8 v1, p2, 0x4

    add-int/2addr v1, p1

    .line 398
    add-int/lit8 v2, v1, 0x2

    invoke-static {p0, v2}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v2

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v0, v2

    add-int/lit8 v2, v1, 0x1

    invoke-static {p0, v2}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v2

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    invoke-static {p0, v1}, Lcom/keymouse/tool/CurLoader;->u8([BI)I

    move-result v1

    or-int/2addr v0, v1

    goto :goto_0
.end method

.method private static readAll(Ljava/io/File;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 104
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/32 v2, 0xc00000

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 105
    :cond_0
    const/4 v0, 0x0

    .line 115
    :goto_0
    return-object v0

    .line 107
    :cond_1
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 109
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 110
    const/16 v2, 0x4000

    new-array v2, v2, [B

    .line 112
    :goto_1
    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_2

    .line 113
    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 117
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 118
    throw v0

    .line 115
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 117
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    goto :goto_0
.end method

.method private static single(Lcom/keymouse/tool/CurLoader$Frame;)Lcom/keymouse/tool/CurLoader$Set;
    .locals 6

    .prologue
    const/16 v5, 0x3e8

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 91
    new-instance v0, Lcom/keymouse/tool/CurLoader$Set;

    invoke-direct {v0}, Lcom/keymouse/tool/CurLoader$Set;-><init>()V

    .line 92
    new-array v1, v4, [Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/keymouse/tool/CurLoader$Frame;->bmp:Landroid/graphics/Bitmap;

    aput-object v2, v1, v3

    iput-object v1, v0, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    .line 93
    new-array v1, v4, [I

    iget v2, p0, Lcom/keymouse/tool/CurLoader$Frame;->hx:I

    aput v2, v1, v3

    iput-object v1, v0, Lcom/keymouse/tool/CurLoader$Set;->hx:[I

    .line 94
    new-array v1, v4, [I

    iget v2, p0, Lcom/keymouse/tool/CurLoader$Frame;->hy:I

    aput v2, v1, v3

    iput-object v1, v0, Lcom/keymouse/tool/CurLoader$Set;->hy:[I

    .line 95
    new-array v1, v4, [I

    aput v3, v1, v3

    iput-object v1, v0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    .line 96
    new-array v1, v4, [I

    aput v5, v1, v3

    iput-object v1, v0, Lcom/keymouse/tool/CurLoader$Set;->delay:[I

    .line 97
    iput v5, v0, Lcom/keymouse/tool/CurLoader$Set;->total:I

    .line 98
    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Frame;->bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, v0, Lcom/keymouse/tool/CurLoader$Set;->baseW:I

    .line 99
    iget-object v1, p0, Lcom/keymouse/tool/CurLoader$Frame;->bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, v0, Lcom/keymouse/tool/CurLoader$Set;->baseH:I

    .line 100
    return-object v0
.end method

.method private static u16([BI)I
    .locals 2

    .prologue
    .line 126
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method private static u8([BI)I
    .locals 1

    .prologue
    .line 122
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method
