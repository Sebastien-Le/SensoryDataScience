leather.score <- leather.score[order(leather.score$ID_juge, leather.score$Product), ]
prod.Valency_ML <- matrix(0, nrow = 10, ncol = __)
for (j in 0:56){
  for (i in 1:10) prod.Valency_ML[i,j+1] <- leather.score$Valency_ML[j*10+i]
}
rownames(prod.Valency_ML) <- levels(as.factor(leather.score$Product))
colnames(prod.Valency_ML) <- paste("ML",levels(leather.score$ID_juge),sep = "")
print("Done!")