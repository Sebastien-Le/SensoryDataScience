library(ggplot2)
library(dplyr)

experts %>%
  
  # Select 3 products and 1 sensory attribute
  select(c(___ , ___)) %>% 
  filter(Product == ___ | Product == ___ | Product == ___ ) %>%

  # Graph
  ggplot() + aes(y=____, x= ____, fill=____) + ____() + labs(title="Boxplot of ____ according three products")
