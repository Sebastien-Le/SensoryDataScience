library(ggplot2)
experts <- read.csv("data/perfumes_qda_experts.csv")
experts$Product <- as.factor(experts$Product)
experts$Panelist <- as.factor(experts$Panelist)
experts$Session <- as.factor(experts$Session)
experts$Rank <- as.factor(experts$Rank)
levels(experts$Product)[4] <- "Cinéma"
print("Done!")