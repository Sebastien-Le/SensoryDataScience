ggplot(GMO, aes(Position.Al.A, ..count..)) + 
      geom_bar(aes(fill = Political.Party), color="black", position = "dodge") + 
      ggtitle("Barplot of cross-categories") +
      scale_fill_manual(values=c("Extreme left"="brown", "Left"="palevioletred2", "Greens"="chartreuse4", "Liberal"="gold1", "Right"="dodgerblue3"))
## ..count.. : stat transformation of the original data set