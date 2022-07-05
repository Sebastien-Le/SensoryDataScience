res.textual.en.V2 <- textual(barbesV2.en,num.text = 3, contingence.by = 2, sep.word = ";")

eff.en.V2 <- as.data.frame(apply(res.textual.en.V2$cont.table, MARGIN = 2, FUN=sum))

words_selection.en.V2 <- res.textual.en.V2$cont.table[,apply(res.textual.en.V2$cont.table, 2, sum)>=1]
res.CA.en.V2 <- CA(words_selection.en.V2, graph=FALSE)

plot.CA(res.CA.en.V2, invisible = "row")
plot.CA(res.CA.en.V2, invisible="col")