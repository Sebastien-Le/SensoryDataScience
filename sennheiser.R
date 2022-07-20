install.packages("ggrepel")
library(ggplot2)
library(ggrepel)
library(dplyr)

#1
sennheiser <- read.csv2("data/sennheiser.csv")
summary(sennheiser)
colnames(sennheiser)

colnames(sennheiser)[30] <- "Serious"
summary(sennheiser)
for (j in c(1:30,33:35)) sennheiser[,j] <- as.factor(sennheiser[,j])
for (j in 4:22) levels(sennheiser[,j]) <- c("No","Yes")
for (j in 23:30) sennheiser[,j] <- factor(sennheiser[,j], levels = c('r_ne', 'ne', 'JAR', 't', 'r_t'))


cont.jar <- function (x){
  
  ind.jar <- 2:ncol(x)
  nbmod = rep(0, ncol(x))
  for (j in ind.jar) {
    nbmod[j] = nlevels(x[, j])
  }
  nbmodtot = sum(nbmod)
  
  cont.table.jar <- matrix(NA, nrow = nbmodtot, ncol = nlevels(x[,1])) 
  for (j in 1:ncol(cont.table.jar)) cont.table.jar[, j] <- unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table))
  rownames(cont.table.jar) = names(unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table)))
  colnames(cont.table.jar) = levels(x[, 1])
  
  return(cont.table.jar)
}

#CATA, from 4 to 22

sennheiser.inter <- sennheiser[,c(2,4:22)]
contingency.CATA <- cont.jar(sennheiser.inter)
contingency.CATA <- t(contingency.CATA)

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
colnames(contingency.CATA) <- str_replace(colnames(contingency.CATA),".Yes","")

#JAR, from 23 to 30
sennheiser.inter <- sennheiser[,c(2,23:30)]
contingency.JAR <- cont.jar(sennheiser.inter)
contingency.JAR <- t(contingency.JAR)

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
colnames(contingency.sennheiser)
dim(contingency.sennheiser)
#1:19 - 20:59 - 60:62 
#28:36

res.mfa <- MFA(contingency.sennheiser[1:27,1:59], group = c(19,40), type = c("f","f"), graph = F, name.group = c("CATA","JAR"))
plot.MFA(res.mfa, choix = "group")
names(res.mfa)
as.data.frame(res.mfa$freq$coord)
rownames(res.mfa$freq$coord)
type <- c(rep("cata",19),rep("jar",40))
coord.freq <- cbind(as.data.frame(res.mfa$freq$coord),type)
summary(coord.freq)

ggplot(coord.freq, aes(x = Dim.1, y = Dim.2)) +
  #geom_point() +
  geom_point(aes(colour = type)) +
  geom_text_repel(label = rownames(coord.freq), max.overlaps = 10) +
  xlab("Penalties for all products") +
  ylab("Penalties for JPR") +
  ggtitle("Impact of defects all versus JPR") +
  coord_fixed() +
  ylim(-0.5,1.5) +
  xlim(-1,1.5) +
  theme_light()


MFA(contingency.sennheiser[1:27,1:59], group = c(19,40), type = c("f","f"), name.group = c("CATA","JAR"))
