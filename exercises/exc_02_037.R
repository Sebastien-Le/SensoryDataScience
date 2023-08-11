summary(GMO)
library(FactoMineR)
res.mca <- MCA(GMO, quali.sup = c(__:__), graph = F)
print("Done!")