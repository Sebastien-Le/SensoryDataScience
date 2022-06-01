library(ggplot2)
library(dplyr)

experts %>%  
  # Select 3 products and 1 sensory attribute
  select(c(Product, Spicy)) %>% 
  filter(Product == "J'adore ET" | Product == "Angel" | Product == "Chanel N5" ) %>%
  # Add the mean's column
  group_by(Product) %>% 
  mutate(mu=mean(Spicy)) %>% 
  # Graph
  ggplot() + aes(x=Spicy, fill=Product) + geom_density(alpha=0.4) + geom_vline(aes(xintercept=mu, color=Product),linetype="dashed") + labs(title="Density of Spicy according three products")


