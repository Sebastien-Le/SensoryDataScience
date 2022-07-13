sentprod <- sentiment_by(data_sent$Text, by=data_sent$Product,
                         polarity_dt=mykey_pola,valence_shifters_dt = mykey_val, averaging.function = average_mean)
sentprod <- sentprod%>%arrange(-ave_sentiment)