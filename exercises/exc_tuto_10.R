leather <- leather[order(leather$____, leather$____), ]
prod.Sentiment <- matrix(0, nrow = __, ncol = __)
for (j in 0:56){
  for (i in 1:10) prod.Sentiment[i,j+1] <- leather$Sentiment[j*10+i]
}
rownames(prod.Sentiment) <- levels(as.factor(leather$____))
colnames(prod.Sentiment) <- paste("S",levels(leather$____),sep = "")
print("Done!")