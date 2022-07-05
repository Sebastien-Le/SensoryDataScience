ni <- apply(GMO_table,1, sum)#row sum
nj <- apply(GMO_table,2, sum)#col sum
n <- as.numeric(sum(ni))
GMO_chi2_row <- matrix(nrow=5, ncol=5)
for(i in 1:5){
for(j in 1:5){GMO_chi2_row[i, j] <- sum((n/nj)*((GMO_table[i,]/ni[i]) - (GMO_table[j,]/ni[j]))^2)}
}
rownames(GMO_chi2_row) <- rownames(GMO_table)
colnames(GMO_chi2_row) <- rownames(GMO_table)