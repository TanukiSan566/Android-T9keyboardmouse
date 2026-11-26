.class final Lcom/keymouse/tool/CursorCfg;
.super Ljava/lang/Object;
.source "CursorCfg.java"


# static fields
.field static final DEF_DIR:Ljava/lang/String; = "STMC"

.field static final PUB_DIR:Ljava/lang/String; = "/storage/emulated/0/keymousecursor"

.field static final SERVICE:Ljava/lang/String; = "com.keymouse.tool/com.keymouse.tool.CursorA11yService"

.field static final SLOTS:[Ljava/lang/String;

.field private static final WIN_ORDER:[Ljava/lang/String;

.field private static sDefChecked:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 31
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "arrow"

    aput-object v1, v0, v2

    const-string v1, "hand"

    aput-object v1, v0, v3

    const-string v1, "ibeam"

    aput-object v1, v0, v4

    const-string v1, "grab"

    aput-object v1, v0, v5

    sput-object v0, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    .line 112
    sput-boolean v2, Lcom/keymouse/tool/CursorCfg;->sDefChecked:Z

    .line 410
    const/16 v0, 0x11

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "Arrow"

    aput-object v1, v0, v2

    const-string v1, "Help"

    aput-object v1, v0, v3

    const-string v1, "AppStarting"

    aput-object v1, v0, v4

    const-string v1, "Wait"

    aput-object v1, v0, v5

    const-string v1, "Crosshair"

    aput-object v1, v0, v6

    const/4 v1, 0x5

    const-string v2, "IBeam"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "NWPen"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "No"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "SizeNS"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "SizeWE"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "SizeNWSE"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "SizeNESW"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "SizeAll"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "UpArrow"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "Hand"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "Pin"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "Person"

    aput-object v2, v0, v1

    sput-object v0, Lcom/keymouse/tool/CursorCfg;->WIN_ORDER:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method static a11yListed(Landroid/content/Context;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 280
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "enabled_accessibility_services"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 281
    if-eqz v1, :cond_0

    const-string v2, "CursorA11yService"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 283
    :cond_0
    :goto_0
    return v0

    .line 282
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static applyDefaultCfg(Landroid/content/Context;Z)V
    .locals 8

    .prologue
    .line 157
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v3

    .line 158
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    const-string v1, "STMC"

    invoke-static {v0, v1}, Lcom/keymouse/tool/CursorCfg;->themeFromFolder(Ljava/io/File;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    .line 159
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    .line 160
    if-nez p1, :cond_0

    if-nez v0, :cond_0

    const-string v0, "on"

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 161
    :cond_0
    const-string v0, "on"

    const-string v1, "1"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    :cond_1
    if-nez p1, :cond_2

    const-string v0, "smart"

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 164
    :cond_2
    const-string v0, "smart"

    const-string v1, "1"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    :cond_3
    if-nez p1, :cond_4

    const-string v0, "size"

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 167
    :cond_4
    const-string v0, "size"

    const-string v1, "32"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    :cond_5
    sget-object v5, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    array-length v6, v5

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v6, :cond_9

    aget-object v7, v5, v2

    .line 170
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 171
    if-nez v0, :cond_7

    .line 169
    :cond_6
    :goto_1
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    .line 174
    :cond_7
    if-nez p1, :cond_8

    invoke-interface {v3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_8

    invoke-interface {v3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_6

    .line 175
    :cond_8
    invoke-interface {v3, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "hs_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 179
    :cond_9
    const-string v0, "def"

    const-string v1, "1"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    invoke-static {p0, v3}, Lcom/keymouse/tool/CursorCfg;->save(Landroid/content/Context;Ljava/util/Map;)V

    .line 181
    return-void
.end method

.method static baseName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 387
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/16 v1, 0x5c

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 388
    if-ltz v0, :cond_0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method private static copyAsset(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 115
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cursor_default/STMC/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 117
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 119
    const/16 v0, 0x2000

    :try_start_1
    new-array v0, v0, [B

    .line 121
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 122
    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 125
    :catchall_0
    move-exception v0

    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 126
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 128
    :catchall_1
    move-exception v0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 129
    throw v0

    .line 125
    :cond_0
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 128
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 130
    const/4 v0, 0x1

    invoke-virtual {p2, v0, v5}, Ljava/io/File;->setReadable(ZZ)Z

    .line 131
    return-void
.end method

.method static defHotspot(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 47
    const-string v0, "hand"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    const/4 v0, 0x1

    .line 53
    :goto_0
    return v0

    .line 50
    :cond_0
    const-string v0, "ibeam"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "grab"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 51
    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    .line 53
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static ensureDefaults(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 185
    sget-boolean v0, Lcom/keymouse/tool/CursorCfg;->sDefChecked:Z

    if-eqz v0, :cond_1

    .line 206
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    sput-boolean v1, Lcom/keymouse/tool/CursorCfg;->sDefChecked:Z

    .line 190
    :try_start_0
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->installDefaultFiles(Landroid/content/Context;)V

    .line 191
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    .line 192
    const-string v1, "1"

    const-string v2, "def"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 193
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/keymouse/tool/CursorCfg;->applyDefaultCfg(Landroid/content/Context;Z)V

    .line 194
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    .line 196
    :cond_2
    const-string v1, "on"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "smart"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->a11yListed(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 197
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/keymouse/tool/CursorCfg$1;

    invoke-direct {v1}, Lcom/keymouse/tool/CursorCfg$1;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 201
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 203
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static expand(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x25

    const/4 v2, 0x0

    .line 503
    move v6, v2

    move-object v4, p0

    :goto_0
    const/4 v0, 0x4

    if-ge v6, v0, :cond_5

    .line 504
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v2

    move v3, v2

    .line 507
    :goto_1
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v3, v0, :cond_3

    .line 508
    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 509
    if-ne v8, v9, :cond_1

    add-int/lit8 v0, v3, 0x1

    invoke-virtual {v4, v9, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    move v5, v0

    .line 510
    :goto_2
    if-le v5, v3, :cond_2

    .line 511
    add-int/lit8 v0, v3, 0x1

    invoke-virtual {v4, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 512
    if-eqz v0, :cond_0

    .line 513
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    const/4 v1, 0x1

    .line 516
    :cond_0
    add-int/lit8 v3, v5, 0x1

    move v0, v1

    :goto_3
    move v1, v0

    .line 521
    goto :goto_1

    .line 509
    :cond_1
    const/4 v0, -0x1

    move v5, v0

    goto :goto_2

    .line 518
    :cond_2
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 519
    add-int/lit8 v3, v3, 0x1

    move v0, v1

    goto :goto_3

    .line 522
    :cond_3
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 523
    if-nez v1, :cond_4

    .line 527
    :goto_4
    return-object v0

    .line 503
    :cond_4
    add-int/lit8 v1, v6, 0x1

    move v6, v1

    move-object v4, v0

    goto :goto_0

    :cond_5
    move-object v0, v4

    goto :goto_4
.end method

.method static file(Landroid/content/Context;)Ljava/io/File;
    .locals 3

    .prologue
    .line 39
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "keymouse_cursor_theme.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static findInf(Ljava/io/File;Ljava/util/ArrayList;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 373
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 374
    if-eqz v1, :cond_0

    const/4 v0, 0x3

    if-le p2, v0, :cond_1

    .line 384
    :cond_0
    return-void

    .line 377
    :cond_1
    array-length v2, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    .line 378
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 379
    add-int/lit8 v4, p2, 0x1

    invoke-static {v3, p1, v4}, Lcom/keymouse/tool/CursorCfg;->findInf(Ljava/io/File;Ljava/util/ArrayList;I)V

    .line 377
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 380
    :cond_3
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".inf"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 381
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method static geti(Ljava/util/Map;Ljava/lang/String;I)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    .prologue
    .line 102
    :try_start_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 103
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 105
    :cond_0
    :goto_0
    return p2

    .line 103
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result p2

    goto :goto_0

    .line 104
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static guess(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 392
    const-string v0, "grab"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "fist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "drag"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "closed"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "grip"

    .line 393
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "dnd"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 394
    :cond_0
    const-string v0, "grab"

    .line 407
    :goto_0
    return-object v0

    .line 396
    :cond_1
    const-string v0, "ibeam"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "i-beam"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "text"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "beam"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "xterm"

    .line 397
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 398
    :cond_2
    const-string v0, "ibeam"

    goto :goto_0

    .line 400
    :cond_3
    const-string v0, "link"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "hand"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "pointing"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "finger"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 401
    :cond_4
    const-string v0, "hand"

    goto :goto_0

    .line 403
    :cond_5
    const-string v0, "normal"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "arrow"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "default"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "left_ptr"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "pointer"

    .line 404
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "main.cur"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "main.ani"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 405
    :cond_6
    const-string v0, "arrow"

    goto/16 :goto_0

    .line 407
    :cond_7
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method static importLib(Landroid/content/Context;)Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 261
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 262
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 263
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "U=$(stat -c %u "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "); mkdir -p "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/storage/emulated/0/keymousecursor"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "; cp -rf "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/storage/emulated/0/keymousecursor"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/. "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/; chown -R $U:$U "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "; chmod -R u+rwX,go+rX "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "; restorecon -R "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " 2>/dev/null; echo done"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 266
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "su"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "-c"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    .line 267
    invoke-virtual {v1}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 268
    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Lcom/keymouse/tool/CursorCfg;->readStream(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 269
    invoke-virtual {v1}, Ljava/lang/Process;->waitFor()I

    .line 270
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    const-string v2, "done"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 272
    :goto_0
    return v0

    .line 271
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static installDefaultFiles(Landroid/content/Context;)V
    .locals 7

    .prologue
    .line 136
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    const-string v2, "STMC"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 137
    new-instance v2, Ljava/io/File;

    const-string v0, ".v71"

    invoke-direct {v2, v1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 138
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 153
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 142
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v3, "cursor_default/STMC"

    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 143
    if-eqz v3, :cond_0

    .line 146
    array-length v4, v3

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v4, :cond_2

    aget-object v5, v3, v0

    .line 147
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0, v5, v6}, Lcom/keymouse/tool/CursorCfg;->copyAsset(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)V

    .line 146
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 149
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 150
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static isCursorFile(Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 211
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 212
    const-string v1, ".cur"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ".ani"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ".ico"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static lib(Landroid/content/Context;)Ljava/io/File;
    .locals 3

    .prologue
    .line 43
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "cursor_lib"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method static listFiles(Ljava/io/File;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 232
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 233
    const/4 v1, 0x0

    invoke-static {p0, p0, v0, v1}, Lcom/keymouse/tool/CursorCfg;->walk(Ljava/io/File;Ljava/io/File;Ljava/util/ArrayList;I)V

    .line 234
    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 235
    return-object v0
.end method

.method static listThemes(Ljava/io/File;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 240
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 241
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 242
    if-nez v3, :cond_0

    .line 255
    :goto_0
    return-object v0

    .line 245
    :cond_0
    array-length v4, v3

    move v1, v2

    :goto_1
    if-ge v1, v4, :cond_2

    aget-object v5, v3, v1

    .line 246
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 247
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 248
    invoke-static {v5, v5, v6, v2}, Lcom/keymouse/tool/CursorCfg;->walk(Ljava/io/File;Ljava/io/File;Ljava/util/ArrayList;I)V

    .line 249
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 250
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 245
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 254
    :cond_2
    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_0
.end method

.method static load(Landroid/content/Context;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->parse(Ljava/io/File;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method static parse(Ljava/io/File;)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 61
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 63
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_1

    .line 76
    :cond_0
    :goto_0
    return-object v0

    .line 66
    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->readAll(Ljava/io/File;)[B

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 67
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    :goto_1
    if-ge v1, v3, :cond_0

    aget-object v4, v2, v1

    .line 68
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 69
    if-lez v5, :cond_2

    .line 70
    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 73
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static parseInf(Ljava/io/File;Ljava/util/Map;Ljava/util/Map;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x3

    const/16 v12, 0x3d

    const/4 v11, 0x1

    const/4 v10, 0x2

    const/4 v1, 0x0

    .line 433
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->readAll(Ljava/io/File;)[B

    move-result-object v3

    .line 435
    array-length v2, v3

    if-le v2, v10, :cond_1

    aget-byte v2, v3, v1

    and-int/lit16 v2, v2, 0xff

    const/16 v4, 0xff

    if-ne v2, v4, :cond_1

    aget-byte v2, v3, v11

    and-int/lit16 v2, v2, 0xff

    const/16 v4, 0xfe

    if-ne v2, v4, :cond_1

    .line 436
    new-instance v0, Ljava/lang/String;

    array-length v2, v3

    add-int/lit8 v2, v2, -0x2

    const-string v4, "UTF-16LE"

    invoke-direct {v0, v3, v10, v2, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 446
    :goto_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 447
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 448
    const-string v3, ""

    .line 449
    const-string v2, "\r?\n|\r"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    move v2, v1

    move-object v0, v3

    :goto_1
    if-ge v2, v7, :cond_7

    aget-object v3, v6, v2

    .line 450
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 451
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_0

    const-string v8, ";"

    invoke-virtual {v3, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 449
    :cond_0
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 437
    :cond_1
    array-length v2, v3

    if-le v2, v10, :cond_2

    aget-byte v2, v3, v1

    and-int/lit16 v2, v2, 0xff

    const/16 v4, 0xfe

    if-ne v2, v4, :cond_2

    aget-byte v2, v3, v11

    and-int/lit16 v2, v2, 0xff

    const/16 v4, 0xff

    if-ne v2, v4, :cond_2

    .line 438
    new-instance v0, Ljava/lang/String;

    array-length v2, v3

    add-int/lit8 v2, v2, -0x2

    const-string v4, "UTF-16BE"

    invoke-direct {v0, v3, v10, v2, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    goto :goto_0

    .line 440
    :cond_2
    array-length v2, v3

    if-le v2, v0, :cond_3

    aget-byte v2, v3, v1

    and-int/lit16 v2, v2, 0xff

    const/16 v4, 0xef

    if-ne v2, v4, :cond_3

    aget-byte v2, v3, v11

    and-int/lit16 v2, v2, 0xff

    const/16 v4, 0xbb

    if-ne v2, v4, :cond_3

    .line 441
    :goto_3
    new-instance v2, Ljava/lang/String;

    array-length v4, v3

    sub-int/2addr v4, v0

    const-string v5, "UTF-8"

    invoke-direct {v2, v3, v0, v4, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 442
    const v4, 0xfffd

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ltz v4, :cond_c

    .line 443
    new-instance v2, Ljava/lang/String;

    array-length v4, v3

    sub-int/2addr v4, v0

    const-string v5, "GBK"

    invoke-static {v5}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-direct {v2, v3, v0, v4, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    move-object v0, v2

    goto :goto_0

    :cond_3
    move v0, v1

    .line 440
    goto :goto_3

    .line 454
    :cond_4
    const-string v8, "["

    invoke-virtual {v3, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 455
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 458
    :cond_5
    const-string v8, "[strings]"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 459
    invoke-virtual {v3, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 460
    if-lez v8, :cond_0

    .line 461
    invoke-virtual {v3, v1, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/keymouse/tool/CursorCfg;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v9, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 463
    :cond_6
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    const-string v9, "control panel\\cursors"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 464
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 467
    :cond_7
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_8
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 468
    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_9

    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/16 v5, 0x2c

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-ge v2, v5, :cond_9

    .line 469
    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    .line 468
    :goto_5
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->splitCsv(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 470
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v5, 0x5

    if-lt v0, v5, :cond_8

    .line 473
    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/keymouse/tool/CursorCfg;->expand(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 474
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 475
    const/4 v0, 0x4

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/keymouse/tool/CursorCfg;->expand(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 476
    const-string v2, "\\schemes"

    invoke-virtual {v5, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 477
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    move v0, v1

    .line 478
    :goto_6
    array-length v5, v2

    if-ge v0, v5, :cond_8

    sget-object v5, Lcom/keymouse/tool/CursorCfg;->WIN_ORDER:[Ljava/lang/String;

    array-length v5, v5

    if-ge v0, v5, :cond_8

    .line 479
    sget-object v5, Lcom/keymouse/tool/CursorCfg;->WIN_ORDER:[Ljava/lang/String;

    aget-object v5, v5, v0

    invoke-static {v5}, Lcom/keymouse/tool/CursorCfg;->slotOfWinName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aget-object v6, v2, v0

    invoke-static {p2, p1, v5, v6}, Lcom/keymouse/tool/CursorCfg;->put(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_9
    move v2, v1

    .line 469
    goto :goto_5

    .line 481
    :cond_a
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_8

    .line 482
    invoke-static {v6}, Lcom/keymouse/tool/CursorCfg;->slotOfWinName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, p1, v2, v0}, Lcom/keymouse/tool/CursorCfg;->put(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 485
    :cond_b
    return-void

    :cond_c
    move-object v0, v2

    goto/16 :goto_0
.end method

.method private static put(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 488
    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 500
    :cond_0
    :goto_0
    return-void

    .line 491
    :cond_1
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->baseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 492
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 493
    if-eqz v0, :cond_0

    .line 497
    invoke-interface {p0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 498
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private static readAll(Ljava/io/File;)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 559
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 561
    :try_start_0
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->readStream(Ljava/io/InputStream;)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 563
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 561
    return-object v1

    .line 563
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 564
    throw v1
.end method

.method private static readStream(Ljava/io/InputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 568
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 569
    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 571
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_0

    .line 572
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 574
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method static save(Landroid/content/Context;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 81
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 83
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 84
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v4, 0x3d

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 95
    :catch_0
    move-exception v0

    .line 98
    :goto_1
    return-void

    .line 87
    :cond_1
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 88
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 94
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setReadable(ZZ)Z

    goto :goto_1

    .line 92
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 93
    throw v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method static setA11y(Z)Z
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 290
    :try_start_0
    const-string v1, "S=com.keymouse.tool/com.keymouse.tool.CursorA11yService; C=$(settings get secure enabled_accessibility_services); [ \"$C\" = null ] && C=\"\"; N=$(echo \":$C:\" | sed \"s#:$S:#:#g\" | sed \'s#^:*##; s#:*$##\'); "

    .line 293
    if-eqz p0, :cond_0

    .line 294
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "if [ -z \"$N\" ]; then N=$S; else N=\"$N:$S\"; fi; settings put secure enabled_accessibility_services \"$N\"; settings put secure accessibility_enabled 1; echo done"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 301
    :goto_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "su"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "-c"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    .line 302
    invoke-virtual {v1}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 303
    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Lcom/keymouse/tool/CursorCfg;->readStream(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 304
    invoke-virtual {v1}, Ljava/lang/Process;->waitFor()I

    .line 305
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    const-string v2, "done"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    .line 307
    :goto_1
    return v0

    .line 298
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "if [ -z \"$N\" ]; then settings delete secure enabled_accessibility_services; else settings put secure enabled_accessibility_services \"$N\"; fi; echo done"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 306
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private static slotOfWinName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 414
    const-string v0, "Arrow"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 415
    const-string v0, "arrow"

    .line 429
    :goto_0
    return-object v0

    .line 417
    :cond_0
    const-string v0, "Hand"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 418
    const-string v0, "hand"

    goto :goto_0

    .line 420
    :cond_1
    const-string v0, "IBeam"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 421
    const-string v0, "ibeam"

    goto :goto_0

    .line 423
    :cond_2
    const-string v0, "Grab"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 424
    const-string v0, "grab"

    goto :goto_0

    .line 426
    :cond_3
    const-string v0, "SizeAll"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 427
    const-string v0, "_move"

    goto :goto_0

    .line 429
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static splitCsv(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 539
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 540
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move v0, v1

    move v2, v1

    .line 542
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v0, v5, :cond_3

    .line 543
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 544
    const/16 v6, 0x22

    if-ne v5, v6, :cond_1

    .line 545
    if-nez v2, :cond_0

    const/4 v2, 0x1

    .line 546
    :goto_1
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 542
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move v2, v1

    .line 545
    goto :goto_1

    .line 547
    :cond_1
    const/16 v6, 0x2c

    if-ne v5, v6, :cond_2

    if-nez v2, :cond_2

    .line 548
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 549
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_2

    .line 551
    :cond_2
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 554
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 555
    return-object v3
.end method

.method static themeFromFolder(Ljava/io/File;Ljava/lang/String;)Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 315
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 316
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 318
    new-instance v0, Ljava/io/File;

    const-string v2, "theme.cfg"

    invoke-direct {v0, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 319
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 320
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->parse(Ljava/io/File;)Ljava/util/Map;

    move-result-object v5

    .line 321
    sget-object v6, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    array-length v7, v6

    move v2, v3

    :goto_0
    if-ge v2, v7, :cond_1

    aget-object v8, v6, v2

    .line 322
    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 323
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_0

    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 324
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    :cond_0
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    .line 327
    :cond_1
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    move-object v0, v1

    .line 369
    :goto_1
    return-object v0

    .line 331
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 332
    invoke-static {p0, v4, v2, v3}, Lcom/keymouse/tool/CursorCfg;->walk(Ljava/io/File;Ljava/io/File;Ljava/util/ArrayList;I)V

    .line 333
    sget-object v0, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 334
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 335
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 336
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->baseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 339
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 340
    invoke-static {v4, v0, v3}, Lcom/keymouse/tool/CursorCfg;->findInf(Ljava/io/File;Ljava/util/ArrayList;I)V

    .line 341
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 343
    :try_start_0
    invoke-static {v0, v5, v1}, Lcom/keymouse/tool/CursorCfg;->parseInf(Ljava/io/File;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 344
    :catch_0
    move-exception v0

    goto :goto_3

    .line 349
    :cond_4
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 350
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->baseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/keymouse/tool/CursorCfg;->guess(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 351
    if-eqz v4, :cond_5

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 352
    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 356
    :cond_6
    const-string v0, "_move"

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 357
    const-string v3, "grab"

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    if-eqz v0, :cond_7

    .line 358
    const-string v3, "grab"

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    :cond_7
    const-string v0, "grab"

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 361
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 362
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->baseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 363
    const-string v4, "move"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "sizeall"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string v4, "all-scroll"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 364
    :cond_9
    const-string v2, "grab"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    move-object v0, v1

    .line 369
    goto/16 :goto_1
.end method

.method private static unquote(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x22

    .line 531
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 532
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_0

    .line 533
    const/4 v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 535
    :cond_0
    return-object v0
.end method

.method private static walk(Ljava/io/File;Ljava/io/File;Ljava/util/ArrayList;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/io/File;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 216
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 217
    if-eqz v1, :cond_0

    const/4 v0, 0x4

    if-le p3, v0, :cond_1

    .line 228
    :cond_0
    return-void

    .line 220
    :cond_1
    array-length v2, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    .line 221
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 222
    add-int/lit8 v4, p3, 0x1

    invoke-static {p0, v3, p2, v4}, Lcom/keymouse/tool/CursorCfg;->walk(Ljava/io/File;Ljava/io/File;Ljava/util/ArrayList;I)V

    .line 220
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 223
    :cond_3
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/keymouse/tool/CursorCfg;->isCursorFile(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 224
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 225
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method
