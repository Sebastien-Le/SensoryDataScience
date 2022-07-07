res <- summary(GMO$Position.Al.A)
res
#re-order the information
res <- res[c(3,2,1,4)]
res
barplot(res)
