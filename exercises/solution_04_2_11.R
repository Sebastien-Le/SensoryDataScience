res.mca <- MCA(goji, quali.sup = 1:6, quanti.sup = 13:14, graph = F)
plot.MCA(res.mca)
plot.MCA(res.mca, invisible = c("var", "quali.sup"), label = "no")