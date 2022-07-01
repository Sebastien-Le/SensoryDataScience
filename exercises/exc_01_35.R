disp.parameters <- data.frame("range" = double(), "IQR" = double(), "std" = double(), "v" = double())

for (j in 5:16){
  range <- ___(experts[_,_])-___(experts[_,_])
  IQR <- quantile(experts[_,_], ___)-quantile(experts[_,_], ___)
  std <- sd(experts[_,_])
  v <- var(experts[_,_])
  disp.parameters <- rbind(disp.parameters, c(range, IQR, std, v))
}

colnames(disp.parameters) <- c("range","IQR", "std", "v")
disp.parameters