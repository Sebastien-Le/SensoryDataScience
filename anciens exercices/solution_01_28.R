library(FactoMineR)
res<-PCA(scale(means.variables), graph = FALSE, scale.unit = F)
res$ind$coord
res$var$coord
