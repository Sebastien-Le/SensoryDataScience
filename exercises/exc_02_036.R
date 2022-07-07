#re-order the factor levels
GMO$Position.Al.A <- factor(GMO$Position.Al.A, 
                            levels=c('Totally opposed', 'Somewhat Against', 'Favourable', 'Very Favourable'))
levels(as.factor(GMO$Position.Al.A))

#graphical representation
ggplot(data = GMO, aes(x = Position.Al.A))+
      geom_bar(stat = "count", width=0.7, fill = "steelblue")