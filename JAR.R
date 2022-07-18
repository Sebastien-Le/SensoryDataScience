library(readxl)
library(ade4)
library(FactoMineR)
library(ggplot2)
library(SensoMineR)
library(stringr)
library(dplyr)


#########################################################
#               Orange example                          #
#                                                       #
#########################################################

orange <- read.csv2("orange.csv")

summary(orange,maxsum = 8)
colnames(orange)
orange <- as.data.frame(orange)
for (j in c(1:2,4:9)) orange[,j] <- as.factor(orange[,j])
summary(orange)
for (j in 4:9) levels(orange[,j]) <- c("ne","ne","JAR","tm","tm")
summary(orange)
orange.disj <- acm.disjonctif(orange[,4:9])
summary(orange.disj)
orange.disj <- cbind(orange[,1:3],orange.disj)
colnames(orange.disj)
num_JAR <- seq(5,21,3)
num_col <- seq(4,21)
num_col <- num_col[-which(num_col%in%num_JAR)]
summary(orange.disj)

#Model 1
eq.anova <- "AovSum(Liking ~ "
for (i in num_col){
  eq.anova <- paste(eq.anova,colnames(orange.disj)[i],"+", sep=" ")
}
eq.anova <- paste(eq.anova, "Juice + Consumer, data = orange.disj)")
res.aov <- eval(parse(text = eq.anova))

#Model 2
orange.disj.pdt <- orange.disj[which(orange.disj$Juice=="1JPA"),]

eq.anova <- "AovSum(Liking ~ "

for (i in num_col[1:11]){
  eq.anova <- paste(eq.anova,colnames(orange.disj.pdt)[i],"+", sep=" ")
}

eq.anova <- paste(eq.anova, "Pu.tm, data = orange.disj.pdt)")
res.aov <- eval(parse(text = eq.anova))

#Multivariate
summary(orange)
orange$Liking <- as.factor(orange$Liking)
res.mca <- MCA(orange[,-c(1:2)], quali.sup = 1, graph = F)
plot.MCA(res.mca, invisible = c("ind"))

#SensoMineR
?JAR
summary(orange)
colnames(orange)
for (j in 4:9) levels(orange[,j]) <- c(paste(colnames(orange)[j],levels(orange[,j])[1],sep="."),"JAR",paste(colnames(orange)[j],levels(orange[,j])[3],sep="."))
summary(orange)

res.jar.orange <- JAR(orange,col.p = 2, col.j = 1, col.pref = 3, jarlevel = "JAR")
names(res.jar.orange)
res.jar.orange$Frequency
res.jar.orange$penalty2

# orange.1JPA <- orange[orange$Juice=="1JPA",]
# summary(orange.1JPA)
# 16/(21+69+16)*100

plot.JAR(res.jar.orange, name.prod = "1JPA", model = 2)

#########################################################
#                    Goji example                       #
#                                                       #
#########################################################

#Préparation jeu de données
# goji <- read_excel("Goji/goji.xlsx")
# summary(goji)     
# colnames(goji)
# goji <- as.data.frame(goji)
# for (j in 1:10) goji[,j] <- as.factor(goji[,j])
# summary(goji)
# levels(goji$Light_dark) <- c("JAR","t.light","t.dark","r.t.light","r.t.dark")
# levels(goji$Intensity) <- c("JAR","n.e.intense","t.intense","r.n.e.intense","r.t.intense")
# levels(goji$Sweet) <- c("JAR","n.e.sweet","t.sweet","r.n.e.sweet","r.t.sweet")
# levels(goji$Acidity) <- c("JAR","n.e.acid","t.acid","r.n.e.acid","r.t.acid")
# levels(goji$Bitterness) <- c("JAR","n.e.bitter","t.bitter","r.n.e.bitter","r.t.bitter")
# levels(goji$Fluid_thick) <- c("JAR","t.thick","t.fluid","r.t.thick","r.t.fluid")
#write.csv(goji, file = "goji.csv")

#Analyse du jeu de données
goji <- read.csv2("goji.csv")
summary(goji)     
colnames(goji)
goji <- as.data.frame(goji)
for (j in 1:10) goji[,j] <- as.factor(goji[,j])
summary(goji)

goji_jar <- goji[,-c(2,3,12)]

levels(goji_jar$Light_dark) <- c("JAR","t.dark","t.light","t.dark","t.light")
levels(goji_jar$Intensity) <- c("JAR","n.e.intense","n.e.intense","t.intense","t.intense")
levels(goji_jar$Sweet) <- c("JAR","n.e.sweet","n.e.sweet","t.sweet","t.sweet")
levels(goji_jar$Acidity) <- c("JAR","n.e.acid","n.e.acid","t.acid","t.acid")
levels(goji_jar$Bitterness) <- c("JAR","n.e.bitter","n.e.bitter","t.bitter","t.bitter")
levels(goji_jar$Fluid_thick) <- c("JAR","t.fluid","t.thick","t.fluid","t.thick")


colnames(goji_jar)
summary(goji_jar)

res.jar.goji <- JAR(goji_jar,col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")

res.jar.goji$Frequency
res.jar.goji$penalty2



#########################################################
#                    Sennheiser example                 #
#                                                       #
#########################################################

sennheiser <- read.csv2("sennheiser.csv")
colnames(sennheiser)
colnames(sennheiser)[30] <- "Serious"
summary(sennheiser)
for (j in c(1:30,33:35)) sennheiser[,j] <- as.factor(sennheiser[,j])
for (j in 4:22) levels(sennheiser[,j]) <- c("No","Yes")
for (j in 23:30) sennheiser[,j] <- factor(sennheiser[,j], levels = c('r_ne', 'ne', 'JAR', 't', 'r_t'))

#CATA, from 4 to 22

j <- 4
contingency.CATA <- table(sennheiser$Sound,sennheiser[,j])
colnames(contingency.CATA) <- paste(colnames(sennheiser)[j], levels(sennheiser[,j]), sep = "_")

for (j in 5:22){
  inter <- table(sennheiser$Sound,sennheiser[,j])
  colnames(inter ) <- paste(colnames(sennheiser)[j], levels(sennheiser[,j]), sep = "_")
  contingency.CATA <- cbind(contingency.CATA, inter)
}

A <- apply(contingency.CATA[grep("A_",rownames(contingency.CATA)),], FUN = sum, 2)
P <- apply(contingency.CATA[grep("P_",rownames(contingency.CATA)),], FUN = sum, 2)
V <- apply(contingency.CATA[grep("V_",rownames(contingency.CATA)),], FUN = sum, 2)

T120 <- apply(contingency.CATA[grep("_120",rownames(contingency.CATA)),], FUN = sum, 2)
T160 <- apply(contingency.CATA[grep("_160_",rownames(contingency.CATA)),], FUN = sum, 2)
T80 <- apply(contingency.CATA[grep("_80",rownames(contingency.CATA)),], FUN = sum, 2)

P1 <- apply(contingency.CATA[grep("0_1",rownames(contingency.CATA)),], FUN = sum, 2)
P3 <- apply(contingency.CATA[grep("0_3",rownames(contingency.CATA)),], FUN = sum, 2)
P5 <- apply(contingency.CATA[grep("0_5",rownames(contingency.CATA)),], FUN = sum, 2)

row.sup <- rbind(A,P,V,T120,T160,T80,P1,P3,P5)
row.sup <- as.data.frame(row.sup)

contingency.CATA <- rbind(contingency.CATA, row.sup)
contingency.CATA <- contingency.CATA[,seq(2,38,2)]
colnames(contingency.CATA) <- str_replace(colnames(contingency.CATA),"_Yes","")

#JAR, from 23 to 30

j <- 23
contingency.JAR <- table(sennheiser$Sound,sennheiser[,j])
colnames(contingency.JAR) <- paste(colnames(sennheiser)[j], levels(sennheiser[,j]), sep = "_")

for (j in 24:30){
  inter <- table(sennheiser$Sound,sennheiser[,j])
  colnames(inter) <- paste(colnames(sennheiser)[j], levels(sennheiser[,j]), sep = "_")
  contingency.JAR <- cbind(contingency.JAR, inter)
}

A <- apply(contingency.JAR[grep("A_",rownames(contingency.JAR)),], FUN = sum, 2)
P <- apply(contingency.JAR[grep("P_",rownames(contingency.JAR)),], FUN = sum, 2)
V <- apply(contingency.JAR[grep("V_",rownames(contingency.JAR)),], FUN = sum, 2)

T120 <- apply(contingency.JAR[grep("_120",rownames(contingency.JAR)),], FUN = sum, 2)
T160 <- apply(contingency.JAR[grep("_160_",rownames(contingency.JAR)),], FUN = sum, 2)
T80 <- apply(contingency.JAR[grep("_80",rownames(contingency.JAR)),], FUN = sum, 2)

P1 <- apply(contingency.JAR[grep("0_1",rownames(contingency.JAR)),], FUN = sum, 2)
P3 <- apply(contingency.JAR[grep("0_3",rownames(contingency.JAR)),], FUN = sum, 2)
P5 <- apply(contingency.JAR[grep("0_5",rownames(contingency.JAR)),], FUN = sum, 2)

row.sup <- rbind(A,P,V,T120,T160,T80,P1,P3,P5)
row.sup <- as.data.frame(row.sup)

i <- 1
exp.design <- strsplit(rownames(contingency.JAR)[i], split = "_")[[1]]
for (i in 2:27){
  exp.design <- rbind(exp.design, strsplit(rownames(contingency.JAR)[i], split = "_")[[1]])
}

contingency.JAR <- cbind(contingency.JAR, as.data.frame(exp.design))
contingency.JAR <- bind_rows(contingency.JAR, row.sup)

contingency.sennheiser <- cbind(contingency.CATA, contingency.JAR)
colnames(contingency.sennheiser)[60:62] <- c("Instrument","Tempo","Pitch")
contingency.sennheiser

