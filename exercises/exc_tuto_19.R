res.mfa <- MFA(scores, group = rep(__, 3), type = rep("s", __), 
               name.group = c("Sentiment", "Machine", "Liking"), graph = FALSE)
plot.MFA(res.mfa, choix = "group")
plot.MFA(res.mfa, choix = "axes")
plot.MFA(res.mfa, choix = "ind")
plot.MFA(res.mfa, partial = "all")