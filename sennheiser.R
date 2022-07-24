# library(ggplot2)
# library(ggrepel)
# library(dplyr)
# library(stringr)
# library(FactoMineR)
# library(tm)

#1
sennheiser <- read.csv2("data/sennheiser.csv")
summary(sennheiser)

#2
colnames(sennheiser)[30] <- "Serious"
for (j in c(1:30,33:35)) sennheiser[,j] <- as.factor(sennheiser[,j])
summary(sennheiser)

#3
for (j in 4:22) levels(sennheiser[,j]) <- c("No","Yes")
for (j in 23:30) sennheiser[,j] <- factor(sennheiser[,j], levels = c('r_ne', 'ne', 'JAR', 't', 'r_t'))

#4
cont.categories <- function (x){
  
  ind.jar <- 2:ncol(x)
  nbmod = rep(0, ncol(x))
  for (j in ind.jar) nbmod[j] = nlevels(x[, j])
  nbmodtot = sum(nbmod)
  cont.table.cat <- matrix(NA, nrow = nbmodtot, ncol = nlevels(x[,1])) 
  for (j in 1:ncol(cont.table.cat)) cont.table.cat[, j] <- unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table))
  rownames(cont.table.cat) = names(unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table)))
  colnames(cont.table.cat) = levels(x[, 1])
  
  return(cont.table.cat)
}

#CATA, from 4 to 22

#5
sennheiser.inter <- sennheiser[,c(2,4:22)]
contingency.CATA <- cont.categories(sennheiser.inter)
contingency.CATA <- t(contingency.CATA)

#6
A <- apply(contingency.CATA[grep("A_",rownames(contingency.CATA)),], FUN = sum, 2)
P <- apply(contingency.CATA[grep("P_",rownames(contingency.CATA)),], FUN = sum, 2)
V <- apply(contingency.CATA[grep("V_",rownames(contingency.CATA)),], FUN = sum, 2)

#7
T120 <- apply(contingency.CATA[grep("_120",rownames(contingency.CATA)),], FUN = sum, 2)
T160 <- apply(contingency.CATA[grep("_160_",rownames(contingency.CATA)),], FUN = sum, 2)
T80 <- apply(contingency.CATA[grep("_80",rownames(contingency.CATA)),], FUN = sum, 2)

P1 <- apply(contingency.CATA[grep("0_1",rownames(contingency.CATA)),], FUN = sum, 2)
P3 <- apply(contingency.CATA[grep("0_3",rownames(contingency.CATA)),], FUN = sum, 2)
P5 <- apply(contingency.CATA[grep("0_5",rownames(contingency.CATA)),], FUN = sum, 2)

#8
row.sup <- rbind(A,P,V,T120,T160,T80,P1,P3,P5)
contingency.CATA <- rbind(contingency.CATA, row.sup)
contingency.CATA <- contingency.CATA[,seq(2,38,2)]

#9
library(stringr)
colnames(contingency.CATA) <- str_replace(colnames(contingency.CATA), ".Yes", "")

#JAR, from 23 to 30

#10
sennheiser.inter <- sennheiser[,c(2,23:30)]
contingency.JAR <- cont.categories(sennheiser.inter)
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

#11
i <- 1
exp.design <- strsplit(rownames(contingency.JAR)[i], split = "_")[[1]]
for (i in 2:27){
  exp.design <- rbind(exp.design, strsplit(rownames(contingency.JAR)[i], split = "_")[[1]])
}

#12
contingency.JAR <- cbind(contingency.JAR, as.data.frame(exp.design))
row.sup <- as.data.frame(row.sup) #for bind_rows

#13
library(dplyr)
contingency.JAR <- bind_rows(contingency.JAR, row.sup)

#14
contingency.sennheiser <- cbind(contingency.CATA, contingency.JAR)
colnames(contingency.sennheiser)[60:62] <- c("Instrument","Tempo","Pitch")
colnames(contingency.sennheiser)
dim(contingency.sennheiser)

#1:19 - 20:59 - 60:62 
#28:36

#15 - vide

###########
#Most simple MFA with two groups
#16
library(FactoMineR)
res.mfa <- MFA(contingency.sennheiser[1:27,1:59], group = c(19,40), type = c("f","f"), name.group = c("CATA","JAR"))
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, partial = "all")

#17
plot.MFA(res.mfa, choix = "freq", invisible = "ind")

#18
names(res.mfa)
res.mfa$eig
names(res.mfa)
names(res.mfa$freq)
as.data.frame(res.mfa$freq$coord)
rownames(res.mfa$freq$coord)
type <- c(rep("cata",19),rep("jar",40))
coord.freq <- cbind(as.data.frame(res.mfa$freq$coord),type)


#19
summary(coord.freq)

library(ggplot2)
library(ggrepel)
ggplot(coord.freq, aes(x = Dim.1, y = Dim.2)) +
  geom_point(aes(colour = type)) +
  geom_text_repel(label = rownames(coord.freq), max.overlaps = 10) +
  xlab("Dim 1") +
  ylab("Dim 2") +
  ggtitle("AFM") +
  coord_fixed() +
  ylim(-0.5,1.5) +
  xlim(-1,1.5) +
  theme_light()

#19
mod <- c("JAR")
all.attr <- rownames(res.mfa$freq$coord)
mod.select <- all.attr[which(str_detect(all.attr,mod))]
mod.select <- c(mod.select, rownames(res.mfa$freq$coord)[1:19])

coord.freq$names <- rownames(coord.freq)
ggplot(coord.freq, aes(x = Dim.1, y = Dim.2, label=names)) +
  geom_point(aes(colour = type)) +
  geom_text_repel(data=subset(coord.freq, names%in%mod.select), aes(label=names, colour=type), max.overlaps = 10)+
  #scale_colour_manual(values=c("orange", "blue"))+
  xlab("Dim 1") +
  ylab("Dim 2") +
  ggtitle("AFM") +
  coord_fixed() +
  ylim(-0.5,1.5) +
  xlim(-1,1.5) +
  theme_light()

res.mfa <- MFA(contingency.sennheiser[1:27,], group = c(19,40,3), type = c("f","f","n"), name.group = c("CATA","JAR","COMPO"), num.group.sup = 3)
plot.MFA(res.mfa)
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, partial = "all")
plot.MFA(res.mfa, choix = "freq", invisible = "ind")

####################################
#textual
colnames(sennheiser)
sennheiser$Why[20:60]

sennheiser.text <- sennheiser[which(!sennheiser$Why==""),c(1,2,32)]
summary(sennheiser.text)

sennheiser.text$Why <- tolower(sennheiser.text$Why)
sennheiser.text$Why <- gsub("too ", "too", sennheiser.text$Why)
sennheiser.text$Why <- gsub("not ", "not", sennheiser.text$Why)
sennheiser.text$Why <- gsub(" enough", "enough", sennheiser.text$Why)

sennheiser.text$Why <- gsub("[`^~.',!?;\"]", " ", sennheiser.text$Why)
sennheiser.text$Why <- gsub("[[:punct:]]", "", sennheiser.text$Why)

library(tm)
stw <- stopwords("en")
stw <- stw[-which(stw%in%c("no","not"))]

sennheiser.text$Why <- removeWords(sennheiser.text$Why,stw)

supprespace <- function(x){
  a <- unlist(strsplit(x," "))
  if (length(which(a==""))==0){
    paste(a, collapse = " ")
  }
  else{
    paste(a[-which(a=="")],collapse=" ")
  }
}

for (i in 1:630) sennheiser.text$Why[i] <- supprespace(sennheiser.text$Why[i])

sennheiser.text[1:5,]

res.textual <- textual(sennheiser.text, num.text = 3, contingence.by = 2)
names(res.textual)
res.textual$nb.words
res.textual$cont.table

A <- apply(res.textual$cont.table[grep("A_",rownames(res.textual$cont.table)),], FUN = sum, 2)
P <- apply(res.textual$cont.table[grep("P_",rownames(res.textual$cont.table)),], FUN = sum, 2)
V <- apply(res.textual$cont.table[grep("V_",rownames(res.textual$cont.table)),], FUN = sum, 2)
instrument.why <- rbind(A,P,V)

descfreq(instrument.why, proba = 0.1)

T120 <- apply(res.textual$cont.table[grep("_120",rownames(res.textual$cont.table)),], FUN = sum, 2)
T160 <- apply(res.textual$cont.table[grep("_160_",rownames(res.textual$cont.table)),], FUN = sum, 2)
T80 <- apply(res.textual$cont.table[grep("_80",rownames(res.textual$cont.table)),], FUN = sum, 2)
tempo.why <- rbind(T120,T160,T80)

descfreq(tempo.why, proba = 0.1)

P1 <- apply(res.textual$cont.table[grep("0_1",rownames(res.textual$cont.table)),], FUN = sum, 2)
P3 <- apply(res.textual$cont.table[grep("0_3",rownames(res.textual$cont.table)),], FUN = sum, 2)
P5 <- apply(res.textual$cont.table[grep("0_5",rownames(res.textual$cont.table)),], FUN = sum, 2)
pitch.why <- rbind(P1,P3,P5)

descfreq(pitch.why, proba = 0.1)