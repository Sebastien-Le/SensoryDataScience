library(FactoMineR)
res.table <- table(GMO$Political.Party, GMO$Position.A.Food)
descfreq(res.table)