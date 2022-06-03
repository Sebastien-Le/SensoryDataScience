a1 <- ggplot(means) + aes(x=mean_Spicy, y=mean_Citrus, color=Product) + geom_path(aes(group=1), color="black") + geom_point()
a2 <- ggplot(means) + aes(x=mean_Spicy, y=mean_Floral, color=Product) + geom_path(aes(group=1), color="black") + geom_point()
a3 <- ggplot(means) + aes(x=mean_Citrus, y=mean_Floral, color=Product) + geom_path(aes(group=1), color="black") + geom_point()

grid.arrange(a1, a2, a3, ncol=2, nrow = 2)

