sennheiser.text$Why <- tolower(sennheiser.text$Why)
sennheiser.text$Why <- gsub("too ", "too", sennheiser.text$Why)
sennheiser.text$Why <- gsub("not ", "not", sennheiser.text$Why)
sennheiser.text$Why <- gsub(" enough", "enough", sennheiser.text$Why)

sennheiser.text$Why <- gsub("[`^~.',!?;\"]", " ", sennheiser.text$Why)
sennheiser.text$Why <- gsub("[[:punct:]]", "", sennheiser.text$Why)
print("Done!")