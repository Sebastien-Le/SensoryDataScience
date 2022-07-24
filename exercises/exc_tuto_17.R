res.pca <- PCA(prod.Liking, graph = FALSE)
plot.PCA(res.pca)
plot.PCA(res.pca, choix = "var")