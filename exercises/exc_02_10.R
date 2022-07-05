fi <- apply(GMO_table, 1, sum)/sum(GMO_table)
fj <- apply(GMO_table, 2, sum)/sum(GMO_table)
GMO_deviation <- matrix(nrow=5, ncol=4)
for(i in 1:5){
for(j in 1:4) GMO_deviation[i, j] <- (GMO_table[i, j]/sum(GMO_table)/((fi[i]*fj[j])))-1
}
rownames(GMO_deviation) <- rownames(GMO_table)
colnames(GMO_deviation) <- colnames(GMO_table)