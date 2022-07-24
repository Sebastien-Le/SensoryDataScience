res.pca <- PCA(prod.Sentiment, graph = FALSE)
plot.PCA(res.pca)
plot.PCA(res.pca, choix = "var")