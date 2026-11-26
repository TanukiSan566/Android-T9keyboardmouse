.class final Lcom/keymouse/tool/KmCfg;
.super Ljava/lang/Object;
.source "KmCfg.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method static L(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 33
    const-string v0, "keymouse"

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 34
    const-string v1, "lang"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 35
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    :goto_0
    return-object p2

    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    move-object p2, p3

    goto :goto_0

    :cond_1
    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    move-object p2, p4

    goto :goto_0

    :cond_2
    move-object p2, p1

    goto :goto_0
.end method

.method static ensure(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 205
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 206
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/keymouse/tool/KmCfg;->readLines(Ljava/io/File;)Ljava/util/Map;

    move-result-object v0

    const-string v1, "maps"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 207
    :cond_0
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->load(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/keymouse/tool/KmCfg;->save(Landroid/content/Context;Ljava/util/Map;)V

    .line 209
    :cond_1
    return-void
.end method

.method static exclCount(Ljava/util/Map;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 212
    const-string v0, "excl"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 213
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 214
    :cond_0
    const/4 v0, 0x0

    .line 216
    :goto_0
    return v0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    goto :goto_0
.end method

.method static file(Landroid/content/Context;)Ljava/io/File;
    .locals 3

    .prologue
    .line 29
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "keymouse_keymap.cfg"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method static geti(Ljava/util/Map;Ljava/lang/String;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    .prologue
    .line 40
    :try_start_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result p2

    .line 42
    :goto_0
    return p2

    .line 41
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method static load(Landroid/content/Context;)Ljava/util/Map;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    const/4 v14, 0x1

    const/4 v13, 0x3

    const/4 v3, 0x0

    .line 69
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 71
    new-array v5, v13, [I

    fill-array-data v5, :array_0

    .line 72
    new-array v6, v13, [I

    fill-array-data v6, :array_1

    .line 73
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 74
    invoke-static {v0}, Lcom/keymouse/tool/KmCfg;->readLines(Ljava/io/File;)Ljava/util/Map;

    move-result-object v0

    .line 88
    :cond_0
    const-string v1, "kmOn"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 89
    const-string v1, "kmOn"

    const-string v2, "1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    :cond_1
    new-array v7, v13, [Ljava/lang/String;

    const-string v1, "menu"

    aput-object v1, v7, v3

    const-string v1, "back"

    aput-object v1, v7, v14

    const-string v1, "star"

    aput-object v1, v7, v10

    .line 92
    new-array v8, v13, [Ljava/lang/String;

    const-string v1, "139"

    aput-object v1, v8, v3

    const-string v1, "158"

    aput-object v1, v8, v14

    const-string v1, "S"

    aput-object v1, v8, v10

    .line 93
    const-string v1, "maps"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 94
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    move v4, v3

    move v2, v3

    .line 96
    :goto_0
    if-ge v4, v13, :cond_5

    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v10, v7, v4

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v10, "Act"

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aget v10, v6, v4

    invoke-static {v0, v1, v10}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v10

    .line 98
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v11, v7, v4

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v11, "Ms"

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aget v11, v5, v4

    invoke-static {v0, v1, v11}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v1

    .line 99
    if-lt v10, v14, :cond_d

    const/4 v11, 0x5

    if-gt v10, v11, :cond_d

    .line 100
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    if-lez v11, :cond_2

    .line 101
    const/16 v11, 0x3b

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 103
    :cond_2
    aget-object v11, v8, v4

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0x3a

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    if-nez v2, :cond_d

    .line 96
    :goto_1
    add-int/lit8 v4, v4, 0x1

    move v2, v1

    goto :goto_0

    .line 76
    :cond_3
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 77
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v4, "keymouse_hold.cfg"

    invoke-direct {v1, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/keymouse/tool/KmCfg;->readLines(Ljava/io/File;)Ljava/util/Map;

    move-result-object v2

    .line 78
    new-array v4, v13, [Ljava/lang/String;

    const-string v1, "menuHold"

    aput-object v1, v4, v3

    const-string v1, "backHold"

    aput-object v1, v4, v14

    const-string v1, "starHold"

    aput-object v1, v4, v10

    move v1, v3

    .line 79
    :goto_2
    if-ge v1, v13, :cond_0

    .line 80
    aget-object v7, v4, v1

    aget v8, v5, v1

    invoke-static {v2, v7, v8}, Lcom/keymouse/tool/KmCfg;->geti(Ljava/util/Map;Ljava/lang/String;I)I

    move-result v7

    .line 81
    if-gtz v7, :cond_4

    .line 82
    aput v3, v6, v1

    .line 79
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 84
    :cond_4
    const/16 v8, 0x1f4

    const/16 v9, 0x1388

    invoke-static {v9, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v8, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    aput v7, v5, v1

    goto :goto_3

    .line 109
    :cond_5
    const-string v1, "maps"

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const-string v1, "holdMs"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 111
    const-string v1, "holdMs"

    if-lez v2, :cond_7

    :goto_4
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    move v1, v3

    .line 114
    :goto_5
    if-ge v1, v13, :cond_8

    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, v7, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Act"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, v7, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Ms"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 111
    :cond_7
    const/16 v2, 0x5dc

    goto :goto_4

    .line 118
    :cond_8
    const-string v1, "holdMs"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 119
    const-string v1, "holdMs"

    const-string v2, "1500"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    :cond_9
    const-string v1, "lockOk"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 122
    const-string v1, "lockOk"

    const-string v2, "1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    :cond_a
    const-string v1, "sleepOk"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 125
    const-string v1, "sleepOk"

    const-string v2, "1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    :cond_b
    const-string v1, "excl"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 128
    const-string v1, "excl"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    :cond_c
    return-object v0

    :cond_d
    move v1, v2

    goto/16 :goto_1

    .line 71
    nop

    :array_0
    .array-data 4
        0x5dc
        0x5dc
        0x7d0
    .end array-data

    .line 72
    :array_1
    .array-data 4
        0x1
        0x2
        0x3
    .end array-data
.end method

.method static parseMaps(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<[I>;"
        }
    .end annotation

    .prologue
    .line 135
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 136
    if-nez p0, :cond_0

    move-object v0, v2

    .line 165
    :goto_0
    return-object v0

    .line 139
    :cond_0
    const-string v0, ";"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    const/4 v0, 0x0

    move v5, v0

    :goto_1
    if-ge v5, v7, :cond_6

    aget-object v0, v6, v5

    .line 141
    const/16 v1, 0x3a

    :try_start_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 142
    if-gtz v1, :cond_2

    .line 139
    :cond_1
    :goto_2
    add-int/lit8 v0, v5, 0x1

    move v5, v0

    goto :goto_1

    .line 145
    :cond_2
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 146
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 147
    array-length v0, v9

    add-int/lit8 v0, v0, 0x1

    new-array v10, v0, [I

    .line 148
    const/4 v1, 0x0

    .line 149
    const/4 v0, 0x1

    aput v8, v10, v1

    .line 150
    array-length v11, v9

    const/4 v1, 0x0

    move v4, v1

    :goto_3
    if-ge v4, v11, :cond_5

    aget-object v1, v9, v4

    .line 151
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 152
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    .line 150
    :goto_4
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_3

    .line 155
    :cond_3
    add-int/lit8 v1, v0, 0x1

    const-string v12, "S"

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    const/4 v3, -0x1

    :goto_5
    aput v3, v10, v0

    move v0, v1

    goto :goto_4

    :cond_4
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_5

    .line 157
    :cond_5
    const/4 v1, 0x2

    if-lt v0, v1, :cond_1

    const/4 v1, 0x5

    if-gt v0, v1, :cond_1

    const/4 v1, 0x1

    if-lt v8, v1, :cond_1

    const/4 v1, 0x5

    if-gt v8, v1, :cond_1

    .line 158
    new-array v1, v0, [I

    .line 159
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v10, v3, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 162
    :catch_0
    move-exception v0

    goto :goto_2

    :cond_6
    move-object v0, v2

    .line 165
    goto :goto_0
.end method

.method private static readLines(Ljava/io/File;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 49
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const-string v4, "UTF-8"

    invoke-direct {v0, v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 53
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 54
    if-lez v3, :cond_0

    .line 55
    const/4 v4, 0x0

    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 60
    throw v0

    .line 61
    :catch_0
    move-exception v0

    .line 63
    :goto_1
    return-object v1

    .line 59
    :cond_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1
.end method

.method static save(Landroid/content/Context;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 187
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 189
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v4, 0x3d

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 198
    :catch_0
    move-exception v0

    .line 200
    :goto_1
    return-void

    .line 191
    :cond_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "UTF-8"

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 195
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 197
    invoke-static {p0}, Lcom/keymouse/tool/KmCfg;->file(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setReadable(ZZ)Z

    goto :goto_1

    .line 195
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 196
    throw v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
.end method

.method static serializeMaps(Ljava/util/List;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[I>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 169
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 171
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 172
    const/16 v1, 0x3b

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_0
    move v1, v2

    .line 174
    :goto_1
    array-length v3, v0

    if-ge v1, v3, :cond_3

    .line 175
    if-le v1, v2, :cond_1

    .line 176
    const/16 v3, 0x2c

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 178
    :cond_1
    aget v3, v0, v1

    if-gez v3, :cond_2

    const-string v3, "S"

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 178
    :cond_2
    aget v3, v0, v1

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 180
    :cond_3
    const/16 v1, 0x3a

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v3, 0x0

    aget v0, v0, v3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 182
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
