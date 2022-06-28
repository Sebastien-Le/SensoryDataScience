library(dplyr)
sub_experts <- experts %>%
  filter(Product=="Angel"|Product=="J'adore ET")
summary(sub_experts)