sentiment1$Liking <- factor(sentiment1$Liking)
sentiment1$Hedo_cat <- factor(sentiment1$Hedo_cat)

AovSum(sentiment1$sentiment ~ sentiment1$Hedo_cat)
AovSum(sentiment1$sentiment ~ sentiment1$Liking)