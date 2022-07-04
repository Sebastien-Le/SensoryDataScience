stw_en <- stopwords("en")
stw_en <- stw_en[-which(stw_en%in%c("no", "not"))]
data_tissu$Text <- removeWords(data_tissu$Text, stw_en)
