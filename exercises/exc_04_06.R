library(____)
res.penalty.all <- AovSum(Liking ~ ____ + Nc.tm + ____ + ____ + Su.ne + Su.tm +
                                   Ac.ne + Ac.tm + Bt.ne + Bt.tm + ____ + ____ +
                                   Consumer + Juice, data = orange.dummy)
names(res.penalty.all)
res.penalty.all$Ttest