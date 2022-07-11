library(ggplot2)
library(dplyr)
library(SensoMineR)
experts <- read.csv("data/perfumes_qda_experts.csv")
experts$Product <- as.factor(experts$Product)
experts$Panelist <- as.factor(experts$Panelist)
experts$Session <- as.factor(experts$Session)
experts$Rank <- as.factor(experts$Rank)
levels(experts$Product)[4] <- "Cinéma"
experts_subset <- experts %>%
  select(c(Panelist,Product,Floral,Marine,Fruity,Heady,Wrapping,Oriental,Greedy,Vanilla)) %>%
  filter(Product == "Angel" | Product == "Pleasures" | Product == "J'adore EP" | Product == "Aromatics Elixir"
         | Product == "Shalimar" | Product == "Chanel N5" | Product == "Lolita Lempicka")
experts_subset <- droplevels(experts_subset)
res.decat <- decat(experts_subset, formul = "~Product+Panelist", firstvar = 3, graph = FALSE)