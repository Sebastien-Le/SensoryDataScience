res.textual.viet.sans.accent.V2 <- textual(barbesV2.viet.sans.acc,num.text = 3, contingence.by = 2, sep.word = ";")

eff.viet.V2 <- as.data.frame(apply(res.textual.viet.sans.accent.V2$cont.table, MARGIN = 2, FUN=sum))

words_selection.viet.sans.accent.V2 <- res.textual.viet.sans.accent.V2$cont.table[,apply(res.textual.viet.sans.accent.V2$cont.table, 2, sum)>=1]

res.CA.viet.sans.accent.V2 <- CA(words_selection.viet.sans.accent.V2, graph=FALSE)
plot.CA(res.CA.viet.sans.accent.V2, invisible = "row")
plot.CA(res.CA.viet.sans.accent.V2, invisible = "col") 