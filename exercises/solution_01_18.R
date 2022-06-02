a1 <- ggplot(df)+aes(y=Floral, x= Product, color=Product)+ 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

a2 <- ggplot(df)+aes(y=Citrus, x= Product, color=Product) + 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

a3 <- ggplot(df)+aes(y=Spicy, x= Product, color=Product) + 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

a4 <- ggplot(df)+aes(y=Heady, x= Product, color=Product) + 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point")+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

grid.arrange(a1, a2, a3, a4, ncol=2, nrow = 2)