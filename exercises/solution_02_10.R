res.table <- table(GMO$Political.Party, GMO$Position.A.Food)
fi <- apply(res.table, 1, sum)/sum(res.table)
fj <- apply(res.table, 2, sum)/sum(res.table)

independence.deviation <- matrix(nrow = 5, ncol = 4)
for(i in 1:5){
for(j in 1:4) independence.deviation[i,j] <- res.table[i, j]/sum(res.table)/(fi[i]*fj[j])-1
}
rownames(independence.deviation) <- rownames(res.table)
colnames(independence.deviation) <- colnames(res.table)
independence.deviation