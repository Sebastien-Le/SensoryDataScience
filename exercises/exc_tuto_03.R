leather$Text <- tolower(leather$Text)
dict.polarity$Word <- tolower(dict.polarity$Word)
dict.val.shift$Word <- tolower(dict.val.shift$Word)

leather$Text <- gsub("[`^~.',!?;\"]", " ", leather$Text)
leather$Text <- gsub("[[:punct:]]", "", leather$Text)

leather$Text <- gsub("just right", "justright", leather$Text)
leather$Text <- gsub("too much", "toomuch", leather$Text)
leather$Text <- gsub("even if", "evenif", leather$Text)
leather$Text <- gsub("not enough", "notenough", leather$Text)
print("Done!")