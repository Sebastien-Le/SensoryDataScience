m <- mean(experts.Angel$Floral)
s <- sd(experts.Angel$Floral)
n <- nrow(experts.Angel)
Iinf <- m - qt(0.975, n-1)*s/sqrt(n)
Isup <- m + qt(0.975, n-1)*s/sqrt(n)
Iinf
Isup