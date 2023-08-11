set.seed(47)
res.mca <- MCA(GMO, quali.sup = c(17:21), graph = F, level.ventil = 0.05)
print("Done!")