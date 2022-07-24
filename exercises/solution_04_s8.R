row.sup <- rbind(A, P, V, T120, T160, T80, P1, P3, P5)
contingency.CATA <- rbind(contingency.CATA, row.sup)
contingency.CATA <- contingency.CATA[, seq(2,38,2)]
print("Done!")