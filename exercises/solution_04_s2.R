colnames(sennheiser)[30] <- "Serious"
for (j in c(1:30,33:35)) sennheiser[,j] <- as.factor(sennheiser[,j])
summary(sennheiser)