disp.parameters <- data.frame("range" = double(), "IQR" = double(), "std" = double(), "v" = double())
for (j in 5:16){
  range <- ____(experts[,j])-min(experts[,_])
  IQR <- quantile(experts[,_], __)-quantile(experts[,_], __)
  std <- sd(experts[,_])
  v <- var(experts[,_])
  disp.parameters <- rbind(disp.parameters, c(range,IQR,std,v))
}
colnames(disp.parameters) <- c("range","IQR","std","v")
disp.parameters