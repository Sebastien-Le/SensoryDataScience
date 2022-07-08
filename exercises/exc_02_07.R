res.table <- table(GMO$Political.Party, GMO$____)
fi <- apply(res.table, 1, sum)/sum(res.table)
fj <- apply(res.table, 2, sum)/sum(res.table)

joint.independence <- matrix(nrow=5,ncol=4)
for(i in 1:5){
for(j in 1:4) joint.independence[_, _] <- fi[_]*fj[_]
}
rownames(joint.independence) <- rownames(res.table)
colnames(joint.independence) <- colnames(res.table)
joint.independence