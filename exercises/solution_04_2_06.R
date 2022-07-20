mat_coef <- data.frame(matrix(ncol = 2, nrow = 24))
colnames(mat_coef) <- c("Liking","Typicity")
rownames(mat_coef) <- rownames(res.jar.typicity$penalty2)

mat_coef[,1] <- res.jar.liking$penalty2[,1]
mat_coef[,2] <- res.jar.typicity$penalty2[,1]

ggplot(mat_coef, aes(x = Liking, y = Typicity)) +
       geom_point() +
       xlab("Penalties for Liking") +
       ylab("Penalties for Typicity") +
       ylim(-2,0) +
       xlim(-2,0) +
       geom_text(label = rownames(mat_coef), hjust = 1, vjust = 1) +
       geom_abline(intercept = 0) +
       theme_minimal()