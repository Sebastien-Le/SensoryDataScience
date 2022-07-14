dist.prod <- as.matrix(dist(res.cr))
heatmap(dist.prod, symm = TRUE)