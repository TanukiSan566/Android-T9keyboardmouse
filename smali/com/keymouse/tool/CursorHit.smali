.class final Lcom/keymouse/tool/CursorHit;
.super Ljava/lang/Object;
.source "CursorHit.java"


# static fields
.field static final ARROW:I = 0x0

.field static final HAND:I = 0x1

.field static final IBEAM:I = 0x2

.field private static volatile busy:Z

.field private static lastX:I

.field private static lastY:I

.field private static movedAt:J

.field private static pending:Z

.field private static volatile resAt:J

.field private static volatile resType:I

.field private static volatile resX:I

.field private static volatile resY:I

.field static volatile svc:Lcom/keymouse/tool/CursorA11yService;

.field private static worker:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    const v0, -0x1869f

    .line 18
    sput v0, Lcom/keymouse/tool/CursorHit;->lastX:I

    .line 19
    sput v0, Lcom/keymouse/tool/CursorHit;->lastY:I

    .line 20
    sput-wide v2, Lcom/keymouse/tool/CursorHit;->movedAt:J

    .line 21
    sput-boolean v1, Lcom/keymouse/tool/CursorHit;->pending:Z

    .line 22
    sput-boolean v1, Lcom/keymouse/tool/CursorHit;->busy:Z

    .line 23
    sput v1, Lcom/keymouse/tool/CursorHit;->resType:I

    .line 24
    sput v0, Lcom/keymouse/tool/CursorHit;->resX:I

    .line 25
    sput v0, Lcom/keymouse/tool/CursorHit;->resY:I

    .line 26
    sput-wide v2, Lcom/keymouse/tool/CursorHit;->resAt:J

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method static synthetic access$002(I)I
    .locals 0

    .prologue
    .line 11
    sput p0, Lcom/keymouse/tool/CursorHit;->resType:I

    return p0
.end method

.method static synthetic access$102(I)I
    .locals 0

    .prologue
    .line 11
    sput p0, Lcom/keymouse/tool/CursorHit;->resX:I

    return p0
.end method

.method static synthetic access$202(I)I
    .locals 0

    .prologue
    .line 11
    sput p0, Lcom/keymouse/tool/CursorHit;->resY:I

    return p0
.end method

.method static synthetic access$302(J)J
    .locals 0

    .prologue
    .line 11
    sput-wide p0, Lcom/keymouse/tool/CursorHit;->resAt:J

    return-wide p0
.end method

.method static synthetic access$402(Z)Z
    .locals 0

    .prologue
    .line 11
    sput-boolean p0, Lcom/keymouse/tool/CursorHit;->busy:Z

    return p0
.end method

.method static available()Z
    .locals 1

    .prologue
    .line 33
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
    .locals 8

    .prologue
    const/16 v6, 0x1c

    const/4 v2, 0x3

    const/4 v0, 0x0

    .line 38
    sget-object v1, Lcom/keymouse/tool/CursorHit;->svc:Lcom/keymouse/tool/CursorA11yService;

    if-nez v1, :cond_1

    .line 53
    :cond_0
    :goto_0
    return v0

    .line 41
    :cond_1
    sget v1, Lcom/keymouse/tool/CursorHit;->lastX:I

    sub-int v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-gt v1, v2, :cond_2

    sget v1, Lcom/keymouse/tool/CursorHit;->lastY:I

    sub-int v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-le v1, v2, :cond_4

    .line 42
    :cond_2
    sput p0, Lcom/keymouse/tool/CursorHit;->lastX:I

    .line 43
    sput p1, Lcom/keymouse/tool/CursorHit;->lastY:I

    .line 44
    sput-wide p2, Lcom/keymouse/tool/CursorHit;->movedAt:J

    .line 45
    const/4 v1, 0x1

    sput-boolean v1, Lcom/keymouse/tool/CursorHit;->pending:Z

    .line 50
    :cond_3
    :goto_1
    sget v1, Lcom/keymouse/tool/CursorHit;->resX:I

    sub-int v1, p0, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-gt v1, v6, :cond_0

    sget v1, Lcom/keymouse/tool/CursorHit;->resY:I

    sub-int v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-gt v1, v6, :cond_0

    .line 51
    sget v0, Lcom/keymouse/tool/CursorHit;->resType:I

    goto :goto_0

    .line 46
    :cond_4
    sget-boolean v1, Lcom/keymouse/tool/CursorHit;->busy:Z

    if-nez v1, :cond_3

    sget-boolean v1, Lcom/keymouse/tool/CursorHit;->pending:Z

    if-eqz v1, :cond_5

    sget-wide v2, Lcom/keymouse/tool/CursorHit;->movedAt:J

    sub-long v2, p2, v2

    const-wide/16 v4, 0x6e

    cmp-long v1, v2, v4

    if-ltz v1, :cond_3

    .line 47
    :goto_2
    sput-boolean v0, Lcom/keymouse/tool/CursorHit;->pending:Z

    .line 48
    invoke-static {p0, p1}, Lcom/keymouse/tool/CursorHit;->startQuery(II)V

    goto :goto_1

    .line 46
    :cond_5
    sget-wide v2, Lcom/keymouse/tool/CursorHit;->resAt:J

    sub-long v2, p2, v2

    const-wide/16 v4, 0x5dc

    cmp-long v1, v2, v4

    if-ltz v1, :cond_3

    goto :goto_2
.end method

.method static reset()V
    .locals 2

    .prologue
    const v1, -0x1869f

    .line 84
    const/4 v0, 0x0

    sput v0, Lcom/keymouse/tool/CursorHit;->resType:I

    .line 85
    sput v1, Lcom/keymouse/tool/CursorHit;->resX:I

    .line 86
    sput v1, Lcom/keymouse/tool/CursorHit;->resY:I

    .line 87
    return-void
.end method

.method private static startQuery(II)V
    .locals 2

    .prologue
    .line 57
    sget-object v0, Lcom/keymouse/tool/CursorHit;->worker:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 58
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "km-hit"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 59
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 60
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/keymouse/tool/CursorHit;->worker:Landroid/os/Handler;

    .line 62
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/keymouse/tool/CursorHit;->busy:Z

    .line 63
    sget-object v0, Lcom/keymouse/tool/CursorHit;->worker:Landroid/os/Handler;

    new-instance v1, Lcom/keymouse/tool/CursorHit$1;

    invoke-direct {v1, p0, p1}, Lcom/keymouse/tool/CursorHit$1;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 81
    return-void
.end method
