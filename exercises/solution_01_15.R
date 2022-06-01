d<-density(experts$Vanilla)

# Plot the line
plot(d, main="Vanilla Distribution and quantiles")
p025 <- which.max(cumsum(d$y/sum(d$y)) >= 0.025)
p975 <- which.max(cumsum(d$y/sum(d$y)) >= 0.975)

# Plot the shading
polygon(c(-5, d$x[1:p025], d$x[p025]), c(0, d$y[1:p025], 0), col = 'lightblue')
poly_range <- d$x > d$x[p975] 
polygon(c(d$x[p975], d$x[poly_range], 15),c(0, d$y[poly_range], 0),col = "lightblue")

# Plot the vline
abline(v=mean(perfumes$Vanilla))
text(mean(perfumes$Vanilla),0.2, "mean", pos=2)

abline(v=d$x[p975])
text(d$x[p975],0.2, "Q97.5", pos=2)

abline(v=d$x[p025])
text(d$x[p025],0.2, "Q0.25", pos=2)