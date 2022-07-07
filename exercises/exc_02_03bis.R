#re-order the factor levels
GMO$Political.Party <- factor(GMO$Political.Party, 
                            levels=c('Extreme left', 'Left', 'Greens', 'Liberal', 'Right'))
levels(as.factor(GMO$Political.Party))

#remember levels have been re-ordered
table(GMO$Position.Al.A,GMO$Political.Party)