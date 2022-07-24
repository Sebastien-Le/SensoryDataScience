library(ggplot2)
ggplot(leather, aes(Hedo_cat, Sentiment)) +
  geom_boxplot()