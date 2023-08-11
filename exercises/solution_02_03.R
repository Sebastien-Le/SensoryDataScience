GMO$Position.A.Food <- factor(GMO$Position.A.Food, 
                              levels=c('Totally opposed', 'Somewhat against', 'Favourable', 'Very favourable'))
GMO$Political.Party <- factor(GMO$Political.Party, 
                              levels=c('Extreme left', 'Left', 'Greens', 'Liberal', 'Right'))
table(GMO$Position.A.Food, GMO$Political.Party)