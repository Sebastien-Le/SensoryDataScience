ggplot(sub_experts) +
  aes(y = Floral, x = Product, color = Product) +
  geom_boxplot() +
  labs(title = "Boxplots of Floral conditionnally to the two products Angel and J'adore ET")