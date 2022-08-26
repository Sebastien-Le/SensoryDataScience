#
sd(experts$Fruity)
var(experts$Fruity)
sd(experts$Fruity)^2

#
disp.parameters <- data.frame("range" = double(), "IQR" = double(), "std" = double(), "v" = double())
for (j in 5:16){
  range <- max(experts[,j])-min(experts[,j])
  IQR <- quantile(experts[,j], 0.75)-quantile(experts[,j], 0.25)
  std <- sd(experts[,j])
  v <- var(experts[,j])
  disp.parameters <- rbind(disp.parameters, c(range,IQR,std,v))
}
colnames(disp.parameters) <- c("range","IQR","std","v")
disp.parameters