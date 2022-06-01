d<-density(____)

# Plot the line
plot(d, main="____ Distribution and quartile")
p25 <- which.max(cumsum(d$y/sum(d$y)) >= 0.25)
p75 <- which.max(cumsum(d$y/sum(d$y)) >= 0.75)

# Plot the shading
polygon(c(-5, d$x[1:p25], d$x[p25]), c(0, d$y[1:p25], 0), col = 'lightblue')
poly_range <- d$x > d$x[p75] 
polygon(c(d$x[p75], d$x[poly_range], 15),c(0, d$y[poly_range], 0),col = "lightblue") 