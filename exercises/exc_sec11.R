library(dplyr)
library(SensoMineR)
experts <- read.csv("data/perfumes_qda_experts.csv")
experts$Product <- as.factor(experts$Product)
experts$Panelist <- as.factor(experts$Panelist)
experts$Session <- as.factor(experts$Session)
experts$Rank <- as.factor(experts$Rank)
levels(experts$Product)[4] <- "Cinéma"
experts.subset <- experts %>%
  select(c(Panelist,Product,Floral,Marine,Fruity,Heady,Wrapping,Oriental,Greedy,Vanilla)) %>%
  filter(Product == "Angel" | Product == "Pleasures" | Product == "J'adore EP" | Product == "Aromatics Elixir"
         | Product == "Shalimar" | Product == "Chanel N5" | Product == "Lolita Lempicka")
experts.subset <- droplevels(experts.subset)
res.decat <- decat(experts.subset, formul = "~Product+Panelist", firstvar = 3, graph = FALSE)
res <- as.matrix(res.decat$adjmean)
I <- nrow(res)
J <- ncol(res)
D = diag(1/I, J)
g <- rep(1,I) %*% res %*% D
col.1 <- matrix(1,I,1)
G <- col.1 %*% g
res.c <- res-G
inv.sigma <- 1/sqrt(diag(t(res.c) %*% res.c)/I)
w <- matrix(diag(1/sqrt(diag(t(res.c) %*% res.c)/I)), ncol=J)
res.cr <- res.c %*% w