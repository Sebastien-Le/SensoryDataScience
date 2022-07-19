res.mca <- MCA(orange, quanti.sup = 3, quali.sup = 1:2, graph = F)
plot.MCA(res.mca, invisible = c("var","quali.sup"), label = "none", title = "Understanding defects profiles (ind.)")
plot.MCA(res.mca, invisible = c("ind","var"), label = "none", title = "Understanding defects profiles (sup. var.)")