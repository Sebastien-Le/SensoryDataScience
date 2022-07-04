ggplot(sub_experts) +
  aes(x = Floral, color = Product) +
  geom_density() +
  labs(title = "Density of Floral for the 2 products Angel and J'adore ET", x = "Floral values", y = "Density")