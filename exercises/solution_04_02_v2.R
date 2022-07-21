library(ggplot2)
ggplot(tab, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange")