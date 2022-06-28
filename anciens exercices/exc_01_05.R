# To get 3 graphs on a single window :
layout(matrix(__,_,_))

for (a in 5:16){
  boxplot(____, xlab=___)
  
  # Mean
  text(0.75, mean(experts[,a])+0.25, "mean", pos=2)
  abline(h=mean(experts[,a]))
  
  # Q1
  text(0.75,_____+0.25, "___", pos=2)
  abline(h=_____)
  
  # Q3
  text(____)
  abline(_____)
  
  # Median
  ____
  ____
}