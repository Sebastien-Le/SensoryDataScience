sennheiser.inter <- sennheiser[,c(2,4:22)]
contingency.CATA <- cont.categories(sennheiser.inter)
contingency.CATA <- t(contingency.CATA)