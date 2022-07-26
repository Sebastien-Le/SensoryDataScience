# Un-comment and run line from 2 to 8 once
# install.packages(" cowplot")
# install.packages("ade4")
# install.packages("FactoMineR")
# install.packages("stringr")
# install.packages("ggplot2")
# install.packages("ggrepel")
# install.packages("SensoMineR")

# With the `read.csv2()` function, import the orange data set and save it in an R object named orange. 
# With the `summary()` function, make sure that the data set has been well imported.
# Check carefully the type of each variable.
# As there are 8 orange juices in the case study, set the `maxsum` argument to 8.
# Pay attention to the folder where is orange.csv

orange <- read.csv2("data/orange.csv")
summary(orange, maxsum = 8)

# With the `as.factor()` function, encode all the variables except the *Liking* as factors. With the `levels()` and the `nlevels()` functions, make sure that you have 106 consumers.

for (j in c(1:2,4:9)) orange[,j] <- as.factor(orange[,j])
levels(orange$Consumer)
nlevels(orange$Consumer)

# Visualization of the data distribution.
# https://r-charts.com/colors/

table(orange[,5])
tab <- as.data.frame(table(orange[,5]))

# 1st attempt

library(ggplot2)
ggplot(tab, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange")

# 2nd attempt

ggplot(tab, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ggtitle("Distribution of modalities for the attribute Io")

# 3rd attempt

ggplot(tab, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ggtitle("Distribution of modalities for the attribute Io") +
  theme_minimal()

# The same type of visualization can be obtained by product.

table(orange[,2],orange[,5])
tab <- as.data.frame(table(orange[,2],orange[,5]))

# 1st attempt

JPA <- ggplot(tab[tab$Var1 == "1JPA",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ggtitle("Distribution for the attribute Io and 1JPA") +
  theme_minimal()

JPA

TWA <- ggplot(tab[tab$Var1 == "7TWA",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ggtitle("Distribution for the attribute Io and 7TWA") +
  theme_minimal()

TWA

library(cowplot)
plot_grid(JPA, TWA, labels=c("(a)", "(b)"), ncol = 2, nrow = 1)

# 2nd attempt

tab[tab$Var1 == "1JPA"|tab$Var1 == "7TWA",]
max(tab[tab$Var1 == "1JPA"|tab$Var1 == "7TWA",]$Freq)

JPA <- ggplot(tab[tab$Var1 == "1JPA",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ylim(0, 45) +
  ggtitle("Distribution for the attribute Io and 1JPA") +
  theme_minimal()

TWA <- ggplot(tab[tab$Var1 == "7TWA",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ylim(0, 45) +
  ggtitle("Distribution for the attribute Io and 7TWA") +
  theme_minimal()

plot_grid(JPA, TWA, labels = c("A","B"), ncol = 2, nrow = 1)

# Aggregate the categories 1 and 2 into ne for not enough, 4 and 5 into tm for too much, 
# and finally recode the category 3 into JAR.

for (j in 4:9) levels(orange[,j]) <- c("ne","ne","JAR","tm","tm")

# Recoding of the variables with the `acm.disjonctif()` function.

library(ade4)
orange.dummy <- acm.disjonctif(orange[,4:9])
orange.dummy[1:5,]

# Creation of an R object containing the information about the consumers, 
# the products and the dummy variables.

orange.dummy <- cbind(orange[,1:3], orange.dummy)
orange.dummy[1:5,]

# Use the AovSum() function of the FactoMineR package to estimate your model for which the liking is explained by 
# the presence or absence of the defects, the consumers and the products.

library(FactoMineR)
res.penalty.all <- AovSum(Liking ~ Nc.ne + Nc.tm + Io.ne + Io.tm + Su.ne + Su.tm +
                            Ac.ne + Ac.tm + Bt.ne + Bt.tm + Pu.ne + Pu.tm +
                            Consumer + Juice, data = orange.dummy)
names(res.penalty.all)
res.penalty.all$Ttest

# More easily with the `JAR()` function.

library(SensoMineR)
res.jar <- JAR(orange, col.p = 2, col.j = 1, col.pref = 3, jarlevel="JAR")
res.jar$penalty2

# Focus on one product.

plot.JAR(res.jar, name.prod = "2JPR", model = 2)

# The graphical output is not informative when the levels of the sensory attributes are the same. 
# Consequently, they are changed with the paste() function, 
# to add the name of the attribute in front of its levels.

j<- 5
colnames(orange)[j]
levels(orange[,j])[1]
paste(colnames(orange)[j], levels(orange[,j])[1], sep=".")

for (j in 4:9) levels(orange[,j]) <- c(paste(colnames(orange)[j], levels(orange[,j])[1], sep="."),"JAR",
                                       paste(colnames(orange)[j], levels(orange[,j])[3], sep="."))
summary(orange)

# JAR function.

res.jar <- JAR(orange, col.p = 2, col.j = 1, col.pref = 3, jarlevel="JAR")
plot.JAR(res.jar, name.prod = "6TPR", model = 2)

# Penalties can also be estimated for each product.

orange.dummy.2JPR <- orange.dummy[orange.dummy$Juice == "2JPR",]

# Use the AovSum() function to estimate your model for which the liking is explained by the presence or absence of the defects.
res.penalty.one <- AovSum(Liking ~ Nc.ne + Nc.tm + Io.ne + Io.tm + Su.ne + Su.tm +
                            Ac.ne + Ac.tm + Bt.ne + Bt.tm + Pu.ne + Pu.tm,
                          data = orange.dummy.2JPR)
res.penalty.one$Ttest

#They can be compared.

penalties <- cbind(res.jar$penalty2, res.penalty.one$Ttest[-1,])[,c(1,4)]
penalties <- as.data.frame(penalties)
colnames(penalties) <- c("All_products","JPR")

# https://ggplot2.tidyverse.org/reference/geom_point.html
# 1st attempt

ggplot(penalties, aes(x = All_products, y = JPR)) +
  geom_point() +
  geom_text(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for all products") +
  ylab("Penalties for JPR") +
  ggtitle("Impact of defects: product space versus JPR")

# The coord_fixed function is very useful in case you want a 
# fixed aspect ratio for your plot regardless the size of the plotting device, 
# this is, one unit along the X axis will be the same unit along the Y axis.
# https://ggplot2.tidyverse.org/reference/coord_fixed.html

# 2nd attempt
# For min and max for ggplot.

summary(penalties)

ggplot(penalties, aes(x = All_products, y = JPR)) +
  geom_point() +
  geom_text(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for all products") +
  ylab("Penalties for JPR") +
  ggtitle("Impact of defects: product space versus JPR") +
  coord_fixed() +
  ylim(-2,0.5) +
  xlim(-2,0.5)

# https://ggrepel.slowkow.com/index.html
# https://ggrepel.slowkow.com/reference/geom_text_repel.html
# attempt ggrepel

library(ggrepel)
ggplot(penalties, aes(x = All_products, y = JPR)) +
  geom_point() +
  geom_text_repel(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for all products") +
  ylab("Penalties for JPR") +
  ggtitle("Impact of defects: product space versus JPR") +
  coord_fixed() +
  ylim(-2,0.5) +
  xlim(-2,0.5)

# https://ggplot2-book.org/polishing.html
# attempt theme
ggplot(penalties, aes(x = All_products, y = JPR)) +
  geom_point() +
  geom_text_repel(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for all products") +
  ylab("Penalties for JPR") +
  ggtitle("Impact of defects: product space versus JPR") +
  coord_fixed() +
  ylim(-2,0.5) +
  xlim(-2,0.5) +
  theme_light()

# Running a Multiple Correspondence Analysis

res.mca <- MCA(orange, quanti.sup = 3, quali.sup = 1:2, graph = F)
plot.MCA(res.mca, invisible = c("var","quali.sup"), label = "none", title = "Understanding defects profiles (ind.)")
plot.MCA(res.mca, invisible = c("ind","var"), label = "none", title = "Understanding defects profiles (sup. var.)")

res.mca <- MCA(orange[,-1], quanti.sup = 2, quali.sup = 1, graph = F)
plot.MCA(res.mca, invisible = c("ind","var"), title = "Understanding defects profiles (sup. var.)")
plot.MCA(res.mca, choix = "quanti.sup", title = "Understanding defects profiles (sup. var.)")

orange$Liking.cat <- as.factor(orange$Liking)
res.mca <- MCA(orange[,-1], quanti.sup = 2, quali.sup = c(1,9), graph = F)
plot.MCA(res.mca, invisible = c("ind","var"), title = "Understanding defects profiles (sup. var.)")

plot.MCA(res.mca, invisible = "ind", title = "Understanding defects profiles (sup. var.)")
names(res.mca)
names(res.mca$var)
res.mca$var$coord
rownames(res.mca$var$coord)
mod.active <- rownames(res.mca$var$coord)

library(stringr)
str_detect(mod.active, "JAR")
which(str_detect(mod.active, "JAR"))
mod.active[which(str_detect(mod.active, "JAR"))]

mod <- "JAR"
mod.select <- mod.active[which(str_detect(mod.active, mod))]
plot.MCA(res.mca, invisible = "ind", selectMod = c(mod.select,rownames(res.mca$quali.sup$coord)))

# As mentioned previously, the juices were chosen according to 3 factors: the question arises as to whether the structure 
# revealed by the analysis can be linked to these factors. Therefore, it makes sense to add this information in the orange data. 
# To do so, we are going to manipulate strings.

# Exercise - break

exp.design <- data.frame(matrix(ncol = 3, nrow = dim(orange)[1]))
colnames(exp.design) <- c("Brand","Pulp","Temperature")

for (i in 1:dim(orange)[1]){
  pdt <- orange$Juice[i]
  pdt_split <- str_split(pdt,"")[[1]]
  if(pdt_split[2]=="J"){
    exp.design[i,1] <- "Jafaden"
  }
  else{
    exp.design[i,1] <- "Tropicana"
  }
  if(pdt_split[3]=="P"){
    exp.design[i,2] <- "With pulp"
  }
  else{
    exp.design[i,2] <- "Without pulp"
  }
  if(pdt_split[4]=="A"){
    exp.design[i,3] <- "Ambient"
  }
  else{
    exp.design[i,3] <- "Refrigerated"
  }
}

orange <- cbind(orange, exp.design)
orange[1:5,]