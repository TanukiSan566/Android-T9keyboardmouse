.class public Lcom/keymouse/tool/KeyCustomActivity;
.super Landroid/app/Activity;
.source "KeyCustomActivity.java"


# static fields
.field private static final ACT:[I

.field private static final MAX_MAPS:I = 0x10


# instance fields
.field private mAdd:Landroid/widget/Button;

.field private mCfg:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mExclSub:Landroid/widget/TextView;

.field private final mH:Landroid/os/Handler;

.field private mLastSeq:Ljava/lang/String;

.field private mLearnStart:J

.field private mLearning:Z

.field private mList:Landroid/widget/LinearLayout;

.field private mMaps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[I>;"
        }
    .end annotation
.end field

.field private final mPoll:Ljava/lang/Runnable;

.field private mReady:Z

.field private mStatus:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keymouse/tool/KeyCustomActivity;->ACT:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x1
        0x2
        0x5
        0x3
        0x4
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 34
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mH:Landroid/os/Handler;

    .line 46
    iput-boolean v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mReady:Z

    .line 47
    iput-boolean v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLastSeq:Ljava/lang/String;

    .line 49
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearnStart:J

    .line 373
    new-instance v0, Lcom/keymouse/tool/KeyCustomActivity$7;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/KeyCustomActivity$7;-><init>(Lcom/keymouse/tool/KeyCustomActivity;)V

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mPoll:Ljava/lang/Runnable;

    return-void
.end method

.method private L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$000(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/keymouse/tool/KeyCustomActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/keymouse/tool/KeyCustomActivity;)V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->toggleLearn()V

    return-void
.end method

.method static synthetic access$1000(Lcom/keymouse/tool/KeyCustomActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLastSeq:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 34
    iput-object p1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLastSeq:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/keymouse/tool/KeyCustomActivity;[Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/keymouse/tool/KeyCustomActivity;->addLearned([Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/keymouse/tool/KeyCustomActivity;)J
    .locals 2

    .prologue
    .line 34
    iget-wide v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearnStart:J

    return-wide v0
.end method

.method static synthetic access$1300(Lcom/keymouse/tool/KeyCustomActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mH:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    invoke-static {p0}, Lcom/keymouse/tool/KeyCustomActivity;->fmt(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/keymouse/tool/KeyCustomActivity;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/keymouse/tool/KeyCustomActivity;)V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->saveMaps()V

    return-void
.end method

.method static synthetic access$500(Lcom/keymouse/tool/KeyCustomActivity;)V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->rebuildList()V

    return-void
.end method

.method static synthetic access$600(Lcom/keymouse/tool/KeyCustomActivity;)V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->refreshAddButton()V

    return-void
.end method

.method static synthetic access$700()[I
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/keymouse/tool/KeyCustomActivity;->ACT:[I

    return-object v0
.end method

.method static synthetic access$800(Lcom/keymouse/tool/KeyCustomActivity;)Z
    .locals 1

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    return v0
.end method

.method static synthetic access$802(Lcom/keymouse/tool/KeyCustomActivity;Z)Z
    .locals 0

    .prologue
    .line 34
    iput-boolean p1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    return p1
.end method

.method static synthetic access$900(Lcom/keymouse/tool/KeyCustomActivity;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->readLearned()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static actIndex(I)I
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 116
    move v0, v1

    :goto_0
    sget-object v2, Lcom/keymouse/tool/KeyCustomActivity;->ACT:[I

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 117
    sget-object v2, Lcom/keymouse/tool/KeyCustomActivity;->ACT:[I

    aget v2, v2, v0

    if-ne v2, p0, :cond_0

    .line 121
    :goto_1
    return v0

    .line 116
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    .line 121
    goto :goto_1
.end method

.method private actionNames()[Ljava/lang/String;
    .locals 6

    .prologue
    .line 106
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Recent apps"

    const-string v3, "\u041d\u0435\u0434\u0430\u0432\u043d\u0438\u0435"

    const-string v4, "\u6700\u8fd1\u306e\u30a2\u30d7\u30ea"

    const-string v5, "\u6700\u8fd1\u4efb\u52a1"

    .line 107
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Close foreground app"

    const-string v3, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0435"

    const-string v4, "\u524d\u9762\u30a2\u30d7\u30ea\u3092\u7d42\u4e86"

    const-string v5, "\u7ed3\u675f\u524d\u53f0\u5e94\u7528"

    .line 108
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Screenshot (root)"

    const-string v3, "\u0421\u043a\u0440\u0438\u043d\u0448\u043e\u0442 (root)"

    const-string v4, "\u30b9\u30af\u30ea\u30fc\u30f3\u30b7\u30e7\u30c3\u30c8(root)"

    const-string v5, "\u622a\u5c4f(root)"

    .line 109
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Flashlight"

    const-string v3, "\u0424\u043e\u043d\u0430\u0440\u0438\u043a"

    const-string v4, "\u30e9\u30a4\u30c8"

    const-string v5, "\u624b\u7535\u7b52"

    .line 110
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Go to home screen"

    const-string v3, "\u041d\u0430 \u0440\u0430\u0431\u043e\u0447\u0438\u0439 \u0441\u0442\u043e\u043b"

    const-string v4, "\u30db\u30fc\u30e0\u753b\u9762\u3078"

    const-string v5, "\u56de\u5230\u684c\u9762"

    .line 111
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 106
    return-object v0
.end method

.method private addLearned([Ljava/lang/String;)V
    .locals 9

    .prologue
    const/4 v2, 0x1

    const/4 v5, 0x0

    .line 397
    array-length v0, p1

    new-array v7, v0, [I

    .line 399
    aput v2, v7, v5

    move v6, v2

    move v3, v2

    .line 401
    :goto_0
    :try_start_0
    array-length v0, p1

    if-ge v6, v0, :cond_4

    const/4 v0, 0x5

    if-ge v3, v0, :cond_4

    .line 402
    aget-object v0, p1, v6

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 403
    const/16 v1, 0x37

    if-eq v0, v1, :cond_0

    const/16 v1, 0xe3

    if-eq v0, v1, :cond_0

    const/16 v1, 0x20a

    if-ne v0, v1, :cond_1

    .line 404
    :cond_0
    const/4 v0, -0x1

    :cond_1
    move v4, v2

    move v1, v5

    .line 407
    :goto_1
    if-ge v4, v3, :cond_3

    .line 408
    aget v8, v7, v4

    if-ne v8, v0, :cond_2

    move v1, v2

    .line 407
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 412
    :cond_3
    if-nez v1, :cond_8

    .line 413
    add-int/lit8 v1, v3, 0x1

    aput v0, v7, v3
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 401
    :goto_2
    add-int/lit8 v1, v6, 0x1

    move v6, v1

    move v3, v0

    goto :goto_0

    .line 419
    :cond_4
    const/4 v0, 0x2

    if-ge v3, v0, :cond_5

    .line 434
    :goto_3
    return-void

    .line 422
    :cond_5
    new-array v1, v3, [I

    .line 423
    invoke-static {v7, v5, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 424
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 425
    invoke-static {v0, v1}, Lcom/keymouse/tool/KeyCustomActivity;->sameKeys([I[I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 426
    const-string v0, "That key combination already exists"

    const-string v1, "\u0422\u0430\u043a\u0430\u044f \u043a\u043e\u043c\u0431\u0438\u043d\u0430\u0446\u0438\u044f \u0443\u0436\u0435 \u0435\u0441\u0442\u044c"

    const-string v2, "\u305d\u306e\u30ad\u30fc\u306e\u7d44\u307f\u5408\u308f\u305b\u306f\u65e2\u306b\u3042\u308a\u307e\u3059"

    const-string v3, "\u8fd9\u4e2a\u7ec4\u5408\u5df2\u7ecf\u5b58\u5728"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 427
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_3

    .line 431
    :cond_7
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 432
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->saveMaps()V

    .line 433
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->rebuildList()V

    goto :goto_3

    .line 416
    :catch_0
    move-exception v0

    goto :goto_3

    :cond_8
    move v0, v3

    goto :goto_2
.end method

.method private comboLabel([I)Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 95
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move v0, v1

    .line 96
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_1

    .line 97
    if-le v0, v1, :cond_0

    .line 98
    const-string v3, " + "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    :cond_0
    aget v3, p1, v0

    invoke-direct {p0, v3}, Lcom/keymouse/tool/KeyCustomActivity;->keyLabel(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private dir()Ljava/io/File;
    .locals 1

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/keymouse/tool/KeyCustomActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private dp(I)I
    .locals 2

    .prologue
    .line 56
    int-to-float v0, p1

    invoke-virtual {p0}, Lcom/keymouse/tool/KeyCustomActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private static fmt(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit16 v1, p0, 0x3e8

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    rem-int/lit16 v1, p0, 0x3e8

    div-int/lit8 v1, v1, 0x64

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private keyLabel(I)Ljava/lang/String;
    .locals 4

    .prologue
    .line 82
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 83
    const-string v0, "*"

    .line 91
    :goto_0
    return-object v0

    .line 85
    :cond_0
    const/16 v0, 0x8b

    if-ne p1, v0, :cond_1

    .line 86
    const-string v0, "Menu"

    const-string v1, "\u041c\u0435\u043d\u044e"

    const-string v2, "\u30e1\u30cb\u30e5\u30fc"

    const-string v3, "\u83dc\u5355"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 88
    :cond_1
    const/16 v0, 0x9e

    if-ne p1, v0, :cond_2

    .line 89
    const-string v0, "Back"

    const-string v1, "\u041d\u0430\u0437\u0430\u0434"

    const-string v2, "\u623b\u308b"

    const-string v3, "\u8fd4\u56de"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 91
    :cond_2
    invoke-static {p0, p1}, Lcom/keymouse/tool/ToggleKeys;->keyName(Landroid/app/Activity;I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 60
    iget-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mReady:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-static {p0, v0}, Lcom/keymouse/tool/KmCfg;->save(Landroid/content/Context;Ljava/util/Map;)V

    goto :goto_0
.end method

.method private readLearned()[Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 356
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v3, Ljava/io/FileInputStream;

    new-instance v4, Ljava/io/File;

    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->dir()Ljava/io/File;

    move-result-object v5

    const-string v6, "keymouse_learned"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 358
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 359
    if-nez v0, :cond_0

    move-object v0, v1

    .line 361
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 364
    :goto_1
    return-object v0

    .line 359
    :cond_0
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v3, "\\s+"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 361
    :catchall_0
    move-exception v0

    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 362
    throw v0
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    .line 363
    :catch_0
    move-exception v0

    move-object v0, v1

    .line 364
    goto :goto_1
.end method

.method private readLearnedSeq()Ljava/lang/String;
    .locals 2

    .prologue
    .line 369
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->readLearned()[Ljava/lang/String;

    move-result-object v0

    .line 370
    if-eqz v0, :cond_0

    array-length v1, v0

    if-nez v1, :cond_1

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0

    :cond_1
    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_0
.end method

.method private rebuildList()V
    .locals 10

    .prologue
    const/4 v2, 0x0

    .line 260
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mList:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 261
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 262
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 263
    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 264
    const v1, 0x3f333333    # 0.7f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 265
    const-string v1, "No mappings yet. Tap + below."

    const-string v2, "\u041f\u043e\u043a\u0430 \u043d\u0435\u0442 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0439. \u041d\u0430\u0436\u043c\u0438\u0442\u0435 + \u043d\u0438\u0436\u0435."

    const-string v3, "\u5272\u308a\u5f53\u3066\u306f\u307e\u3060\u3042\u308a\u307e\u305b\u3093\u3002\u4e0b\u306e + \u3092\u62bc\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    const-string v4, "\u8fd8\u6ca1\u6709\u6620\u5c04\uff0c\u70b9\u4e0b\u9762\u7684 + \u6dfb\u52a0\u3002"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mList:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 315
    :cond_0
    return-void

    .line 270
    :cond_1
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->actionNames()[Ljava/lang/String;

    move-result-object v3

    move v1, v2

    .line 271
    :goto_0
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    .line 272
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 273
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 274
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 275
    const/16 v5, 0xa

    invoke-direct {p0, v5}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v5

    const/4 v6, 0x6

    invoke-direct {p0, v6}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v6

    invoke-virtual {v4, v2, v5, v2, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 277
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 278
    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 279
    const/16 v6, 0x10

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 280
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 281
    const/high16 v7, 0x41880000    # 17.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 282
    invoke-direct {p0, v0}, Lcom/keymouse/tool/KeyCustomActivity;->comboLabel([I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 283
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v7, v2, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 284
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 285
    const-string v7, "\u00d7"

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 286
    new-instance v7, Lcom/keymouse/tool/KeyCustomActivity$5;

    invoke-direct {v7, p0, v0}, Lcom/keymouse/tool/KeyCustomActivity$5;-><init>(Lcom/keymouse/tool/KeyCustomActivity;[I)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 294
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 295
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 297
    new-instance v5, Landroid/widget/Spinner;

    invoke-direct {v5, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 298
    new-instance v6, Landroid/widget/ArrayAdapter;

    const v7, 0x1090009

    invoke-direct {v6, p0, v7, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 299
    aget v6, v0, v2

    invoke-static {v6}, Lcom/keymouse/tool/KeyCustomActivity;->actIndex(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 300
    new-instance v6, Lcom/keymouse/tool/KeyCustomActivity$6;

    invoke-direct {v6, p0, v0}, Lcom/keymouse/tool/KeyCustomActivity$6;-><init>(Lcom/keymouse/tool/KeyCustomActivity;[I)V

    invoke-virtual {v5, v6}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 312
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 313
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mList:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 271
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_0
.end method

.method private refreshAddButton()V
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 318
    iget-boolean v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    if-eqz v1, :cond_0

    .line 319
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    const-string v2, "Cancel"

    const-string v3, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const-string v4, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v5, "\u53d6\u6d88"

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 320
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 321
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mStatus:Landroid/widget/TextView;

    const-string v1, "Hold the key(s) you want (1-4 keys together), then release all (within 8 s)..."

    const-string v2, "\u0417\u0430\u0436\u043c\u0438\u0442\u0435 \u043d\u0443\u0436\u043d\u044b\u0435 \u043a\u043b\u0430\u0432\u0438\u0448\u0438 (1-4 \u0432\u043c\u0435\u0441\u0442\u0435), \u0437\u0430\u0442\u0435\u043c \u043e\u0442\u043f\u0443\u0441\u0442\u0438\u0442\u0435 \u0432\u0441\u0435 (8 \u0441)..."

    const-string v3, "\u4f7f\u3044\u305f\u3044\u30ad\u30fc\u3092\u540c\u6642\u306b\u62bc\u3057\u7d9a\u3051(1\u301c4\u500b)\u3001\u3059\u3079\u3066\u96e2\u3057\u3066\u304f\u3060\u3055\u3044(8\u79d2\u4ee5\u5185)..."

    const-string v4, "\u8bf7\u540c\u65f6\u6309\u4f4f\u60f3\u7528\u7684\u952e\uff081~4 \u4e2a\uff09\uff0c\u7136\u540e\u5168\u90e8\u677e\u5f00\uff088 \u79d2\u5185\uff09\u2026"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 330
    :goto_0
    return-void

    .line 326
    :cond_0
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    const-string v2, "+"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 327
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x10

    if-ge v2, v3, :cond_1

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 328
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mStatus:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 327
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static sameKeys([I[I)Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x1

    .line 437
    array-length v0, p0

    array-length v2, p1

    if-eq v0, v2, :cond_1

    .line 451
    :cond_0
    :goto_0
    return v4

    :cond_1
    move v0, v1

    .line 440
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_4

    move v2, v1

    move v3, v4

    .line 442
    :goto_2
    array-length v5, p1

    if-ge v2, v5, :cond_3

    .line 443
    aget v5, p0, v0

    aget v6, p1, v2

    if-ne v5, v6, :cond_2

    move v3, v1

    .line 442
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 447
    :cond_3
    if-eqz v3, :cond_0

    .line 440
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    move v4, v1

    .line 451
    goto :goto_0
.end method

.method private saveMaps()V
    .locals 3

    .prologue
    .line 68
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const-string v1, "maps"

    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/keymouse/tool/KmCfg;->serializeMaps(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-static {p0, v0}, Lcom/keymouse/tool/KmCfg;->save(Landroid/content/Context;Ljava/util/Map;)V

    .line 70
    return-void
.end method

.method private sceneRow(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 482
    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 483
    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-static {v2, p1, v0}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 484
    new-instance v0, Lcom/keymouse/tool/KeyCustomActivity$8;

    invoke-direct {v0, p0, p1}, Lcom/keymouse/tool/KeyCustomActivity$8;-><init>(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 489
    const-string v0, "On"

    const-string v2, "\u0412\u043a\u043b"

    const-string v3, "\u30aa\u30f3"

    const-string v4, "\u5f00\u542f"

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "Off"

    const-string v3, "\u0412\u044b\u043a\u043b"

    const-string v4, "\u30aa\u30d5"

    const-string v5, "\u5173\u95ed"

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, p2, v0, v2, v1}, Lcom/keymouse/tool/ChoiceRow;->build(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/CompoundButton;)Landroid/view/View;

    move-result-object v0

    return-object v0

    .line 483
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private toggleLearn()V
    .locals 5

    .prologue
    .line 333
    iget-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    if-eqz v0, :cond_0

    .line 334
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    .line 335
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->dir()Ljava/io/File;

    move-result-object v0

    const-string v1, "learn_cancel"

    invoke-static {v0, v1}, Lcom/keymouse/tool/ToggleKeys;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    .line 336
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->refreshAddButton()V

    .line 351
    :goto_0
    return-void

    .line 339
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->dir()Ljava/io/File;

    move-result-object v1

    const-string v2, "keymouse.pid"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 340
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mStatus:Landroid/widget/TextView;

    const-string v1, "Turn on the main switch first."

    const-string v2, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u0435 \u0433\u043b\u0430\u0432\u043d\u044b\u0439 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0442\u0435\u043b\u044c."

    const-string v3, "\u5148\u306b\u30e1\u30a4\u30f3\u30b9\u30a4\u30c3\u30c1\u3092\u30aa\u30f3\u306b\u3057\u3066\u304f\u3060\u3055\u3044\u3002"

    const-string v4, "\u8bf7\u5148\u6253\u5f00\u4e3b\u754c\u9762\u7684\u9f20\u6807\u603b\u5f00\u5173\u3002"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 344
    :cond_1
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->readLearnedSeq()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLastSeq:Ljava/lang/String;

    .line 345
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    .line 346
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearnStart:J

    .line 347
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->dir()Ljava/io/File;

    move-result-object v0

    const-string v1, "learn_map"

    invoke-static {v0, v1}, Lcom/keymouse/tool/ToggleKeys;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    .line 348
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->refreshAddButton()V

    .line 349
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mH:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mPoll:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 350
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mH:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mPoll:Ljava/lang/Runnable;

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12

    .prologue
    const/16 v6, 0x10

    const/high16 v11, 0x41400000    # 12.0f

    const/high16 v10, 0x41800000    # 16.0f

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 126
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 127
    const-string v0, "Key customization"

    const-string v3, "\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u043a\u043b\u0430\u0432\u0438\u0448"

    const-string v4, "\u30ad\u30fc\u306e\u30ab\u30b9\u30bf\u30de\u30a4\u30ba"

    const-string v5, "\u6309\u952e\u81ea\u5b9a\u4e49"

    invoke-direct {p0, v0, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/keymouse/tool/KeyCustomActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 128
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    .line 129
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const-string v3, "maps"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/keymouse/tool/KmCfg;->parseMaps(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mMaps:Ljava/util/ArrayList;

    .line 130
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->readLearnedSeq()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLastSeq:Ljava/lang/String;

    .line 132
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 133
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 134
    invoke-direct {p0, v6}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v0

    const/16 v4, 0xc

    invoke-direct {p0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v6}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v5

    const/16 v6, 0x18

    invoke-direct {p0, v6}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v6

    invoke-virtual {v3, v0, v4, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 136
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 137
    const/high16 v4, 0x41a00000    # 20.0f

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 138
    invoke-virtual {p0}, Lcom/keymouse/tool/KeyCustomActivity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 142
    new-instance v4, Landroid/widget/Switch;

    invoke-direct {v4, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 143
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const-string v5, "kmOn"

    invoke-static {v0, v5, v1}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v4, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 144
    new-instance v0, Lcom/keymouse/tool/KeyCustomActivity$1;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/KeyCustomActivity$1;-><init>(Lcom/keymouse/tool/KeyCustomActivity;)V

    invoke-virtual {v4, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 149
    const-string v0, "Enable key mapping"

    const-string v5, "\u0412\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f \u043a\u043b\u0430\u0432\u0438\u0448"

    const-string v6, "\u30ad\u30fc\u5272\u308a\u5f53\u3066\u3092\u6709\u52b9\u306b\u3059\u308b"

    const-string v7, "\u542f\u7528\u6309\u952e\u6620\u5c04"

    .line 150
    invoke-direct {p0, v0, v5, v6, v7}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v5, "On"

    const-string v6, "\u0412\u043a\u043b"

    const-string v7, "\u30aa\u30f3"

    const-string v8, "\u5f00\u542f"

    .line 151
    invoke-direct {p0, v5, v6, v7, v8}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "Off"

    const-string v7, "\u0412\u044b\u043a\u043b"

    const-string v8, "\u30aa\u30d5"

    const-string v9, "\u5173\u95ed"

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 149
    invoke-static {p0, v0, v5, v6, v4}, Lcom/keymouse/tool/ChoiceRow;->build(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/CompoundButton;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 152
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 153
    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 154
    const-string v4, "Off = every mapping below is disabled; short presses always stay with the system."

    const-string v5, "\u0412\u044b\u043a\u043b = \u0432\u0441\u0435 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f \u043e\u0442\u043a\u043b\u044e\u0447\u0435\u043d\u044b; \u043a\u043e\u0440\u043e\u0442\u043a\u0438\u0435 \u043d\u0430\u0436\u0430\u0442\u0438\u044f \u0432\u0441\u0435\u0433\u0434\u0430 \u043e\u0441\u0442\u0430\u044e\u0442\u0441\u044f \u0441\u0438\u0441\u0442\u0435\u043c\u0435."

    const-string v6, "\u30aa\u30d5 = \u4ee5\u4e0b\u306e\u5272\u308a\u5f53\u3066\u3092\u3059\u3079\u3066\u505c\u6b62(\u77ed\u62bc\u3057\u306f\u5e38\u306b\u30b7\u30b9\u30c6\u30e0\u306b\u6e21\u3057\u307e\u3059)"

    const-string v7, "\u5173\u95ed = \u4e0b\u9762\u6240\u6709\u6620\u5c04\u90fd\u505c\u7528\uff1b\u5355\u51fb\u59cb\u7ec8\u4ea4\u7ed9\u7cfb\u7edf\u5904\u7406\u3002"

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 161
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 162
    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 163
    const/16 v4, 0x14

    invoke-direct {p0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v4

    const/4 v5, 0x4

    invoke-direct {p0, v5}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v5

    invoke-virtual {v0, v2, v4, v2, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 164
    const-string v4, "Key mappings (hold 1-4 keys together)"

    const-string v5, "\u041d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f (\u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u0435 1-4 \u043a\u043b\u0430\u0432\u0438\u0448 \u0432\u043c\u0435\u0441\u0442\u0435)"

    const-string v6, "\u30ad\u30fc\u5272\u308a\u5f53\u3066(1\u301c4\u500b\u3092\u540c\u6642\u306b\u9577\u62bc\u3057)"

    const-string v7, "\u6309\u952e\u6620\u5c04\uff08\u540c\u65f6\u957f\u6309 1~4 \u4e2a\u952e\uff09"

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 168
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mList:Landroid/widget/LinearLayout;

    .line 169
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mList:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 170
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mList:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 173
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    .line 174
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    const/high16 v4, 0x41d00000    # 26.0f

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setTextSize(F)V

    .line 175
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    const-string v4, "+"

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 176
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    new-instance v4, Lcom/keymouse/tool/KeyCustomActivity$2;

    invoke-direct {v4, p0}, Lcom/keymouse/tool/KeyCustomActivity$2;-><init>(Lcom/keymouse/tool/KeyCustomActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 182
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mStatus:Landroid/widget/TextView;

    .line 183
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mStatus:Landroid/widget/TextView;

    const/high16 v4, 0x41500000    # 13.0f

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 184
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mStatus:Landroid/widget/TextView;

    const v4, 0x3f4ccccd    # 0.8f

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 185
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mStatus:Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 188
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 189
    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 190
    const/16 v4, 0x12

    invoke-direct {p0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v2, v4, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 191
    const/16 v4, 0x1f4

    const/16 v5, 0x1388

    iget-object v6, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const-string v7, "holdMs"

    const/16 v8, 0x5dc

    invoke-static {v6, v7, v8}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 192
    const-string v5, "Long-press time (all mappings)"

    const-string v6, "\u0412\u0440\u0435\u043c\u044f \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044f (\u0434\u043b\u044f \u0432\u0441\u0435\u0445)"

    const-string v7, "\u9577\u62bc\u3057\u6642\u9593(\u3059\u3079\u3066\u5171\u901a)"

    const-string v8, "\u957f\u6309\u65f6\u95f4\uff08\u6240\u6709\u6620\u5c04\u5171\u7528\uff09"

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 194
    const-string v6, " s"

    const-string v7, " \u0441"

    const-string v8, " \u79d2"

    const-string v9, " \u79d2"

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 195
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v4}, Lcom/keymouse/tool/KeyCustomActivity;->fmt(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 197
    new-instance v7, Landroid/widget/SeekBar;

    invoke-direct {v7, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 198
    const/16 v8, 0x2d

    invoke-virtual {v7, v8}, Landroid/widget/SeekBar;->setMax(I)V

    .line 199
    div-int/lit8 v4, v4, 0x64

    add-int/lit8 v4, v4, -0x5

    invoke-virtual {v7, v4}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 200
    new-instance v4, Lcom/keymouse/tool/KeyCustomActivity$3;

    invoke-direct {v4, p0, v0, v5, v6}, Lcom/keymouse/tool/KeyCustomActivity$3;-><init>(Lcom/keymouse/tool/KeyCustomActivity;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 215
    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 218
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 219
    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 220
    const/16 v4, 0x16

    invoke-direct {p0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v2, v4, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 221
    const-string v4, "When it works"

    const-string v5, "\u041a\u043e\u0433\u0434\u0430 \u0440\u0430\u0431\u043e\u0442\u0430\u0435\u0442"

    const-string v6, "\u52d5\u4f5c\u3059\u308b\u5834\u9762"

    const-string v7, "\u751f\u6548\u573a\u666f"

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 223
    const-string v0, "lockOk"

    const-string v4, "Also on the lock screen (screen on)"

    const-string v5, "\u0418 \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 (\u044d\u043a\u0440\u0430\u043d \u0432\u043a\u043b\u044e\u0447\u0451\u043d)"

    const-string v6, "\u30ed\u30c3\u30af\u753b\u9762(\u753b\u9762\u70b9\u706f\u4e2d)\u3067\u3082\u6709\u52b9"

    const-string v7, "\u9501\u5c4f\u754c\u9762(\u4eae\u5c4f)\u4e5f\u751f\u6548"

    .line 224
    invoke-direct {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 223
    invoke-direct {p0, v0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->sceneRow(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 226
    const-string v0, "sleepOk"

    const-string v4, "Also when the screen is off (sleep)"

    const-string v5, "\u0418 \u043f\u0440\u0438 \u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d\u043d\u043e\u043c \u044d\u043a\u0440\u0430\u043d\u0435"

    const-string v6, "\u753b\u9762\u6d88\u706f\u4e2d(\u30b9\u30ea\u30fc\u30d7)\u3082\u6709\u52b9"

    const-string v7, "\u606f\u5c4f(\u4f11\u7720)\u65f6\u4e5f\u751f\u6548"

    .line 227
    invoke-direct {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 226
    invoke-direct {p0, v0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->sceneRow(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 231
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 232
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 233
    const/16 v4, 0x16

    invoke-direct {p0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v4

    const/4 v5, 0x6

    invoke-direct {p0, v5}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v5

    invoke-virtual {v0, v2, v4, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 234
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 235
    invoke-virtual {v2, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 236
    const-string v4, "Excluded apps  \u203a"

    const-string v5, "\u0418\u0441\u043a\u043b\u044e\u0447\u0451\u043d\u043d\u044b\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f  \u203a"

    const-string v6, "\u9664\u5916\u30a2\u30d7\u30ea  \u203a"

    const-string v7, "\u6392\u9664\u5e94\u7528  \u203a"

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 238
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mExclSub:Landroid/widget/TextView;

    .line 239
    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mExclSub:Landroid/widget/TextView;

    invoke-virtual {v2, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 240
    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mExclSub:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 241
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 242
    new-instance v2, Lcom/keymouse/tool/KeyCustomActivity$4;

    invoke-direct {v2, p0}, Lcom/keymouse/tool/KeyCustomActivity$4;-><init>(Lcom/keymouse/tool/KeyCustomActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 249
    iput-boolean v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mReady:Z

    .line 250
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->rebuildList()V

    .line 251
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->refreshAddButton()V

    .line 252
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 253
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 254
    invoke-virtual {v0, v3}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 255
    invoke-virtual {p0, v0}, Lcom/keymouse/tool/KeyCustomActivity;->setContentView(Landroid/view/View;)V

    .line 256
    return-void

    :cond_0
    move v0, v2

    .line 143
    goto/16 :goto_0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 456
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 457
    iget-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    if-eqz v0, :cond_0

    .line 458
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mLearning:Z

    .line 459
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->dir()Ljava/io/File;

    move-result-object v0

    const-string v1, "learn_cancel"

    invoke-static {v0, v1}, Lcom/keymouse/tool/ToggleKeys;->sendCmd(Ljava/io/File;Ljava/lang/String;)V

    .line 461
    :cond_0
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mH:Landroid/os/Handler;

    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mPoll:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 462
    return-void
.end method

.method protected onResume()V
    .locals 7

    .prologue
    .line 466
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 467
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mAdd:Landroid/widget/Button;

    if-eqz v0, :cond_0

    .line 468
    invoke-direct {p0}, Lcom/keymouse/tool/KeyCustomActivity;->refreshAddButton()V

    .line 471
    :cond_0
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    .line 472
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const-string v2, "excl"

    const-string v3, "excl"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-static {v0}, Lcom/keymouse/tool/KmCfg;->exclCount(Ljava/util/Map;)I

    move-result v0

    .line 474
    if-nez v0, :cond_1

    const-string v0, "none"

    const-string v1, "\u043d\u0435\u0442"

    const-string v2, "\u306a\u3057"

    const-string v3, "\u65e0"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 475
    :goto_0
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mExclSub:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Mappings do nothing while these apps are in front: "

    const-string v4, "\u041d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f \u043d\u0435 \u0440\u0430\u0431\u043e\u0442\u0430\u044e\u0442, \u043f\u043e\u043a\u0430 \u044d\u0442\u0438 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u043d\u0430 \u043f\u0435\u0440\u0435\u0434\u043d\u0435\u043c \u043f\u043b\u0430\u043d\u0435: "

    const-string v5, "\u3053\u308c\u3089\u306e\u30a2\u30d7\u30ea\u304c\u524d\u9762\u306b\u3042\u308b\u9593\u306f\u5272\u308a\u5f53\u3066\u304c\u52d5\u4f5c\u3057\u307e\u305b\u3093: "

    const-string v6, "\u8fd9\u4e9b\u5e94\u7528\u5728\u524d\u53f0\u65f6\u4e0d\u89e6\u53d1\u6620\u5c04\uff1a"

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 479
    return-void

    .line 474
    :cond_1
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
