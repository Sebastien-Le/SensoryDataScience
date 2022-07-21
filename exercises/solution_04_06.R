library(FactoMineR)
res.penalty.all <- AovSum(Liking ~ Nc.ne + Nc.tm + Io.ne + Io.tm + Su.ne + Su.tm +
                                   Ac.ne + Ac.tm + Bt.ne + Bt.tm + Pu.ne + Pu.tm +
                                   Consumer + Juice, data = orange.dummy)
names(res.penalty.all)
res.penalty.all$Ttest