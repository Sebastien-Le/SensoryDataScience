library(ggplot2)
library(stringr)

attr <- 5
orange_attr <- as.data.frame(orange[,attr])
tab <- as.data.frame(table(orange_attr))
colnames(tab) <- c("mod","count")
ggplot(tab, aes(x = mod, y = count))+
  geom_bar(stat = "identity", fill = "orange")+
  theme_minimal()+
  ggtitle(str_glue("Distribution of modalities for the attribute {colnames(orange)[attr]}"))+
  xlab("Modalities")+
  ylab("Number of occurrences")