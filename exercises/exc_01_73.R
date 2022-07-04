boxplot(experts$Fruity)
hist(experts$Spicy,
     breaks = 50,
     probability = TRUE,
     main = "Distribution of the values for the Spicy attribute")
density(experts$Vanilla)