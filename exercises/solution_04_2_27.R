res.jar.s1 <- JAR(goji.liking.s1, col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")
res.jar.s2 <- JAR(goji.liking.s2, col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")

penalties <- cbind(res.jar.s1$penalty2, res.jar.s2$penalty2)[,c(1,4)]
colnames(penalties) <- c("Session_1","Session_2")
penalties <- as.data.frame(penalties)