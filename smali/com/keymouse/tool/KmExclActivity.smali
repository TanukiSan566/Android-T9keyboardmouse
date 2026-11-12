.class public Lcom/keymouse/tool/KmExclActivity;
.super Landroid/app/Activity;
.source "KmExclActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/keymouse/tool/KmExclActivity$Item;
    }
.end annotation


# instance fields
.field private mAdapter:Landroid/widget/BaseAdapter;

.field private final mAll:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keymouse/tool/KmExclActivity$Item;",
            ">;"
        }
    .end annotation
.end field

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

.field private mLoading:Landroid/widget/TextView;

.field private mSearch:Landroid/widget/EditText;

.field private final mSel:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mShowHidden:Z

.field private final mShown:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/keymouse/tool/KmExclActivity$Item;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mAll:Ljava/util/List;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;

    .line 44
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keymouse/tool/KmExclActivity;->mShowHidden:Z

    return-void
.end method

.method private L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .prologue
    .line 52
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$000(Lcom/keymouse/tool/KmExclActivity;)V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/keymouse/tool/KmExclActivity;->refilter()V

    return-void
.end method

.method static synthetic access$102(Lcom/keymouse/tool/KmExclActivity;Z)Z
    .registers 2

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/keymouse/tool/KmExclActivity;->mShowHidden:Z

    return p1
.end method

.method static synthetic access$200(Lcom/keymouse/tool/KmExclActivity;)V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/keymouse/tool/KmExclActivity;->load()V

    return-void
.end method

.method static synthetic access$300(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/List;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/keymouse/tool/KmExclActivity;I)I
    .registers 3

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/keymouse/tool/KmExclActivity;->dp(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/Set;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$600(Lcom/keymouse/tool/KmExclActivity;)V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/keymouse/tool/KmExclActivity;->saveSel()V

    return-void
.end method

.method static synthetic access$700(Lcom/keymouse/tool/KmExclActivity;)Landroid/widget/BaseAdapter;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mAdapter:Landroid/widget/BaseAdapter;

    return-object v0
.end method

.method static synthetic access$800(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/List;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mAll:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$900(Lcom/keymouse/tool/KmExclActivity;)Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mLoading:Landroid/widget/TextView;

    return-object v0
.end method

.method private dp(I)I
    .registers 4

    .prologue
    .line 56
    int-to-float v0, p1

    invoke-virtual {p0}, Lcom/keymouse/tool/KmExclActivity;->getResources()Landroid/content/res/Resources;

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

.method private load()V
    .registers 5

    .prologue
    .line 200
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mLoading:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 201
    iget-boolean v0, p0, Lcom/keymouse/tool/KmExclActivity;->mShowHidden:Z

    .line 202
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 203
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/keymouse/tool/KmExclActivity$5;

    invoke-direct {v3, p0, v0, v1}, Lcom/keymouse/tool/KmExclActivity$5;-><init>(Lcom/keymouse/tool/KmExclActivity;ZLandroid/os/Handler;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 255
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 256
    return-void
.end method

.method private refilter()V
    .registers 5

    .prologue
    .line 259
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mSearch:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 260
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 261
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mAll:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1d
    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/keymouse/tool/KmExclActivity$Item;

    .line 262
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_47

    iget-object v3, v0, Lcom/keymouse/tool/KmExclActivity$Item;->label:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_47

    iget-object v3, v0, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 263
    :cond_47
    iget-object v3, p0, Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 267
    :cond_4d
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mShown:Ljava/util/List;

    new-instance v1, Lcom/keymouse/tool/KmExclActivity$6;

    invoke-direct {v1, p0}, Lcom/keymouse/tool/KmExclActivity$6;-><init>(Lcom/keymouse/tool/KmExclActivity;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 277
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 278
    return-void
.end method

.method private saveSel()V
    .registers 5

    .prologue
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_22

    .line 63
    const/16 v3, 0x20

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    :cond_22
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 67
    :cond_26
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mCfg:Ljava/util/Map;

    const-string v2, "excl"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mCfg:Ljava/util/Map;

    invoke-static {p0, v0}, Lcom/keymouse/tool/KmCfg;->save(Landroid/content/Context;Ljava/util/Map;)V

    .line 69
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 10

    .prologue
    const/16 v6, 0xc

    const/4 v7, 0x1

    const/4 v1, 0x0

    .line 73
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 74
    const-string v0, "Excluded apps"

    const-string v2, "\u0418\u0441\u043a\u043b\u044e\u0447\u0451\u043d\u043d\u044b\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f"

    const-string v3, "\u9664\u5916\u30a2\u30d7\u30ea"

    const-string v4, "\u6392\u9664\u5e94\u7528"

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/keymouse/tool/KmExclActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/keymouse/tool/KmExclActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 75
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mCfg:Ljava/util/Map;

    .line 76
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity;->mCfg:Ljava/util/Map;

    const-string v2, "excl"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 77
    if-eqz v0, :cond_4a

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_4a

    .line 78
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\\s+"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    move v0, v1

    :goto_3e
    if-ge v0, v3, :cond_4a

    aget-object v4, v2, v0

    .line 79
    iget-object v5, p0, Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;

    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_3e

    .line 83
    :cond_4a
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 84
    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 85
    invoke-direct {p0, v6}, Lcom/keymouse/tool/KmExclActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x8

    invoke-direct {p0, v3}, Lcom/keymouse/tool/KmExclActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v6}, Lcom/keymouse/tool/KmExclActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 87
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 88
    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 89
    const-string v3, "Tick the apps where long-press actions should NOT fire."

    const-string v4, "\u041e\u0442\u043c\u0435\u0442\u044c\u0442\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f, \u0433\u0434\u0435 \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u043d\u0435 \u0434\u043e\u043b\u0436\u043d\u044b \u0441\u0440\u0430\u0431\u0430\u0442\u044b\u0432\u0430\u0442\u044c."

    const-string v5, "\u9577\u62bc\u3057\u52d5\u4f5c\u3092\u3055\u305b\u305f\u304f\u306a\u3044\u30a2\u30d7\u30ea\u306b\u30c1\u30a7\u30c3\u30af\u3092\u5165\u308c\u3066\u304f\u3060\u3055\u3044\u3002"

    const-string v6, "\u52fe\u9009\u7684\u5e94\u7528\u5728\u524d\u53f0\u65f6\uff0c\u957f\u6309\u52a8\u4f5c\u4e0d\u4f1a\u89e6\u53d1\u3002"

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/KmExclActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 95
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mSearch:Landroid/widget/EditText;

    .line 96
    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mSearch:Landroid/widget/EditText;

    invoke-virtual {v2, v7}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 97
    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mSearch:Landroid/widget/EditText;

    const-string v3, "Search"

    const-string v4, "\u041f\u043e\u0438\u0441\u043a"

    const-string v5, "\u691c\u7d22"

    const-string v6, "\u641c\u7d22"

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/KmExclActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 98
    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mSearch:Landroid/widget/EditText;

    new-instance v3, Lcom/keymouse/tool/KmExclActivity$1;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/KmExclActivity$1;-><init>(Lcom/keymouse/tool/KmExclActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 109
    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mSearch:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 111
    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 112
    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setTextSize(F)V

    .line 113
    const-string v3, "Also show apps without a launcher icon"

    const-string v4, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0438 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u0431\u0435\u0437 \u0437\u043d\u0430\u0447\u043a\u0430"

    const-string v5, "\u30a2\u30a4\u30b3\u30f3\u306e\u306a\u3044\u30a2\u30d7\u30ea\u3082\u8868\u793a"

    const-string v6, "\u540c\u65f6\u663e\u793a\u6ca1\u6709\u684c\u9762\u56fe\u6807\u7684\u5e94\u7528"

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/KmExclActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 115
    new-instance v3, Lcom/keymouse/tool/KmExclActivity$2;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/KmExclActivity$2;-><init>(Lcom/keymouse/tool/KmExclActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 121
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 123
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mLoading:Landroid/widget/TextView;

    .line 124
    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mLoading:Landroid/widget/TextView;

    const/16 v3, 0x11

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 125
    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mLoading:Landroid/widget/TextView;

    const-string v3, "Loading..."

    const-string v4, "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430..."

    const-string v5, "\u8aad\u307f\u8fbc\u307f\u4e2d..."

    const-string v6, "\u52a0\u8f7d\u4e2d..."

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/KmExclActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    iget-object v2, p0, Lcom/keymouse/tool/KmExclActivity;->mLoading:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 128
    new-instance v2, Landroid/widget/ListView;

    invoke-direct {v2, p0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 129
    new-instance v3, Lcom/keymouse/tool/KmExclActivity$3;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/KmExclActivity$3;-><init>(Lcom/keymouse/tool/KmExclActivity;)V

    iput-object v3, p0, Lcom/keymouse/tool/KmExclActivity;->mAdapter:Landroid/widget/BaseAdapter;

    .line 182
    iget-object v3, p0, Lcom/keymouse/tool/KmExclActivity;->mAdapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 183
    new-instance v3, Lcom/keymouse/tool/KmExclActivity$4;

    invoke-direct {v3, p0}, Lcom/keymouse/tool/KmExclActivity$4;-><init>(Lcom/keymouse/tool/KmExclActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 193
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v1, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    invoke-virtual {p0, v0}, Lcom/keymouse/tool/KmExclActivity;->setContentView(Landroid/view/View;)V

    .line 195
    invoke-direct {p0}, Lcom/keymouse/tool/KmExclActivity;->load()V

    .line 196
    return-void
.end method
