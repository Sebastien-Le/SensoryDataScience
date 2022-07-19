exp.design <- data.frame(matrix(ncol = 3, nrow = dim(orange)[1]))
colnames(exp.design) <- c("Brand","Pulp","Temperature")

for (i in 1:dim(orange)[1]){
  pdt <- orange$Juice[i]
  pdt_split <- str_split(pdt,"")[[1]]
  if(pdt_split[2]=="J"){
    exp.design[i,1] <- "Jafaden"
  }
  else{
    exp.design[i,1] <- "Tropicana"
  }
  if(pdt_split[3]=="P"){
    exp.design[i,2] <- "With pulp"
  }
  else{
    exp.design[i,2] <- "Without pulp"
  }
  if(pdt_split[4]=="A"){
    exp.design[i,3] <- "Ambient"
  }
  else{
    exp.design[i,3] <- "Refrigerated"
  }
}

orange <- cbind(orange,exp.design)