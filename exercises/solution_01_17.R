library(gridExtra)

# Select three sensory attributes and three products 
df <- experts %>%  
  select(c(Product, Floral, Citrus, Spicy, Heady)) %>% 
  filter(Product == "J'adore ET" | Product == "Angel" | Product == "Chanel N5" )

# First sensory attribute
a1 <- ggplot(df)+aes(y=Floral, x= Product, color=Product)+geom_boxplot() + 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")+
  # Delete the x-axis:
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Second sensory attribute
a2 <- ggplot(df)+aes(y=Spicy, x= Product, color=Product)+geom_boxplot() + 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Third sensory attribute
a3 <- ggplot(df)+aes(y=Citrus, x= Product, color=Product)+geom_boxplot() + 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Fourth sensory attribute
a4 <- ggplot(df)+aes(y=Heady, x= Product, color=Product)+geom_boxplot() + 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

grid.arrange(a1, a2, a3,a4, ncol=2, nrow = 2)