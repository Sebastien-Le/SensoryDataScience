library(ggplot2)
library(dplyr)

experts %>%  
  
  # Select 3 products and 1 sensory attribute
  select(c(___ , ___)) %>%
  filter(Product == ___ | Product == ___ | Product == ___ ) %>%
  
  # Add the mean's column
  group_by(___) %>% 
  mutate(mu=___) %>% 
  
  # Graph
  ggplot() + aes(x=___, fill=___) + geom_density(alpha=0.4) + geom_vline(aes(xintercept=___, color=___), linetype="dashed") + labs(title="Density of ____ according three products")


