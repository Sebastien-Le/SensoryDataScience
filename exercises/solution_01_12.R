plot(density(experts$Vanilla), col="blue", main="Vanilla and Floral density")
lines(density(experts$Floral), col="red")

legend(10, 0.2, legend=c("Vanilla", "Floral"),col=c("blue", "red"), lty=1:2, cex=0.8)