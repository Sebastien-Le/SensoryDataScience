library(FactoMineR)
res.mfa <- MFA(contingency.sennheiser[1:27,1:59], group = c(19,40), 
               type = c("f","f"), name.group = c("CATA","JAR"), graph = FALSE)
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, partial = "all")