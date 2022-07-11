GMO$Implicated <- factor(GMO$Implicated, 
                              levels=c('Not at all', 'A little', 'Certain extent', 'A lot'))
GMO$Position.H.Food <- factor(GMO$Position.H.Food, 
                              levels=c('Totally opposed', 'Somewhat against', 'Favourable', 'Very favourable'))
GMO$Age <- factor(GMO$Age, 
                  levels=c('< 25', '[26; 40]', '[41; 60]', '> 60'))