prod.Liking <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Liking[i,j+1] <- leather.score$Liking[j*10+i]
}
rownames(prod.Liking) <- levels(as.factor(leather.score$Product))
colnames(prod.Liking) <- paste("L",levels(leather.score$ID_juge),sep = "")
print("Done!")