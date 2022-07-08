levels(GMO$Position.Culture)
GMO$Position.Culture <- factor(GMO$Position.Culture, 
                            levels=c('Totally opposed', 'Somewhat Against', 'Favourable', 'Very Favourable'))
levels(GMO$Position.Culture)
summary(GMO$Position.Culture)