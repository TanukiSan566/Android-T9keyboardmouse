.class Lcom/keymouse/tool/KmExclActivity$5;
.super Ljava/lang/Object;
.source "KmExclActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keymouse/tool/KmExclActivity;->load()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keymouse/tool/KmExclActivity;

.field final synthetic val$h:Landroid/os/Handler;

.field final synthetic val$hidden:Z


# direct methods
.method constructor <init>(Lcom/keymouse/tool/KmExclActivity;ZLandroid/os/Handler;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 203
    iput-object p1, p0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    iput-boolean p2, p0, Lcom/keymouse/tool/KmExclActivity$5;->val$hidden:Z

    iput-object p3, p0, Lcom/keymouse/tool/KmExclActivity$5;->val$h:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    .line 205
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 207
    :try_start_5
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-virtual {v0}, Lcom/keymouse/tool/KmExclActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 208
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 209
    new-instance v0, Landroid/content/Intent;

    const-string v4, "android.intent.action.MAIN"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 210
    const-string v4, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 211
    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_25
    :goto_25
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    .line 212
    iget-object v5, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 213
    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_25

    iget-object v6, p0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-virtual {v6}, Lcom/keymouse/tool/KmExclActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_25

    .line 216
    new-instance v6, Lcom/keymouse/tool/KmExclActivity$Item;

    invoke-direct {v6}, Lcom/keymouse/tool/KmExclActivity$Item;-><init>()V

    .line 217
    iput-object v5, v6, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    .line 218
    invoke-virtual {v0, v2}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v6, Lcom/keymouse/tool/KmExclActivity$Item;->label:Ljava/lang/String;

    .line 219
    invoke-virtual {v0, v2}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, v6, Lcom/keymouse/tool/KmExclActivity$Item;->icon:Landroid/graphics/drawable/Drawable;

    .line 220
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_61
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_61} :catch_62

    goto :goto_25

    .line 244
    :catch_62
    move-exception v0

    .line 246
    :cond_63
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$5;->val$h:Landroid/os/Handler;

    new-instance v2, Lcom/keymouse/tool/KmExclActivity$5$1;

    invoke-direct {v2, p0, v1}, Lcom/keymouse/tool/KmExclActivity$5$1;-><init>(Lcom/keymouse/tool/KmExclActivity$5;Ljava/util/List;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 254
    return-void

    .line 222
    :cond_6e
    :try_start_6e
    iget-boolean v0, p0, Lcom/keymouse/tool/KmExclActivity$5;->val$hidden:Z

    if-eqz v0, :cond_ba

    .line 223
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_7b
    :goto_7b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_ba

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 224
    iget-object v5, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7b

    iget-object v5, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v6, p0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    invoke-virtual {v6}, Lcom/keymouse/tool/KmExclActivity;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7b

    .line 227
    new-instance v5, Lcom/keymouse/tool/KmExclActivity$Item;

    invoke-direct {v5}, Lcom/keymouse/tool/KmExclActivity$Item;-><init>()V

    .line 228
    iget-object v6, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iput-object v6, v5, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    .line 229
    invoke-virtual {v0, v2}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/keymouse/tool/KmExclActivity$Item;->label:Ljava/lang/String;

    .line 230
    invoke-virtual {v0, v2}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, v5, Lcom/keymouse/tool/KmExclActivity$Item;->icon:Landroid/graphics/drawable/Drawable;

    .line 231
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7b

    .line 235
    :cond_ba
    iget-object v0, p0, Lcom/keymouse/tool/KmExclActivity$5;->this$0:Lcom/keymouse/tool/KmExclActivity;

    # getter for: Lcom/keymouse/tool/KmExclActivity;->mSel:Ljava/util/Set;
    invoke-static {v0}, Lcom/keymouse/tool/KmExclActivity;->access$500(Lcom/keymouse/tool/KmExclActivity;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_c4
    :goto_c4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_63

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 236
    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c4

    .line 237
    new-instance v5, Lcom/keymouse/tool/KmExclActivity$Item;

    invoke-direct {v5}, Lcom/keymouse/tool/KmExclActivity$Item;-><init>()V

    .line 238
    iput-object v0, v5, Lcom/keymouse/tool/KmExclActivity$Item;->pkg:Ljava/lang/String;

    .line 239
    iput-object v0, v5, Lcom/keymouse/tool/KmExclActivity$Item;->label:Ljava/lang/String;

    .line 240
    invoke-virtual {v2}, Landroid/content/pm/PackageManager;->getDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, v5, Lcom/keymouse/tool/KmExclActivity$Item;->icon:Landroid/graphics/drawable/Drawable;

    .line 241
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_e8
    .catch Ljava/lang/Throwable; {:try_start_6e .. :try_end_e8} :catch_62

    goto :goto_c4
.end method
