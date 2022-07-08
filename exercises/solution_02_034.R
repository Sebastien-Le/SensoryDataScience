prop.table(table(GMO[,"Position.Culture"]))
barplot(prop.table(table(GMO[,"Position.Culture"]))*100, 
        main = "What is your view of GMO cultivation in France? (%)", col = rainbow(4))