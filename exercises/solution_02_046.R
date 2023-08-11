set.seed(47)
res.mca <- MCA(GMO, quali.sup = c(17:21), graph = F, level.ventil = 0.05, ncp = 15)
res.hcpc <- HCPC(res.mca, nb.clust = -1, graph = F)
plot.HCPC(res.hcpc, choice = "map", draw.tree = F)