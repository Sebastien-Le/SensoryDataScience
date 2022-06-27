par(mfrow=c(1,3))
for (j in colnames(experts[,5:7])) boxplot(experts[,j],main=j)