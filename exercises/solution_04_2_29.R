goji.s1 <- goji[goji$Session =="S1",]
goji.s2 <- goji[goji$Session =="S2",]

goji.s1 <- goji.s1[order(goji.s1$Consumer, goji.s1$Product), ]
goji.s2 <- goji.s2[order(goji.s2$Consumer, goji.s2$Product), ]

goji.s1[1:5,]
goji.s2[1:5,]

goji.s1.s2 <- cbind(goji.s1[,-c(1:6,13:14)], goji.s2[,-c(1:6,13:14)])
print("Done!")