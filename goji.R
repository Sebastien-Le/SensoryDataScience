# Un-comment and run line from 2 to 5 once
# install.packages("ggplot2")
# install.packages("ggrepel")
# install.packages("SensoMineR")
# install.packages("stringr")

# Let’s first import the data, and make sure that what should be categorical is categorical.

goji <- read.csv2("data/goji.csv")
summary(goji)

# As data are not considered as categorical, recode them with the as.factor() function and a simple loop.

for (j in 1:12) goji[,j] <- as.factor(goji[,j])
summary(goji)

# Create two R objects named goji.liking and goji.typicity, in which you store the proper information,
# which are consumer variable, the product variable, the liking (or assimilated) variable, and finally 
# the sensory attributes evaluated on a JAR scale.

goji.liking <- goji[,-c(2,3,5,6,14)]
goji.typicity <- goji[,-c(2,3,5,6,13)]

# Then run the JAR() function of the SensoMineR package on both objects, store the results in two 
# separate objects and compare the estimation of the penalties for the model that takes into 
# account all the sensory attributes at the same time.

library(SensoMineR)
res.jar.liking <- JAR(goji.liking, col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")
res.jar.typicity <- JAR(goji.typicity, col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")

res.jar.liking$penalty2
res.jar.typicity$penalty2

# Let’s plot the two sets of penalties. First, build the proper data set as input of the 
# ggplot() and geom_point() functions: a data frame, where rows correspond to defects and 
# columns to penalties for the liking and the typicity.

penalties <- cbind(res.jar.liking$penalty2, res.jar.typicity$penalty2)[,c(1,4)]
colnames(penalties) <- c("Liking","Typicity")
penalties <- as.data.frame(penalties)
penalties

# https://ggplot2.tidyverse.org/reference/geom_point.html
# 1st attempt

library(ggplot2)
ggplot(penalties, aes(x = Liking, y = Typicity)) +
  geom_point() +
  geom_text(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Liking") +
  ylab("Penalties for Typicity") +
  ggtitle("Impact of defects on liking and typicity")

# The coord_fixed function is very useful in case you want a 
# fixed aspect ratio for your plot regardless the size of the plotting device, 
# this is, one unit along the X axis will be the same unit along the Y axis.
# https://ggplot2.tidyverse.org/reference/coord_fixed.html

# 2nd attempt
# Run the `summary()` function for min and max for ggplot.

summary(penalties)

ggplot(penalties, aes(x = Liking, y = Typicity)) +
  geom_point() +
  geom_text(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Liking") +
  ylab("Penalties for Typicity") +
  ggtitle("Impact of defects on liking and typicity") +
  coord_fixed() +
  ylim(-2.8,0.3) +
  xlim(-2.8,0.3)


# https://ggrepel.slowkow.com/index.html
# https://ggrepel.slowkow.com/reference/geom_text_repel.html
# put the labels of the defects.

library(ggrepel)
ggplot(penalties, aes(x = Liking, y = Typicity)) +
  geom_point() +
  geom_text_repel(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Liking") +
  ylab("Penalties for Typicity") +
  ggtitle("Impact of defects on liking and typicity") +
  coord_fixed() +
  ylim(-2.8,0.5) +
  xlim(-2.8,0.5)

ggplot(penalties, aes(x = Liking, y = Typicity)) +
  geom_point() +
  geom_text_repel(label = rownames(penalties), max.overlaps = Inf) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Liking") +
  ylab("Penalties for Typicity") +
  ggtitle("Impact of defects on liking and typicity") +
  coord_fixed() +
  ylim(-2.8,0.5) +
  xlim(-2.8,0.5)


# https://ggplot2-book.org/polishing.html
# attempt theme
ggplot(penalties, aes(x = Liking, y = Typicity)) +
  geom_point() +
  geom_text_repel(label = rownames(penalties), max.overlaps = Inf) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Liking") +
  ylab("Penalties for Typicity") +
  ggtitle("Impact of defects on liking and typicity") +
  coord_fixed() +
  ylim(-2.8,0.5) +
  xlim(-2.8,0.5) +
  theme_light()


# multivariate analysis
# 1st attempt
# the summary() function allows to choose the active variables.

summary(goji)
res.mca <- MCA(goji, quali.sup = 1:6, quanti.sup = 13:14, graph = F)
plot.MCA(res.mca)
plot.MCA(res.mca, invisible = c("var", "quali.sup"), label = "no")

# 2nd attempt
res.mca <- MCA(goji, quali.sup = 1:6, quanti.sup = 13:14, graph = F, level.ventil = 0.1)
plot.MCA(res.mca, invisible = c("var", "quali.sup"), label = "no")

plot.MCA(res.mca, invisible = c("ind", "quali.sup"))
plot.MCA(res.mca, invisible = "ind")

# 3rd attempt
res.mca <- MCA(goji[,-c(1:3)], quali.sup = 1:3, quanti.sup = 10:11, graph = F, level.ventil = 0.1)
plot.MCA(res.mca, invisible = "ind")

#  Select the JAR categories and the formulation categories that you want to display.

library(stringr)
mod <- "JAR"
all.attr <- rownames(res.mca$var$coord)
mod.select <- all.attr[which(str_detect(all.attr, mod))]

plot.MCA(res.mca, invisible = "ind", selectMod = c("orange","pineapple","apple","20","10","0",mod.select))

plot.MCA(res.mca, choix = "quanti.sup")

# Create a contingency table between the products and the JAR attributes.

goji.inter <- goji[,c(4,7:12)]

j <- 2
contingency <- table(goji.inter$Product,goji.inter[,j])
contingency
colnames(contingency) <- paste(colnames(goji.inter)[j], levels(goji.inter[,j]), sep = "_")

for (j in 3:7){
  inter <- table(goji.inter$Product,goji.inter[,j])
  colnames(inter) <- paste(colnames(goji.inter)[j], levels(goji.inter[,j]), sep = "_")
  contingency <- cbind(contingency, inter)
}

# very important `apply()` function.
# https://www.r-bloggers.com/2010/08/a-brief-introduction-to-%e2%80%9capply%e2%80%9d-in-r/

Apple <- apply(contingency[c("127","431","759"),], FUN = sum, 2)
Pineapple <- apply(contingency[c("245","518","876"),], FUN = sum, 2)
Orange <- apply(contingency[c("362","694","983"),], FUN = sum, 2)

D0 <- apply(contingency[c("127","245","362"),], FUN = sum, 2)
D10 <- apply(contingency[c("431","518","694"),], FUN = sum, 2)
D20 <- apply(contingency[c("759","876","983"),], FUN = sum, 2)

# Let's bind it to the main contingency table.

row.sup <- rbind(Apple,Pineapple,Orange,D0,D10,D20)

contingency <- rbind(contingency,row.sup)

# Let's run the CA.

res.ca <- CA(contingency, graph = F, row.sup = c(10:15))
plot.CA(res.ca, invisible = "col")
ellipseCA(res.ca, ellipse = "row", invisible = "col")

# Let's run a description of frequencies in order to characterize the products.

descfreq(contingency[c(1:9),])
descfreq(contingency[c(10:12),])
descfreq(contingency[c(13:15),])

# Taking into account the sessions.
# Penalty analysis sessions comparison.

goji.liking.s1 <- goji[goji$Session =="S1",-c(2,3,5,6,14)]
goji.liking.s2 <- goji[goji$Session =="S2",-c(2,3,5,6,14)]

res.jar.s1 <- JAR(goji.liking.s1, col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")
res.jar.s2 <- JAR(goji.liking.s2, col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")

penalties <- cbind(res.jar.s1$penalty2, res.jar.s2$penalty2)[,c(1,4)]
colnames(penalties) <- c("Session_1","Session_2")
penalties <- as.data.frame(penalties)

# Identify min and max for ggplot.

summary(penalties)

ggplot(penalties, aes(x = Session_1, y = Session_2)) +
  geom_point() +
  geom_text_repel(label = rownames(penalties), max.overlaps = Inf) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Session_1") +
  ylab("Penalties for Session_2") +
  ggtitle("Impact of defects on session 1 and session2") +
  coord_fixed() +
  ylim(-3,0.5) +
  xlim(-3,0.5) +
  theme_light()

# Multivariate advanced - representation of the groups.

goji.s1 <- goji[goji$Session =="S1",]
goji.s2 <- goji[goji$Session =="S2",]

goji.s1 <- goji.s1[order(goji.s1$Consumer, goji.s1$Product), ]
goji.s2 <- goji.s2[order(goji.s2$Consumer, goji.s2$Product), ]

goji.s1[1:5,]
goji.s2[1:5,]

goji.s1.s2 <- cbind(goji.s1[,-c(1:6,13:14)], goji.s2[,-c(1:6,13:14)])
print("Done!")

res.mfa <- MFA(goji.s1.s2, group = c(6,6), type = c("n","n"), name.group = c("S1","S2"), graph = F)
plot.MFA(res.mfa, choix = "group")

# Multiple Factor Analysis on contingency tables.

j <- 7
goji.s1.prod <- table(goji.s1$Product, goji.s1[,j])
colnames(goji.s1.prod) <- paste(colnames(goji.s1)[j], levels(goji.s1[,j]), sep = "_")

for (j in 8:12){
  inter <- table(goji.s1$Product, goji.s1[,j])
  colnames(inter) <- paste(colnames(goji.s1)[j], levels(goji.s1[,j]), sep = "_")
  goji.s1.prod <- cbind(goji.s1.prod, inter)
}

j <- 7
goji.s2.prod <- table(goji.s2$Product, goji.s2[,j])
colnames(goji.s2.prod) <- paste(colnames(goji.s2)[j], levels(goji.s2[,j]), sep = "_")

for (j in 8:12){
  inter <- table(goji.s2$Product, goji.s2[,j])
  colnames(inter) <- paste(colnames(goji.s2)[j], levels(goji.s2[,j]), sep = "_")
  goji.s2.prod <- cbind(goji.s2.prod, inter)
}

goji.prod.s1.s2 <- cbind(goji.s1.prod, goji.s2.prod)

res.mfa <- MFA(goji.prod.s1.s2, group = c(30,30), type = c("f","f"), name.group = c("S1","S2"), graph = F)
plot.MFA(res.mfa, choix = "group")
