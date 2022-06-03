d<-density(experts$Vanilla)

# Plot the line
plot(d, main="Vanilla Distribution and quantiles")
q025 <- which.max(cumsum(d$y/sum(d$y)) >= 0.025)
q975 <- which.max(cumsum(d$y/sum(d$y)) >= 0.975)

# Plot the shading
polygon(c(-5, d$x[1:q025], d$x[q025]), c(0, d$y[1:q025], 0), col = "lightblue")
polygon(c(d$x[q975], d$x[d$x > d$x[q975]], 15), c(0, d$y[d$x > d$x[q975]], 0), col="lightblue")

# Plot the vline for mean
abline(v=mean(experts$Vanilla))
text(mean(experts$Vanilla), 0.2, "mean", pos=2)

# Plot the vline for Q97.5
abline(v=d$x[q975])
text(d$x[q975], 0.2, "Q97.5", pos=2)

# Plot the vline for Q0.25
abline(v=d$x[q025])
text(d$x[q025], 0.2, "Q0.25", pos=2)