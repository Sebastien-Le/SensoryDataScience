res.svd <- svd(res.cr)
res.svd$u%*%diag(res.svd$d)%*%t(res.svd$v)
res.cr