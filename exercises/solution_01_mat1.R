res <- as.matrix(res.decat$adjmean)
I <- nrow(res)
J <- ncol(res)
D = diag(1/I, J)
g <- rep(1,I) %*% res %*% D
col.1 <- matrix(1,I,1)
G <- col.1 %*% g
res.c <- res-G
res.c