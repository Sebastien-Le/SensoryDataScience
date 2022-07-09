distrib.Position.H.Food <- summary(GMO$Position.H.Food)
distrib.Position.H.Food
#re-order the information
distrib.Position.H.Food[c(3, 2, 1, 4)]

#visualization
barplot(distrib.Position.H.Food[c(3, 2, 1, 4)])