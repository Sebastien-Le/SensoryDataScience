data_leather$Text <- tolower(data_leather$Text)
dico_pola$Word <- tolower(dico_pola$Word)
dico_val$Word <- tolower(dico_val$Word)

data_leather$Text <- gsub("[`^~.'!?;\"]", " ", data_leather$Text)

data_leather$Text <- gsub("easy to maintain", "easytomaintain", data_leather$Text)
data_leather$Text <- gsub("just right", "justright", data_leather$Text)
data_leather$Text <- gsub("too much", "toomuch", data_leather$Text)
data_leather$Text <- gsub("even if", "evenif", data_leather$Text)
data_leather$Text <- gsub("not enough", "notenough", data_leather$Text)