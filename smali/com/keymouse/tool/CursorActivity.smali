.class public Lcom/keymouse/tool/CursorActivity;
.super Landroid/app/Activity;
.source "CursorActivity.java"


# instance fields
.field private mA11yStatus:Landroid/widget/TextView;

.field private mBox:Landroid/widget/LinearLayout;

.field private mBuilding:Z

.field private mBuiltin:Landroid/widget/LinearLayout;

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

.field private mOnSw:Landroid/widget/Switch;

.field private mSelName:Landroid/widget/TextView;

.field private mSelThumbs:[Landroid/widget/ImageView;

.field private mSlots:Landroid/widget/LinearLayout;

.field private mSmartSw:Landroid/widget/Switch;

.field private mThemeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mThemes:Landroid/widget/LinearLayout;

.field private final mThumbCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 35
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mH:Landroid/os/Handler;

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 334
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThumbCache:Ljava/util/HashMap;

    .line 335
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemeList:Ljava/util/ArrayList;

    return-void
.end method

.method private S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    invoke-static {p0, p3, p3, p2, p1}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$000(Lcom/keymouse/tool/CursorActivity;)Z
    .locals 1

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    return v0
.end method

.method static synthetic access$100(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)[Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->thumbsOf(Ljava/lang/String;)[Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Lcom/keymouse/tool/CursorActivity;[Landroid/graphics/Bitmap;I)Landroid/widget/LinearLayout;
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/keymouse/tool/CursorActivity;->thumbRow([Landroid/graphics/Bitmap;I)Landroid/widget/LinearLayout;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Lcom/keymouse/tool/CursorActivity;[Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->applyBuiltin([Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->pickFile(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->rebuildSlots()V

    return-void
.end method

.method static synthetic access$1500(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshThemeRows()V

    return-void
.end method

.method static synthetic access$1600(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->hsOf(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1700(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->recreateSoon()V

    return-void
.end method

.method static synthetic access$1800(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshAll()V

    return-void
.end method

.method static synthetic access$1900(Lcom/keymouse/tool/CursorActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mH:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/keymouse/tool/CursorActivity;Z)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->smartToggled(Z)V

    return-void
.end method

.method static synthetic access$2000(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshA11yStatus()V

    return-void
.end method

.method static synthetic access$302(Lcom/keymouse/tool/CursorActivity;Ljava/util/Map;)Ljava/util/Map;
    .locals 0

    .prologue
    .line 33
    iput-object p1, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    return-object p1
.end method

.method static synthetic access$400(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->afterThemeChanged()V

    return-void
.end method

.method static synthetic access$600(Lcom/keymouse/tool/CursorActivity;Landroid/widget/Button;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->doImport(Landroid/widget/Button;)V

    return-void
.end method

.method static synthetic access$700(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->applyTheme(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/keymouse/tool/CursorActivity;)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->showThemeDialog()V

    return-void
.end method

.method static synthetic access$900(Lcom/keymouse/tool/CursorActivity;I)I
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v0

    return v0
.end method

.method private afterThemeChanged()V
    .locals 5

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 554
    iput-boolean v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 555
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity;->mOnSw:Landroid/widget/Switch;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    const-string v4, "on"

    invoke-static {v3, v4, v0}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_0

    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 556
    iput-boolean v1, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 557
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshThemeRows()V

    .line 558
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->rebuildSlots()V

    .line 559
    return-void

    :cond_0
    move v0, v1

    .line 555
    goto :goto_0
.end method

.method private applyBuiltin([Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 543
    aget-object v0, p1, v4

    invoke-static {p0, v0}, Lcom/keymouse/tool/CursorCfg;->applyBuiltin(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 544
    const-string v0, "\u5957\u7528\u5931\u8d25(\u4e3b\u9898\u6587\u4ef6\u590d\u5236\u51fa\u9519)"

    const-string v1, "\u9069\u7528\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    const-string v2, "Failed to apply (copy error)"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 550
    :goto_0
    return-void

    .line 547
    :cond_0
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    .line 548
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5df2\u5957\u7528 \""

    const-string v2, "\u9069\u7528\u3057\u307e\u3057\u305f \""

    const-string v3, "Applied \""

    invoke-direct {p0, v1, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0, p1}, Lcom/keymouse/tool/CursorCfg;->themeName(Landroid/content/Context;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 549
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->afterThemeChanged()V

    goto :goto_0
.end method

.method private applyTheme(Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 302
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/keymouse/tool/CursorCfg;->themeFromFolder(Ljava/io/File;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    .line 303
    const-string v0, "theme"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    sget-object v5, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    array-length v6, v5

    move v2, v3

    move v1, v3

    :goto_0
    if-ge v2, v6, :cond_0

    aget-object v7, v5, v2

    .line 306
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 307
    invoke-direct {p0, v7, v0}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    if-eqz v0, :cond_1

    .line 309
    add-int/lit8 v0, v1, 0x1

    .line 305
    :goto_1
    add-int/lit8 v2, v2, 0x1

    move v1, v0

    goto :goto_0

    .line 312
    :cond_0
    const-string v0, "on"

    const-string v2, "1"

    invoke-direct {p0, v0, v2}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->rebuildSlots()V

    .line 314
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 315
    iput-boolean v3, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 316
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

    .line 318
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->recreateSoon()V

    .line 319
    return-void

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method private doImport(Landroid/widget/Button;)V
    .locals 3

    .prologue
    .line 674
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 675
    invoke-virtual {p1}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 676
    const-string v1, "\u2026"

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 677
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/keymouse/tool/CursorActivity$17;

    invoke-direct {v2, p0, p1, v0}, Lcom/keymouse/tool/CursorActivity$17;-><init>(Lcom/keymouse/tool/CursorActivity;Landroid/widget/Button;Ljava/lang/CharSequence;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 691
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 692
    return-void
.end method

.method private dp(I)I
    .locals 2

    .prologue
    .line 51
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

.method private groupOf(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 324
    const-string v0, "stmc-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 325
    const-string v0, "STMC \u00b7 Sam Toki (\u539f\u795e / \u5b64\u72ec\u6447\u6eda / \u6c89\u9ed8\u7684\u9b54\u5973 \u2026)"

    const-string v1, "STMC \u00b7 Sam Toki (\u539f\u795e / \u307c\u3063\u3061\u30fb\u3056\u30fb\u308d\u3063\u304f! / \u30b5\u30a4\u30ec\u30f3\u30c8\u30fb\u30a6\u30a3\u30c3\u30c1 \u2026)"

    const-string v2, "STMC \u00b7 Sam Toki (Genshin / Bocchi the Rock / Silent Witch \u2026)"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 330
    :goto_0
    return-object v0

    .line 327
    :cond_0
    const-string v0, "bibata-"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 328
    const-string v0, "Bibata (\u5706\u89d2 / \u5c16\u89d2 \u00d7 \u7425\u73c0 / \u9ed1 / \u767d)"

    const-string v1, "Bibata (\u4e38/\u5c16 \u00d7 \u30a2\u30f3\u30d0\u30fc/\u9ed2/\u767d)"

    const-string v2, "Bibata (rounded / sharp \u00d7 amber / black / white)"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 330
    :cond_1
    const-string v0, "macOS \u98ce\u683c (Capitaine)"

    const-string v1, "macOS\u98a8 (Capitaine)"

    const-string v2, "macOS style (Capitaine)"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private hint(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .prologue
    .line 85
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 86
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 87
    const/high16 v1, 0x3f400000    # 0.75f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 88
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    return-object v0
.end method

.method private hsName(I)Ljava/lang/String;
    .locals 3

    .prologue
    .line 652
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
    .line 648
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
    .line 656
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->listFiles(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v0

    .line 657
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 658
    const-string v0, "\u5e93\u662f\u7a7a\u7684\uff0c\u5148\u628a\u6587\u4ef6\u653e\u8fdb keymousecursor \u518d\u5bfc\u5165"

    const-string v1, "\u30e9\u30a4\u30d6\u30e9\u30ea\u304c\u7a7a\u3067\u3059\u3002\u5148\u306b keymousecursor \u306b\u7f6e\u3044\u3066\u53d6\u308a\u8fbc\u3093\u3067\u304f\u3060\u3055\u3044"

    const-string v2, "Library is empty: put files in keymousecursor and import first"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 659
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 671
    :goto_0
    return-void

    .line 662
    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 663
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/keymouse/tool/CursorActivity;->slotName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/keymouse/tool/CursorActivity$16;

    invoke-direct {v2, p0, p1, v0}, Lcom/keymouse/tool/CursorActivity$16;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 670
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private put(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 55
    if-nez p2, :cond_0

    .line 56
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    :goto_0
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-static {p0, v0}, Lcom/keymouse/tool/CursorCfg;->save(Landroid/content/Context;Ljava/util/Map;)V

    .line 61
    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private rebuildBuiltin()V
    .locals 10

    .prologue
    const/4 v7, 0x6

    const/4 v6, 0x1

    const/4 v9, 0x4

    const/4 v8, 0x2

    const/4 v0, 0x0

    .line 378
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity;->mBuiltin:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 379
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->builtinThemes(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/keymouse/tool/CursorActivity;->mThemeList:Ljava/util/ArrayList;

    .line 380
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity;->mThemeList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 381
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuiltin:Landroid/widget/LinearLayout;

    const-string v1, "(\u6ca1\u6709\u627e\u5230\u5185\u7f6e\u4e3b\u9898)"

    const-string v2, "(\u5185\u8535\u30c6\u30fc\u30de\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093)"

    const-string v3, "(no built-in themes found)"

    invoke-direct {p0, v1, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 431
    :goto_0
    return-void

    .line 384
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 385
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 386
    const/16 v2, 0xa

    invoke-direct {p0, v2}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x8

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    const/16 v4, 0xa

    invoke-direct {p0, v4}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v4

    const/16 v5, 0x8

    invoke-direct {p0, v5}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 387
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 388
    invoke-direct {p0, v7}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 389
    const v3, 0x14808080

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 390
    invoke-direct {p0, v6}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    const v4, -0x757067

    invoke-virtual {v2, v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 391
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 392
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 393
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 394
    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 395
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSelName:Landroid/widget/TextView;

    .line 396
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSelName:Landroid/widget/TextView;

    const/high16 v4, 0x41700000    # 15.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 397
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSelName:Landroid/widget/TextView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v0, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 398
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 399
    const-string v4, "\u25be"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 400
    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 401
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 402
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 403
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 404
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 405
    invoke-direct {p0, v7}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v2, v0, v3, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 406
    new-array v3, v9, [Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSelThumbs:[Landroid/widget/ImageView;

    .line 407
    :goto_1
    if-ge v0, v9, :cond_1

    .line 408
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 409
    const v4, -0x473f34

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 410
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 411
    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 412
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x22

    invoke-direct {p0, v5}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v5

    const/16 v6, 0x22

    invoke-direct {p0, v6}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 413
    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v5

    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 414
    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 415
    iget-object v4, p0, Lcom/keymouse/tool/CursorActivity;->mSelThumbs:[Landroid/widget/ImageView;

    aput-object v3, v4, v0

    .line 407
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 417
    :cond_1
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 418
    new-instance v0, Lcom/keymouse/tool/CursorActivity$8;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/CursorActivity$8;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 423
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuiltin:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 424
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshThemeRows()V

    .line 426
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/keymouse/tool/CursorActivity$9;

    invoke-direct {v1, p0}, Lcom/keymouse/tool/CursorActivity$9;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 430
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0
.end method

.method private rebuildSlots()V
    .locals 14

    .prologue
    .line 570
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 571
    sget-object v3, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    array-length v4, v3

    const/4 v0, 0x0

    move v2, v0

    :goto_0
    if-ge v2, v4, :cond_5

    aget-object v5, v3, v2

    .line 572
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 573
    const/4 v0, 0x1

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 574
    const/4 v0, 0x0

    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v1

    const/4 v7, 0x0

    const/4 v8, 0x6

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v8

    invoke-virtual {v6, v0, v1, v7, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 575
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 576
    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 577
    invoke-direct {p0, v5}, Lcom/keymouse/tool/CursorActivity;->slotName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 578
    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 580
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 581
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 582
    const/16 v0, 0x10

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 583
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 584
    const v0, -0x222223

    invoke-virtual {v8, v0}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 585
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 586
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v0

    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v1

    const/4 v9, 0x3

    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v9

    const/4 v10, 0x3

    invoke-direct {p0, v10}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v10

    invoke-virtual {v8, v0, v1, v9, v10}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 587
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v1, 0x30

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v1

    const/16 v9, 0x30

    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v9

    invoke-direct {v0, v1, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 588
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 589
    const/high16 v0, 0x41500000    # 13.0f

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 590
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v0

    const/4 v1, 0x0

    const/4 v10, 0x6

    invoke-direct {p0, v10}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v10

    const/4 v11, 0x0

    invoke-virtual {v9, v0, v1, v10, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 591
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 592
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 593
    :cond_0
    const-string v0, "\u672a\u8bbe\u7f6e"

    const-string v1, "\u672a\u8a2d\u5b9a"

    const-string v8, "Not set"

    invoke-direct {p0, v0, v1, v8}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 594
    const v0, 0x3f19999a    # 0.6f

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 609
    :goto_1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, 0x0

    const/4 v8, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 610
    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 612
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 613
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 614
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 615
    const-string v7, "\u9009\u62e9"

    const-string v8, "\u9078\u629e"

    const-string v9, "Pick"

    invoke-direct {p0, v7, v8, v9}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 616
    new-instance v7, Lcom/keymouse/tool/CursorActivity$13;

    invoke-direct {v7, p0, v5}, Lcom/keymouse/tool/CursorActivity$13;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 621
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 622
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 623
    const-string v7, "\u6e05\u9664"

    const-string v8, "\u30af\u30ea\u30a2"

    const-string v9, "Clear"

    invoke-direct {p0, v7, v8, v9}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 624
    new-instance v7, Lcom/keymouse/tool/CursorActivity$14;

    invoke-direct {v7, p0, v5}, Lcom/keymouse/tool/CursorActivity$14;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 632
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v7, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 633
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 634
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u70ed\u70b9:"

    const-string v9, "\u30db\u30c3\u30c8\u30b9\u30dd\u30c3\u30c8:"

    const-string v10, "Hotspot: "

    invoke-direct {p0, v8, v9, v10}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-direct {p0, v5}, Lcom/keymouse/tool/CursorActivity;->hsOf(Ljava/lang/String;)I

    move-result v8

    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->hsName(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 635
    new-instance v7, Lcom/keymouse/tool/CursorActivity$15;

    invoke-direct {v7, p0, v5}, Lcom/keymouse/tool/CursorActivity$15;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 641
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v8, -0x2

    const v9, 0x3fa66666    # 1.3f

    invoke-direct {v5, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 642
    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 643
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 571
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto/16 :goto_0

    .line 596
    :cond_1
    invoke-static {p0, v0}, Lcom/keymouse/tool/CursorCfg;->builtinOfPath(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 597
    if-eqz v1, :cond_2

    invoke-static {p0, v1}, Lcom/keymouse/tool/CursorCfg;->themeName(Landroid/content/Context;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 598
    :goto_2
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 599
    new-instance v10, Ljava/io/File;

    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v11

    invoke-direct {v10, v11, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v5}, Lcom/keymouse/tool/CursorActivity;->hsOf(Ljava/lang/String;)I

    move-result v0

    invoke-static {v10, v0}, Lcom/keymouse/tool/CurLoader;->load(Ljava/io/File;I)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v0

    .line 600
    if-eqz v0, :cond_4

    .line 601
    iget-object v10, v0, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    const-wide/16 v12, 0x0

    invoke-virtual {v0, v12, v13}, Lcom/keymouse/tool/CurLoader$Set;->frameAt(J)I

    move-result v11

    aget-object v10, v10, v11

    .line 602
    invoke-virtual {v8, v10}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 603
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, "\n"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, "\u00d7"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 604
    invoke-virtual {v0}, Lcom/keymouse/tool/CurLoader$Set;->animated()Z

    move-result v8

    if-eqz v8, :cond_3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  \u52a8\u753b "

    const-string v11, "  \u30a2\u30cb\u30e1 "

    const-string v12, "  anim "

    invoke-direct {p0, v10, v11, v12}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v0, v0, Lcom/keymouse/tool/CurLoader$Set;->seq:[I

    array-length v0, v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, " \u6b65"

    const-string v10, " \u30b9\u30c6\u30c3\u30d7"

    const-string v11, " steps"

    invoke-direct {p0, v8, v10, v11}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 603
    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    :cond_2
    move-object v1, v0

    .line 597
    goto/16 :goto_2

    .line 604
    :cond_3
    const-string v0, ""

    goto :goto_3

    .line 606
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(\u8bfb\u53d6\u5931\u8d25)"

    const-string v8, "(\u8aad\u307f\u8fbc\u307f\u5931\u6557)"

    const-string v10, "(failed to read)"

    invoke-direct {p0, v1, v8, v10}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 645
    :cond_5
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

    .line 276
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 277
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 278
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    const-string v1, "\u8fd8\u6ca1\u6709\u4e3b\u9898\u6587\u4ef6\u5939(\u5355\u4e2a\u6587\u4ef6\u8bf7\u5728\u4e0b\u9762\u5404\u72b6\u6001\u91cc\u9009)\u3002"

    const-string v2, "\u30c6\u30fc\u30de\u30d5\u30a9\u30eb\u30c0\u306f\u307e\u3060\u3042\u308a\u307e\u305b\u3093(\u5358\u4f53\u30d5\u30a1\u30a4\u30eb\u306f\u4e0b\u3067\u9078\u629e)\u3002"

    const-string v3, "No theme folders yet (pick single files below)."

    invoke-direct {p0, v1, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 299
    :cond_0
    return-void

    .line 281
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

    .line 282
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 283
    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 284
    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 285
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 286
    const/high16 v4, 0x41700000    # 15.0f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 287
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 288
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v7, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 289
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 290
    const-string v4, "\u5957\u7528"

    const-string v5, "\u9069\u7528"

    const-string v6, "Apply"

    invoke-direct {p0, v4, v5, v6}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 291
    new-instance v4, Lcom/keymouse/tool/CursorActivity$7;

    invoke-direct {v4, p0, v0}, Lcom/keymouse/tool/CursorActivity$7;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 297
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_0
.end method

.method private recreateSoon()V
    .locals 4

    .prologue
    .line 562
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mH:Landroid/os/Handler;

    new-instance v1, Lcom/keymouse/tool/CursorActivity$12;

    invoke-direct {v1, p0}, Lcom/keymouse/tool/CursorActivity$12;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    const-wide/16 v2, 0x96

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 567
    return-void
.end method

.method private refreshA11yStatus()V
    .locals 4

    .prologue
    .line 715
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 725
    :goto_0
    return-void

    .line 718
    :cond_0
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->a11yListed(Landroid/content/Context;)Z

    move-result v0

    .line 719
    invoke-static {}, Lcom/keymouse/tool/CursorHit;->available()Z

    move-result v1

    .line 720
    if-eqz v1, :cond_1

    const-string v0, "\u65e0\u969c\u788d\u670d\u52a1: \u5df2\u8fde\u63a5\uff0c\u6b63\u5728\u5de5\u4f5c"

    const-string v2, "\u30b5\u30fc\u30d3\u30b9: \u63a5\u7d9a\u6e08\u307f"

    const-string v3, "Service: connected"

    invoke-direct {p0, v0, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 723
    :goto_1
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 724
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    if-eqz v1, :cond_3

    const v0, -0xe475c6

    :goto_2
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 721
    :cond_1
    if-eqz v0, :cond_2

    const-string v0, "\u65e0\u969c\u788d\u670d\u52a1: \u5df2\u542f\u7528\uff0c\u7b49\u5f85\u8fde\u63a5\u2026(\u82e5\u4e00\u76f4\u4e0d\u8fde\u63a5\uff0c\u5173\u518d\u5f00\u4e00\u6b21\u4e0a\u9762\u7684\u5f00\u5173)"

    const-string v2, "\u30b5\u30fc\u30d3\u30b9: \u6709\u52b9\u3001\u63a5\u7d9a\u5f85\u3061\u2026"

    const-string v3, "Service: enabled, waiting to connect\u2026"

    invoke-direct {p0, v0, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 722
    :cond_2
    const-string v0, "\u65e0\u969c\u788d\u670d\u52a1: \u672a\u5f00\u542f(\u6253\u5f00\u4e0a\u9762\u7684\u5f00\u5173\u5373\u53ef\uff0c\u9700\u8981 root)"

    const-string v2, "\u30b5\u30fc\u30d3\u30b9: \u7121\u52b9(\u4e0a\u306e\u30b9\u30a4\u30c3\u30c1\u3067\u6709\u52b9\u5316\u3001root \u5fc5\u8981)"

    const-string v3, "Service: off (turn the switch on; needs root)"

    invoke-direct {p0, v0, v2, v3}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 724
    :cond_3
    const v0, -0x619600

    goto :goto_2
.end method

.method private refreshAll()V
    .locals 7

    .prologue
    .line 264
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 265
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->listFiles(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v1

    .line 266
    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->listThemes(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v0

    .line 267
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

    .line 268
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

    .line 267
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 269
    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->rebuildThemes(Ljava/util/ArrayList;)V

    .line 270
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->rebuildBuiltin()V

    .line 271
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->rebuildSlots()V

    .line 272
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshA11yStatus()V

    .line 273
    return-void
.end method

.method private refreshThemeRows()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v2, 0x0

    .line 509
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSelName:Landroid/widget/TextView;

    if-nez v0, :cond_1

    .line 540
    :cond_0
    return-void

    .line 512
    :cond_1
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->currentThemeId(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    .line 513
    const/4 v1, 0x0

    .line 514
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 515
    aget-object v5, v0, v2

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    :goto_1
    move-object v1, v0

    .line 518
    goto :goto_0

    .line 519
    :cond_2
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSelName:Landroid/widget/TextView;

    if-eqz v1, :cond_3

    invoke-static {p0, v1}, Lcom/keymouse/tool/CursorCfg;->themeName(Landroid/content/Context;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 522
    if-eqz v1, :cond_4

    .line 523
    aget-object v0, v1, v2

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->thumbsOf(Ljava/lang/String;)[Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_3
    move v1, v2

    .line 537
    :goto_4
    if-ge v1, v8, :cond_0

    .line 538
    iget-object v2, p0, Lcom/keymouse/tool/CursorActivity;->mSelThumbs:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 537
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 520
    :cond_3
    const-string v0, "\u81ea\u5b9a\u4e49(\u6ca1\u6709\u5957\u7528\u5185\u7f6e\u4e3b\u9898)"

    const-string v4, "\u30ab\u30b9\u30bf\u30e0(\u5185\u8535\u30c6\u30fc\u30de\u672a\u9069\u7528)"

    const-string v5, "Custom (no built-in theme)"

    invoke-direct {p0, v0, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 526
    :cond_4
    new-array v1, v8, [Landroid/graphics/Bitmap;

    move v3, v2

    .line 527
    :goto_5
    if-ge v3, v8, :cond_6

    .line 528
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    sget-object v4, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 529
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_5

    .line 530
    new-instance v4, Ljava/io/File;

    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->lib(Landroid/content/Context;)Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sget-object v0, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    aget-object v0, v0, v3

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->defHotspot(Ljava/lang/String;)I

    move-result v0

    invoke-static {v4, v0}, Lcom/keymouse/tool/CurLoader;->load(Ljava/io/File;I)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v0

    .line 531
    if-eqz v0, :cond_5

    .line 532
    iget-object v4, v0, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    const-wide/16 v6, 0x0

    invoke-virtual {v0, v6, v7}, Lcom/keymouse/tool/CurLoader$Set;->frameAt(J)I

    move-result v0

    aget-object v0, v4, v0

    aput-object v0, v1, v3

    .line 527
    :cond_5
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_5

    :cond_6
    move-object v0, v1

    goto :goto_3

    :cond_7
    move-object v0, v1

    goto :goto_1
.end method

.method private showThemeDialog()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 435
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 437
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v2, v3

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 438
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->groupOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 439
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 441
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 443
    :goto_1
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v2, v1

    .line 444
    goto :goto_0

    .line 445
    :cond_0
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    invoke-static {v0}, Lcom/keymouse/tool/CursorCfg;->currentThemeId(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 446
    new-instance v1, Lcom/keymouse/tool/CursorActivity$10;

    invoke-direct {v1, p0, v4, v0}, Lcom/keymouse/tool/CursorActivity$10;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 493
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 494
    const-string v2, "\u9009\u62e9\u5185\u7f6e\u4e3b\u9898"

    const-string v5, "\u5185\u8535\u30c6\u30fc\u30de\u3092\u9078\u629e"

    const-string v6, "Choose a built-in theme"

    invoke-direct {p0, v2, v5, v6}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 495
    new-instance v2, Lcom/keymouse/tool/CursorActivity$11;

    invoke-direct {v2, p0, v4}, Lcom/keymouse/tool/CursorActivity$11;-><init>(Lcom/keymouse/tool/CursorActivity;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 503
    const-string v1, "\u53d6\u6d88"

    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v4, "Cancel"

    invoke-direct {p0, v1, v2, v4}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 504
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 505
    return-void

    :cond_1
    move-object v1, v2

    goto :goto_1
.end method

.method private slotName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 64
    const-string v0, "arrow"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    const-string v0, "\u5e38\u89c4 \u00b7 \u7bad\u5934"

    const-string v1, "\u901a\u5e38\u30fb\u77e2\u5370"

    const-string v2, "Normal \u00b7 arrow"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 73
    :goto_0
    return-object v0

    .line 67
    :cond_0
    const-string v0, "hand"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 68
    const-string v0, "\u94fe\u63a5 \u00b7 \u624b\u6307"

    const-string v1, "\u30ea\u30f3\u30af\u30fb\u6307"

    const-string v2, "Link \u00b7 hand"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 70
    :cond_1
    const-string v0, "ibeam"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 71
    const-string v0, "\u6587\u5b57 \u00b7 I \u578b"

    const-string v1, "\u30c6\u30ad\u30b9\u30c8\u30fbI\u30d3\u30fc\u30e0"

    const-string v2, "Text \u00b7 I-beam"

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 73
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
    .line 695
    const-string v1, "smart"

    if-eqz p1, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-direct {p0, v1, v0}, Lcom/keymouse/tool/CursorActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    const-string v1, "\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 697
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/keymouse/tool/CursorActivity$18;

    invoke-direct {v1, p0, p1}, Lcom/keymouse/tool/CursorActivity$18;-><init>(Lcom/keymouse/tool/CursorActivity;Z)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 711
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 712
    return-void

    .line 695
    :cond_0
    const-string v0, "0"

    goto :goto_0
.end method

.method private thumbRow([Landroid/graphics/Bitmap;I)Landroid/widget/LinearLayout;
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v0, 0x0

    const/4 v7, 0x2

    .line 359
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 360
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 361
    :goto_0
    if-ge v0, v8, :cond_1

    .line 362
    new-instance v2, Landroid/widget/ImageView;

    invoke-direct {v2, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 363
    const v3, -0x473f34

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 364
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 365
    invoke-direct {p0, v7}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v7}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v7}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v7}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 366
    if-eqz p1, :cond_0

    aget-object v3, p1, v0

    if-eqz v3, :cond_0

    .line 367
    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 369
    :cond_0
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, p2}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, p2}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 370
    invoke-direct {p0, v8}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 371
    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 361
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 373
    :cond_1
    return-object v1
.end method

.method private thumbsOf(Ljava/lang/String;)[Landroid/graphics/Bitmap;
    .locals 8

    .prologue
    const/4 v7, 0x4

    .line 340
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThumbCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/graphics/Bitmap;

    .line 341
    if-eqz v0, :cond_0

    .line 355
    :goto_0
    return-object v0

    .line 344
    :cond_0
    new-array v0, v7, [Landroid/graphics/Bitmap;

    .line 345
    invoke-static {p0, p1}, Lcom/keymouse/tool/CursorCfg;->installTheme(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 346
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v7, :cond_2

    .line 347
    sget-object v2, Lcom/keymouse/tool/CursorCfg;->SLOTS:[Ljava/lang/String;

    aget-object v2, v2, v1

    .line 348
    new-instance v3, Ljava/io/File;

    invoke-static {p0, p1}, Lcom/keymouse/tool/CursorCfg;->themeDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".cur"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/keymouse/tool/CursorCfg;->defHotspot(Ljava/lang/String;)I

    move-result v2

    invoke-static {v3, v2}, Lcom/keymouse/tool/CurLoader;->load(Ljava/io/File;I)Lcom/keymouse/tool/CurLoader$Set;

    move-result-object v2

    .line 349
    if-eqz v2, :cond_1

    .line 350
    iget-object v3, v2, Lcom/keymouse/tool/CurLoader$Set;->frames:[Landroid/graphics/Bitmap;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, v4, v5}, Lcom/keymouse/tool/CurLoader$Set;->frameAt(J)I

    move-result v2

    aget-object v2, v3, v2

    aput-object v2, v0, v1

    .line 346
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 354
    :cond_2
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity;->mThumbCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private title(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 77
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 78
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 79
    const/16 v1, 0x16

    invoke-direct {p0, v1}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v1

    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 80
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
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

    .line 94
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 95
    const-string v0, "\u81ea\u5b9a\u4e49\u9f20\u6807"

    const-string v3, "\u30ab\u30b9\u30bf\u30e0\u30de\u30a6\u30b9\u30dd\u30a4\u30f3\u30bf"

    const-string v4, "Custom mouse pointer"

    invoke-direct {p0, v0, v3, v4}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/keymouse/tool/CursorActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 96
    invoke-static {p0}, Lcom/keymouse/tool/CursorCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    .line 97
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v0

    .line 98
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    .line 99
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 100
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 103
    new-instance v3, Landroid/widget/Switch;

    invoke-direct {v3, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 104
    iput-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mOnSw:Landroid/widget/Switch;

    .line 105
    invoke-virtual {v3, v8}, Landroid/widget/Switch;->setTextSize(F)V

    .line 106
    const-string v0, "\u542f\u7528\u81ea\u5b9a\u4e49\u9f20\u6807"

    const-string v4, "\u30ab\u30b9\u30bf\u30e0\u30dd\u30a4\u30f3\u30bf\u3092\u4f7f\u3046"

    const-string v5, "Use custom pointer"

    invoke-direct {p0, v0, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 107
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mCfg:Ljava/util/Map;

    const-string v4, "on"

    invoke-static {v0, v4, v1}, Lcom/keymouse/tool/CursorCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 108
    new-instance v0, Lcom/keymouse/tool/CursorActivity$1;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/CursorActivity$1;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-virtual {v3, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 115
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 116
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u5173\u95ed = \u7528\u5185\u7f6e\u7684\u9ec4\u7ea2\u7bad\u5934\u3002\u81ea\u5b9a\u4e49\u9f20\u6807\u753b\u5728\"\u81ea\u7ed8\u5149\u6807\"\u4e0a\uff0c\u6240\u4ee5\u4e3b\u754c\u9762\"\u9f20\u6807\u8f6f\u5f00\u5173\"\u91cc\u7684\"\u81ea\u7ed8\u5149\u6807\"\u8981\u4fdd\u6301\u5f00\u542f\u3002"

    const-string v4, "\u30aa\u30d5 = \u5185\u8535\u306e\u9ec4\u8d64\u306e\u77e2\u5370\u3002\u30e1\u30a4\u30f3\u753b\u9762\u306e\u300c\u81ea\u524d\u30ab\u30fc\u30bd\u30eb\u300d\u304c\u30aa\u30f3\u3067\u3042\u308b\u5fc5\u8981\u304c\u3042\u308a\u307e\u3059\u3002"

    const-string v5, "Off = built-in yellow/red arrow. Needs the \"self-drawn cursor\" switch on the main screen."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 121
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 122
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 123
    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v3, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 124
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

    .line 125
    const-string v4, "\u6307\u9488\u5927\u5c0f"

    const-string v5, "\u30dd\u30a4\u30f3\u30bf\u306e\u5927\u304d\u3055"

    const-string v6, "Pointer size"

    invoke-direct {p0, v4, v5, v6}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 126
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

    .line 127
    iget-object v5, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 128
    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 129
    const/16 v6, 0x38

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setMax(I)V

    .line 130
    add-int/lit8 v3, v3, -0x10

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 131
    new-instance v3, Lcom/keymouse/tool/CursorActivity$2;

    invoke-direct {v3, p0, v0, v4}, Lcom/keymouse/tool/CursorActivity$2;-><init>(Lcom/keymouse/tool/CursorActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 145
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 148
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    .line 149
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    invoke-virtual {v0, v8}, Landroid/widget/Switch;->setTextSize(F)V

    .line 150
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v3, v2, v2}, Landroid/widget/Switch;->setPadding(IIII)V

    .line 151
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    const-string v3, "\u667a\u80fd\u624b\u578b / \u6587\u5b57\u5149\u6807"

    const-string v4, "\u30b9\u30de\u30fc\u30c8\u624b\u578b / \u30c6\u30ad\u30b9\u30c8\u30ab\u30fc\u30bd\u30eb"

    const-string v5, "Smart hand / text cursor"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 152
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

    .line 153
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    new-instance v3, Lcom/keymouse/tool/CursorActivity$3;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/CursorActivity$3;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 160
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSmartSw:Landroid/widget/Switch;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 161
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u9f20\u6807\u505c\u5728\u53ef\u70b9\u51fb\u63a7\u4ef6\u4e0a\u663e\u793a\"\u94fe\u63a5\u624b\u6307\"\uff0c\u505c\u5728\u8f93\u5165\u6846/\u53ef\u9009\u6587\u5b57\u4e0a\u663e\u793a\"\u6587\u5b57 I \u578b\"\u3002\u9760\u65e0\u969c\u788d\u670d\u52a1\u67e5\u754c\u9762\uff0c\u7531 root \u81ea\u52a8\u5f00\u542f\uff0c\u4e0d\u7528\u4f60\u53bb\u8bbe\u7f6e\u91cc\u70b9\uff1b\u6307\u9488\u505c\u4e0b\u7ea6 0.1~0.3 \u79d2\u540e\u624d\u4f1a\u53d8\u3002\u670d\u52a1\u53ea\u67e5\u4f4d\u7f6e\u4e0b\u7684\u63a7\u4ef6\u7c7b\u578b\uff0c\u4e0d\u8bfb\u5185\u5bb9\u3002"

    const-string v4, "\u30af\u30ea\u30c3\u30af\u53ef\u80fd\u306a\u90e8\u54c1\u306e\u4e0a\u3067\u306f\u300c\u30ea\u30f3\u30af\u300d\u3001\u5165\u529b\u6b04/\u9078\u629e\u53ef\u80fd\u30c6\u30ad\u30b9\u30c8\u306e\u4e0a\u3067\u306f\u300cI\u30d3\u30fc\u30e0\u300d\u3002\u30a2\u30af\u30bb\u30b7\u30d3\u30ea\u30c6\u30a3\u30b5\u30fc\u30d3\u30b9\u3067\u8abf\u3079\u3001root \u304c\u81ea\u52d5\u3067\u6709\u52b9\u5316\u3057\u307e\u3059\u3002\u30dd\u30a4\u30f3\u30bf\u304c\u6b62\u307e\u3063\u3066\u304b\u3089\u7d040.1\u301c0.3\u79d2\u5f8c\u306b\u5207\u308a\u66ff\u308f\u308a\u307e\u3059\u3002"

    const-string v5, "Shows the link hand over clickable controls and the I-beam over text fields. Uses an accessibility service that root enables automatically; the pointer changes ~0.1-0.3 s after it stops. It only checks the control type under the pointer, never reads content."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 164
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    .line 165
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 166
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v3, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 167
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mA11yStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 170
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 171
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 172
    invoke-direct {p0, v9}, Lcom/keymouse/tool/CursorActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v3, v2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 173
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

    .line 174
    const-string v4, "\u957f\u6309\u591a\u4e45\u53d8\"\u6293\u53d6\""

    const-string v5, "\u4f55\u30df\u30ea\u79d2\u306e\u9577\u62bc\u3057\u3067\u300c\u3064\u304b\u3080\u300d"

    const-string v6, "Long-press time for grab"

    invoke-direct {p0, v4, v5, v6}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 175
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

    .line 176
    iget-object v5, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 177
    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 178
    const/16 v6, 0x1a

    invoke-virtual {v5, v6}, Landroid/widget/SeekBar;->setMax(I)V

    .line 179
    add-int/lit16 v3, v3, -0xc8

    div-int/lit8 v3, v3, 0x32

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 180
    new-instance v3, Lcom/keymouse/tool/CursorActivity$4;

    invoke-direct {v3, p0, v0, v4}, Lcom/keymouse/tool/CursorActivity$4;-><init>(Lcom/keymouse/tool/CursorActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 194
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 195
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u6309\u4f4f\u4e2d\u95f4\u952e\u8d85\u8fc7\u8fd9\u4e2a\u65f6\u95f4(\u4e14\u6307\u9488\u4e0b\u4e0d\u662f\u6587\u5b57)\uff0c\u5c31\u6362\u6210\"\u6293\u53d6\"\u6837\u5f0f\uff0c\u7528\u5728\u957f\u6309\u5e94\u7528\u56fe\u6807\u62d6\u52a8\u3002"

    const-string v4, "\u6c7a\u5b9a\u30ad\u30fc\u3092\u3053\u306e\u6642\u9593\u3088\u308a\u9577\u304f\u62bc\u3057\u7d9a\u3051\u308b\u3068(\u30c6\u30ad\u30b9\u30c8\u4e0a\u4ee5\u5916)\u300c\u3064\u304b\u3080\u300d\u306b\u5207\u308a\u66ff\u308f\u308a\u307e\u3059\u3002"

    const-string v5, "Holding the centre key longer than this (not over text) switches to the grab pointer."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 200
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u5185\u7f6e\u4e3b\u9898"

    const-string v4, "\u5185\u8535\u30c6\u30fc\u30de"

    const-string v5, "Built-in themes"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 201
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u70b9\"\u4f7f\u7528\"\u5c31\u6574\u5957\u6362\u6210\u8fd9\u4e2a\u4e3b\u9898\u7684 \u7bad\u5934 / \u624b\u6307 / \u6587\u5b57 / \u6293\u53d6 \u56db\u4e2a\u6307\u9488\u3002\u5305\u542b STMC(\u539f\u795e\u3001\u5b64\u72ec\u6447\u6eda\u3001\u6c89\u9ed8\u7684\u9b54\u5973\u7b49\uff0c\u542b\u5de6\u624b\u7248)\u3001Bibata\u3001macOS \u98ce\u683c\u3002\u5957\u7528\u540e\u8fd8\u53ef\u4ee5\u5728\u6700\u4e0b\u9762\u5355\u72ec\u6539\u67d0\u4e2a\u72b6\u6001\u3002"

    const-string v4, "\u300c\u4f7f\u7528\u300d\u3092\u62bc\u3059\u3068 \u77e2\u5370/\u6307/\u30c6\u30ad\u30b9\u30c8/\u3064\u304b\u3080 \u306e4\u3064\u304c\u307e\u3068\u3081\u3066\u5207\u308a\u66ff\u308f\u308a\u307e\u3059\u3002STMC(\u539f\u795e\u30fb\u307c\u3063\u3061\u30fb\u3056\u30fb\u308d\u3063\u304f!\u30fb\u30b5\u30a4\u30ec\u30f3\u30c8\u30fb\u30a6\u30a3\u30c3\u30c1\u7b49\u3001\u5de6\u624b\u7528\u3042\u308a)\u3001Bibata\u3001macOS\u98a8\u3092\u5185\u8535\u3002\u9069\u7528\u5f8c\u3082\u4e0b\u3067\u72b6\u614b\u3054\u3068\u306b\u5909\u66f4\u3067\u304d\u307e\u3059\u3002"

    const-string v5, "Tap \"Use\" to switch the arrow / hand / I-beam / grab pointers at once. Includes STMC (Genshin, Bocchi the Rock, Silent Witch\u2026, with left-handed versions), Bibata and macOS style. You can still change single states below afterwards."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 204
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 205
    const-string v3, "\u6062\u590d\u9ed8\u8ba4\u6307\u9488(STMC \u6807\u51c6)"

    const-string v4, "\u65e2\u5b9a\u306e\u30dd\u30a4\u30f3\u30bf\u306b\u623b\u3059(STMC \u30b9\u30bf\u30f3\u30c0\u30fc\u30c9)"

    const-string v5, "Restore default pointers (STMC Standard)"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 206
    new-instance v3, Lcom/keymouse/tool/CursorActivity$5;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/CursorActivity$5;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 214
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 215
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuiltin:Landroid/widget/LinearLayout;

    .line 216
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBuiltin:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 217
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBuiltin:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 220
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u6307\u9488\u5e93"

    const-string v4, "\u30dd\u30a4\u30f3\u30bf\u30e9\u30a4\u30d6\u30e9\u30ea"

    const-string v5, "Pointer library"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 221
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u628a .cur / .ani / .png \u6587\u4ef6\uff0c\u6216\u6574\u5957 Windows \u9f20\u6807\u4e3b\u9898\u6587\u4ef6\u5939(\u542b .inf \u66f4\u597d)\uff0c\u653e\u5230\u624b\u673a\u5b58\u50a8\u6839\u76ee\u5f55\u7684 keymousecursor \u6587\u4ef6\u5939\u91cc\uff0c\u518d\u70b9\u4e0b\u9762\u7684\u6309\u94ae\u5bfc\u5165\u3002"

    const-string v4, ".cur / .ani / .png\u3001\u307e\u305f\u306f Windows \u306e\u30de\u30a6\u30b9\u30c6\u30fc\u30de\u30d5\u30a9\u30eb\u30c0(.inf \u4ed8\u304d\u63a8\u5968)\u3092\u3001\u30b9\u30c8\u30ec\u30fc\u30b8\u76f4\u4e0b\u306e keymousecursor \u30d5\u30a9\u30eb\u30c0\u306b\u7f6e\u3044\u3066\u3001\u4e0b\u306e\u30dc\u30bf\u30f3\u3067\u53d6\u308a\u8fbc\u307f\u307e\u3059\u3002"

    const-string v5, "Put .cur / .ani / .png files or a whole Windows cursor-theme folder (with its .inf) into the keymousecursor folder in internal storage, then tap import."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 224
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 225
    const-string v3, "\u4ece keymousecursor \u5bfc\u5165(root)"

    const-string v4, "keymousecursor \u304b\u3089\u53d6\u308a\u8fbc\u307f(root)"

    const-string v5, "Import from keymousecursor (root)"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 226
    new-instance v3, Lcom/keymouse/tool/CursorActivity$6;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/CursorActivity$6;-><init>(Lcom/keymouse/tool/CursorActivity;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 232
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mLibInfo:Landroid/widget/TextView;

    .line 233
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mLibInfo:Landroid/widget/TextView;

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 234
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mLibInfo:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 236
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u6211\u5bfc\u5165\u7684\u4e3b\u9898\u6587\u4ef6\u5939"

    const-string v4, "\u53d6\u308a\u8fbc\u3093\u3060\u30c6\u30fc\u30de\u30d5\u30a9\u30eb\u30c0"

    const-string v5, "My imported theme folders"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 237
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    .line 238
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 239
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mThemes:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 241
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u5404\u72b6\u6001\u7684\u6307\u9488"

    const-string v4, "\u72b6\u614b\u3054\u3068\u306e\u30dd\u30a4\u30f3\u30bf"

    const-string v5, "Pointer for each state"

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->title(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 242
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    .line 243
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 244
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/keymouse/tool/CursorActivity;->mSlots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 245
    iget-object v0, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    const-string v3, "\u6ca1\u8bbe\u7684\u72b6\u6001\u6cbf\u7528\"\u5e38\u89c4\"\u90a3\u4e2a\uff1b\"\u5e38\u89c4\"\u4e5f\u6ca1\u8bbe\u5c31\u7528\u5185\u7f6e\u7bad\u5934\u3002.cur \u81ea\u5e26\u70ed\u70b9\uff1bpng \u6ca1\u6709\u70ed\u70b9\uff0c\u7528\u53f3\u8fb9\u6309\u94ae\u9009\u70ed\u70b9\u4f4d\u7f6e(\u5de6\u4e0a/\u4e0a\u8fb9\u4e2d\u95f4/\u6b63\u4e2d)\u3002.ani \u4f1a\u6309\u6587\u4ef6\u91cc\u7684\u5e27\u548c\u901f\u5ea6\u64ad\u653e\u3002"

    const-string v4, "\u672a\u8a2d\u5b9a\u306e\u72b6\u614b\u306f\u300c\u901a\u5e38\u300d\u3092\u4f7f\u3044\u3001\u305d\u308c\u3082\u672a\u8a2d\u5b9a\u306a\u3089\u5185\u8535\u306e\u77e2\u5370\u3002.cur \u306f\u30db\u30c3\u30c8\u30b9\u30dd\u30c3\u30c8\u5185\u8535\u3001png \u306f\u53f3\u306e\u30dc\u30bf\u30f3\u3067\u4f4d\u7f6e(\u5de6\u4e0a/\u4e0a\u4e2d\u592e/\u4e2d\u592e)\u3092\u9078\u3073\u307e\u3059\u3002.ani \u306f\u30d5\u30ec\u30fc\u30e0\u3068\u901f\u5ea6\u3069\u304a\u308a\u306b\u518d\u751f\u3057\u307e\u3059\u3002"

    const-string v5, "Unset states fall back to Normal, then to the built-in arrow. .cur carries its hotspot; for png pick one with the button (top-left / top-centre / centre). .ani plays with its own frames and rates."

    invoke-direct {p0, v3, v4, v5}, Lcom/keymouse/tool/CursorActivity;->S(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/keymouse/tool/CursorActivity;->hint(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 249
    iput-boolean v2, p0, Lcom/keymouse/tool/CursorActivity;->mBuilding:Z

    .line 250
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshAll()V

    .line 251
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 252
    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 253
    iget-object v1, p0, Lcom/keymouse/tool/CursorActivity;->mBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 254
    invoke-virtual {p0, v0}, Lcom/keymouse/tool/CursorActivity;->setContentView(Landroid/view/View;)V

    .line 255
    return-void

    :cond_0
    move v0, v2

    .line 107
    goto/16 :goto_0

    :cond_1
    move v0, v2

    .line 152
    goto/16 :goto_1
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 259
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 260
    invoke-direct {p0}, Lcom/keymouse/tool/CursorActivity;->refreshA11yStatus()V

    .line 261
    return-void
.end method
