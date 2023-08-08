library(ggplot2)
GMO <- read.csv("data/gmo.csv", sep = ';', header = TRUE)
for (j in 1:ncol(GMO)) GMO[, j] <- as.factor(GMO[, j])
GMO$Position.Culture <- factor(GMO$Position.Culture, 
                               levels = c('Totally opposed', 'Somewhat Against', 
                                          'Favourable', 'Very Favourable'))
print("Done!")