coord.en.V2 <- data.frame("words"=rownames(res.CA.en.V2$col$coord))
coord.en.V2 <- coord.en.V2 %>% mutate(Dim1.en=res.CA.en.V2$col$coord[,1], Dim2.en=res.CA.en.V2$col$coord[,2])
coord.en.V2 <- as.data.frame(coord.en.V2[order(coord.en.V2$Dim1.en,coord.en.V2$Dim2.en),])

coord.viet.acc.V2 <- data.frame("words"=rownames(res.CA.viet.V2$col$coord))
coord.viet.acc.V2 <- coord.viet.acc.V2 %>% mutate(Dim1.viet.acc = res.CA.viet.V2$col$coord[,1], Dim2.viet.acc=res.CA.viet.V2$col$coord[,2])
coord.viet.acc.V2 <- as.data.frame(coord.viet.acc.V2[order(coord.viet.acc.V2$Dim1.viet.acc,coord.viet.acc.V2$Dim2.viet.acc),])

coord.viet.sans.acc.V2 <- data.frame("words"=rownames(res.CA.viet.sans.accent.V2$col$coord))
coord.viet.sans.acc.V2 <- coord.viet.sans.acc.V2 %>% mutate(Dim1.viet.sans.acc = res.CA.viet.sans.accent.V2$col$coord[,1], Dim2.viet.sans.acc=res.CA.viet.sans.accent.V2$col$coord[,2])
coord.viet.sans.acc.V2 <- as.data.frame(coord.viet.sans.acc.V2[order(coord.viet.sans.acc.V2$Dim1.viet.sans.acc,coord.viet.sans.acc.V2$Dim2.viet.sans.acc),])

coord <- cbind(coord.en.V2, coord.viet.acc.V2, coord.viet.sans.acc.V2)