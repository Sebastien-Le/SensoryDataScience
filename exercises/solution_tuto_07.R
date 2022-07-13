note <- aggregate(data.frame(Note=data_sent$Liking),by=list(Produit=data_sent$Product),mean)
note <- note%>%arrange(-Note)