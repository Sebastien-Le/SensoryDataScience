res.mca <- MCA(goji, quali.sup = _:_, quanti.sup = _:_, graph = F)
plot.MCA(res.mca)
plot.MCA(res.mca, invisible = c("var", "quali.sup"), label = "no")