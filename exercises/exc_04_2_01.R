goji <- read.csv2("data/goji.csv")
summary(goji)     
for (j in 1:10) goji[,j] <- as.factor(goji[,j])
summary(goji)