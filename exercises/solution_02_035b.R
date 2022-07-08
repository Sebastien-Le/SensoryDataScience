library(ggplot2)
ggplot(data = distrib.Position.Culture, aes(x = Var1, y = Freq)) +
       geom_bar(stat = "identity")