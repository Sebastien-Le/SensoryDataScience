dispersion <- data.frame("mean"=double(), "sd"=double(), "median"=double(), "q1"=double(), "q3"=double())

for (a in 5:16){
  mean <- mean(experts[,a])
  sd <- sqrt(var(experts[,a]))
  med <- quantile(experts[,a], 0.5)
  q1 <- quantile(experts[,a], 0.25)
  q3 <- quantile(experts[,a], 0.75)
  dispersion <- rbind(dispersion, c(mean, sd, med, q1, q3))
}

colnames(dispersion) <- c("mean", "sd", "median", "q1", "q3")
rownames(dispersion) <- colnames(experts[,5:16])