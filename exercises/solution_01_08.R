experts %>%  
  # Select 3 products and 1 sensory attribute
  select(c(Product, Spicy)) %>% 
  filter(Product == "Coco Mademoiselle" | Product == "Angel" | Product == "Chanel N5" ) %>%
  
  # Graph
  ggplot() + aes(x=Spicy, fill=Product) + geom_boxplot() + labs(title="Boxplot of Spicy according three products")


