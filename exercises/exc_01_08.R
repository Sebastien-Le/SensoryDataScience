library(ggplot2)
library(dplyr)

experts %>%  
  
  # Select 3 products and 1 sensory attribute
  select(c(___ , ___)) %>% 
  filter(Product == ___ | Product == ___ | Product == ___ ) %>%

  # Graph
  ggplot() + aes(x=___, fill=___) + ____() + labs(title="Boxplot of ____ according three products")
