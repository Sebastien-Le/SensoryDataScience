GMO$Position.A.Food <- factor(GMO$Position.A.Food, 
                              levels=c('Totally opposed', '____', '____', 'Very favourable'))
GMO$Political.Party <- factor(GMO$Political.Party, 
                              levels=c('Extreme left', '____', 'Greens', 'Liberal', '____'))
table(GMO$Position.A.Food, GMO$____)