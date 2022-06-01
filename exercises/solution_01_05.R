# To get 3 graphs on a single window :
layout(matrix(1:3,1,3))

for (a in 5:7){
  boxplot(experts[,a], xlab=paste0("Boxplot of ", colnames(experts[a])))
  
  # Mean
  text(0.75,mean(experts[,a])+0.25, "mean", pos=2)
  abline(h=mean(experts[,a]))
  
  # Q1
  text(0.75,quantile(experts[,a], probs = 0.25)+0.25, "q1", pos=2)
  abline(h=quantile(experts[,a], probs = 0.25))
  
  # Q3
  text(0.75,quantile(experts[,a], probs = 0.75)+0.25, "q3", pos=2)
  abline(h=quantile(experts[,a], probs = 0.75))
  
  # Median
  text(0.75,quantile(experts[,a], probs = 0.5)+0.25, "Median", pos=2)
  abline(h=quantile(experts[,a], probs = 0.5))
  
}
