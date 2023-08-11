summary(GMO)
library(FactoMineR)
res.mca <- MCA(GMO, quali.sup = c(17:21), graph = F)
print("Done!")