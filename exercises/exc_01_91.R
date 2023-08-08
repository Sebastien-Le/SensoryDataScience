data(wine)
wine_quanti <- wine[, -c(1,2,30,31)]

group1 <- wine_quanti[, 1:5]
group2 <- wine_quanti[, 6:8]
group3 <- wine_quanti[, 9:18]
group4 <- wine_quanti[, 19:27]

# PCA on each group
res.pca1 <- PCA(group1, graph=F)
res.pca2 <- PCA(group2, graph=F)
res.pca3 <- PCA(group3, graph=F)
res.pca4 <- PCA(group4, graph=F)

# First eigenvalue of each PCA
egv1 <- res.pca1$eig[1]
egv2 <- res.pca2$eig[1]
egv3 <- res.pca3$eig[1]
egv4 <- res.pca4$eig[1]

# Vector of weights
weight.mfa <- 1/c(rep(egv1,5),rep(egv2,3),rep(egv3,10),rep(egv4,9))

res.pca <- PCA(wine_quanti, col.w = weight.mfa, graph=F)
res.pca$ind$coord

res.mfa <- MFA(wine_quanti, group=c(5,3,10,9), type=c("s","s","s","s"), graph=F)
res.mfa$ind$coord