levels(GMO$Position.Culture)
GMO$Position.Culture <- factor(GMO$Position.Culture, 
                            levels = c('Totally opposed', 'Somewhat against', 
                                       'Favourable', 'Very favourable'))
levels(GMO$Position.Culture)
summary(GMO$Position.Culture)