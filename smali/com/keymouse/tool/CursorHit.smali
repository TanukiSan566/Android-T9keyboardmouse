.class final Lcom/keymouse/tool/CursorHit;
.super Ljava/lang/Object;
.source "CursorHit.java"


# static fields
.field static final ARROW:I = 0x0

.field static final HAND:I = 0x1

.field static final IBEAM:I = 0x2

.field private static volatile busy:Z

.field private static lastStart:J

.field private static lastX:I

.field private static lastY:I

.field private static movedAt:J

.field private static pending:Z

.field private static volatile res:[I

.field private static volatile resAt:J

.field static volatile svc:Lcom/keymouse/tool/CursorA11yService;

.field private static worker:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    const v0, -0x1869f

    const-wide/16 v2, 0x0

    .line 24
    sput v0, Lcom/keymouse/tool/CursorHit;->lastX:I

    .line 25
    sput v0, Lcom/keymouse/tool/CursorHit;->lastY:I

    .line 26
    sput-wide v2, Lcom/keymouse/tool/CursorHit;->movedAt:J

    .line 27
    sput-wide v2, Lcom/keymouse/tool/CursorHit;->lastStart:J

    .line 28
    sput-boolean v1, Lcom/keymouse/tool/CursorHit;->pending:Z

    .line 29
    sput-boolean v1, Lcom/keymouse/tool/CursorHit;->busy:Z

    .line 30
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keymouse/tool/CursorHit;->res:[I

    .line 31
    sput-wide v2, Lcom/keymouse/tool/CursorHit;->resAt:J

    return-void

    .line 30
    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method static synthetic access$002([I)[I
    .locals 0

    .prologue
    .line 17
    sput-object p0, Lcom/keymouse/tool/CursorHit;->res:[I

    return-object p0
.end method

.method static synthetic access$102(J)J
    .locals 0

    .prologue
    .line 17
    sput-wide p0, Lcom/keymouse/tool/CursorHit;->resAt:J

    return-wide p0
.end method

.method static synthetic access$202(Z)Z
    .locals 0

    .prologue
    .line 17
    sput-boolean p0, Lcom/keymouse/tool/CursorHit;->busy:Z

    return p0
.end method

.method static available()Z
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static poll(IIJ)I
    .locals 10

    .prologue
    const/4 v8, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 43
    sget-object v0, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    if-nez v0, :cond_1

    .line 72
    :cond_0
    :goto_0
    return v2

    .line 46
    :cond_1
    sget v0, Lcom/keymouse/tool/CursorHit;->lastX:I

    sub-int v0, p0, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    if-gt v0, v8, :cond_2

    sget v0, Lcom/keymouse/tool/CursorHit;->lastY:I

    sub-int v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    if-le v0, v8, :cond_5

    :cond_2
    move v0, v1

    .line 47
    :goto_1
    if-eqz v0, :cond_3

    .line 48
    sput p0, Lcom/keymouse/tool/CursorHit;->lastX:I

    .line 49
    sput p1, Lcom/keymouse/tool/CursorHit;->lastY:I

    .line 50
    sput-wide p2, Lcom/keymouse/tool/CursorHit;->movedAt:J

    .line 51
    sput-boolean v1, Lcom/keymouse/tool/CursorHit;->pending:Z

    .line 53
    :cond_3
    sget-boolean v3, Lcom/keymouse/tool/CursorHit;->busy:Z

    if-nez v3, :cond_4

    .line 55
    if-eqz v0, :cond_7

    .line 56
    sget-wide v4, Lcom/keymouse/tool/CursorHit;->lastStart:J

    sub-long v4, p2, v4

    const-wide/16 v6, 0x46

    cmp-long v0, v4, v6

    if-ltz v0, :cond_6

    move v0, v1

    .line 62
    :goto_2
    if-eqz v0, :cond_4

    .line 63
    sput-boolean v2, Lcom/keymouse/tool/CursorHit;->pending:Z

    .line 64
    sput-wide p2, Lcom/keymouse/tool/CursorHit;->lastStart:J

    .line 65
    invoke-static {p0, p1}, Lcom/keymouse/tool/CursorHit;->startQuery(II)V

    .line 68
    :cond_4
    sget-object v0, Lcom/keymouse/tool/CursorHit;->res:[I

    .line 69
    aget v3, v0, v2

    if-eqz v3, :cond_0

    aget v1, v0, v1

    if-lt p0, v1, :cond_0

    const/4 v1, 0x3

    aget v1, v0, v1

    if-ge p0, v1, :cond_0

    aget v1, v0, v8

    if-lt p1, v1, :cond_0

    const/4 v1, 0x4

    aget v1, v0, v1

    if-ge p1, v1, :cond_0

    .line 70
    aget v2, v0, v2

    goto :goto_0

    :cond_5
    move v0, v2

    .line 46
    goto :goto_1

    :cond_6
    move v0, v2

    .line 56
    goto :goto_2

    .line 57
    :cond_7
    sget-boolean v0, Lcom/keymouse/tool/CursorHit;->pending:Z

    if-eqz v0, :cond_9

    .line 58
    sget-wide v4, Lcom/keymouse/tool/CursorHit;->movedAt:J

    sub-long v4, p2, v4

    const-wide/16 v6, 0x5a

    cmp-long v0, v4, v6

    if-ltz v0, :cond_8

    move v0, v1

    goto :goto_2

    :cond_8
    move v0, v2

    goto :goto_2

    .line 60
    :cond_9
    sget-wide v4, Lcom/keymouse/tool/CursorHit;->resAt:J

    sub-long v4, p2, v4

    sget-object v0, Lcom/keymouse/tool/CursorHit;->res:[I

    aget v0, v0, v2

    if-nez v0, :cond_a

    const/16 v0, 0x4b0

    :goto_3
    int-to-long v6, v0

    cmp-long v0, v4, v6

    if-ltz v0, :cond_b

    move v0, v1

    goto :goto_2

    :cond_a
    const/16 v0, 0x1c2

    goto :goto_3

    :cond_b
    move v0, v2

    goto :goto_2
.end method

.method static reset()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/keymouse/tool/CursorHit;->res:[I

    .line 105
    return-void

    .line 104
    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private static startQuery(II)V
    .locals 2

    .prologue
    .line 76
    sget-object v0, Lcom/keymouse/tool/CursorHit;->worker:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "km-hit"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 78
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 79
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/keymouse/tool/CursorHit;->worker:Landroid/os/Handler;

    .line 81
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/keymouse/tool/CursorHit;->busy:Z

    .line 82
    sget-object v0, Lcom/keymouse/tool/CursorHit;->worker:Landroid/os/Handler;

    new-instance v1, Lcom/keymouse/tool/CursorHit$1;

    invoke-direct {v1, p0, p1}, Lcom/keymouse/tool/CursorHit$1;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 101
    return-void
.end method
