NIPALS <- function(X){
  X = as.matrix(X)
  N = nrow(X)
  M = ncol(X)
  
  D = diag(1/N, N)
  Xini = X
  qrX=qr(X)
  rang = qrX$rank
  vec=matrix(0,nrow=M,ncol=rang) 
  t=X[,1]
  i=1
  
  p=t(X)%*%t%*%(1/(t(t)%*%t))
  p=p/as.numeric(sqrt(t(p)%*%p))
  print(rang)
  while (i<rang+1) {
    norm=1
    while(norm>0.000001){
      t=(X%*%p)%*%(1/(t(p)%*%p))
      p2=t(X)%*%t%*%(1/(t(t)%*%t))
      p2=p2/as.numeric(sqrt(t(p2)%*%p2))
      diff=p2-p
      norm=t(diff)%*%diff
      p=p2
      print(p)
      print(i)
    }
    vec[,i]=p
    X=X-(t%*%t(p))
    i=i+1
  }
  return(vec)
}

NIPALS(means.variables)
svd(means.variables)$v
