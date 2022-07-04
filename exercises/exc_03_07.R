dtm <- build_dtm(corpus)
I = length(dtm$dimnames$Terms)
mots <- dtm$dimnames$Term
mots