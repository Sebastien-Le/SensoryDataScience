res.svd <- svd(res.cr)
res.svd$u%*%diag(res.svd$d)%*%t(res.svd$v)
res.cr

#Individuals coordinates
res.cr%*%res.svd$v
res.pca$ind$coord
#Variables coordinates
t(res.cr)%*%res.svd$u/sqrt(nrow(res.cr))
res.pca$var$coord