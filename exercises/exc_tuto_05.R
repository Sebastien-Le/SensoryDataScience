res.sent <- get_sentences(leather$Text)
res.sentiment <- sentiment(res.sent, polarity_dt = ____, valence_shifters_dt = ____)
print("Done!")