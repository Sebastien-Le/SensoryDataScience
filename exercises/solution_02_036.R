ggplot(data = GMO, aes(x = Position.Culture))+
      geom_bar(stat = "count", width=0.7, fill = "steelblue")