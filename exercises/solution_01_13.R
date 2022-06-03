d<-density(experts$Vanilla)

# Plot the line
plot(d, main="Vanilla distribution and median")
p50 <- which.max(cumsum(d$y/sum(d$y)) >= 0.50)

# Plot the shading
polygon(c(-5, d$x[1:p50], d$x[p50]), c(0, d$y[1:p50], 0), col="lightblue")