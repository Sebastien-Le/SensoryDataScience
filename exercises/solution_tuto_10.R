leather <- leather[order(leather$ID_juge, leather$Product), ]
prod.Sentiment <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Sentiment[i,j+1] <- leather$Sentiment[j*10+i]
}
rownames(prod.Sentiment) <- levels(as.factor(leather$Product))
colnames(prod.Sentiment) <- paste("S",levels(leather$ID_juge),sep = "")
print("Done!")