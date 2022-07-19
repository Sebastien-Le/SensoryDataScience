library(ggplot2)
library(stringr)

attr <- 8
session <- 2

nb_session <- length(levels(goji$Session))
goji_attr <- as.data.frame(goji[,c(attr,session)])
tab <- as.data.frame(table(goji_attr[,1], goji_attr[,2]))
colnames(tab) <- c("mod","session","count")

ggplot(tab,aes(x=mod,y=count,fill=session))+
       geom_bar(stat="identity",position=position_dodge())+
       theme_minimal()+
       ggtitle(str_glue("Distribution of modalities for the attribute {colnames(goji)[attr]}"))+
       xlab("Modalities")+
       ylab("Number of occurrences")+
       scale_fill_manual(values=c("orange","blue"))