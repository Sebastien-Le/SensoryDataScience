#
demo()

#
demo(graphics)

#
experts <- read.csv("data/perfumes_qda_experts.csv")

#
experts <- read.csv(file = "data/perfumes_qda_experts.csv")

#
experts <- read.table(file = "data/perfumes_qda_experts.csv", header = TRUE, sep = ",", quote = "\"")

#
experts[1:5,1:8]

#
head(experts)

#
summary(experts)

#
experts$Product <- as.factor(experts$Product)

#
experts$Panelist <- as.factor(experts$Panelist)
experts$Session <- as.factor(experts$Session)
experts$Rank <- as.factor(experts$Rank)

#
head(experts)

#
summary(experts)

#
levels(experts$Product)

#
levels(experts$Product)[4]

#
levels(experts$Product)[4] <- "Cinéma"
levels(experts$Product)

#
for (j in 1:4) experts[,j] <- as.factor(experts[,j])

#
for (j in 1:4){
  as.factor(experts[,j])
}

#
summary(experts)

#
x1 <- mean(experts$Spicy)
x2 <- quantile(experts$Spicy)
c(x1,x2)

#
loc.parameters <- data.frame("mean" = double(), "median" = double(), "q1" = double(), "q3" = double())
loc.parameters

#
for (j in 5:16){
  me <- mean(experts[,j])
  med <- quantile(experts[,j], 0.5)
  q1 <- quantile(experts[,j], 0.25)
  q3 <- quantile(experts[,j], 0.75)
  loc.parameters <- rbind(loc.parameters, c(me,med,q1,q3))
}
loc.parameters

#
colnames(loc.parameters) <- c("mean","median","q1","q3")
rownames(loc.parameters) <- colnames(experts[,5:16])
loc.parameters