##############################################
### EXPLORATION CORPUS
##############################################

N <- nrow(data_tissu)
corpus <- import_corpus("bon_tissu_ANG.csv",format="csv",
                        language ="fr" ,  textcolumn = 4)
inspect(corpus)
dtm <- build_dtm(corpus)
I = length(dtm$dimnames$Terms)
mots <- dtm$dimnames$Term
mots

dic <- dictionary(dtm,remove_stopwords = FALSE)
dic[order(dic$Occurrences,decreasing=TRUE),]