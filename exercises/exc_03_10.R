liste_mot_dico_ira <- c()
a = 1
for (i in 1:N){
  sent <- data_tissu$Text[i]
  sent_split <- strsplit(sent, split = " ")[[1]]
  for (j in 1:length(sent_split)){
    if (sent_split[j]%in%dico_ira$Mot){
      liste_mot_dico_ira[a] <- which(dico_ira$Mot %in% sent_split)
      a = a+1
    }
  }
}

liste_mot_dico_ira <- unique(liste_mot_dico_ira)