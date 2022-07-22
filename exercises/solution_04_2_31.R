j <- 7
goji.s1.prod <- table(goji.s1$Product, goji.s1[,j])
colnames(goji.s1.prod) <- paste(colnames(goji.s1)[j], levels(goji.s1[,j]), sep = "_")

for (j in 8:12){
  inter <- table(goji.s1$Product, goji.s1[,j])
  colnames(inter) <- paste(colnames(goji.s1)[j], levels(goji.s1[,j]), sep = "_")
  goji.s1.prod <- cbind(goji.s1.prod, inter)
}

j <- 7
goji.s2.prod <- table(goji.s2$Product, goji.s2[,j])
colnames(goji.s2.prod) <- paste(colnames(goji.s2)[j], levels(goji.s2[,j]), sep = "_")

for (j in 8:12){
  inter <- table(goji.s2$Product, goji.s2[,j])
  colnames(inter) <- paste(colnames(goji.s2)[j], levels(goji.s2[,j]), sep = "_")
  goji.s2.prod <- cbind(goji.s2.prod, inter)
}

goji.prod.s1.s2 <- cbind(goji.s1.prod,goji.s2.prod)