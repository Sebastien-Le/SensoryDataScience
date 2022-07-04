dico_ira_2 <- dico_ira[liste_mot_dico_ira,]

for (i in 1:N){
  sent <- data_tissu$Text[i]
  sent_split <- strsplit(sent,split = " ")[[1]]
  for (j in 1:length(sent_split)){
    for (k in 1:dim(dico_ira_2)[1]){
      if (sent_split[j]==dico_ira_2[k,1]){
        sent_split[j] <- dico_ira_2[k,2]
      }
    }
  }
  data_tissu$Text[i] <- str_c(str_replace_na(sent_split),collapse = " ")
}