library(dplyr)
library(sentimentr)
library(FactoMineR)
library(RTextTools)

##02
leather <- read.csv2("data/leather.csv")
dico_pola <- read.csv2("data/valency_leather.csv")
dico_val <- read.csv2("data/valence_shifters_leather.csv")


##03
leather$Text <- tolower(leather$Text) #met tout en minuscules
dico_pola$Word <- tolower(dico_pola$Word)
dico_val$Word <- tolower(dico_val$Word)

leather$Text <- gsub("[`^~.',!?;\"]", " ", leather$Text)
leather$Text <- gsub("[[:punct:]]", "", leather$Text)

leather$Text <- gsub("just right", "justright", leather$Text)
leather$Text <- gsub("too much", "toomuch", leather$Text)
leather$Text <- gsub("even if", "evenif", leather$Text)
leather$Text <- gsub("not enough", "notenough", leather$Text)

##04
mykey_pola <- as_key(dico_pola)
mykey_val <- as_key(dico_val)

##05
data_sent <- get_sentences(leather$Text)
sentiment1 <- sentiment(data_sent, polarity_dt = mykey_pola, valence_shifters_dt = mykey_val)

##06
leather$sentiment <- sentiment1$sentiment
sentprod <- aggregate(leather$sentiment, by = list(leather$Product), FUN = mean)
sentprod <- sentprod %>% arrange(-x)

##07
liking <- aggregate(leather$Liking, by = list(leather$Product), FUN = mean)
liking <- liking %>% arrange(-x)

##08
leather$Liking <- factor(leather$Liking)
leather$Hedo_cat <- factor(leather$Hedo_cat)

AovSum(leather$sentiment ~ leather$Hedo_cat)
AovSum(leather$sentiment ~ leather$Liking)

##09
data_pca <- data.frame(matrix(0,ncol=length(unique(leather$ID_juge)), nrow=length(unique(leather$Product))))
colnames(data_pca) <- unique(leather$ID_juge)
rownames(data_pca) <- unique(leather$Product)

for(j in 1:length(unique(leather$ID_juge))){
  for (i in 1:length(unique(leather$Product))){
    k <- leather[which(leather$ID_juge == colnames(data_pca)[j] & leather$Product == rownames(data_pca)[i]),6]
    if(length(k)==0){
      data_pca[i,j] <- 0
    }else{
      data_pca[i,j] <- k
    }
  }
}

res.pca <- PCA(data_pca)

##10
dtm <- create_matrix(leather$Text, removeStopwords = TRUE)
#dtm$dimnames$Terms

dtm_mat <- as.data.frame(matrix(0,nrow=length(unique(leather$Product)),ncol=dtm$ncol))
rownames(dtm_mat) <- unique(leather$Product)
colnames(dtm_mat) <- dtm$dimnames$Terms

for(i in 1:dim(leather)[1]){
  sent <- str_split(leather$Text[i]," ")[[1]]
  for (j in 1:length(sent)){
    dtm_mat[which(rownames(dtm_mat)==leather$Product[i]),which(colnames(dtm_mat)==sent[j])] <- dtm_mat[which(rownames(dtm_mat)==leather$Product[i]),which(colnames(dtm_mat)==sent[j])] + 1
  }
}

res_desc <- descfreq(dtm_mat, proba = 0.1)

for (i in 1:10) res_desc[[i]] <- res_desc[[i]][which(res_desc[[i]][,3]>=1),]

res.ca <- CA(dtm_mat[,apply(dtm_mat, 2, sum)>=3], graph = F)
plot.CA(res.ca, invisible = "col")

res.ca <- CA(dtm_mat, graph = F)
plot.CA(res.ca, invisible = "col")
