GMO <- read.csv("data/gmo.csv", sep = ';', header = TRUE)
for (j in 1:ncol(GMO)) GMO[, j] <- as.factor(GMO[, j])
GMO$Position.Culture <- factor(GMO$Position.Culture, 
                               levels = c('Totally opposed', 'Somewhat against', 
                                          'Favourable', 'Very favourable'))
GMO$Position.A.Food <- factor(GMO$Position.A.Food, 
                              levels=c('Totally opposed', 'Somewhat against', 'Favourable', 'Very favourable'))
GMO$Political.Party <- factor(GMO$Political.Party, 
                              levels=c('Extreme left', 'Left', 'Greens', 'Liberal', 'Right'))
print("Done!")