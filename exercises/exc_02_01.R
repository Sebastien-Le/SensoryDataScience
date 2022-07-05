GMO <- read.csv("data/gmo.csv", sep=';')
GMO<-GMO[-136,]
#transform into factor
for (i in 1:21)
{
    GMO[, i] <- as.factor(GMO[, i])
}
