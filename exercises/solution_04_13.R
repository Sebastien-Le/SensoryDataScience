res.mca <- MCA(orange[,-1], quanti.sup = 2, quali.sup = 1, graph = F)
plot.MCA(res.mca, invisible = c("ind","var"), title = "Understanding defects profiles (sup. var.)")
plot.MCA(res.mca, choix = "quanti.sup", title = "Understanding defects profiles (sup. var.)")