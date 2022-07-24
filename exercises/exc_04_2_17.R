goji.inter <- goji[,c(____)]

j <- 2
contingency <- ____(goji.inter$Product,goji.inter[,j])
contingency
colnames(contingency) <- paste(colnames(goji.inter)[j], levels(goji.inter[,j]), sep = "_")

for (j in 3:7){
  inter <- ____(goji.inter$Product,goji.inter[,j])
  colnames(inter) <- paste(colnames(goji.inter)[j], levels(goji.inter[,j]), sep = "_")
  contingency <- cbind(contingency, inter)
}

contingency