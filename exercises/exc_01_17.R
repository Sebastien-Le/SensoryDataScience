library(gridExtra)

# Select three sensory attributes and three products 
df <- _____

# First sensory attribute
a1 <- ggplot(df) + aes(y=____, x= _____, color=______) + ____() + 
  stat_summary(fun=mean, geom="line", aes(group=1), color="black") + 
  stat_summary(fun=mean, geom="point") +
  # Delete the x-axis:
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

# Second sensory attribute
a2 <- _______

# Third sensory attribute
a3 <- _______

# Fourth sensory attribute
a4 <- _______

grid.arrange(a1, a2, a3,a4, ncol=2, nrow = 2)