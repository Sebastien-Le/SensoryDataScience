barbesV2 <- read_excel("data/barbesV2.xlsx")
barbesV2 <- barbesV2 %>% mutate(trad_sans_accents = stri_trans_general(Trad, "Latin-ASCII"))
barbesV2$Juge <- as.factor(barbesV2$Juge)
barbesV2$Barbes <- as.factor(barbesV2$Barbes)

barbesV2.viet.acc <- as.data.frame(barbesV2[, -c(3,5)])
barbesV2.viet.sans.acc <- as.data.frame(barbesV2[, -c(3,4)])
barbesV2.en <- as.data.frame(barbesV2[,-c(4,5)])