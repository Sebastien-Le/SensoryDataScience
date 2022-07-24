cont.categories <- function (x){
  
  ind.jar <- 2:ncol(x)
  nbmod = rep(0, ncol(x))
  for (j in ind.jar) nbmod[j] = nlevels(x[, j])
  nbmodtot = sum(nbmod)
  cont.table.cat <- matrix(NA, nrow = nbmodtot, ncol = nlevels(x[,1])) 
  for (j in 1:ncol(cont.table.cat)) cont.table.cat[, j] <- unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table))
  rownames(cont.table.cat) = names(unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table)))
  colnames(cont.table.cat) = levels(x[, 1])
  
  return(cont.table.cat)
}
print("Done!")