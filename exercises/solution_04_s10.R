sennheiser.inter <- sennheiser[,c(2,23:30)]
contingency.JAR <- cont.categories(sennheiser.inter)
contingency.JAR <- t(contingency.JAR)

A <- apply(contingency.JAR[grep("A_", rownames(contingency.JAR)),], FUN = sum, 2)
P <- apply(contingency.JAR[grep("P_", rownames(contingency.JAR)),], FUN = sum, 2)
V <- apply(contingency.JAR[grep("V_", rownames(contingency.JAR)),], FUN = sum, 2)

T120 <- apply(contingency.JAR[grep("_120", rownames(contingency.JAR)),], FUN = sum, 2)
T160 <- apply(contingency.JAR[grep("_160_", rownames(contingency.JAR)),], FUN = sum, 2)
T80 <- apply(contingency.JAR[grep("_80", rownames(contingency.JAR)),], FUN = sum, 2)

P1 <- apply(contingency.JAR[grep("0_1", rownames(contingency.JAR)),], FUN = sum, 2)
P3 <- apply(contingency.JAR[grep("0_3", rownames(contingency.JAR)),], FUN = sum, 2)
P5 <- apply(contingency.JAR[grep("0_5", rownames(contingency.JAR)),], FUN = sum, 2)

row.sup <- rbind(A, P, V, T120, T160, T80, P1, P3, P5)
print("Done!")