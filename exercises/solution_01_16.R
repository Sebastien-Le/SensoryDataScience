experts %>%  
  # Select 3 products and 1 sensory attribute
  select(c(Product, Floral)) %>%
  filter(Product == "J'adore ET" | Product == "Angel" | Product == "Chanel N5" ) %>% 

  ggplot()+aes(y=Floral, x=Product, fill=Product) + geom_boxplot() + 
    stat_summary(fun.y=mean, geom="line", aes(group=1), color="black") + 
    stat_summary(fun.y=mean, geom="point")