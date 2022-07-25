# library(sentimentr)
# library(FactoMineR)
# library(ggplot2)

#01

leather <- read.csv2("data/carseat.csv")
dict.polarity <- read.csv2("data/valency_leather.csv")
dict.val.shift <- read.csv2("data/valence_shifters_leather.csv")
print("Done!")

#02

summary(leather)
for (j in 1:3) leather[,j] <- as.factor(leather[,j])
print("Done!")

#03

leather$Text <- tolower(leather$Text)
dict.polarity$Word <- tolower(dict.polarity$Word)
dict.val.shift$Word <- tolower(dict.val.shift$Word)

leather$Text <- gsub("[`^~.',!?;\"]", " ", leather$Text)
leather$Text <- gsub("[[:punct:]]", "", leather$Text)

leather$Text <- gsub("just right", "justright", leather$Text)
leather$Text <- gsub("too much", "toomuch", leather$Text)
leather$Text <- gsub("even if", "evenif", leather$Text)
leather$Text <- gsub("not enough", "notenough", leather$Text)
print("Done!")

#04

library(sentimentr)
polarity <- as_key(dict.polarity)
val.shift <- as_key(dict.val.shift)
print("Done!")

#05

res.sent <- get_sentences(leather$Text)
res.sentiment <- sentiment(res.sent, polarity_dt = polarity, valence_shifters_dt = val.shift)
print("Done!")

#06

leather$Sentiment <- res.sentiment$sentiment
print("Done!")

#07

library(FactoMineR)
res.consistency <- AovSum(Sentiment ~ Hedo_cat + ID_juge, data = leather)
res.consistency$Ftest

#08

res.consistency <- AovSum(Sentiment ~ Hedo_cat, data = leather)
res.consistency$Ftest
res.consistency$Ttest

#09

library(ggplot2)
ggplot(leather, aes(Hedo_cat, Sentiment)) +
    geom_boxplot()

#10

leather <- leather[order(leather$ID_juge, leather$Product), ]
prod.Sentiment <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Sentiment[i,j+1] <- leather$Sentiment[j*10+i]
}
rownames(prod.Sentiment) <- levels(as.factor(leather$Product))
colnames(prod.Sentiment) <- paste("S",levels(leather$ID_juge),sep = "")
print("Done!")

#11

res.pca <- PCA(prod.Sentiment, graph = FALSE)
plot.PCA(res.pca)
plot.PCA(res.pca, choix = "var")

#############################
# ML
#############################
#12

leather.score <- read.csv2("data/carseat_scores.csv")
summary(leather.score)

#13

for (j in 1:3) leather.score[,j] <- as.factor(leather.score[,j])
print("Done!")

#14

leather.score <- leather.score[order(leather.score$ID_juge, leather.score$Product), ]
prod.Valency_ML <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Valency_ML[i,j+1] <- leather.score$Valency_ML[j*10+i]
}
rownames(prod.Valency_ML) <- levels(as.factor(leather.score$Product))
colnames(prod.Valency_ML) <- paste("ML",levels(leather.score$ID_juge),sep = "")
print("Done!")

#15

res.pca <- PCA(prod.Valency_ML, graph = FALSE)
plot.PCA(res.pca)
plot.PCA(res.pca, choix = "var")

#16

prod.Liking <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Liking[i,j+1] <- leather.score$Liking[j*10+i]
}
rownames(prod.Liking) <- levels(as.factor(leather.score$Product))
colnames(prod.Liking) <- paste("L",levels(leather.score$ID_juge),sep = "")
print("Done!")

#17

res.pca <- PCA(prod.Liking, graph = FALSE)
plot.PCA(res.pca)
plot.PCA(res.pca, choix = "var")

#18

scores <- cbind(prod.Sentiment, prod.Valency_ML, prod.Liking)
print("Done!")

#19

res.mfa <- MFA(scores, group = rep(57, 3), type = rep("s", 3), 
               name.group = c("Sentiment", "Machine", "Liking"), graph = FALSE)
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, choix = "ind")
plot.MFA(res.mfa, partial = "all")
