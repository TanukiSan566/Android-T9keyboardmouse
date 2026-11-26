.class public Lcom/keymouse/tool/CursorActivity;
.super Landroid/app/Activity;
.source "CursorActivity.java"


# instance fields
.field private mA11yStatus:Landroid/widget/TextView;

.field private mBox:Landroid/widget/LinearLayout;

.field private mBuilding:Z

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

.field private final mH:Landroid/os/Handler;

.field private mLibInfo:Landroid/widget/TextView;

.field private mSlots:Landroid/widget/LinearLayout;

.field private mSmartSw:Landroid/widget/Switch;

.field private mThemes:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 34
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mH:Landroid/os/Handler;

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    return-void
.end method

.method private S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    invoke-static {p0, p3, p3, p2, p1}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$000(Lcom/keymouse/tool/CursorActivity;)Z
    .locals 1

    .prologue
    .line 32
    iget-boolean v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    return v0
.end method

.method static synthetic access$100(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshAll()V

    return-void
.end method

.method static synthetic access$1100(Lcom/keymouse/tool/CursorActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mH:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshA11yStatus()V

    return-void
.end method

.method static synthetic access$200(Lcom/keymouse/tool/CursorActivity;Z)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->smartToggled(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/keymouse/tool/CursorActivity;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->doImport(Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$400(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->applyTheme(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->pickFile(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->rebuildSlots()V

    return-void
.end method

.method static synthetic access$700(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->hsOf(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->recreateSoon()V

    return-void
.end method

.method static synthetic access$900(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private applyTheme(Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 277
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/keymouse/tool/CursorCfg;->themeFromFolder(Ljava/io/File;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    .line 279
    sget-object v5, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    array-length v6, v5

    move v2, v3

    move v1, v3

    :goto_0
    if-ge v2, v6, :cond_0

    aget-object v7, v5, v2

    .line 280
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 281
    invoke-direct {p0, v7, v0}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    if-eqz v0, :cond_1

    .line 283
    add-int/lit8 v0, v1, 0x1

    .line 279
    :goto_1
    add-int/lit8 v2, v2, 0x1

    move v1, v0

    goto :goto_0

    .line 286
    :cond_0
    const-string v0, "on"

    const-string v2, "1"

    invoke-direct {p0, v0, v2}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->rebuildSlots()V

    .line 288
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 289
    iput-boolean v3, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 290
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5df2\u5957\u7528 \""

    const-string v4, "\u9069\u7528\u3057\u307e\u3057\u305f \""

    const-string v5, "Applied \""

    invoke-direct {p0, v2, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\" ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/4)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 292
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->recreateSoon()V

    .line 293
    return-void

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method private doImport(Landroid/widget/Button;)V
    .locals 3

    .prologue
    .line 403
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 404
    invoke-virtual {p1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 405
    const-string v1, "\u2026"

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 406
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/keymouse/tool/CursorActivity$12;

    invoke-direct {v2, p0, p1, v0}, Lcom/keymouse/tool/CursorActivity$12;-><init>(Lcom/keymouse/tool/CursorActivity;Landroid/widget/Button;Ljava/lang/CharSequence;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 420
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 421
    return-void
.end method

.method private dp(I)I
    .locals 2

    .prologue
    .line 48
    int-to-float v0, p1

    invoke-virtual {p0}, Lcom/keymouse/tool/CursorActivity;->getResources()Landroid/content/res/Resources;

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

.method private hint(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .prologue
    .line 82
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 83
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 84
    const/high16 v1, 0x3f400000    # 0.75f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 85
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    return-object v0
.end method

.method private hsName(I)Ljava/lang/String;
    .locals 3

    .prologue
    .line 382
    if-nez p1, :cond_0

    const-string v0, "\u5de6\u4e0a"

    const-string v1, "\u5de6\u4e0a"

    const-string v2, "top-left"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    const-string v0, "\u4e0a\u4e2d"

    const-string v1, "\u4e0a\u4e2d\u592e"

    const-string v2, "top-centre"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v0, "\u6b63\u4e2d"

    const-string v1, "\u4e2d\u592e"

    const-string v2, "centre"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private hsOf(Ljava/lang/String;)I
    .locals 3

    .prologue
    .line 378
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hs_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lcom/keymouse/tool/CursorCfg;->defHotspot(Ljava/lang/String;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private pickFile(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 386
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->listFiles(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v0

    .line 387
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 388
    const-string v0, "\u5e93\u662f\u7a7a\u7684\uff0c\u5148\u628a\u6587\u4ef6\u653e\u8fdb keymousecursor \u518d\u5bfc\u5165"

    const-string v1, "\u30e9\u30a4\u30d6\u30e9\u30ea\u304c\u7a7a\u3067\u3059\u3002\u5148\u306b keymousecursor \u306b\u7f6e\u3044\u3066\u53d6\u308a\u8fbc\u3093\u3067\u304f\u3060\u3055\u3044"

    const-string v2, "Library is empty: put files in keymousecursor and import first"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 389
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 400
    :goto_0
    return-void

    .line 392
    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 393
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->slotName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/keymouse/tool/CursorActivity$11;

    invoke-direct {v2, p0, p1, v0}, Lcom/keymouse/tool/CursorActivity$11;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 399
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 52
    if-nez p2, :cond_0

    .line 53
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    :goto_0
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-static {p0, v0}, Lcom/keymouse/tool/CursorCfg;->save(Landroid/content/Context;Ljava/util/Map;)V

    .line 58
    return-void

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private rebuildSlots()V
    .locals 14

    .prologue
    .line 304
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 305
    sget-object v2, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    array-length v3, v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_4

    aget-object v4, v2, v1

    .line 306
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 307
    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 308
    const/4 v0, 0x0

    const/16 v6, 0xa

    invoke-direct {p0, v6}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x6

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v8

    invoke-virtual {v5, v0, v6, v7, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 309
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 310
    const/high16 v6, 0x41700000    # 15.0f

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 311
    invoke-direct {p0, v4}, Lcom/keymouse/tool/CursorActivity;->slotName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 314
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 315
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 316
    const/16 v0, 0x10

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 317
    new-instance v7, Landroid/widget/ImageView;

    invoke-direct {v7, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 318
    const v0, -0x222223

    invoke-virtual {v7, v0}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 319
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v7, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 320
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v0

    const/4 v8, 0x3

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v8

    const/4 v9, 0x3

    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v9

    const/4 v10, 0x3

    invoke-direct {p0, v10}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v10

    invoke-virtual {v7, v0, v8, v9, v10}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 321
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v8, 0x30

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v8

    const/16 v9, 0x30

    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v9

    invoke-direct {v0, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 322
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 323
    const/high16 v0, 0x41500000    # 13.0f

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 324
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v0

    const/4 v9, 0x0

    const/4 v10, 0x6

    invoke-direct {p0, v10}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v10

    const/4 v11, 0x0

    invoke-virtual {v8, v0, v9, v10, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 325
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 326
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_1

    .line 327
    :cond_0
    const-string v0, "\u672a\u8bbe\u7f6e"

    const-string v7, "\u672a\u8a2d\u5b9a"

    const-string v9, "Not set"

    invoke-direct {p0, v0, v7, v9}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 328
    const v0, 0x3f19999a    # 0.6f

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 341
    :goto_1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v0, v7, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 342
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 344
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 345
    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 346
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 347
    const-string v7, "\u9009\u62e9"

    const-string v8, "\u9078\u629e"

    const-string v9, "Pick"

    invoke-direct {p0, v7, v8, v9}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 348
    new-instance v7, Lcom/keymouse/tool/CursorActivity$8;

    invoke-direct {v7, p0, v4}, Lcom/keymouse/tool/CursorActivity$8;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 353
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 354
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 355
    const-string v7, "\u6e05\u9664"

    const-string v8, "\u30af\u30ea\u30a2"

    const-string v9, "Clear"

    invoke-direct {p0, v7, v8, v9}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 356
    new-instance v7, Lcom/keymouse/tool/CursorActivity$9;

    invoke-direct {v7, p0, v4}, Lcom/keymouse/tool/CursorActivity$9;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 362
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 363
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 364
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u70ed\u70b9:"

    const-string v9, "\u30db\u30c3\u30c8\u30b9\u30dd\u30c3\u30c8:"

    const-string v10, "Hotspot: "

    invoke-direct {p0, v8, v9, v10}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-direct {p0, v4}, Lcom/keymouse/tool/CursorActivity;->hsOf(Ljava/lang/String;)I

    move-result v8

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->hsName(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 365
    new-instance v7, Lcom/keymouse/tool/CursorActivity$10;

    invoke-direct {v7, p0, v4}, Lcom/keymouse/tool/CursorActivity$10;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 371
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v8, -0x2

    const v9, 0x3fa66666    # 1.3f

    invoke-direct {v4, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 372
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 373
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 305
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_0

    .line 330
    :cond_1
    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 331
    new-instance v9, Ljava/io/File;

    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v10

    invoke-direct {v9, v10, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v4}, Lcom/keymouse/tool/CursorActivity;->hsOf(Ljava/lang/String;)I

    move-result v10

    invoke-static {v9, v10}, Lcom/keymouse/tool/CurLoader;->load(Ljava/io/File;I)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v9

    .line 332
    if-eqz v9, :cond_3

    .line 333
    iget-object v10, v9, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    const-wide/16 v12, 0x0

    invoke-virtual {v9, v12, v13}, Lcom/keymouse/tool/CurLoader$Set;->frameAt(J)I

    move-result v11

    aget-object v10, v10, v11

    .line 334
    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 335
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, "\n"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, "\u00d7"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 336
    invoke-virtual {v9}, Lcom/keymouse/tool/CurLoader$Set;->animated()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  \u52a8\u753b "

    const-string v11, "  \u30a2\u30cb\u30e1 "

    const-string v12, "  anim "

    invoke-direct {p0, v10, v11, v12}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v9, v9, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    array-length v9, v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v9, " \u6b65"

    const-string v10, " \u30b9\u30c6\u30c3\u30d7"

    const-string v11, " steps"

    invoke-direct {p0, v9, v10, v11}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 335
    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 336
    :cond_2
    const-string v0, ""

    goto :goto_2

    .line 338
    :cond_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, "\n"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, "(\u8bfb\u53d6\u5931\u8d25)"

    const-string v9, "(\u8aad\u307f\u8fbc\u307f\u5931\u6557)"

    const-string v10, "(failed to read)"

    invoke-direct {p0, v7, v9, v10}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 375
    :cond_4
    return-void
.end method

.method private rebuildThemes(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 251
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 252
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 253
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    const-string v1, "\u8fd8\u6ca1\u6709\u4e3b\u9898\u6587\u4ef6\u5939(\u5355\u4e2a\u6587\u4ef6\u8bf7\u5728\u4e0b\u9762\u5404\u72b6\u6001\u91cc\u9009)\u3002"

    const-string v2, "\u30c6\u30fc\u30de\u30d5\u30a9\u30eb\u30c0\u306f\u307e\u3060\u3042\u308a\u307e\u305b\u3093(\u5358\u4f53\u30d5\u30a1\u30a4\u30eb\u306f\u4e0b\u3067\u9078\u629e)\u3002"

    const-string v3, "No theme folders yet (pick single files below)."

    invoke-direct {p0, v1, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 274
    :cond_0
    return-void

    .line 256
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 257
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 258
    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 259
    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 260
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 261
    const/high16 v4, 0x41700000    # 15.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 262
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v7, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 264
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 265
    const-string v4, "\u5957\u7528"

    const-string v5, "\u9069\u7528"

    const-string v6, "Apply"

    invoke-direct {p0, v4, v5, v6}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 266
    new-instance v4, Lcom/keymouse/tool/CursorActivity$6;

    invoke-direct {v4, p0, v0}, Lcom/keymouse/tool/CursorActivity$6;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 272
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0
.end method

.method private recreateSoon()V
    .locals 4

    .prologue
    .line 296
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mH:Landroid/os/Handler;

    new-instance v1, Lcom/keymouse/tool/CursorActivity$7;

    invoke-direct {v1, p0}, Lcom/keymouse/tool/CursorActivity$7;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    const-wide/16 v2, 0x96

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 301
    return-void
.end method

.method private refreshA11yStatus()V
    .locals 4

    .prologue
    .line 444
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 454
    :goto_0
    return-void

    .line 447
    :cond_0
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->a11yListed(Landroid/content/Context;)Z

    move-result v0

    .line 448
    invoke-static {}, Lcom/keymouse/tool/CursorHit;->available()Z

    move-result v1

    .line 449
    if-eqz v1, :cond_1

    const-string v0, "\u65e0\u969c\u788d\u670d\u52a1: \u5df2\u8fde\u63a5\uff0c\u6b63\u5728\u5de5\u4f5c"

    const-string v2, "\u30b5\u30fc\u30d3\u30b9: \u63a5\u7d9a\u6e08\u307f"

    const-string v3, "Service: connected"

    invoke-direct {p0, v0, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 452
    :goto_1
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 453
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    if-eqz v1, :cond_3

    const v0, -0xe475c6

    :goto_2
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 450
    :cond_1
    if-eqz v0, :cond_2

    const-string v0, "\u65e0\u969c\u788d\u670d\u52a1: \u5df2\u542f\u7528\uff0c\u7b49\u5f85\u8fde\u63a5\u2026(\u82e5\u4e00\u76f4\u4e0d\u8fde\u63a5\uff0c\u5173\u518d\u5f00\u4e00\u6b21\u4e0a\u9762\u7684\u5f00\u5173)"

    const-string v2, "\u30b5\u30fc\u30d3\u30b9: \u6709\u52b9\u3001\u63a5\u7d9a\u5f85\u3061\u2026"

    const-string v3, "Service: enabled, waiting to connect\u2026"

    invoke-direct {p0, v0, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 451
    :cond_2
    const-string v0, "\u65e0\u969c\u788d\u670d\u52a1: \u672a\u5f00\u542f(\u6253\u5f00\u4e0a\u9762\u7684\u5f00\u5173\u5373\u53ef\uff0c\u9700\u8981 root)"

    const-string v2, "\u30b5\u30fc\u30d3\u30b9: \u7121\u52b9(\u4e0a\u306e\u30b9\u30a4\u30c3\u30c1\u3067\u6709\u52b9\u5316\u3001root \u5fc5\u8981)"

    const-string v3, "Service: off (turn the switch on; needs root)"

    invoke-direct {p0, v0, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 453
    :cond_3
    const v0, -0x619600

    goto :goto_2
.end method

.method private refreshAll()V
    .locals 7

    .prologue
    .line 240
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 241
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->listFiles(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v1

    .line 242
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->listThemes(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v0

    .line 243
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity;->mLibInfo:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u5e93\u91cc\u73b0\u6709 "

    const-string v5, "\u30e9\u30a4\u30d6\u30e9\u30ea: "

    const-string v6, "Library: "

    invoke-direct {p0, v4, v5, v6}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " \u4e2a\u6307\u9488\u6587\u4ef6\uff0c"

    const-string v4, " \u500b\u306e\u30d5\u30a1\u30a4\u30eb\u3001"

    const-string v5, " files, "

    .line 244
    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " \u5957\u4e3b\u9898\u6587\u4ef6\u5939"

    const-string v4, " \u500b\u306e\u30c6\u30fc\u30de\u30d5\u30a9\u30eb\u30c0"

    const-string v5, " theme folders"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 243
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 245
    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->rebuildThemes(Ljava/util/ArrayList;)V

    .line 246
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->rebuildSlots()V

    .line 247
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshA11yStatus()V

    .line 248
    return-void
.end method

.method private slotName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 61
    const-string v0, "arrow"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    const-string v0, "\u5e38\u89c4 \u00b7 \u7bad\u5934"

    const-string v1, "\u901a\u5e38\u30fb\u77e2\u5370"

    const-string v2, "Normal \u00b7 arrow"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 70
    :goto_0
    return-object v0

    .line 64
    :cond_0
    const-string v0, "hand"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    const-string v0, "\u94fe\u63a5 \u00b7 \u624b\u6307"

    const-string v1, "\u30ea\u30f3\u30af\u30fb\u6307"

    const-string v2, "Link \u00b7 hand"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 67
    :cond_1
    const-string v0, "ibeam"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 68
    const-string v0, "\u6587\u5b57 \u00b7 I \u578b"

    const-string v1, "\u30c6\u30ad\u30b9\u30c8\u30fbI\u30d3\u30fc\u30e0"

    const-string v2, "Text \u00b7 I-beam"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 70
    :cond_2
    const-string v0, "\u6293\u53d6 \u00b7 \u957f\u6309\u56fe\u6807/\u62d6\u52a8"

    const-string v1, "\u3064\u304b\u3080\u30fb\u9577\u62bc\u3057/\u30c9\u30e9\u30c3\u30b0"

    const-string v2, "Grab \u00b7 long-press / drag"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private smartToggled(Z)V
    .locals 2

    .prologue
    .line 424
    const-string v1, "smart"

    if-eqz p1, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    const-string v1, "\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 426
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/keymouse/tool/CursorActivity$13;

    invoke-direct {v1, p0, p1}, Lcom/keymouse/tool/CursorActivity$13;-><init>(Lcom/keymouse/tool/CursorActivity;Z)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 440
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 441
    return-void

    .line 424
    :cond_0
    const-string v0, "0"

    goto :goto_0
.end method

.method private title(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 74
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 75
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 76
    const/16 v1, 0x16

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v1

    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 77
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11

    .prologue
    const/high16 v10, 0x41500000    # 13.0f

    const/16 v9, 0x14

    const/high16 v8, 0x41800000    # 16.0f

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 91
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 92
    const-string v0, "\u81ea\u5b9a\u4e49\u9f20\u6807"

    const-string v3, "\u30ab\u30b9\u30bf\u30e0\u30de\u30a6\u30b9\u30dd\u30a4\u30f3\u30bf"

    const-string v4, "Custom mouse pointer"

    invoke-direct {p0, v0, v3, v4}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/keymouse/tool/CursorActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 93
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    .line 94
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v0

    .line 95
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    .line 96
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 97
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 100
    new-instance v3, Landroid/widget/Switch;

    invoke-direct {v3, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 101
    invoke-virtual {v3, v8}, Landroid/widget/Switch;->setTextSize(F)V

    .line 102
    const-string v0, "\u542f\u7528\u81ea\u5b9a\u4e49\u9f20\u6807"

    const-string v4, "\u30ab\u30b9\u30bf\u30e0\u30dd\u30a4\u30f3\u30bf\u3092\u4f7f\u3046"

    const-string v5, "Use custom pointer"

    invoke-direct {p0, v0, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 103
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    const-string v4, "on"

    invoke-static {v0, v4, v2}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 104
    new-instance v0, Lcom/keymouse/tool/CursorActivity$1;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/CursorActivity$1;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-virtual {v3, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 111
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 112
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u5173\u95ed = \u7528\u5185\u7f6e\u7684\u9ec4\u7ea2\u7bad\u5934\u3002\u81ea\u5b9a\u4e49\u9f20\u6807\u753b\u5728\"\u81ea\u7ed8\u5149\u6807\"\u4e0a\uff0c\u6240\u4ee5\u4e3b\u754c\u9762\"\u9f20\u6807\u8f6f\u5f00\u5173\"\u91cc\u7684\"\u81ea\u7ed8\u5149\u6807\"\u8981\u4fdd\u6301\u5f00\u542f\u3002"

    const-string v4, "\u30aa\u30d5 = \u5185\u8535\u306e\u9ec4\u8d64\u306e\u77e2\u5370\u3002\u30e1\u30a4\u30f3\u753b\u9762\u306e\u300c\u81ea\u524d\u30ab\u30fc\u30bd\u30eb\u300d\u304c\u30aa\u30f3\u3067\u3042\u308b\u5fc5\u8981\u304c\u3042\u308a\u307e\u3059\u3002"

    const-string v5, "Off = built-in yellow/red arrow. Needs the \"self-drawn cursor\" switch on the main screen."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 117
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 118
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 119
    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v3, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 120
    const/16 v3, 0x10

    const/16 v4, 0x48

    iget-object v5, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    const-string v6, "size"

    const/16 v7, 0x20

    invoke-static {v5, v6, v7}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 121
    const-string v4, "\u6307\u9488\u5927\u5c0f"

    const-string v5, "\u30dd\u30a4\u30f3\u30bf\u306e\u5927\u304d\u3055"

    const-string v6, "Pointer size"

    invoke-direct {p0, v4, v5, v6}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 122
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " dp"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    iget-object v5, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 124
    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 125
    const/16 v6, 0x38

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setMax(I)V

    .line 126
    add-int/lit8 v3, v3, -0x10

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 127
    new-instance v3, Lcom/keymouse/tool/CursorActivity$2;

    invoke-direct {v3, p0, v0, v4}, Lcom/keymouse/tool/CursorActivity$2;-><init>(Lcom/keymouse/tool/CursorActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 141
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 144
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    .line 145
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    invoke-virtual {v0, v8}, Landroid/widget/Switch;->setTextSize(F)V

    .line 146
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v3, v2, v2}, Landroid/widget/Switch;->setPadding(IIII)V

    .line 147
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    const-string v3, "\u667a\u80fd\u624b\u578b / \u6587\u5b57\u5149\u6807"

    const-string v4, "\u30b9\u30de\u30fc\u30c8\u624b\u578b / \u30c6\u30ad\u30b9\u30c8\u30ab\u30fc\u30bd\u30eb"

    const-string v5, "Smart hand / text cursor"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 148
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    const-string v4, "smart"

    invoke-static {v0, v4, v1}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->a11yListed(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {v3, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 149
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    new-instance v3, Lcom/keymouse/tool/CursorActivity$3;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/CursorActivity$3;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 156
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 157
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u9f20\u6807\u505c\u5728\u53ef\u70b9\u51fb\u63a7\u4ef6\u4e0a\u663e\u793a\"\u94fe\u63a5\u624b\u6307\"\uff0c\u505c\u5728\u8f93\u5165\u6846/\u53ef\u9009\u6587\u5b57\u4e0a\u663e\u793a\"\u6587\u5b57 I \u578b\"\u3002\u9760\u65e0\u969c\u788d\u670d\u52a1\u67e5\u754c\u9762\uff0c\u7531 root \u81ea\u52a8\u5f00\u542f\uff0c\u4e0d\u7528\u4f60\u53bb\u8bbe\u7f6e\u91cc\u70b9\uff1b\u6307\u9488\u505c\u4e0b\u7ea6 0.1~0.3 \u79d2\u540e\u624d\u4f1a\u53d8\u3002\u670d\u52a1\u53ea\u67e5\u4f4d\u7f6e\u4e0b\u7684\u63a7\u4ef6\u7c7b\u578b\uff0c\u4e0d\u8bfb\u5185\u5bb9\u3002"

    const-string v4, "\u30af\u30ea\u30c3\u30af\u53ef\u80fd\u306a\u90e8\u54c1\u306e\u4e0a\u3067\u306f\u300c\u30ea\u30f3\u30af\u300d\u3001\u5165\u529b\u6b04/\u9078\u629e\u53ef\u80fd\u30c6\u30ad\u30b9\u30c8\u306e\u4e0a\u3067\u306f\u300cI\u30d3\u30fc\u30e0\u300d\u3002\u30a2\u30af\u30bb\u30b7\u30d3\u30ea\u30c6\u30a3\u30b5\u30fc\u30d3\u30b9\u3067\u8abf\u3079\u3001root \u304c\u81ea\u52d5\u3067\u6709\u52b9\u5316\u3057\u307e\u3059\u3002\u30dd\u30a4\u30f3\u30bf\u304c\u6b62\u307e\u3063\u3066\u304b\u3089\u7d040.1\u301c0.3\u79d2\u5f8c\u306b\u5207\u308a\u66ff\u308f\u308a\u307e\u3059\u3002"

    const-string v5, "Shows the link hand over clickable controls and the I-beam over text fields. Uses an accessibility service that root enables automatically; the pointer changes ~0.1-0.3 s after it stops. It only checks the control type under the pointer, never reads content."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 160
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    .line 161
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 162
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v3, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 163
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 166
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 167
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 168
    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v3, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 169
    const/16 v3, 0xc8

    const/16 v4, 0x5dc

    iget-object v5, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    const-string v6, "grabms"

    const/16 v7, 0x1c2

    invoke-static {v5, v6, v7}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 170
    const-string v4, "\u957f\u6309\u591a\u4e45\u53d8\"\u6293\u53d6\""

    const-string v5, "\u4f55\u30df\u30ea\u79d2\u306e\u9577\u62bc\u3057\u3067\u300c\u3064\u304b\u3080\u300d"

    const-string v6, "Long-press time for grab"

    invoke-direct {p0, v4, v5, v6}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 171
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ms"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 172
    iget-object v5, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 173
    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 174
    const/16 v6, 0x1a

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setMax(I)V

    .line 175
    add-int/lit16 v3, v3, -0xc8

    div-int/lit8 v3, v3, 0x32

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 176
    new-instance v3, Lcom/keymouse/tool/CursorActivity$4;

    invoke-direct {v3, p0, v0, v4}, Lcom/keymouse/tool/CursorActivity$4;-><init>(Lcom/keymouse/tool/CursorActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 190
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 191
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u6309\u4f4f\u4e2d\u95f4\u952e\u8d85\u8fc7\u8fd9\u4e2a\u65f6\u95f4(\u4e14\u6307\u9488\u4e0b\u4e0d\u662f\u6587\u5b57)\uff0c\u5c31\u6362\u6210\"\u6293\u53d6\"\u6837\u5f0f\uff0c\u7528\u5728\u957f\u6309\u5e94\u7528\u56fe\u6807\u62d6\u52a8\u3002"

    const-string v4, "\u6c7a\u5b9a\u30ad\u30fc\u3092\u3053\u306e\u6642\u9593\u3088\u308a\u9577\u304f\u62bc\u3057\u7d9a\u3051\u308b\u3068(\u30c6\u30ad\u30b9\u30c8\u4e0a\u4ee5\u5916)\u300c\u3064\u304b\u3080\u300d\u306b\u5207\u308a\u66ff\u308f\u308a\u307e\u3059\u3002"

    const-string v5, "Holding the centre key longer than this (not over text) switches to the grab pointer."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 196
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u6307\u9488\u5e93"

    const-string v4, "\u30dd\u30a4\u30f3\u30bf\u30e9\u30a4\u30d6\u30e9\u30ea"

    const-string v5, "Pointer library"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 197
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u628a .cur / .ani / .png \u6587\u4ef6\uff0c\u6216\u6574\u5957 Windows \u9f20\u6807\u4e3b\u9898\u6587\u4ef6\u5939(\u542b .inf \u66f4\u597d)\uff0c\u653e\u5230\u624b\u673a\u5b58\u50a8\u6839\u76ee\u5f55\u7684 keymousecursor \u6587\u4ef6\u5939\u91cc\uff0c\u518d\u70b9\u4e0b\u9762\u7684\u6309\u94ae\u5bfc\u5165\u3002"

    const-string v4, ".cur / .ani / .png\u3001\u307e\u305f\u306f Windows \u306e\u30de\u30a6\u30b9\u30c6\u30fc\u30de\u30d5\u30a9\u30eb\u30c0(.inf \u4ed8\u304d\u63a8\u5968)\u3092\u3001\u30b9\u30c8\u30ec\u30fc\u30b8\u76f4\u4e0b\u306e keymousecursor \u30d5\u30a9\u30eb\u30c0\u306b\u7f6e\u3044\u3066\u3001\u4e0b\u306e\u30dc\u30bf\u30f3\u3067\u53d6\u308a\u8fbc\u307f\u307e\u3059\u3002"

    const-string v5, "Put .cur / .ani / .png files or a whole Windows cursor-theme folder (with its .inf) into the keymousecursor folder in internal storage, then tap import."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 200
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 201
    const-string v3, "\u4ece keymousecursor \u5bfc\u5165(root)"

    const-string v4, "keymousecursor \u304b\u3089\u53d6\u308a\u8fbc\u307f(root)"

    const-string v5, "Import from keymousecursor (root)"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 202
    new-instance v3, Lcom/keymouse/tool/CursorActivity$5;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/CursorActivity$5;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 208
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mLibInfo:Landroid/widget/TextView;

    .line 209
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mLibInfo:Landroid/widget/TextView;

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 210
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mLibInfo:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 212
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u5957\u7528\u6574\u5957\u4e3b\u9898"

    const-string v4, "\u30c6\u30fc\u30de\u3092\u4e38\u3054\u3068\u9069\u7528"

    const-string v5, "Apply a whole theme"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 213
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    .line 214
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 215
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 217
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u5404\u72b6\u6001\u7684\u6307\u9488"

    const-string v4, "\u72b6\u614b\u3054\u3068\u306e\u30dd\u30a4\u30f3\u30bf"

    const-string v5, "Pointer for each state"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 218
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    .line 219
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 220
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 221
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u6ca1\u8bbe\u7684\u72b6\u6001\u6cbf\u7528\"\u5e38\u89c4\"\u90a3\u4e2a\uff1b\"\u5e38\u89c4\"\u4e5f\u6ca1\u8bbe\u5c31\u7528\u5185\u7f6e\u7bad\u5934\u3002.cur \u81ea\u5e26\u70ed\u70b9\uff1bpng \u6ca1\u6709\u70ed\u70b9\uff0c\u7528\u53f3\u8fb9\u6309\u94ae\u9009\u70ed\u70b9\u4f4d\u7f6e(\u5de6\u4e0a/\u4e0a\u8fb9\u4e2d\u95f4/\u6b63\u4e2d)\u3002.ani \u4f1a\u6309\u6587\u4ef6\u91cc\u7684\u5e27\u548c\u901f\u5ea6\u64ad\u653e\u3002"

    const-string v4, "\u672a\u8a2d\u5b9a\u306e\u72b6\u614b\u306f\u300c\u901a\u5e38\u300d\u3092\u4f7f\u3044\u3001\u305d\u308c\u3082\u672a\u8a2d\u5b9a\u306a\u3089\u5185\u8535\u306e\u77e2\u5370\u3002.cur \u306f\u30db\u30c3\u30c8\u30b9\u30dd\u30c3\u30c8\u5185\u8535\u3001png \u306f\u53f3\u306e\u30dc\u30bf\u30f3\u3067\u4f4d\u7f6e(\u5de6\u4e0a/\u4e0a\u4e2d\u592e/\u4e2d\u592e)\u3092\u9078\u3073\u307e\u3059\u3002.ani \u306f\u30d5\u30ec\u30fc\u30e0\u3068\u901f\u5ea6\u3069\u304a\u308a\u306b\u518d\u751f\u3057\u307e\u3059\u3002"

    const-string v5, "Unset states fall back to Normal, then to the built-in arrow. .cur carries its hotspot; for png pick one with the button (top-left / top-centre / centre). .ani plays with its own frames and rates."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 225
    iput-boolean v2, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 226
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshAll()V

    .line 227
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 228
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 229
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 230
    invoke-virtual {p0, v0}, Lcom/keymouse/tool/CursorActivity;->setContentView(Landroid/view/View;)V

    .line 231
    return-void

    :cond_0
    move v0, v2

    .line 103
    goto/16 :goto_0

    :cond_1
    move v0, v2

    .line 148
    goto/16 :goto_1
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 235
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 236
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshA11yStatus()V

    .line 237
    return-void
.end method
