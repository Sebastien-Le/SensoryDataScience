set.seed(7)
ind.sample <- sample(1:135)
ind.sample
Position.Al.A.break <- GMO$Position.Al.A[ind.sample]
GMO <- cbind(GMO, Position.Al.A.break)
table(GMO$Position.Al.A.break, GMO$Political.Party)
