res <- table(GMO[,"Position.Al.A"])
res <- res[c(3,2,1,4)]
df <- data.frame(res)
df
colnames(df) <- c("Position.Al.A","Count")
library(ggplot2)
ggplot(data = df, aes(x = Position.Al.A, y = Count)) +
       geom_bar(stat = "identity")