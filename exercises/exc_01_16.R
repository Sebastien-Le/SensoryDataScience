experts %>%  
  # Select 3 products and 1 sensory attribute
  __________ %>% 
  
  # Plot the boxplots 
  __________ + 
  
  # Add lines between each means
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")