ggplot(sub_experts) +
  aes(x=Floral, fill=Product) +
  geom_density(alpha=0.5)  +
  labs(title="Density of Vanilla for the 2 products Angel and J'adore ET", 
       x="Vanilla values", 
       y="Density")