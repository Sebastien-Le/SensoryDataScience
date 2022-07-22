res.mfa <- MFA(goji.prod.s1.s2, group = c(30,30), type = c("f","f"), name.group = c("S1","S2"), graph = F)
plot.MFA(res.mfa, choix = "group")