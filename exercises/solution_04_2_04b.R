penalties <- cbind(res.jar.liking$penalty2, res.jar.typicity$penalty2)[,c(1,4)]
colnames(penalties) <- c("Liking","Typicity")
penalties <- as.data.frame(penalties)
penalties