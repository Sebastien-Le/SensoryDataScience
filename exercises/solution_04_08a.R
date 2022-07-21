penalties <- cbind(res.jar$penalty2, res.penalty.one$Ttest[-1,])[,c(1,4)]
penalties <- as.data.frame(penalties)
colnames(penalties) <- c("All_products","JPR")