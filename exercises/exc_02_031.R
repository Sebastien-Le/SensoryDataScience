res <- summary(GMO$Position.Al.A)
res
#reorder the information
res <- res[c(3,2,1,4)]
res
barplot(res)
