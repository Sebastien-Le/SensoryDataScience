library(ggplot2)

ggplot(experts) +
  aes(x=Fruity) +
  geom_boxplot()

ggplot(experts) +
  aes(x=Spicy) +
  geom_histogram()

ggplot(experts) +
  aes(x = Spicy, y = ..density..) +
  geom_histogram(bins = 50)

ggplot(sub_experts) +
  aes(x = Floral, color = Product) +
  geom_density() +
  labs(title="Density of Floral for the 2 products Angel and J'adore ET", x = "Floral values", y = "Density")