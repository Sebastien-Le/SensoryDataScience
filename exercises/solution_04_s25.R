supprespace <- function(x){
  a <- unlist(strsplit(x," "))
  if (length(which(a==""))==0){
    paste(a, collapse = " ")
  }
  else{
    paste(a[-which(a=="")],collapse=" ")
  }
}

for (i in 1:630) sennheiser.text$Why[i] <- supprespace(sennheiser.text$Why[i])