#We start by adding margins to have row and column profiles
GMO_table <- as.data.frame.matrix(table(GMO.Al.A))
fi <- apply(GMO_table, 1, sum)/sum(GMO_table)
fj <- apply(GMO_table, 2, sum)/sum(GMO_table)
GMO_theo <- matrix(nrow=5,ncol=4)
for(i in 1:5){
for(j in 1:4) GMO_theo[i, j] <- (fi[i]*fj[j])
}
rownames(GMO_theo) <- rownames(GMO_table)
colnames(GMO_theo) <- colnames(GMO_table)