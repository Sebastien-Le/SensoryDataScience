GMO <- read.csv("data/gmo.csv", sep=';', header = TRUE)
summary(GMO)
#transform into factor
for (j in 1:21)
{
    GMO[, j] <- as.factor(GMO[, j])
}
