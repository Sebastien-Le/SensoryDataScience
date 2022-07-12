ggplot(experts.2products) +
  aes(x = Floral, color = Product) +
  geom_density() +
  labs(title = "Density of Floral for Angel and J'adore ET", x = "Floral values", y = "Density")