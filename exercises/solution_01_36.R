library(dplyr)
experts.2products <- experts %>% filter(Product == "Angel"|Product == "J’adore ET")
summary(experts.2products)