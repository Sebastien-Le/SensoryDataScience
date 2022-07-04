dic <- dictionary(dtm, remove_stopwords = FALSE)
dic[order(dic$Occurrences, decreasing = TRUE),]