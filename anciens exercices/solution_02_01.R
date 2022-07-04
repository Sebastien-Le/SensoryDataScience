GMO <- read.csv("data/gmo.csv", sep=';')
for (i in 1:21)
{
    GMO[, i] <- as.factor(GMO[, i])
}
summary(GMO)