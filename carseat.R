# library(sentimentr)
# library(FactoMineR)
# library(ggplot2)

##02
leather <- read.csv2("data/carseat.csv")
dict.polarity <- read.csv2("data/valency_leather.csv")
dict.val.shift <- read.csv2("data/valence_shifters_leather.csv")

summary(leather)
for (j in 1:3) leather[,j] <- as.factor(leather[,j])

##03
leather$Text <- tolower(leather$Text) #met tout en minuscules
dict.polarity$Word <- tolower(dict.polarity$Word)
dict.val.shift$Word <- tolower(dict.val.shift$Word)

leather$Text <- gsub("[`^~.',!?;\"]", " ", leather$Text)
leather$Text <- gsub("[[:punct:]]", "", leather$Text)

leather$Text <- gsub("just right", "justright", leather$Text)
leather$Text <- gsub("too much", "toomuch", leather$Text)
leather$Text <- gsub("even if", "evenif", leather$Text)
leather$Text <- gsub("not enough", "notenough", leather$Text)

##04
library(sentimentr)
polarity <- as_key(dict.polarity)
val.shift <- as_key(dict.val.shift)

##05
res.sent <- get_sentences(leather$Text)
res.sentiment <- sentiment(res.sent, polarity_dt = polarity, valence_shifters_dt = val.shift)

##06
leather$Sentiment <- res.sentiment$sentiment

library(FactoMineR)
res.consistency <- AovSum(Sentiment ~ Hedo_cat + ID_juge, data = leather)
res.consistency$Ftest

res.consistency <- AovSum(Sentiment ~ Hedo_cat, data = leather)
res.consistency$Ftest
res.consistency$Ttest

library(ggplot2)
ggplot(leather, aes(Hedo_cat, Sentiment)) +
  geom_boxplot()

leather <- leather[order(leather$ID_juge, leather$Product), ]

prod.Sentiment <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Sentiment[i,j+1] <- leather$Sentiment[j*10+i]
}
rownames(prod.Sentiment) <- levels(as.factor(leather$Product))
colnames(prod.Sentiment) <- paste("S",levels(leather$ID_juge),sep = "")
res.pca <- PCA(prod.Sentiment)

#############################
# ML
#############################
#
leather.score <- read.csv2("data/carseat_scores.csv")
summary(leather.score)
for (j in 1:3) leather.score[,j] <- as.factor(leather.score[,j])

#
leather.score <- leather.score[order(leather.score$ID_juge, leather.score$Product), ]

#
prod.Valency_ML <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Valency_ML[i,j+1] <- leather.score$Valency_ML[j*10+i]
}
rownames(prod.Valency_ML) <- levels(as.factor(leather.score$Product))
colnames(prod.Valency_ML) <- paste("ML",levels(leather.score$ID_juge),sep = "")

#
res.pca <- PCA(prod.Valency_ML)

#
prod.Liking <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Liking[i,j+1] <- leather.score$Liking[j*10+i]
}
rownames(prod.Liking) <- levels(as.factor(leather.score$Product))
colnames(prod.Liking) <- paste("L",levels(leather.score$ID_juge),sep = "")
#
res.pca <- PCA(prod.Liking)

scores <- cbind(prod.Sentiment, prod.Valency_ML, prod.Liking)
res.mfa <- MFA(scores, group = rep(57, 3), type = rep("s", 3), name.group = c("Sentiment", "Machine", "Liking"))

