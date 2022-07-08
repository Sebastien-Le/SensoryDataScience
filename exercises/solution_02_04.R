ggplot(GMO, aes(Position.A.Food, ..count..)) + 
      geom_bar(aes(fill = Political.Party), position = "dodge") + 
      scale_fill_manual(values=c("Extreme left"="brown", "Left"="palevioletred2", 
                                 "Greens"="chartreuse4", "Liberal"="gold1", 
                                 "Right"="dodgerblue3"))