d<-density(experts$Vanilla)

# Plot the line
plot(d, main="Vanilla Distribution and quartile")

# Get indexes of quantiles 0.25 and 0.75
q25 <- which.max(cumsum(d$y/sum(d$y)) >= 0.25)
q75 <- which.max(cumsum(d$y/sum(d$y)) >= 0.75)

# Plot the first quantile
polygon(x=c(-5, d$x[1:q25], d$x[q25]), y=c(0, d$y[1:q25], 0), col = 'lightblue')

# Plot the third quantile
polygon(x=c(d$x[q75], d$x[d$x > d$x[q75]], 15),y=c(0, d$y[d$x > d$x[q75]], 0),col = "lightblue") 