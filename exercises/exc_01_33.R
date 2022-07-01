d <- density(experts$Vanilla)
i_mean <- which.max(__$__ >= mean(experts$Vanilla))
pcum1 <- cumsum(__$__/sum(__$__))[i_mean]-0.15
pcum2 <- cumsum(__$__/sum(__$__))[i_mean]+0.15
x_1 <- which.max(cumsum(__$__/sum(__$__)) >= pcum1)
x_2 <- which.max(cumsum(__$__/sum(__$__)) >= pcum2)
d$x[x_1]
d$x[x_2]
plot(d, main = "The notion of dispersion around the mean", type = "l", lwd = 2, col = "blue")
polygon(c(d$x[x_1], d$x[x_1:x_2],d$x[x_2]), c(0,d$y[x_1:x_2],0), col = 'lightblue')