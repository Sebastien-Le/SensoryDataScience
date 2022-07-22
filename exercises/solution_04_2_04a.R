library(SensoMineR)
res.jar.liking <- JAR(goji.liking, col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")
res.jar.typicity <- JAR(goji.typicity, col.p = 2, col.j = 1, col.pref = 9, jarlevel = "JAR")

res.jar.liking$penalty2
res.jar.typicity$penalty2
