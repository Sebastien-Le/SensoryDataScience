res <- table(GMO[,"Position.Al.A"])
res <- res[c(3,2,1,4)]
prop.table(res)
barplot(prop.table(res) * 100, main = "Relative frequency (%)", col = rainbow(4))