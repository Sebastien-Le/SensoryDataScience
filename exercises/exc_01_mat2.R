inv.sigma <- 1/sqrt(diag(t(res.c) %*% res.c)/I)
w <- matrix(diag(1/sqrt(diag(t(res.c) %*% res.c)/I)), ncol=J)
res.cr <- res.c %*% w
res.cr