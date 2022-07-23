A <- apply(contingency.CATA[grep("A_",rownames(contingency.CATA)),], FUN = sum, 2)
P <- apply(contingency.CATA[grep("P_",rownames(contingency.CATA)),], FUN = sum, 2)
V <- apply(contingency.CATA[grep("V_",rownames(contingency.CATA)),], FUN = sum, 2)