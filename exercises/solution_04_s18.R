names(res.mfa)
res.mfa$eig
names(res.mfa)
names(res.mfa$freq)
as.data.frame(res.mfa$freq$coord)
rownames(res.mfa$freq$coord)
type <- c(rep("cata",19),rep("jar",40))
coord.freq <- cbind(as.data.frame(res.mfa$freq$coord),type)