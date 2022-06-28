library(ggplot2)
hist_spicy <- ggplot(experts) +
  aes(x=Spicy) +
  geom_histogram()
hist_spicy