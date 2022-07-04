supprespace <- function(x){
  a <- unlist(strsplit(x, " "))
  if (length(which(a==""))==0){
    paste(a, collapse = " ")
  }
  else{
    paste(a[-which(a=="")], collapse = " ")
  }
}

N <- nrow(data_tissu)

for (i in 1:N){
  data_tissu$Text[i] <- supprespace(data_tissu$Text[i])
}
