means_simulated=vector(mode = "numeric", length = 100)
for (i in 1:100){
  a=rnorm(20,85,2)
  means_simulated[i]=mean(a)
}
mean(means_simulated)