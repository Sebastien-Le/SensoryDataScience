res.consistency <- AovSum(Sentiment ~ Hedo_cat, data = leather)
res.consistency$Ftest
res.consistency$Ttest