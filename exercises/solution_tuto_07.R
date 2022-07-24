library(FactoMineR)
res.consistency <- AovSum(Sentiment ~ Hedo_cat + ID_juge, data = leather)
res.consistency$Ftest