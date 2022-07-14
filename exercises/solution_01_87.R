res.pca <- PCA(res.decat$adjmean, graph = FALSE)
plot.PCA(res.pca)