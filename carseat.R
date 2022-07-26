# Un-comment and run line from 2 to 4 once
# install.packages("sentimentr")
# install.packages("FactoMineR")
# install.packages("ggplot2")

# First, import the carseat data set as well as the dictionaries associated with these data.

leather <- read.csv2("data/carseat.csv")
dict.polarity <- read.csv2("data/valency_leather.csv")
dict.val.shift <- read.csv2("data/valence_shifters_leather.csv")
print("Done!")

# Then, as usual, recode the variables as factors, when necessary.

summary(leather)
for (j in 1:3) leather[,j] <- as.factor(leather[,j])
print("Done!")

# As a pre-processing, we need to homogenize the textual data in lowercase using the tolower() function. 
# The punctuation is removed and the terms that make sense when they are combined are re-coded and combined.

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

# The R package used to achieve the sentiment analysis needs to operate on dictionaries 
# that are recognized as “key” object. A transformation is thus achieved. 
# To do so, use the as_key() function of the sentimentr package.

library(sentimentr)
polarity <- as_key(dict.polarity)
val.shift <- as_key(dict.val.shift)
print("Done!")

# The sentiment() function of the sentimentr package is used to perform the sentiment analysis. 
# The function takes also as arguments the polarity and the valence shifter dictionaries.

res.sent <- get_sentences(leather$Text)
res.sentiment <- sentiment(res.sent, polarity_dt = polarity, valence_shifters_dt = val.shift)
print("Done!")

# The valency score obtained for each comment are concatenated to the leather data set 
# in order to associate to each comment its valency score.

leather$Sentiment <- res.sentiment$sentiment
print("Done!")

# The consistency of the resulting valency scores with the hedonic categories needs to be checked
# in order to be sure that this quantitative score is relevant and can be exploited. 
# To achieve it, an analysis of variance that explains the valency score according to the hedonic categories and the judges is achieved. 

library(FactoMineR)
res.consistency <- AovSum(Sentiment ~ Hedo_cat + ID_juge, data = leather)
res.consistency$Ftest

res.consistency <- AovSum(Sentiment ~ Hedo_cat, data = leather)
res.consistency$Ftest
res.consistency$Ttest

# A boxplot can be obtained with the geom_boxplot() function of the ggplot2 package, in order to represent the distribution 
# of the valency scores according to the hedonic categories in which the described product has been 
# placed by the respondent prior to the description step.

library(ggplot2)
ggplot(leather, aes(Hedo_cat, Sentiment)) +
  geom_boxplot()

# Let’s now create a matrix product x respondent whose entries are the valency scores associated with the description of a 
# product by a respondent. It is just a reorganization of the data.

leather <- leather[order(leather$ID_juge, leather$Product), ]
prod.Sentiment <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Sentiment[i,j+1] <- leather$Sentiment[j*10+i]
}
rownames(prod.Sentiment) <- levels(as.factor(leather$Product))
colnames(prod.Sentiment) <- paste("S",levels(leather$ID_juge),sep = "")
print("Done!")

# We thus want to run a PCA on this data table. The graphical display represents an internal preference mapping. 
# Let’s now see how the respondents (as variables) are displayed.

res.pca <- PCA(prod.Sentiment, graph = FALSE)
plot.PCA(res.pca)
plot.PCA(res.pca, choix = "var")

#############################
# Machine learning approach
#############################

# For saving time, import the data set with the valency scores calculated with the machine learning approach.

leather.score <- read.csv2("data/carseat_scores.csv")
summary(leather.score)

# As usual, recode the variables that need to be imported as factors.

for (j in 1:3) leather.score[,j] <- as.factor(leather.score[,j])
print("Done!")

# As for the valency scores resulting from the lexical approach, we transform the data set into a matrix product x respondent, 
# whose entries are the valency scores calculated with the machine learning approach, 
# associated with the description of the product by the respondent.

leather.score <- leather.score[order(leather.score$ID_juge, leather.score$Product), ]
prod.Valency_ML <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Valency_ML[i,j+1] <- leather.score$Valency_ML[j*10+i]
}
rownames(prod.Valency_ML) <- levels(as.factor(leather.score$Product))
colnames(prod.Valency_ML) <- paste("ML",levels(leather.score$ID_juge),sep = "")
print("Done!")

# Run a Principal Component Analysis with the PCA() function in order to 
# get a representation the products based on these new valency scores.

res.pca <- PCA(prod.Valency_ML, graph = FALSE)
plot.PCA(res.pca)
plot.PCA(res.pca, choix = "var")

# In order to check the consistency and the added-value of the valency scores regarding Liking, 
# let’s construct the same matrix product x respondent as for the valency scores from the two approaches. 
# The entries are the liking scores given by each respondent for each product.

prod.Liking <- matrix(0, nrow = 10, ncol = 57)
for (j in 0:56){
  for (i in 1:10) prod.Liking[i,j+1] <- leather.score$Liking[j*10+i]
}
rownames(prod.Liking) <- levels(as.factor(leather.score$Product))
colnames(prod.Liking) <- paste("L",levels(leather.score$ID_juge),sep = "")
print("Done!")

# Let’s run a PCA to represent the products according to their Liking scores.

res.pca <- PCA(prod.Liking, graph = FALSE)
plot.PCA(res.pca)
plot.PCA(res.pca, choix = "var")

# Now we want to see the differences between products according to the three different scores: 
# valency scores from lexical approach, valency scores from machine learning approach and liking scores. 
# To do so, we need to combine the three product x respondent matrices.

scores <- cbind(prod.Sentiment, prod.Valency_ML, prod.Liking)
print("Done!")

# Run a Multiple Factor Analysis with the MFA() function pf the FactoMineR package, in order to see how consistent 
# are the three different scores. Keep in mind that Liking scores were collected in order to assess the validity 
# of our sentiment analysis and machine learning approaches: in a Free JAR protocol, hedonic scores are not collected.

res.mfa <- MFA(scores, group = rep(57, 3), type = rep("s", 3), 
               name.group = c("Sentiment", "Machine", "Liking"), graph = FALSE)
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, choix = "ind")
plot.MFA(res.mfa, partial = "all")
