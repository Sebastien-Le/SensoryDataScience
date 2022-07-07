res <- table(GMO[,"Position.Al.A"])
res <- res[c(3,2,1,4)]
barplot(res, main = "Absolute frequency", col = rainbow(4))