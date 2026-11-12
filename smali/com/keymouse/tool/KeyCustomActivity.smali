.class public Lcom/keymouse/tool/KeyCustomActivity;
.super Landroid/app/Activity;
.source "KeyCustomActivity.java"


# static fields
.field private static final PRE:[Ljava/lang/String;


# instance fields
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

.field private mReady:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 25
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "menu"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "back"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "star"

    aput-object v2, v0, v1

    sput-object v0, Lcom/keymouse/tool/KeyCustomActivity;->PRE:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mReady:Z

    return-void
.end method

.method private L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .prologue
    .line 32
    invoke-static {p0, p1, p2, p3, p4}, Lcom/keymouse/tool/KmCfg;->L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$000(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/keymouse/tool/KeyCustomActivity;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(I)Ljava/lang/String;
    .registers 2

    .prologue
    .line 24
    invoke-static {p0}, Lcom/keymouse/tool/KeyCustomActivity;->fmt(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private dp(I)I
    .registers 4

    .prologue
    .line 36
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
    .registers 3

    .prologue
    .line 48
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

.method private put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mReady:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 45
    :cond_10
    :goto_10
    return-void

    .line 43
    :cond_11
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-static {p0, v0}, Lcom/keymouse/tool/KmCfg;->save(Landroid/content/Context;Ljava/util/Map;)V

    goto :goto_10
.end method

.method private sceneRow(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .registers 9

    .prologue
    const/4 v0, 0x1

    .line 203
    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 204
    iget-object v2, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-static {v2, p1, v0}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_36

    :goto_e
    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 205
    new-instance v0, Lcom/keymouse/tool/KeyCustomActivity$5;

    invoke-direct {v0, p0, p1}, Lcom/keymouse/tool/KeyCustomActivity$5;-><init>(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 210
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

    .line 204
    :cond_36
    const/4 v0, 0x0

    goto :goto_e
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 15

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 54
    const-string v0, "Key customization"

    const-string v1, "\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u043a\u043b\u0430\u0432\u0438\u0448"

    const-string v2, "\u30ad\u30fc\u306e\u30ab\u30b9\u30bf\u30de\u30a4\u30ba"

    const-string v3, "\u6309\u952e\u81ea\u5b9a\u4e49"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/keymouse/tool/KeyCustomActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 55
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    .line 57
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 58
    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 59
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v0

    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v1

    const/16 v2, 0x10

    invoke-direct {p0, v2}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x18

    invoke-direct {p0, v3}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v3

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 61
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 62
    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 63
    invoke-virtual {p0}, Lcom/keymouse/tool/KeyCustomActivity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 67
    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 68
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const-string v2, "kmOn"

    const/4 v3, 0x1

    invoke-static {v0, v2, v3}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_22e

    const/4 v0, 0x1

    :goto_61
    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 69
    new-instance v0, Lcom/keymouse/tool/KeyCustomActivity$1;

    invoke-direct {v0, p0}, Lcom/keymouse/tool/KeyCustomActivity$1;-><init>(Lcom/keymouse/tool/KeyCustomActivity;)V

    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 74
    const-string v0, "Enable key mapping"

    const-string v2, "\u0412\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f \u043a\u043b\u0430\u0432\u0438\u0448"

    const-string v3, "\u30ad\u30fc\u5272\u308a\u5f53\u3066\u3092\u6709\u52b9\u306b\u3059\u308b"

    const-string v4, "\u542f\u7528\u6309\u952e\u6620\u5c04"

    .line 75
    invoke-direct {p0, v0, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "On"

    const-string v3, "\u0412\u043a\u043b"

    const-string v4, "\u30aa\u30f3"

    const-string v5, "\u5f00\u542f"

    .line 76
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Off"

    const-string v4, "\u0412\u044b\u043a\u043b"

    const-string v5, "\u30aa\u30d5"

    const-string v6, "\u5173\u95ed"

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 74
    invoke-static {p0, v0, v2, v3, v1}, Lcom/keymouse/tool/ChoiceRow;->build(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/CompoundButton;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 77
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 78
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 79
    const-string v1, "Off = every long-press action below is disabled; short presses always stay with the system."

    const-string v2, "\u0412\u044b\u043a\u043b = \u0432\u0441\u0435 \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u043f\u043e \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044e \u043e\u0442\u043a\u043b\u044e\u0447\u0435\u043d\u044b; \u043a\u043e\u0440\u043e\u0442\u043a\u0438\u0435 \u043d\u0430\u0436\u0430\u0442\u0438\u044f \u0432\u0441\u0435\u0433\u0434\u0430 \u043e\u0441\u0442\u0430\u044e\u0442\u0441\u044f \u0441\u0438\u0441\u0442\u0435\u043c\u0435."

    const-string v3, "\u30aa\u30d5 = \u4ee5\u4e0b\u306e\u9577\u62bc\u3057\u52d5\u4f5c\u3092\u3059\u3079\u3066\u505c\u6b62(\u77ed\u62bc\u3057\u306f\u5e38\u306b\u30b7\u30b9\u30c6\u30e0\u306b\u6e21\u3057\u307e\u3059)"

    const-string v4, "\u5173\u95ed = \u4e0b\u9762\u6240\u6709\u957f\u6309\u52a8\u4f5c\u90fd\u505c\u7528\uff1b\u5355\u51fb\u59cb\u7ec8\u4ea4\u7ed9\u7cfb\u7edf\u5904\u7406\u3002"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 85
    const/4 v0, 0x5

    new-array v8, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "Off"

    const-string v2, "\u0412\u044b\u043a\u043b"

    const-string v3, "\u30aa\u30d5"

    const-string v4, "\u5173\u95ed"

    .line 86
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v8, v0

    const/4 v0, 0x1

    const-string v1, "Recent apps"

    const-string v2, "\u041d\u0435\u0434\u0430\u0432\u043d\u0438\u0435"

    const-string v3, "\u6700\u8fd1\u306e\u30a2\u30d7\u30ea"

    const-string v4, "\u6700\u8fd1\u4efb\u52a1"

    .line 87
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v8, v0

    const/4 v0, 0x2

    const-string v1, "Close foreground app"

    const-string v2, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0435"

    const-string v3, "\u524d\u9762\u30a2\u30d7\u30ea\u3092\u7d42\u4e86"

    const-string v4, "\u7ed3\u675f\u524d\u53f0\u5e94\u7528"

    .line 88
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v8, v0

    const/4 v0, 0x3

    const-string v1, "Flashlight"

    const-string v2, "\u0424\u043e\u043d\u0430\u0440\u0438\u043a"

    const-string v3, "\u30e9\u30a4\u30c8"

    const-string v4, "\u624b\u7535\u7b52"

    .line 89
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v8, v0

    const/4 v0, 0x4

    const-string v1, "Go to home screen"

    const-string v2, "\u041d\u0430 \u0440\u0430\u0431\u043e\u0447\u0438\u0439 \u0441\u0442\u043e\u043b"

    const-string v3, "\u30db\u30fc\u30e0\u753b\u9762\u3078"

    const-string v4, "\u56de\u5230\u684c\u9762"

    .line 90
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v8, v0

    .line 92
    const/4 v0, 0x3

    new-array v9, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "Menu key (long press)"

    const-string v2, "\u041a\u043b\u0430\u0432\u0438\u0448\u0430 \u041c\u0435\u043d\u044e (\u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u0435)"

    const-string v3, "\u30e1\u30cb\u30e5\u30fc\u30ad\u30fc(\u9577\u62bc\u3057)"

    const-string v4, "\u83dc\u5355\u952e\uff08\u957f\u6309\uff09"

    .line 93
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v9, v0

    const/4 v0, 0x1

    const-string v1, "Back key (long press)"

    const-string v2, "\u041a\u043b\u0430\u0432\u0438\u0448\u0430 \u041d\u0430\u0437\u0430\u0434 (\u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u0435)"

    const-string v3, "\u623b\u308b\u30ad\u30fc(\u9577\u62bc\u3057)"

    const-string v4, "\u8fd4\u56de\u952e\uff08\u957f\u6309\uff09"

    .line 94
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v9, v0

    const/4 v0, 0x2

    const-string v1, "* key (long press)"

    const-string v2, "\u041a\u043b\u0430\u0432\u0438\u0448\u0430 * (\u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u0435)"

    const-string v3, "*\u30ad\u30fc(\u9577\u62bc\u3057)"

    const-string v4, "*\u53f7\u952e\uff08\u957f\u6309\uff09"

    .line 95
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v9, v0

    .line 97
    const-string v0, "Hold time"

    const-string v1, "\u0412\u0440\u0435\u043c\u044f \u0443\u0434\u0435\u0440\u0436\u0430\u043d\u0438\u044f"

    const-string v2, "\u9577\u62bc\u3057\u6642\u9593"

    const-string v3, "\u957f\u6309\u65f6\u95f4"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 98
    const-string v0, " s"

    const-string v1, " \u0441"

    const-string v2, " \u79d2"

    const-string v4, " \u79d2"

    invoke-direct {p0, v0, v1, v2, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 100
    const/4 v0, 0x0

    move v6, v0

    :goto_14b
    const/4 v0, 0x3

    if-ge v6, v0, :cond_231

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/keymouse/tool/KeyCustomActivity;->PRE:[Ljava/lang/String;

    aget-object v1, v1, v6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Act"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/keymouse/tool/KeyCustomActivity;->PRE:[Ljava/lang/String;

    aget-object v2, v2, v6

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 103
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 104
    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 105
    const/4 v2, 0x0

    const/16 v10, 0x12

    invoke-direct {p0, v10}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v1, v2, v10, v11, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 106
    aget-object v2, v9, v6

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 109
    new-instance v1, Landroid/widget/Spinner;

    invoke-direct {v1, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 110
    new-instance v2, Landroid/widget/ArrayAdapter;

    const v10, 0x1090009

    invoke-direct {v2, p0, v10, v8}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 111
    const/4 v2, 0x0

    const/4 v10, 0x4

    iget-object v11, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const/4 v12, 0x0

    invoke-static {v11, v0, v12}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    invoke-static {v2, v10}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 112
    new-instance v2, Lcom/keymouse/tool/KeyCustomActivity$2;

    invoke-direct {v2, p0, v0}, Lcom/keymouse/tool/KeyCustomActivity$2;-><init>(Lcom/keymouse/tool/KeyCustomActivity;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 120
    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 122
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 123
    const/high16 v0, 0x41600000    # 14.0f

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 124
    const/16 v0, 0x1f4

    const/16 v1, 0x1388

    iget-object v10, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const/16 v11, 0x5dc

    invoke-static {v10, v5, v11}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v10

    invoke-static {v1, v10}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v10, ": "

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lcom/keymouse/tool/KeyCustomActivity;->fmt(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 128
    new-instance v10, Landroid/widget/SeekBar;

    invoke-direct {v10, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 129
    const/16 v1, 0x2d

    invoke-virtual {v10, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 130
    div-int/lit8 v0, v0, 0x64

    add-int/lit8 v0, v0, -0x5

    invoke-virtual {v10, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 131
    new-instance v0, Lcom/keymouse/tool/KeyCustomActivity$3;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/keymouse/tool/KeyCustomActivity$3;-><init>(Lcom/keymouse/tool/KeyCustomActivity;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 146
    invoke-virtual {v7, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 100
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto/16 :goto_14b

    .line 68
    :cond_22e
    const/4 v0, 0x0

    goto/16 :goto_61

    .line 150
    :cond_231
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 151
    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 152
    const/4 v1, 0x0

    const/16 v2, 0x16

    invoke-direct {p0, v2}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 153
    const-string v1, "When it works"

    const-string v2, "\u041a\u043e\u0433\u0434\u0430 \u0440\u0430\u0431\u043e\u0442\u0430\u0435\u0442"

    const-string v3, "\u52d5\u4f5c\u3059\u308b\u5834\u9762"

    const-string v4, "\u751f\u6548\u573a\u666f"

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 155
    const-string v0, "lockOk"

    const-string v1, "Also on the lock screen (screen on)"

    const-string v2, "\u0418 \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435 \u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u043a\u0438 (\u044d\u043a\u0440\u0430\u043d \u0432\u043a\u043b\u044e\u0447\u0451\u043d)"

    const-string v3, "\u30ed\u30c3\u30af\u753b\u9762(\u753b\u9762\u70b9\u706f\u4e2d)\u3067\u3082\u6709\u52b9"

    const-string v4, "\u9501\u5c4f\u754c\u9762(\u4eae\u5c4f)\u4e5f\u751f\u6548"

    .line 156
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 155
    invoke-direct {p0, v0, v1}, Lcom/keymouse/tool/KeyCustomActivity;->sceneRow(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 158
    const-string v0, "sleepOk"

    const-string v1, "Also when the screen is off (sleep)"

    const-string v2, "\u0418 \u043f\u0440\u0438 \u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d\u043d\u043e\u043c \u044d\u043a\u0440\u0430\u043d\u0435"

    const-string v3, "\u753b\u9762\u6d88\u706f\u4e2d(\u30b9\u30ea\u30fc\u30d7)\u3082\u6709\u52b9"

    const-string v4, "\u606f\u5c4f(\u4f11\u7720)\u65f6\u4e5f\u751f\u6548"

    .line 159
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 158
    invoke-direct {p0, v0, v1}, Lcom/keymouse/tool/KeyCustomActivity;->sceneRow(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 163
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 164
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 165
    const/4 v1, 0x0

    const/16 v2, 0x16

    invoke-direct {p0, v2}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x6

    invoke-direct {p0, v4}, Lcom/keymouse/tool/KeyCustomActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 166
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 167
    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 168
    const-string v2, "Excluded apps  \u203a"

    const-string v3, "\u0418\u0441\u043a\u043b\u044e\u0447\u0451\u043d\u043d\u044b\u0435 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f  \u203a"

    const-string v4, "\u9664\u5916\u30a2\u30d7\u30ea  \u203a"

    const-string v5, "\u6392\u9664\u5e94\u7528  \u203a"

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 170
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mExclSub:Landroid/widget/TextView;

    .line 171
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mExclSub:Landroid/widget/TextView;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 172
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mExclSub:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 173
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 174
    new-instance v1, Lcom/keymouse/tool/KeyCustomActivity$4;

    invoke-direct {v1, p0}, Lcom/keymouse/tool/KeyCustomActivity$4;-><init>(Lcom/keymouse/tool/KeyCustomActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 181
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mReady:Z

    .line 182
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 183
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 184
    invoke-virtual {v0, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 185
    invoke-virtual {p0, v0}, Lcom/keymouse/tool/KeyCustomActivity;->setContentView(Landroid/view/View;)V

    .line 186
    return-void
.end method

.method protected onResume()V
    .registers 8

    .prologue
    .line 190
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 192
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    .line 193
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    const-string v2, "excl"

    const-string v3, "excl"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    iget-object v0, p0, Lcom/keymouse/tool/KeyCustomActivity;->mCfg:Ljava/util/Map;

    invoke-static {v0}, Lcom/keymouse/tool/KmCfg;->exclCount(Ljava/util/Map;)I

    move-result v0

    .line 195
    if-nez v0, :cond_4d

    const-string v0, "none"

    const-string v1, "\u043d\u0435\u0442"

    const-string v2, "\u306a\u3057"

    const-string v3, "\u65e0"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 196
    :goto_2a
    iget-object v1, p0, Lcom/keymouse/tool/KeyCustomActivity;->mExclSub:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Long-press actions do nothing while these apps are in front: "

    const-string v4, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u043d\u0435 \u0432\u044b\u043f\u043e\u043b\u043d\u044f\u044e\u0442\u0441\u044f, \u043f\u043e\u043a\u0430 \u044d\u0442\u0438 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u043d\u0430 \u043f\u0435\u0440\u0435\u0434\u043d\u0435\u043c \u043f\u043b\u0430\u043d\u0435: "

    const-string v5, "\u3053\u308c\u3089\u306e\u30a2\u30d7\u30ea\u304c\u524d\u9762\u306b\u3042\u308b\u9593\u306f\u9577\u62bc\u3057\u52d5\u4f5c\u3092\u3057\u307e\u305b\u3093: "

    const-string v6, "\u8fd9\u4e9b\u5e94\u7528\u5728\u524d\u53f0\u65f6\u4e0d\u89e6\u53d1\u957f\u6309\u52a8\u4f5c\uff1a"

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/keymouse/tool/KeyCustomActivity;->L(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    return-void

    .line 195
    :cond_4d
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2a
.end method
