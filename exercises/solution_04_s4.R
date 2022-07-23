cont.jar <- function (x){
  
  ind.jar <- 2:ncol(x)
  nbmod = rep(0, ncol(x))
  for (j in ind.jar) nbmod[j] = nlevels(x[, j])
  nbmodtot = sum(nbmod)
  cont.table.jar <- matrix(NA, nrow = nbmodtot, ncol = nlevels(x[,1])) 
  for (j in 1:ncol(cont.table.jar)) cont.table.jar[, j] <- unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table))
  rownames(cont.table.jar) = names(unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table)))
  colnames(cont.table.jar) = levels(x[, 1])
  
  return(cont.table.jar)
}