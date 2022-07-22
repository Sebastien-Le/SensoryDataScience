res.mca <- MCA(orange, quanti.sup = 3, quali.sup = 1:2, graph = F)
plot.MCA(res.mca, invisible = c("____","____"), label = "none", title = "Understanding defects profiles (ind.)")
plot.MCA(res.mca, invisible = c("____","____"), label = "none", title = "Understanding defects profiles (sup. var.)")