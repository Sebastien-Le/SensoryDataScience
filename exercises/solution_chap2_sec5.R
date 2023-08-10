library(ggplot2)
GMO <- read.csv("data/gmo.csv", sep = ';', header = TRUE)
for (j in 1:ncol(GMO)) GMO[, j] <- as.factor(GMO[, j])
GMO$Position.Culture <- factor(GMO$Position.Culture, 
                               levels = c('Totally opposed', 'Somewhat against', 
                                          'Favourable', 'Very favourable'))
GMO$Position.A.Food <- factor(GMO$Position.A.Food, 
                              levels=c('Totally opposed', 'Somewhat against', 'Favourable', 'Very favourable'))
GMO$Political.Party <- factor(GMO$Political.Party, 
                              levels=c('Extreme left', 'Left', 'Greens', 'Liberal', 'Right'))
set.seed(7)
ind.permuted <- sample(1:135)
ind.permuted
Position.A.Food.Permuted <- GMO$Position.A.Food[ind.permuted]
GMO <- cbind(GMO, Position.A.Food.Permuted)
res.table <- table(GMO$Political.Party, GMO$Position.A.Food)
fi <- apply(res.table, 1, sum)/sum(res.table)
fj <- apply(res.table, 2, sum)/sum(res.table)

joint.independence <- matrix(nrow=5,ncol=4)
for(i in 1:5){
  for(j in 1:4) joint.independence[i, j] <- fi[i]*fj[j]
}
rownames(joint.independence) <- rownames(res.table)
colnames(joint.independence) <- colnames(res.table)