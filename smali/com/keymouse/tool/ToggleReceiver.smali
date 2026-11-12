.class public Lcom/keymouse/tool/ToggleReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ToggleReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private static addPickerButton(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/WindowManager;Landroid/view/View;Ljava/lang/String;I)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "row"    # Landroid/widget/LinearLayout;
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "wm"    # Landroid/view/WindowManager;
    .param p4, "root"    # Landroid/view/View;
    .param p5, "rotFilePath"    # Ljava/lang/String;
    .param p6, "value"    # I

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v1, 0x14

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    const v1, -0xc5c5c6    # 深灰色按钮背景 0xFF3A3A3A

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    new-instance v1, Lcom/keymouse/tool/RotationPickerClick;

    invoke-direct {v1, p3, p4, p5, p6}, Lcom/keymouse/tool/RotationPickerClick;-><init>(Landroid/view/WindowManager;Landroid/view/View;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 33
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    move-object/from16 v0, p1

    .local v0, "ctx":Landroid/content/Context;
    move-object/from16 v1, p2

    const-string v2, "tip"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_no_tip

    const-string v3, "dot_on"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_not_dot_on

    invoke-static {v0}, Lcom/keymouse/tool/PosDot;->start(Landroid/content/Context;)V

    return-void

    :cond_not_dot_on
    const-string v3, "dot_off"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_not_dot_off

    invoke-static {}, Lcom/keymouse/tool/PosDot;->stop()V

    return-void

    :cond_not_dot_off
    const-string v3, "arg"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/keymouse/tool/TipBubble;->show(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_no_tip
    const-string v2, "enabled"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .local v1, "enabled":Z
    if-eqz v1, :cond_dot_stop

    invoke-static {v0}, Lcom/keymouse/tool/PosDot;->start(Landroid/content/Context;)V

    goto :cond_dot_done

    :cond_dot_stop
    invoke-static {}, Lcom/keymouse/tool/PosDot;->stop()V

    :cond_dot_done
    const-string v2, "keymouse"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "lang"

    const/4 v9, 0x0

    invoke-interface {v2, v3, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v9, 0x3

    if-eq v3, v9, :cond_toggle_zh

    const/4 v3, 0x1

    goto :cond_toggle_lang_done

    :cond_toggle_zh
    const/4 v3, 0x0

    :cond_toggle_lang_done
    .local v3, "langEn":Z
    if-eqz v1, :cond_off

    if-eqz v3, :cond_on_zh

    const-string v4, "Key mouse ON"

    goto :goto_msg

    :cond_on_zh
    const-string v4, "\u6309\u952e\u9f20\u6807\u5df2\u5f00\u542f"

    goto :goto_msg

    :cond_off
    if-eqz v3, :cond_off_zh

    const-string v4, "Key mouse OFF"

    goto :goto_msg

    :cond_off_zh
    const-string v4, "\u6309\u952e\u9f20\u6807\u5df2\u5173\u95ed"

    :goto_msg
    .local v4, "msg":Ljava/lang/String;

    :try_start_0
    const-string v5, "window"

    invoke-virtual {v0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/WindowManager;

    .local v5, "wm":Landroid/view/WindowManager;
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "/keymouse_manual_rot.cfg"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .local v6, "rotFilePath":Ljava/lang/String;
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v7, "container":Landroid/widget/LinearLayout;
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v8, 0x1e

    invoke-virtual {v7, v8, v8, v8, v8}, Landroid/view/View;->setPadding(IIII)V

    const v8, -0xddddde    # 实心深灰背景 0xFF222222 (原来是半透明0xCC，
                            # 会透出底下 Activity 的文字造成重叠看不清，改成完全不透明)

    invoke-virtual {v7, v8}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v9, -0x1

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # 关闭时只显示一行提示，不显示方向选择按钮
    if-eqz v1, :cond_skip_picker

    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    if-eqz v3, :cond_hint_en

    const-string v10, "\u65b9\u5411\u4e0d\u5bf9\u53ef\u70b9\u51fb\u4e0b\u65b9\u624b\u52a8\u9009\u62e9\uff1a"

    goto :goto_hint

    :cond_hint_en
    const-string v10, "Tap below to fix direction:"

    :goto_hint
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v10, -0x333334    # 浅灰色 0xFFCCCCCC

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v10, 0x41400000    # 12.0f

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v10, 0x0

    const/16 v11, 0xc

    invoke-virtual {v9, v10, v11, v10, v10}, Landroid/view/View;->setPadding(IIII)V

    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v10, "row":Landroid/widget/LinearLayout;
    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v7, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v7, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move-object/from16 v16, v11

    if-eqz v3, :cond_lbl_zh

    const-string v11, "Auto"

    const-string v12, "Port"

    const-string v13, "Port180"

    const-string v14, "Land"

    const-string v15, "Land180"

    goto :goto_lbl

    :cond_lbl_zh
    const-string v11, "\u81ea\u52a8"

    const-string v12, "\u7ad6\u5c4f\u6b63"

    const-string v13, "\u7ad6\u5c4f\u5012"

    const-string v14, "\u6a2a\u5c4f\u6b63"

    const-string v15, "\u6a2a\u5c4f\u5012"

    :goto_lbl
    move-object/from16 v20, v0

    move-object/from16 v21, v10

    move-object/from16 v22, v11

    move-object/from16 v23, v5

    move-object/from16 v24, v7

    move-object/from16 v25, v6

    const/16 v26, -0x1

    invoke-static/range {v20 .. v26}, Lcom/keymouse/tool/ToggleReceiver;->addPickerButton(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/WindowManager;Landroid/view/View;Ljava/lang/String;I)V

    move-object/from16 v22, v12

    const/16 v26, 0x0

    invoke-static/range {v20 .. v26}, Lcom/keymouse/tool/ToggleReceiver;->addPickerButton(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/WindowManager;Landroid/view/View;Ljava/lang/String;I)V

    move-object/from16 v22, v13

    const/16 v26, 0x2

    invoke-static/range {v20 .. v26}, Lcom/keymouse/tool/ToggleReceiver;->addPickerButton(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/WindowManager;Landroid/view/View;Ljava/lang/String;I)V

    move-object/from16 v21, v16

    move-object/from16 v22, v14

    const/16 v26, 0x1

    invoke-static/range {v20 .. v26}, Lcom/keymouse/tool/ToggleReceiver;->addPickerButton(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/WindowManager;Landroid/view/View;Ljava/lang/String;I)V

    move-object/from16 v22, v15

    const/16 v26, 0x3

    invoke-static/range {v20 .. v26}, Lcom/keymouse/tool/ToggleReceiver;->addPickerButton(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;Landroid/view/WindowManager;Landroid/view/View;Ljava/lang/String;I)V

    :cond_skip_picker
    new-instance v27, Landroid/view/WindowManager$LayoutParams;

    const/16 v28, -0x2

    const/16 v29, -0x2

    const/16 v30, 0x7f6

    # 实测反馈: 点击"竖屏正/竖屏倒/横屏正/横屏倒"这几个按钮完全没反应。
    # 根因: 这里原来传的 flags=0x118 = FLAG_LAYOUT_IN_SCREEN(0x100) |
    # FLAG_NOT_TOUCHABLE(0x10) | FLAG_NOT_FOCUSABLE(0x08) —— 其中
    # FLAG_NOT_TOUCHABLE 会让整个悬浮窗直接忽略所有触摸事件、原样穿透给
    # 下面的 MainActivity，这个弹窗从一开始就收不到任何点击，跟按钮本身
    # 的 onClick 逻辑对不对完全无关。这个 flag 组合更像是最早只做"纯提示
    # 用 Toast 式悬浮窗、不需要交互"时留下的，后来加了可点击的方向按钮，
    # 但没有把这里的 flags 一并改成"可触摸"。改成只保留
    # FLAG_LAYOUT_IN_SCREEN(0x100)，去掉 NOT_TOUCHABLE / NOT_FOCUSABLE，
    # 弹窗才能真正接收到点击。
    # 0x128 = LAYOUT_IN_SCREEN(0x100) | NOT_TOUCH_MODAL(0x20) | NOT_FOCUSABLE(0x08)
    # 方向按钮仍可点击；但不再抢走下面应用的输入焦点(原来只有 0x100，
    # 弹窗显示的 3 秒里会让前台应用失去焦点: 视频/游戏暂停、输入法收起、按键被弹窗吃掉)。
    const/16 v31, 0x128

    if-nez v1, :cond_flags_ok

    # 关闭提示不需要接收触摸: NOT_FOCUSABLE|NOT_TOUCHABLE|LAYOUT_IN_SCREEN
    const/16 v31, 0x118

    :cond_flags_ok

    const/16 v32, -0x3

    invoke-direct/range {v27 .. v32}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    move-object/from16 v13, v27

    .local v13, "lp":Landroid/view/WindowManager$LayoutParams;
    const/16 v2, 0x31

    iput v2, v13, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/16 v2, 0x28

    iput v2, v13, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-interface {v5, v7, v13}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v27, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v28

    move-object/from16 v11, v27

    move-object/from16 v12, v28

    invoke-direct {v11, v12}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v27, Lcom/keymouse/tool/OverlayDismiss;

    move-object/from16 v14, v27

    invoke-direct {v14, v5, v7}, Lcom/keymouse/tool/OverlayDismiss;-><init>(Landroid/view/WindowManager;Landroid/view/View;)V

    const-wide/16 v8, 0xbb8

    invoke-virtual {v11, v14, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v5

    .local v5, "e":Ljava/lang/Exception;
    const/4 v6, 0x0

    invoke-static {v0, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    return-void
.end method
