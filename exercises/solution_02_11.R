res.table <- table(GMO$Political.Party, GMO$Position.A.Food)
ni <- apply(res.table, 1, sum)
nj <- apply(res.table, 2, sum)
n <- sum(ni)
chi2.row <- matrix(nrow = 5, ncol = 5)
for(i in 1:5){
  for(j in 1:5) chi2.row[i,j] <- sum((n/nj)*((res.table[i,]/ni[i]) - (res.table[j,]/ni[j]))^2)
}
rownames(chi2.row) <- rownames(res.table)
colnames(chi2.row) <- rownames(res.table)
chi2.row