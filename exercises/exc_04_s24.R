library(tm)
stw <- stopwords("en")
stw <- stw[-which(stw%in%c("no","not"))]

sennheiser.text$Why <- removeWords(sennheiser.text$Why,stw)
print("Done!")