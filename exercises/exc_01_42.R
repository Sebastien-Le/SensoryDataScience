ggplot(sub_experts) +
  aes(x=Floral, color=Product) +
  geom_density() +
  labs(title="Density of Vanilla for the 2 products Angel and J'adore ET", x="Vanilla values", y="Density")