library(SensoMineR)
res.jar <- JAR(orange, col.p = 2, col.j = 1, col.pref = 3, jarlevel="JAR")
res.jar$penalty2
plot(res.jar, name.prod = "2JPR", model = 2)