#
boxplot(experts$Fruity)

#
par(mfrow=c(1,3))
for (j in 5:7) boxplot(experts[,j], main = colnames(experts)[j])

#
par(mfrow=c(1,3))
for (j in 5:7) {
  boxplot(experts[,j], main = colnames(experts)[j])
  abline(h=mean(experts[,j]))
}

#
experts$Spicy[experts$Spicy<=1]
length(experts$Spicy[experts$Spicy<=1])

#
experts$Spicy[1<experts$Spicy & experts$Spicy<=2]
length(experts$Spicy[1<experts$Spicy & experts$Spicy<=2])

#
hist(experts$Spicy)

#
hist(experts$Spicy, breaks=50)

#
hist(experts$Spicy, breaks=50, ylab="Number of occurences")

#
hist(experts$Spicy,
     breaks=50,
     probability=TRUE,
     main="Distribution of the values for the Spicy attribute")

#
d <- density(experts$Spicy)
plot(d,main="Density of Spicy")

#
names(d)

#
plot(x=d$x,y=d$y,main="Density of Spicy")

#
library(ggplot2)
ggplot(experts) + aes(x = Spicy) + geom_histogram()

#
ggplot(experts) + aes(x = Spicy, y = ..density..) + geom_histogram(bins = 50)