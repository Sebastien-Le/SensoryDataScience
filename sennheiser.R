# Un-comment and run line from 2 to 7 once
# install.packages("ggplot2")
# install.packages("ggrepel")
# install.packages("dplyr")
# install.packages("stringr")
# install.packages("FactoMineR")
# install.packages("tm")

# Import the data and make sure that data are well imported.

sennheiser <- read.csv2("data/sennheiser.csv")
summary(sennheiser)

# According to the 'summary()' function, rename the variable at column 30 as Serious, 
# and recode the data with the as.factor() function, except variables Adequation (adequacy,
# suitable) and Why. Check the recoding with the 'summary()' function.

colnames(sennheiser)[30] <- "Serious"
for (j in c(1:30,33:35)) sennheiser[,j] <- as.factor(sennheiser[,j])
summary(sennheiser)

# Change the values of the levels of the CATA data into more explicit levels such as “Yes” and “No”. 
# Then, reorder the levels of the JAR data as previously done.

for (j in 4:22) levels(sennheiser[,j]) <- c("No","Yes")
for (j in 23:30) sennheiser[,j] <- factor(sennheiser[,j], levels = c('r_ne', 'ne', 'JAR', 't', 'r_t'))
print("Done!")

# Run the following code in order to create a very helpful function that will simply produce contingency tables.

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
print("Done!")

# Analysis of CATA data, from columns 4 to 22.

# Build an temporary matrix by selecting the product effect and the CATA data. Apply the cont.categories() function 
# to the temporary data set. Save the results in an R object named contingency.CATA. With the t() function, 
# transpose the matrix to get the sounds as rows.

sennheiser.inter <- sennheiser[,c(2,4:22)]
contingency.CATA <- cont.categories(sennheiser.inter)
contingency.CATA <- t(contingency.CATA)
print("Done!")

# Use the object contingency.CATA and the very important apply() function, to get the number of times a given instrument
# has been associated with a CATA item.

A <- apply(contingency.CATA[grep("A_",rownames(contingency.CATA)),], FUN = sum, 2)
P <- apply(contingency.CATA[grep("P_",rownames(contingency.CATA)),], FUN = sum, 2)
V <- apply(contingency.CATA[grep("V_",rownames(contingency.CATA)),], FUN = sum, 2)
print("Done!")

# Do the same thing for the other factors, the tempo and the pitch.

T120 <- apply(contingency.CATA[grep("_120",rownames(contingency.CATA)),], FUN = sum, 2)
T160 <- apply(contingency.CATA[grep("_160_",rownames(contingency.CATA)),], FUN = sum, 2)
T80 <- apply(contingency.CATA[grep("_80",rownames(contingency.CATA)),], FUN = sum, 2)

P1 <- apply(contingency.CATA[grep("0_1",rownames(contingency.CATA)),], FUN = sum, 2)
P3 <- apply(contingency.CATA[grep("0_3",rownames(contingency.CATA)),], FUN = sum, 2)
P5 <- apply(contingency.CATA[grep("0_5",rownames(contingency.CATA)),], FUN = sum, 2)
print("Done!")

# Aggregate all these vectors into an R object named row.sup, then aggregate row.sup to contingency.CATA. 
# Keep one column out of two, the yes column for instance.

row.sup <- rbind(A, P, V, T120, T160, T80, P1, P3, P5)
contingency.CATA <- rbind(contingency.CATA, row.sup)
contingency.CATA <- contingency.CATA[, seq(2,38,2)]
print("Done!")

# Use the str_replace() function of the stringr package to change the names of the columns, and to get rid of the “yes”.

library(stringr)
colnames(contingency.CATA) <- str_replace(colnames(contingency.CATA), ".Yes", "")
colnames(contingency.CATA)

# Analysis of JAR data, from columbs 23 to 30.

# Now, do the same thing for the JAR data, until the creation of the row.sup object.

sennheiser.inter <- sennheiser[,c(2,23:30)]
contingency.JAR <- cont.categories(sennheiser.inter)
contingency.JAR <- t(contingency.JAR)

A <- apply(contingency.JAR[grep("A_", rownames(contingency.JAR)),], FUN = sum, 2)
P <- apply(contingency.JAR[grep("P_", rownames(contingency.JAR)),], FUN = sum, 2)
V <- apply(contingency.JAR[grep("V_", rownames(contingency.JAR)),], FUN = sum, 2)

T120 <- apply(contingency.JAR[grep("_120", rownames(contingency.JAR)),], FUN = sum, 2)
T160 <- apply(contingency.JAR[grep("_160_", rownames(contingency.JAR)),], FUN = sum, 2)
T80 <- apply(contingency.JAR[grep("_80", rownames(contingency.JAR)),], FUN = sum, 2)

P1 <- apply(contingency.JAR[grep("0_1", rownames(contingency.JAR)),], FUN = sum, 2)
P3 <- apply(contingency.JAR[grep("0_3", rownames(contingency.JAR)),], FUN = sum, 2)
P5 <- apply(contingency.JAR[grep("0_5", rownames(contingency.JAR)),], FUN = sum, 2)

row.sup <- rbind(A, P, V, T120, T160, T80, P1, P3, P5)
print("Done!")

# In this part, we are going to create three columns from the names of the sounds, each column being one of the three factors used to create the sounds.

i <- 1
exp.design <- strsplit(rownames(contingency.JAR)[i], split = "_")[[1]]
for (i in 2:27){
  exp.design <- rbind(exp.design, strsplit(rownames(contingency.JAR)[i], split = "_")[[1]])
}
exp.design[1:5,]

# Aggregate the three experimental factors to the object contingency.JAR, transform the row.sup object as a data frame.

contingency.JAR <- cbind(contingency.JAR, as.data.frame(exp.design))
row.sup <- as.data.frame(row.sup)
print("Done!")

# Use the 'bind_rows()' function of the dplyr package to aggregate the objects contingency.JAR and row.sup.

library(dplyr)
contingency.JAR <- bind_rows(contingency.JAR, row.sup)
summary(contingency.JAR)

# As you can see, building the contingency.JAR object was a little bit more complicated. 
# It is mainly due to the fact that you are aggregating objects with different dimensions. 
# Now, let’s build our final data set named contingency.sennheiser.

contingency.sennheiser <- cbind(contingency.CATA, contingency.JAR)
colnames(contingency.sennheiser)[60:62] <- c("Instrument","Tempo","Pitch")
colnames(contingency.sennheiser)
dim(contingency.sennheiser)

# Run an MFA on the contingency.sennheiser data. Try to understand the meaning of these visualizations.

library(FactoMineR)
res.mfa <- MFA(contingency.sennheiser[1:27,1:59], group = c(19,40), 
               type = c("f","f"), name.group = c("CATA","JAR"), graph = FALSE)
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, partial = "all")

# Represent the columns of your contingency data. As you know, rows and columns live in the same space.

plot.MFA(res.mfa, choix = "freq", invisible = "ind")

# Build an R object containing the coordinates of the columns on the first five dimensions, as well as their names, 
# and finally the group these columns belong to, CATA or JAR.

names(res.mfa)
res.mfa$eig
names(res.mfa)
names(res.mfa$freq)
as.data.frame(res.mfa$freq$coord)
rownames(res.mfa$freq$coord)
type <- c(rep("cata",19),rep("jar",40))
coord.freq <- cbind(as.data.frame(res.mfa$freq$coord),type)
print("Done!")

# Now that you have built the proper data set, use the summary() function to get the limits of your graph, 
# then the ggplot() and geom_point() functions to plot the graph.

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

# As in the previous case studies, let’s select some columns, and let’s represent 
# for instance the columns associated with the JAR level.

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

# The following MFA is interesting as we are going to add a supplementary group.

res.mfa <- MFA(contingency.sennheiser[1:27,], group = c(19,40,3), type = c("f","f","n"), 
               name.group = c("CATA","JAR","COMPO"), num.group.sup = 3, graph = FALSE)
plot.MFA(res.mfa)
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, partial = "all")
plot.MFA(res.mfa, choix = "freq", invisible = "ind")

####################################
# This part is dedicated to textual data, the infamous Why? question. 
# For this kind of data, the preparation phase is really important. Once done, 
# the rest is pretty classic, at least in this part.

# Lets’ have a look at these data from line 20 to line 60. What can you say from this kind of data?

sennheiser$Why[20:60]

# To facilitate the manipulation of the data, you are going to build a new data set named sennheiser.text. 
# Just keep the consumer effect, the product effect, and the answers to the Why? question.

sennheiser.text <- sennheiser[which(!sennheiser$Why==""),c(1,2,32)]
summary(sennheiser.text)

# Now, we are going to clean the newly created data set.

sennheiser.text$Why <- tolower(sennheiser.text$Why)
sennheiser.text$Why <- gsub("too ", "too", sennheiser.text$Why)
sennheiser.text$Why <- gsub("not ", "not", sennheiser.text$Why)
sennheiser.text$Why <- gsub(" enough", "enough", sennheiser.text$Why)

sennheiser.text$Why <- gsub("[`^~.',!?;\"]", " ", sennheiser.text$Why)
sennheiser.text$Why <- gsub("[[:punct:]]", "", sennheiser.text$Why)
print("Done!")

# To remove the stopwords, we are going to use the tm package.

library(tm)
stw <- stopwords("en")
stw <- stw[-which(stw%in%c("no","not"))]

sennheiser.text$Why <- removeWords(sennheiser.text$Why,stw)
print("Done!")

# Finally, we have created a function to get rid of the improper space.

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
print("Done!")

# Now that the textual data has been processed, have a look at it before analyzing it.

sennheiser.text[1:5,]

# Use the 'textual()' function of the FactoMineR package to build a contingency table crossing products and words.

res.textual <- textual(sennheiser.text, num.text = 3, contingence.by = 2)
names(res.textual)
res.textual$nb.words
res.textual$cont.table

# From this matrix, build a contingency table crossing the instrument and the words.

A <- apply(res.textual$cont.table[grep("A_",rownames(res.textual$cont.table)),], FUN = sum, 2)
P <- apply(res.textual$cont.table[grep("P_",rownames(res.textual$cont.table)),], FUN = sum, 2)
V <- apply(res.textual$cont.table[grep("V_",rownames(res.textual$cont.table)),], FUN = sum, 2)
instrument.why <- rbind(A,P,V)
instrument.why

# Run a description of frequencies.

descfreq(instrument.why, proba = 0.1)

# You can do the same thing for the other experimental factors. Let’s try.

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