library(FactoMineR)
res.table <- table(GMO$Political.Party, GMO$Position.A.Food)
res.CA <- CA(res.table, graph = F)
plot.CA(res.CA, invisible = "col", title = "Representation of the political parties")