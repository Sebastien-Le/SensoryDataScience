means <- df %>% group_by(Product) %>% summarise(
  mean_Spicy=mean(Spicy),
  mean_Citrus=mean(Citrus),
  mean_Floral=mean(Floral)
)