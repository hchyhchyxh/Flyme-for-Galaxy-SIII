.class public Lcom/android/server/pm/IntentFilterVerificationState;
.super Ljava/lang/Object;
.source "IntentFilterVerificationState.java"


# static fields
.field public static final STATE_UNDEFINED:I = 0x0

.field public static final STATE_VERIFICATION_FAILURE:I = 0x3

.field public static final STATE_VERIFICATION_PENDING:I = 0x1

.field public static final STATE_VERIFICATION_SUCCESS:I = 0x2

.field static final TAG:Ljava/lang/String;


# instance fields
.field private mFilters:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/PackageParser$ActivityIntentInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mHosts:Landroid/util/ArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArraySet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPackageName:Ljava/lang/String;

.field private mRequiredVerifierUid:I

.field private mState:I

.field private mUserId:I

.field private mVerificationComplete:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/android/server/pm/IntentFilterVerificationState;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/IntentFilterVerificationState;->TAG:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 2
    .param p1, "verifierUid"    # I
    .param p2, "userId"    # I
    .param p3, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput v1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mRequiredVerifierUid:I

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mFilters:Ljava/util/ArrayList;

    .line 39
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mHosts:Landroid/util/ArraySet;

    .line 46
    iput p1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mRequiredVerifierUid:I

    .line 47
    iput p2, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mUserId:I

    .line 48
    iput-object p3, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mPackageName:Ljava/lang/String;

    .line 49
    iput v1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mState:I

    .line 50
    iput-boolean v1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mVerificationComplete:Z

    .line 45
    return-void
.end method


# virtual methods
.method public addFilter(Landroid/content/pm/PackageParser$ActivityIntentInfo;)V
    .locals 2
    .param p1, "filter"    # Landroid/content/pm/PackageParser$ActivityIntentInfo;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mFilters:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    iget-object v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mHosts:Landroid/util/ArraySet;

    invoke-virtual {p1}, Landroid/content/pm/PackageParser$ActivityIntentInfo;->getHostsList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/ArraySet;->addAll(Ljava/util/Collection;)Z

    .line 121
    return-void
.end method

.method public getFilters()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/pm/PackageParser$ActivityIntentInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mFilters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getHostsString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mHosts:Landroid/util/ArraySet;

    invoke-virtual {v3}, Landroid/util/ArraySet;->size()I

    move-result v0

    .line 95
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 96
    if-lez v1, :cond_0

    .line 97
    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    :cond_0
    iget-object v3, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mHosts:Landroid/util/ArraySet;

    invoke-virtual {v3, v1}, Landroid/util/ArraySet;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 101
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mState:I

    return v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mUserId:I

    return v0
.end method

.method public isVerificationComplete()Z
    .locals 1

    .prologue
    .line 74
    iget-boolean v0, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mVerificationComplete:Z

    return v0
.end method

.method public isVerified()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 78
    iget-boolean v1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mVerificationComplete:Z

    if-eqz v1, :cond_1

    .line 79
    iget v1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 81
    :cond_1
    return v0
.end method

.method public setPendingState()V
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/server/pm/IntentFilterVerificationState;->setState(I)V

    .line 65
    return-void
.end method

.method public setState(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    const/4 v1, 0x0

    .line 54
    const/4 v0, 0x3

    if-gt p1, v0, :cond_0

    if-gez p1, :cond_1

    .line 55
    :cond_0
    iput v1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mState:I

    .line 53
    :goto_0
    return-void

    .line 57
    :cond_1
    iput p1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mState:I

    goto :goto_0
.end method

.method public setVerifierResponse(II)Z
    .locals 4
    .param p1, "callerUid"    # I
    .param p2, "code"    # I

    .prologue
    const/4 v2, 0x1

    .line 105
    iget v1, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mRequiredVerifierUid:I

    if-ne v1, p1, :cond_2

    .line 106
    const/4 v0, 0x0

    .line 107
    .local v0, "state":I
    if-ne p2, v2, :cond_1

    .line 108
    const/4 v0, 0x2

    .line 112
    :cond_0
    :goto_0
    iput-boolean v2, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mVerificationComplete:Z

    .line 113
    invoke-virtual {p0, v0}, Lcom/android/server/pm/IntentFilterVerificationState;->setState(I)V

    .line 114
    return v2

    .line 109
    :cond_1
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 110
    const/4 v0, 0x3

    goto :goto_0

    .line 116
    .end local v0    # "state":I
    :cond_2
    sget-object v1, Lcom/android/server/pm/IntentFilterVerificationState;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Cannot set verifier response with callerUid:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " and code:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 117
    const-string/jumbo v3, " as required verifierUid is:"

    .line 116
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 117
    iget v3, p0, Lcom/android/server/pm/IntentFilterVerificationState;->mRequiredVerifierUid:I

    .line 116
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    const/4 v1, 0x0

    return v1
.end method
