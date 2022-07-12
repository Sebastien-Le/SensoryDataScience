par(mfrow=c(1,3))
for (j in 5:7) {
  boxplot(experts[,j], main = colnames(experts)[j])
  abline(h=mean(experts[,j]))
}