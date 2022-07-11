GMO <- read.csv("data/gmo.csv", sep = ';', header = TRUE)
for (j in 1:ncol(GMO)) GMO[, j] <- as.factor(GMO[, j])