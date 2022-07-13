data_sent <- get_sentences(data_leather)
sentiment1 <- sentiment(data_sent,polarity_dt=mykey_pola,valence_shifters_dt = mykey_val)