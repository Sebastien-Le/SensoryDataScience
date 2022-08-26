#
library(dplyr)
experts.2products <- experts %>% filter(Product == "____"|Product == "J’adore ET")
summary(experts.2products)

#
experts.Angel <- experts[experts$Product=="____", ]
experts.Angel

#
experts.2products <- experts[experts$Product=="____"|experts$Product=="____", ]
experts.2products

#
condition <- c("Angel","J'adore ET")
experts.2products <- experts[experts$Product %in% condition,]
experts.2products

#
summary(experts.2products)

#
droplevels(experts.2products$Product)
experts.2products$Product <- droplevels(experts.2products$Product)
summary(experts.2products)

#
ggplot(experts.2products) +
  aes(x = Floral, color = Product) +
  geom_density() +
  labs(title = "Density of Floral for Angel and J'adore ET", x = "Floral values", y = "Density")

#
ggplot(experts.2products) +
  aes(x = Floral, fill = Product) +
  geom_density(alpha = 0.5)  +
  labs(title = "Density of Floral for Angel and J'adore ET", x = "Floral values", y = "Density")

#
ggplot(experts.2products) +
  aes(y = Floral, x = Product, color = Product) +
  geom_boxplot() +
  labs(title = "Boxplots of Floral conditionnally to Angel and J'adore ET")