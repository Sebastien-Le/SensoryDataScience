for (j in 5:16){
  me <- mean(experts[,j])
  med <- quantile(experts[,j], 0.5)
  q1 <- quantile(experts[_,_], 0.25)
  q3 <- quantile(experts[,j], _)
  loc.parameters <- rbind(loc.parameters, c(me, med, q1, q3))
}

loc.parameters