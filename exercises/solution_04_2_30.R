res.mfa <- MFA(goji.s1.s2, group = c(6,6), type = c("n","n"), name.group = c("S1","S2"), graph = F)
plot.MFA(res.mfa, choix = "group")