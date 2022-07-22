goji.inter <- goji[,c(4,7:12)]

j <- 2
contingency <- table(goji.inter$Product,goji.inter[,j])
contingency
colnames(contingency) <- paste(colnames(goji.inter)[j], levels(goji.inter[,j]), sep = "_")

for (j in 3:7){
  inter <- table(goji.inter$Product,goji.inter[,j])
  colnames(inter) <- paste(colnames(goji.inter)[j], levels(goji.inter[,j]), sep = "_")
  contingency <- cbind(contingency, inter)
}

contingency