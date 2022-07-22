orange$Liking.cat <- ____(orange$Liking)
res.mca <- MCA(orange[,-1], quanti.sup = 2, quali.sup = c(1,9), graph = F)
plot.MCA(res.mca, invisible = c("ind","var"), title = "Understanding defects profiles (sup. var.)")