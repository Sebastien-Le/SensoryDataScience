library(ggplot2)
library(dplyr)

experts %>%  
  # Select 3 products and 1 sensory attribute
  select(c(Product, Floral)) %>% 
  filter(Product == "J'adore ET" | Product == "Angel" | Product == "Chanel N5" ) %>%
  # Add the mean's column
  group_by(Product) %>% 
  mutate(mu=mean(Floral)) %>% 
  # Graph
  ggplot() + aes(x=Floral, fill=Product) + geom_density(alpha=0.4) + geom_vline(aes(xintercept=mu, color=Product),linetype="dashed") + labs(title="Density of Spicy according three products")


