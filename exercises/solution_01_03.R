layout(matrix(1:2,1:2))

d1 <- density(experts$Spicy) 
plot(d1, main = "Density of Spicy") 

d2 <- density(experts$Heady) 
plot(d2, main="Density of Heady") 