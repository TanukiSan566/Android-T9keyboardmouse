.class public Lcom/keymouse/tool/MainActivity;
.super Landroid/app/Activity;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;
.source "MainActivity.java"


# instance fields
.field private mBtnApps:Landroid/view/View;

.field private mBtnDeb:Landroid/view/View;

.field private mBtnLog:Landroid/widget/Button;

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mSeekMove:Landroid/widget/SeekBar;

.field private mSeekScroll:Landroid/widget/SeekBar;

.field private mSpinnerLang:Landroid/widget/Spinner;

.field private mSwitchAutostart:Landroid/widget/Switch;

.field private mSwitchDialer:Landroid/widget/Switch;

.field private mSwitchEnable:Landroid/widget/Switch;

.field private mSwitchFlip:Landroid/widget/Switch;

.field private mSwitchHome:Landroid/widget/Switch;

.field private mSwitchIme:Landroid/widget/Switch;

.field private mUiReady:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private addSwitchRow(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/Switch;
    .locals 6
    .param p1, "root"    # Landroid/widget/LinearLayout;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "initial"    # Z

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v0, "row":Landroid/widget/LinearLayout;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x0

    const/16 v2, 0x28

    const/16 v3, 0x0

    const/16 v4, 0xa

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v1, "lbl":Landroid/widget/TextView;
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/Switch;

    invoke-direct {v2, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .local v2, "sw":Landroid/widget/Switch;
    invoke-virtual {v2, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    invoke-virtual {v2, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v2
.end method

.method private addSeekRow(Landroid/widget/LinearLayout;Ljava/lang/String;II)Landroid/widget/SeekBar;
    .locals 5
    .param p1, "root"    # Landroid/widget/LinearLayout;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "max"    # I
    .param p4, "progress"    # I

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v0, "lbl":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v1, 0x28

    const/16 v2, 0x1e

    const/16 v3, 0x0

    const/16 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/SeekBar;

    invoke-direct {v1, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .local v1, "sb":Landroid/widget/SeekBar;
    invoke-virtual {v1, p3}, Landroid/widget/SeekBar;->setMax(I)V

    invoke-virtual {v1, p4}, Landroid/widget/SeekBar;->setProgress(I)V

    invoke-virtual {v1, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v1
.end method

.method private getLang()I
    .locals 3

    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v1, "lang"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "en"    # Ljava/lang/String;
    .param p2, "ru"    # Ljava/lang/String;
    .param p3, "ja"    # Ljava/lang/String;
    .param p4, "zh"    # Ljava/lang/String;

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->getLang()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_not_ru

    return-object p2

    :cond_not_ru
    const/4 v1, 0x2

    if-ne v0, v1, :cond_not_ja

    return-object p3

    :cond_not_ja
    const/4 v1, 0x3

    if-ne v0, v1, :cond_not_zh

    return-object p4

    :cond_not_zh
    return-object p1
.end method

.method private addSpinnerRow(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;
    .locals 5
    .param p1, "root"    # Landroid/widget/LinearLayout;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "items"    # [Ljava/lang/String;
    .param p4, "selected"    # I

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v0, "row":Landroid/widget/LinearLayout;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x0

    const/16 v2, 0x28

    const/16 v3, 0x0

    const/16 v4, 0xa

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v1, "lbl":Landroid/widget/TextView;
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/Spinner;

    invoke-direct {v2, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .local v2, "sp":Landroid/widget/Spinner;
    new-instance v3, Landroid/widget/ArrayAdapter;

    sget v4, Landroid/R$layout;->simple_spinner_item:I

    invoke-direct {v3, p0, v4, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .local v3, "adapter":Landroid/widget/ArrayAdapter;
    sget v4, Landroid/R$layout;->simple_spinner_dropdown_item:I

    invoke-virtual {v3, v4}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {v2, p4}, Landroid/widget/Spinner;->setSelection(I)V

    invoke-virtual {v2, p0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v2
.end method

.method private strTitle()Ljava/lang/String;
    .locals 4

    const-string v0, "KeyMouse T9 Tool"

    const-string v1, "\u0418\u043d\u0441\u0442\u0440\u0443\u043c\u0435\u043d\u0442-\u043c\u044b\u0448\u044c KeyMouse T9"

    const-string v2, "KeyMouse T9 \u30de\u30a6\u30b9\u30c4\u30fc\u30eb"

    const-string v3, "KeyMouse T9 \u9f20\u6807\u5de5\u5177"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strEnableSwitch()Ljava/lang/String;
    .locals 4

    const-string v0, "Mouse Switch"

    const-string v1, "\u041f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0442\u0435\u043b\u044c \u043c\u044b\u0448\u0438"

    const-string v2, "\u30de\u30a6\u30b9\u30b9\u30a4\u30c3\u30c1"

    const-string v3, "\u9f20\u6807\u603b\u5f00\u5173"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strMoveSpeed()Ljava/lang/String;
    .locals 4

    const-string v0, "Move Speed (1-20)"

    const-string v1, "\u0421\u043a\u043e\u0440\u043e\u0441\u0442\u044c \u0434\u0432\u0438\u0436\u0435\u043d\u0438\u044f (1-20)"

    const-string v2, "\u79fb\u52d5\u901f\u5ea6 (1-20)"

    const-string v3, "\u79fb\u52a8\u901f\u5ea6 (1-20)"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strScrollSpeed()Ljava/lang/String;
    .locals 4

    const-string v0, "Scroll Speed (1-10)"

    const-string v1, "\u0421\u043a\u043e\u0440\u043e\u0441\u0442\u044c \u043f\u0440\u043e\u043a\u0440\u0443\u0442\u043a\u0438 (1-10)"

    const-string v2, "\u30b9\u30af\u30ed\u30fc\u30eb\u901f\u5ea6 (1-10)"

    const-string v3, "\u7ffb\u9875\u901f\u5ea6 (1-10)"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strFlipSwitch()Ljava/lang/String;
    .locals 4

    const-string v0, "Flip All Directions (check if keys are reversed)"

    const-string v1, "\u0418\u043d\u0432\u0435\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043d\u0430\u043f\u0440\u0430\u0432\u043b\u0435\u043d\u0438\u044f (\u0435\u0441\u043b\u0438 \u043a\u043d\u043e\u043f\u043a\u0438 \u043f\u0435\u0440\u0435\u043f\u0443\u0442\u0430\u043d\u044b)"

    const-string v2, "\u65b9\u5411\u3092\u53cd\u8ee2 (\u30ad\u30fc\u304c\u9006\u306e\u5834\u5408\u306f\u30aa\u30f3\u306b)"

    const-string v3, "\u65b9\u5411\u6574\u4f53\u53cd\u8f6c(\u65b9\u5411\u952e\u5168\u53cd\u4e86\u5c31\u52fe\u8fd9\u4e2a)"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private writeLiveConfig(IIZ)V
    .locals 6
    .param p1, "moveStep"    # I
    .param p2, "scrollStep"    # I
    .param p3, "flip180"    # Z

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "moveStep="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\nscrollStep="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\nflip180="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_wlc_noflip

    const-string v1, "1"

    goto :goto_wlc_flip

    :cond_wlc_noflip
    const-string v1, "0"

    :goto_wlc_flip
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nautoImeSuspend="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "imeHide"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_wlc_noime

    const-string v1, "1"

    goto :goto_wlc_ime

    :cond_wlc_noime
    const-string v1, "0"

    :goto_wlc_ime
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nautoHomeSuspend="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "homeHide"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_wlc_nohome

    const-string v1, "1"

    goto :goto_wlc_home

    :cond_wlc_nohome
    const-string v1, "0"

    :goto_wlc_home
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nautoDialerAllow="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "dialerAllow"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_wlc_nodial

    const-string v1, "1"

    goto :goto_wlc_dial

    :cond_wlc_nodial
    const-string v1, "0"

    :goto_wlc_dial
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nhideApps="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "hideApps"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\ndebGlobal="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "debGlobal"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_wd1_no

    const-string v1, "1"

    goto :goto_wd1

    :cond_wd1_no
    const-string v1, "0"

    :goto_wd1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\ndebMouse="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "debMouse"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_wd2_no

    const-string v1, "1"

    goto :goto_wd2

    :cond_wd2_no
    const-string v1, "0"

    :goto_wd2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\ndebToggle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "debToggle"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_wd3_no

    const-string v1, "1"

    goto :goto_wd3

    :cond_wd3_no
    const-string v1, "0"

    :goto_wd3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\ndebAll="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "debAllEff"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_wd4_no

    const-string v1, "1"

    goto :goto_wd4

    :cond_wd4_no
    const-string v1, "0"

    :goto_wd4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\ndebMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "debMsEff"

    const/16 v4, 0x78

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\ndebGhost="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "debGhostEff"

    const/16 v4, 0x1e

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\ndebKeys="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "debKeys"

    const-string v4, "2:1:1,3:1:2,4:1:3,5:1:4,6:1:5,7:1:6,8:1:7,9:1:8,10:1:9,11:1:0,227:1:*,228:1:#"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\ndebApps="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "debApps"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "keymouse_live.cfg"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_wlc

    return-void

    :catch_wlc
    move-exception v0

    return-void
.end method

.method private strImeSwitch()Ljava/lang/String;
    .locals 4

    const-string v0, "Hide mouse while the keyboard is shown (off = mouse always on)"

    const-string v1, "\u0421\u043a\u0440\u044b\u0432\u0430\u0442\u044c \u043c\u044b\u0448\u044c, \u043f\u043e\u043a\u0430 \u043f\u043e\u043a\u0430\u0437\u0430\u043d\u0430 \u043a\u043b\u0430\u0432\u0438\u0430\u0442\u0443\u0440\u0430 (\u0432\u044b\u043a\u043b. = \u043c\u044b\u0448\u044c \u0432\u0441\u0435\u0433\u0434\u0430 \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u0430)"

    const-string v2, "\u30ad\u30fc\u30dc\u30fc\u30c9\u8868\u793a\u4e2d\u306f\u30de\u30a6\u30b9\u3092\u96a0\u3059 (\u30aa\u30d5=\u5e38\u306b\u6709\u52b9)"

    const-string v3, "\u68c0\u6d4b\u5230\u8f93\u5165\u6cd5\u65f6\u9690\u85cf\u9f20\u6807(\u5173\u95ed=\u9f20\u6807\u4e00\u76f4\u5f00\u542f)"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strHomeSwitch()Ljava/lang/String;
    .locals 4

    const-string v0, "Hide mouse on the home screen (comes back when you leave it)"

    const-string v1, "\u0421\u043a\u0440\u044b\u0432\u0430\u0442\u044c \u043c\u044b\u0448\u044c \u043d\u0430 \u0440\u0430\u0431\u043e\u0447\u0435\u043c \u0441\u0442\u043e\u043b\u0435 (\u0432\u043e\u0437\u0432\u0440\u0430\u0449\u0430\u0435\u0442\u0441\u044f \u043f\u0440\u0438 \u0432\u044b\u0445\u043e\u0434\u0435)"

    const-string v2, "\u30db\u30fc\u30e0\u753b\u9762\u3067\u306f\u30de\u30a6\u30b9\u3092\u96a0\u3059 (\u96e2\u308c\u308b\u3068\u81ea\u52d5\u3067\u5fa9\u5e30)"

    const-string v3, "\u68c0\u6d4b\u5230\u684c\u9762\u65f6\u9690\u85cf\u9f20\u6807(\u79bb\u5f00\u684c\u9762\u81ea\u52a8\u6062\u590d)"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strDialerSwitch()Ljava/lang/String;
    .locals 4

    const-string v0, "Allow mouse in the dialer app (off = mouse switches off there, digit keys go to the dialer)"

    const-string v1, "\u0420\u0430\u0437\u0440\u0435\u0448\u0438\u0442\u044c \u043c\u044b\u0448\u044c \u0432 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438 \u00ab\u0422\u0435\u043b\u0435\u0444\u043e\u043d\u00bb (\u0432\u044b\u043a\u043b. = \u043c\u044b\u0448\u044c \u043e\u0442\u043a\u043b\u044e\u0447\u0430\u0435\u0442\u0441\u044f, \u0446\u0438\u0444\u0440\u044b \u0438\u0434\u0443\u0442 \u0432 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0435)"

    const-string v2, "\u96fb\u8a71\u30a2\u30d7\u30ea\u3067\u30de\u30a6\u30b9\u3092\u8a31\u53ef (\u30aa\u30d5=\u81ea\u52d5\u3067\u30de\u30a6\u30b9\u3092\u5207\u308a\u3001\u6570\u5b57\u30ad\u30fc\u3092\u96fb\u8a71\u30a2\u30d7\u30ea\u3078)"

    const-string v3, "\u62e8\u53f7\u5e94\u7528\u91cc\u5141\u8bb8\u4f7f\u7528\u9f20\u6807(\u5173\u95ed=\u81ea\u52a8\u5173\u95ed\u9f20\u6807\uff0c\u6570\u5b57\u952e\u4ea4\u7ed9\u62e8\u53f7\u5e94\u7528)"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strAppsBtn()Ljava/lang/String;
    .locals 4

    const-string v0, "Mouse-hide app list"

    const-string v1, "\u0421\u043f\u0438\u0441\u043e\u043a \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0439 \u0431\u0435\u0437 \u043c\u044b\u0448\u0438"

    const-string v2, "\u30de\u30a6\u30b9\u3092\u96a0\u3059\u30a2\u30d7\u30ea\u4e00\u89a7"

    const-string v3, "\u9f20\u6807\u9690\u85cf\u5e94\u7528\u5217\u8868"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strAppsSub()Ljava/lang/String;
    .locals 4

    const-string v0, "Home / dialer / keyboard / any app"

    const-string v1, "\u0420\u0430\u0431\u043e\u0447\u0438\u0439 \u0441\u0442\u043e\u043b / \u0442\u0435\u043b\u0435\u0444\u043e\u043d / \u043a\u043b\u0430\u0432\u0438\u0430\u0442\u0443\u0440\u0430 / \u043b\u044e\u0431\u043e\u0435"

    const-string v2, "\u30db\u30fc\u30e0 / \u96fb\u8a71 / \u30ad\u30fc\u30dc\u30fc\u30c9 / \u4efb\u610f\u306e\u30a2\u30d7\u30ea"

    const-string v3, "\u684c\u9762 / \u62e8\u53f7 / \u8f93\u5165\u6cd5 / \u4efb\u610f\u5e94\u7528"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private makeAppsCard()Landroid/view/View;
    .locals 10

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, -0xc5c5c6

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, -0xe0b2bb

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/4 v1, 0x2

    const v3, -0xff5772

    invoke-virtual {v2, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    new-instance v3, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [I

    const v5, 0x0101009c

    const/4 v6, 0x0

    aput v5, v4, v6

    invoke-virtual {v3, v4, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v4, 0x1

    new-array v4, v4, [I

    const v5, 0x010100a7

    aput v5, v4, v6

    invoke-virtual {v3, v4, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v4, 0x0

    new-array v4, v4, [I

    invoke-virtual {v3, v4, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v5, 0xe

    invoke-virtual {v4, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v4, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setFocusable(Z)V

    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const v7, -0xff5772

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v6, 0x9

    invoke-virtual {v5, v6, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "ic_menu_view"

    const-string v8, "drawable"

    const-string v9, "android"

    invoke-virtual {v6, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_noicon

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_noicon
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x2c

    invoke-direct {v6, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v7, 0x0

    const/16 v8, 0xe

    invoke-virtual {v6, v7, v7, v8, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strAppsBtn()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41800000    # 16.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strAppsSub()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41400000    # 12.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const v7, -0x616162

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v8, -0x2

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v6, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "\u203a"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41e00000    # 28.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const v6, -0xff5772

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v6, 0x0

    const/16 v7, 0x10

    invoke-virtual {v5, v6, v7, v6, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v4
.end method

.method private strDebBtn()Ljava/lang/String;
    .locals 4

    const-string v0, "Debounce settings"

    const-string v1, "\u0417\u0430\u0449\u0438\u0442\u0430 \u043e\u0442 \u0434\u0440\u0435\u0431\u0435\u0437\u0433\u0430"

    const-string v2, "\u30c1\u30e3\u30bf\u30ea\u30f3\u30b0\u9632\u6b62\u8a2d\u5b9a"

    const-string v3, "\u9632\u6296\u8bbe\u7f6e"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strDebSub()Ljava/lang/String;
    .locals 4

    const-string v0, "Key chatter / global / per app / adjustable time"

    const-string v1, "\u0414\u0440\u0435\u0431\u0435\u0437\u0433 \u043a\u043b\u0430\u0432\u0438\u0448 / \u0433\u043b\u043e\u0431\u0430\u043b\u044c\u043d\u043e / \u043f\u043e \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044e / \u0432\u0440\u0435\u043c\u044f"

    const-string v2, "\u30ad\u30fc\u9023\u6253 / \u5168\u4f53 / \u30a2\u30d7\u30ea\u5225 / \u6642\u9593\u8abf\u6574"

    const-string v3, "\u6309\u952e\u8fde\u51fb / \u5168\u5c40 / \u6309\u5e94\u7528 / \u65f6\u95f4\u53ef\u8c03"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private makeDebCard()Landroid/view/View;
    .locals 10

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, -0xc5c5c6

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, -0xe0b2bb

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/4 v1, 0x2

    const v3, -0xff5772

    invoke-virtual {v2, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    new-instance v3, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [I

    const v5, 0x0101009c

    const/4 v6, 0x0

    aput v5, v4, v6

    invoke-virtual {v3, v4, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v4, 0x1

    new-array v4, v4, [I

    const v5, 0x010100a7

    aput v5, v4, v6

    invoke-virtual {v3, v4, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const/4 v4, 0x0

    new-array v4, v4, [I

    invoke-virtual {v3, v4, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v5, 0xe

    invoke-virtual {v4, v5, v5, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v4, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setFocusable(Z)V

    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    const v7, -0xff5772

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v6, 0x9

    invoke-virtual {v5, v6, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const-string v7, "ic_menu_manage"

    const-string v8, "drawable"

    const-string v9, "android"

    invoke-virtual {v6, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-eqz v6, :cond_noicon

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_noicon
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x2c

    invoke-direct {v6, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v7, 0x0

    const/16 v8, 0xe

    invoke-virtual {v6, v7, v7, v8, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strDebBtn()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41800000    # 16.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strDebSub()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41400000    # 12.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const v7, -0x616162

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, 0x0

    const/4 v8, -0x2

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v6, v7, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "\u203a"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41e00000    # 28.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const v6, -0xff5772

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v6, 0x0

    const/16 v7, 0x10

    invoke-virtual {v5, v6, v7, v6, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v4
.end method

.method private applyLive()V
    .locals 4

    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mSeekMove:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mSeekScroll:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mSwitchFlip:Landroid/widget/Switch;

    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/MainActivity;->writeLiveConfig(IIZ)V

    return-void
.end method

.method private strOn()Ljava/lang/String;
    .locals 4

    const-string v0, "On"

    const-string v1, "\u0412\u043a\u043b."

    const-string v2, "\u30aa\u30f3"

    const-string v3, "\u5f00\u542f"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strOff()Ljava/lang/String;
    .locals 4

    const-string v0, "Off"

    const-string v1, "\u0412\u044b\u043a\u043b."

    const-string v2, "\u30aa\u30d5"

    const-string v3, "\u5173\u95ed"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private addChoiceRow(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/Switch;
    .locals 4
    .param p1, "root"    # Landroid/widget/LinearLayout;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "initial"    # Z

    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    invoke-virtual {v0, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strOn()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strOff()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, p2, v1, v2, v0}, Lcom/keymouse/tool/ChoiceRow;->build(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/widget/CompoundButton;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private strAutostart()Ljava/lang/String;
    .locals 4

    const-string v0, "Autostart on Boot"

    const-string v1, "\u0410\u0432\u0442\u043e\u0437\u0430\u043f\u0443\u0441\u043a \u043f\u0440\u0438 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0435"

    const-string v2, "\u8d77\u52d5\u6642\u306b\u81ea\u52d5\u958b\u59cb"

    const-string v3, "\u5f00\u673a\u81ea\u542f"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strLangSwitch()Ljava/lang/String;
    .locals 4

    const-string v0, "Language"

    const-string v1, "\u042f\u0437\u044b\u043a"

    const-string v2, "\u8a00\u8a9e"

    const-string v3, "\u8bed\u8a00"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strFooter()Ljava/lang/String;
    .locals 4

    const-string v0, "Requires Root. Switch takes effect immediately. Long-press F1 on the device to toggle mouse mode."

    const-string v1, "\u0422\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f root-\u0434\u043e\u0441\u0442\u0443\u043f. \u041f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0442\u0435\u043b\u044c \u043f\u0440\u0438\u043c\u0435\u043d\u044f\u0435\u0442\u0441\u044f \u0441\u0440\u0430\u0437\u0443. \u0414\u043e\u043b\u0433\u043e\u0435 \u043d\u0430\u0436\u0430\u0442\u0438\u0435 F1 \u043d\u0430 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0435 \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0430\u0435\u0442 \u0440\u0435\u0436\u0438\u043c \u043c\u044b\u0448\u0438."

    const-string v2, "Root\u6a29\u9650\u304c\u5fc5\u8981\u3067\u3059\u3002\u30b9\u30a4\u30c3\u30c1\u306f\u5373\u5ea7\u306b\u53cd\u6620\u3055\u308c\u307e\u3059\u3002\u7aef\u672b\u306eF1\u9577\u62bc\u3057\u3067\u30de\u30a6\u30b9\u30e2\u30fc\u30c9\u3092\u5207\u308a\u66ff\u3048\u307e\u3059\u3002"

    const-string v3, "\u9700\u8981 Root \u6743\u9650\uff1b\u5f00\u5173\u5b9e\u65f6\u751f\u6548\uff0cF1 \u957f\u6309\u5207\u6362\u9f20\u6807\u6a21\u5f0f\u3002"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strCopyLogBtn()Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strLogCopied()Ljava/lang/String;
    .locals 4

    const-string v0, "Log copied to clipboard"

    const-string v1, "\u0416\u0443\u0440\u043d\u0430\u043b \u0441\u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d \u0432 \u0431\u0443\u0444\u0435\u0440 \u043e\u0431\u043c\u0435\u043d\u0430"

    const-string v2, "\u30ed\u30b0\u3092\u30af\u30ea\u30c3\u30d7\u30dc\u30fc\u30c9\u306b\u30b3\u30d4\u30fc\u3057\u307e\u3057\u305f"

    const-string v3, "\u65e5\u5fd7\u5df2\u590d\u5236\u5230\u526a\u8d34\u677f"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private strLogEmpty()Ljava/lang/String;
    .locals 4

    const-string v0, "No log yet (toggle mouse mode once first)"

    const-string v1, "\u0416\u0443\u0440\u043d\u0430\u043b\u0430 \u043f\u043e\u043a\u0430 \u043d\u0435\u0442 (\u0441\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u043a\u043b/\u0432\u044b\u043a\u043b \u0440\u0435\u0436\u0438\u043c \u043c\u044b\u0448\u0438)"

    const-string v2, "\u307e\u3060\u30ed\u30b0\u304c\u3042\u308a\u307e\u305b\u3093(\u5148\u306b\u30de\u30a6\u30b9\u30e2\u30fc\u30c9\u3092\u4e00\u5ea6\u5207\u308a\u66ff\u3048\u3066\u304f\u3060\u3055\u3044)"

    const-string v3, "\u8fd8\u6ca1\u6709\u65e5\u5fd7(\u5148\u5f00\u5173\u4e00\u6b21\u9f20\u6807\u6a21\u5f0f\u518d\u8bd5)"

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/keymouse/tool/MainActivity;->tr4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private readLogFile()Ljava/lang/String;
    .locals 10

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cat "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/keymouse.log 2>/dev/null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # 日志文件是守护进程以 root 身份创建的；之前直接用 App 自己的
    # FileInputStream 读，遇到过读不到的情况(不管是 DAC 权限还是
    # SELinux 的 app_data_file 分类限制导致，站在 App 这一层都排查
    # 不了)。改成和 su -c 一样走 root 权限读，规避掉这整类问题。
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "su"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "-c"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v1, v2, v3

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v6, 0x1000

    new-array v6, v6, [B

    :goto_readlog
    invoke-virtual {v4, v6}, Ljava/io/InputStream;->read([B)I

    move-result v7

    if-lez v7, :cond_readlog_done

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_readlog

    :cond_readlog_done
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    new-instance v7, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_readlog_nonempty

    const/4 v0, 0x0

    return-object v0

    :cond_readlog_nonempty
    const/16 v8, 0x1770

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-le v9, v8, :cond_1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v8

    invoke-virtual {v7, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    :cond_1
    move-object v1, v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    # 适配深色模式: 清单里写死的是 Theme.Material.Light，这里在构建任何
    # 界面控件之前，先检测系统当前是不是深色模式，是的话把 Activity 的
    # 主题临时切换成框架自带的 Theme.Material (深色)。整个界面全是代码
    # 现画的控件，没有一个地方手动写死过背景色/文字色，全都跟随当前
    # 主题的默认前景/背景色，所以只需要在这里切一次主题，后面所有控件
    # 自动跟着对；不需要逐个控件单独设置颜色。
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    sget v1, Landroid/content/res/Configuration;->UI_MODE_NIGHT_MASK:I

    and-int/2addr v0, v1

    sget v1, Landroid/content/res/Configuration;->UI_MODE_NIGHT_YES:I

    if-ne v0, v1, :cond_not_dark

    sget v0, Landroid/R$style;->Theme_Material:I

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTheme(I)V

    :cond_not_dark
    const-string v0, "keymouse"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v2, "lang"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_lang_seeded

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const-string v3, "ru"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_detect_not_ru

    const/4 v2, 0x1

    goto :cond_detect_done

    :cond_detect_not_ru
    const-string v3, "ja"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_detect_not_ja

    const/4 v2, 0x2

    goto :cond_detect_done

    :cond_detect_not_ja
    const-string v3, "zh"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_detect_done

    const/4 v2, 0x3

    :cond_detect_done
    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "lang"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_lang_seeded
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v0, "root":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x28

    const/16 v2, 0x3c

    const/16 v3, 0x28

    const/16 v4, 0x28

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v1, "title":Landroid/widget/TextView;
    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "enabled"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strEnableSwitch()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v3, v2}, Lcom/keymouse/tool/MainActivity;->addSwitchRow(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/Switch;

    move-result-object v2

    iput-object v2, p0, Lcom/keymouse/tool/MainActivity;->mSwitchEnable:Landroid/widget/Switch;

    # 总开关下面: 鼠标软开关 + 开关键(1~4键组合，一个按钮学完) + 红点 + 锁屏界面是否启用鼠标
    invoke-static {p0, v0}, Lcom/keymouse/tool/ToggleKeys;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    # 中间键按键映射 (不同手机中间键键码不同)
    invoke-static {p0, v0}, Lcom/keymouse/tool/ConfirmKey;->addTo(Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    iget-object v3, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v4, "moveStep"

    const/4 v5, 0x5

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strMoveSpeed()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x13

    invoke-direct {p0, v0, v4, v5, v3}, Lcom/keymouse/tool/MainActivity;->addSeekRow(Landroid/widget/LinearLayout;Ljava/lang/String;II)Landroid/widget/SeekBar;

    move-result-object v3

    iput-object v3, p0, Lcom/keymouse/tool/MainActivity;->mSeekMove:Landroid/widget/SeekBar;

    iget-object v4, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v5, "scrollStep"

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strScrollSpeed()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x9

    invoke-direct {p0, v0, v5, v6, v4}, Lcom/keymouse/tool/MainActivity;->addSeekRow(Landroid/widget/LinearLayout;Ljava/lang/String;II)Landroid/widget/SeekBar;

    move-result-object v4

    iput-object v4, p0, Lcom/keymouse/tool/MainActivity;->mSeekScroll:Landroid/widget/SeekBar;

    iget-object v5, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v6, "flip180"

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strFlipSwitch()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v0, v6, v5}, Lcom/keymouse/tool/MainActivity;->addChoiceRow(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/Switch;

    move-result-object v5

    iput-object v5, p0, Lcom/keymouse/tool/MainActivity;->mSwitchFlip:Landroid/widget/Switch;

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->makeAppsCard()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v5, p0, Lcom/keymouse/tool/MainActivity;->mBtnApps:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->makeDebCard()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v5, p0, Lcom/keymouse/tool/MainActivity;->mBtnDeb:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Lcom/keymouse/tool/KeyCustomCard;->build(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Lcom/keymouse/tool/CursorCard;->build(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->getLang()I

    move-result v6

    invoke-static {p0, v6}, Lcom/keymouse/tool/HoldSliders;->build(Landroid/content/Context;I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0, v6}, Lcom/keymouse/tool/SpeedSliders;->build(Landroid/content/Context;I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v5, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    const-string v6, "autostart"

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strAutostart()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v0, v6, v5}, Lcom/keymouse/tool/MainActivity;->addSwitchRow(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/Switch;

    move-result-object v5

    iput-object v5, p0, Lcom/keymouse/tool/MainActivity;->mSwitchAutostart:Landroid/widget/Switch;

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "English"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-string v8, "\u0420\u0443\u0441\u0441\u043a\u0438\u0439"

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-string v8, "\u65e5\u672c\u8a9e"

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-string v8, "\u4e2d\u6587"

    aput-object v8, v6, v7

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->getLang()I

    move-result v7

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strLangSwitch()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v0, v8, v6, v7}, Lcom/keymouse/tool/MainActivity;->addSpinnerRow(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v6

    iput-object v6, p0, Lcom/keymouse/tool/MainActivity;->mSpinnerLang:Landroid/widget/Spinner;

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .local v6, "footer":Landroid/widget/TextView;
    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->strFooter()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41400000    # 12.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v7, 0x0

    const/16 v8, 0x3c

    const/16 v9, 0x0

    const/16 v10, 0x0

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->build(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v9, Landroid/widget/ScrollView;

    invoke-direct {v9, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .local v9, "scroller":Landroid/widget/ScrollView;
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    invoke-virtual {v9, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v9}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    iget-object v5, p0, Lcom/keymouse/tool/MainActivity;->mSeekMove:Landroid/widget/SeekBar;

    invoke-virtual {v5}, Landroid/widget/SeekBar;->getProgress()I

    move-result v5

    const/4 v6, 0x1

    add-int/2addr v5, v6

    iget-object v6, p0, Lcom/keymouse/tool/MainActivity;->mSeekScroll:Landroid/widget/SeekBar;

    invoke-virtual {v6}, Landroid/widget/SeekBar;->getProgress()I

    move-result v6

    const/4 v7, 0x1

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/keymouse/tool/MainActivity;->mSwitchFlip:Landroid/widget/Switch;

    invoke-virtual {v7}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v7

    invoke-direct {p0, v5, v6, v7}, Lcom/keymouse/tool/MainActivity;->writeLiveConfig(IIZ)V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/keymouse/tool/MainActivity;->mUiReady:Z

    return-void
.end method


# virtual methods
# v75: 回到界面时，如果总开关是"开"但守护进程不在运行(重启手机/重装/更新后常见)，后台自动拉起。
# 守护进程在运行时什么都不做，不会打断鼠标模式。
.method protected onResume()V
    .locals 5

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_end

    const-string v1, "enabled"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_end

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mSeekMove:Landroid/widget/SeekBar;

    if-eqz v1, :cond_end

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mSeekScroll:Landroid/widget/SeekBar;

    if-eqz v2, :cond_end

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v1, v3

    add-int/2addr v2, v3

    new-instance v4, Lcom/keymouse/tool/Daemon;

    const/4 v0, 0x2

    invoke-direct {v4, p0, v1, v2, v0}, Lcom/keymouse/tool/Daemon;-><init>(Landroid/content/Context;III)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    :cond_end
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->applyLive()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mBtnApps:Landroid/view/View;

    if-ne p1, v0, :cond_not_apps

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keymouse/tool/AppListActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x7

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :cond_not_apps
    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mBtnDeb:Landroid/view/View;

    if-ne p1, v0, :cond_not_deb

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/keymouse/tool/DebounceActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x8

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :cond_not_deb
    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mBtnLog:Landroid/widget/Button;

    if-ne p1, v0, :cond_end

    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->toggle(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mBtnLog:Landroid/widget/Button;

    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Lcom/keymouse/tool/DebugLog;->hint(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_end
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 8
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mSwitchEnable:Landroid/widget/Switch;

    if-ne p1, v0, :cond_not_enable

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "enabled"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mSeekMove:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/keymouse/tool/MainActivity;->mSeekScroll:Landroid/widget/SeekBar;

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    const/4 v4, 0x1

    add-int/2addr v3, v4

    if-eqz p2, :cond_stop

    new-instance v4, Lcom/keymouse/tool/Daemon;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v2, v3, v5}, Lcom/keymouse/tool/Daemon;-><init>(Landroid/content/Context;III)V

    invoke-virtual {v4}, Lcom/keymouse/tool/Daemon;->start()V

    goto :cond_end

    :cond_stop
    new-instance v4, Lcom/keymouse/tool/Daemon;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v2, v3, v5}, Lcom/keymouse/tool/Daemon;-><init>(Landroid/content/Context;III)V

    invoke-virtual {v4}, Lcom/keymouse/tool/Daemon;->start()V

    goto :cond_end

    :cond_not_enable
    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mSwitchFlip:Landroid/widget/Switch;

    if-ne p1, v0, :cond_not_flip

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "flip180"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mSeekMove:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/keymouse/tool/MainActivity;->mSeekScroll:Landroid/widget/SeekBar;

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getProgress()I

    move-result v3

    const/4 v4, 0x1

    add-int/2addr v3, v4

    invoke-direct {p0, v2, v3, p2}, Lcom/keymouse/tool/MainActivity;->writeLiveConfig(IIZ)V

    goto :cond_end

    :cond_not_flip
    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mSwitchIme:Landroid/widget/Switch;

    if-ne p1, v0, :cond_not_ime

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "imeHide"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->applyLive()V

    goto :cond_end

    :cond_not_ime
    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mSwitchHome:Landroid/widget/Switch;

    if-ne p1, v0, :cond_not_home

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "homeHide"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->applyLive()V

    goto :cond_end

    :cond_not_home
    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mSwitchDialer:Landroid/widget/Switch;

    if-ne p1, v0, :cond_not_dialer

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "dialerAllow"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->applyLive()V

    goto :cond_end

    :cond_not_dialer
    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "autostart"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_end
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    iget-boolean v0, p0, Lcom/keymouse/tool/MainActivity;->mUiReady:Z

    if-nez v0, :cond_ready

    return-void

    :cond_ready
    invoke-direct {p0}, Lcom/keymouse/tool/MainActivity;->getLang()I

    move-result v0

    if-ne v0, p3, :cond_changed

    return-void

    :cond_changed
    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "lang"

    invoke-interface {v1, v2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .param p1, "parent"    # Landroid/widget/AdapterView;

    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    if-eqz p3, :cond_end

    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mSeekMove:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mSeekScroll:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mSwitchFlip:Landroid/widget/Switch;

    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/keymouse/tool/MainActivity;->writeLiveConfig(IIZ)V

    :cond_end
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 8
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/keymouse/tool/MainActivity;->mSeekMove:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/keymouse/tool/MainActivity;->mSeekScroll:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/keymouse/tool/MainActivity;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "moveStep"

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "scrollStep"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
