leather$Text <- _____(leather$Text)
dict.polarity$Word <- ____(dict.polarity$Word)
dict.val.shift$Word <- ____(dict.val.shift$Word)

leather$Text <- gsub("[`^~.',!?;\"]", " ", leather$Text)
leather$Text <- gsub("[[:punct:]]", "", leather$Text)

leather$Text <- gsub("just right", "____", leather$Text)
leather$Text <- gsub("too much", "____", leather$Text)
leather$Text <- gsub("even if", "____", leather$Text)
leather$Text <- gsub("not enough", "____", leather$Text)
print("Done!")