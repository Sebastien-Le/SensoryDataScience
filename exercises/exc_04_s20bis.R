res.mfa <- MFA(contingency.sennheiser[1:27,], group = c(19,40,__), type = c("f","f","n"), 
               name.group = c("CATA","JAR","COMPO"), num.group.sup = 3, graph = FALSE)
plot.MFA(res.mfa)
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, partial = "all")
plot.MFA(res.mfa, choix = "freq", invisible = "ind")