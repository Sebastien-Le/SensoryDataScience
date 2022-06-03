svd <- svd(scale(means.variables))
diag <- diag(svd$d)

#Verification
svd$u%*%diag%*%t(svd$v)
scale(as.matrix(means.variables))[1:3,1:3]

#Individuals coordinates
scale(means.variables)%*%svd$v
#Variables coordinates
t(scale(means.variables))%*%svd$u/sqrt(3)

#Comparate with PCA()
res$ind$coord
res$var$coord