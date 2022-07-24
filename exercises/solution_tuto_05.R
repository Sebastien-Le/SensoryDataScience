res.sent <- get_sentences(leather$Text)
res.sentiment <- sentiment(res.sent, polarity_dt = polarity, valence_shifters_dt = val.shift)
print("Done!")