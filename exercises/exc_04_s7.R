T120 <- apply(____[grep("_120",rownames(contingency.CATA)),], FUN = sum, 2)
T160 <- apply(____[grep("_160_",rownames(contingency.CATA)),], FUN = sum, 2)
T80 <- apply(____[grep("_80",rownames(contingency.CATA)),], FUN = sum, 2)

P1 <- apply(contingency.CATA[grep("0_1",____(contingency.CATA)),], FUN = sum, 2)
P3 <- apply(contingency.CATA[grep("0_3",____(contingency.CATA)),], FUN = sum, 2)
P5 <- apply(contingency.CATA[grep("0_5",____(contingency.CATA)),], FUN = sum, 2)
print("Done!")