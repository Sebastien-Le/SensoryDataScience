ggplot(GMO, aes(Position.A.Food, after_stat(count))) + 
      geom_bar(aes(fill = ____)) + 
      scale_fill_manual(values=c("Extreme left"="brown", "Left"="palevioletred2", 
                                 "Greens"="chartreuse4", "Liberal"="gold1", 
                                 "Right"="dodgerblue3"))