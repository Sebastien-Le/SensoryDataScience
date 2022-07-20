res.mca <- MCA(goji, quali.sup = 1:4, quanti.sup = 11:12, graph = F)
plot.MCA(res.mca, invisible = c("ind", "quali.sup"))

res.mca <- MCA(goji[,-c(1:3)], quali.sup = 1, quanti.sup = 8:9, graph = F)
plot.MCA(res.mca, invisible = "ind")

goji$Liking.cat <- as.factor(goji$Liking)
goji$Typicity.cat <- as.factor(goji$Typicity)

res.mca <- MCA(goji[,-c(1:3)], quali.sup = c(1,10,11), quanti.sup = 8:9, graph = F)
plot.MCA(res.mca, invisible = c("ind","var"))

goji.s1 <- goji[goji$Session =="S1",]
goji.s2 <- goji[goji$Session =="S2",]

goji.s1 <- goji.s1[order(goji.s1$Consumer, goji.s1$Product), ]
goji.s2 <- goji.s2[order(goji.s2$Consumer, goji.s2$Product), ]

goji.s1[1:5,]
goji.s2[1:5,]

goji.s1.s2 <- cbind(goji.s1[,-c(1:4,11:14)], goji.s2[,-c(1:4,11:14)])
summary(goji.s1.s2)
res.mfa <- MFA(goji.s1.s2, group = c(6,6), type = c("n","n"), name.group = c("S1","S2"), graph = F)
plot.MFA(res.mfa, choix = "group")



cont.jar <- function (x){ # x = une colonne produit et le reste en JAR.
  
  ind.jar <- 2:ncol(x) #colonnes des attributs JAR
  nbmod = rep(0, ncol(x))
  for (j in ind.jar) {
    nbmod[j] = nlevels(x[, j]) #nombre de modalit?s par attribut JAR
  }
  nbmodtot = sum(nbmod) #nombre total d'attributs x modalit?s
  
  cont.table.jar <- matrix(NA, nrow = nbmodtot, ncol = nlevels(x[,1])) 
  #cr?ation d'une matrice avec autant de lignes que d'attributs x modalit?s et autant de colonnes que de produit
  
  for (j in 1:ncol(cont.table.jar)) cont.table.jar[, j] <- unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table))
  #pour chaque produit, s?lection des donn?es correspondantes, et application de la fonction table ? chaque colonne pour cr?er 
  #obtenir le nombre de fois o? chaque modalit?s de la variable a ?t? utilis?e
  #la fonction unlist permet de cr?er un vecteur des composantes des tableaux de comptage
  
  rownames(cont.table.jar) = names(unlist(lapply(x[x[,1] == levels(x[, 1])[j], ind.jar], table)))
  #on r?cup?re les noms des attributs x modalit?
  
  colnames(cont.table.jar) = levels(x[, 1])
  # on r?cup?re les noms des produits 
  
  return(cont.table.jar)
}

goji.inter <- goji[,4:10]

res <- cont.jar(goji[,4:10])
goji.prod <- as.data.frame(t(res))
descfreq(goji.prod)
res.ca <- CA(goji.prod, graph = F)
plot.CA(res.ca, invisible = "col")
