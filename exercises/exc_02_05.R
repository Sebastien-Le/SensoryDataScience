Position.A.Food.Permuted <- GMO$Position.A.Food[ind.permuted]
GMO <- cbind(GMO, Position.A.Food.Permuted)
table(GMO$Position.A.Food.Permuted, GMO$Political.Party)