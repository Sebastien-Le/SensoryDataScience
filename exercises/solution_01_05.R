layout(matrix(1:6,2,3))

for (a in 5:16){
  boxplot(experts[,a], xlab=paste0("Boxplot of ", colnames(experts[a])))
  abline(h = mean(experts[,a]), col="red", lwd=3, lty=3)
}