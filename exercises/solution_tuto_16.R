data_tissu$Text <- tolower(data_tissu$Text)
stw_en <- stopwords("en")
stw_en <- stw_en[-which(stw_en%in%c("no","not"))]
data_tissu$Text <- removeWords(data_tissu$Text, stw_en)

supprespace <- function(x){
  a <- unlist(strsplit(x," "))
  if (length(which(a==""))==0){
    paste(a, collapse = " ")
  }
  else{
    paste(a[-which(a=="")],collapse=" ")
  }
}

for (i in 1:N){
  data_tissu$Text[i] <- supprespace(data_tissu$Text[i])
}