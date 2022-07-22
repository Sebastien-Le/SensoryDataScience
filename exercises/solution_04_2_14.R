res.mca <- MCA(goji[,-c(1:3)], quali.sup = 1:3, quanti.sup = 10:11, graph = F, level.ventil = 0.1)
plot.MCA(res.mca, invisible = "ind")