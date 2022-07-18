for (j in c(1:2,4:9)) orange[,j] <- as.factor(orange[,j])
levels(orange$Consumer)
nlevels(orange$Consumer)