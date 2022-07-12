ggplot(experts.2products) +
  aes(x = Floral, fill = Product) +
  geom_density(alpha = 0.5)  +
  labs(title = "Density of Floral for Angel and J'adore ET", x = "Floral values", y = "Density")