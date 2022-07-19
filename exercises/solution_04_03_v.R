library(gridExtra)
library(cowplot)

attr = 7
pdt = 2

orange_attr <- as.data.frame(orange[,c(pdt,attr)])
tab <- as.data.frame(table(orange_attr[,1],orange_attr[,2]))
colnames(tab) <- c("pdt","mod","count")
list_graph <- list()
a=1

for (j in unique(orange[,pdt])){
  gg <- ggplot(tab[which(tab$pdt==j),-1],aes(x=mod,y=count))+
    geom_bar(stat="identity",fill="orange")+
    theme_minimal()+
    ggtitle(str_glue("Distribution of attribute {colnames(orange)[attr]} for product {j}"))+
    xlab("Modalities")+
    ylab("Number of occurrences")+
    ylim(0,max(tab$count))
  list_graph[[a]] <- gg
  a=a+1
}

if(length(unique(orange[,pdt]))%%2==0){
  plot_grid(plotlist = list_graph,ncol = round(length(unique(orange[,pdt]))/2,0), nrow=2)
} else{
  plot_grid(plotlist = list_graph,labels=levels(orange[,pdt]),ncol = round(length(unique(orange[,pdt]))/2,0)+1, nrow=2)
}