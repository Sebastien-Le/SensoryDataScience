key_pola <- data.frame(
  mots = dico_pola$Word,
  polarite = dico_pola$Valency,
  stringsAsFactors = FALSE)
mykey_pola <- as_key(key_pola)

mykey_val <- as_key(dico_val)