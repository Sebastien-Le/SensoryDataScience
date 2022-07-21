JPA <- ggplot(tab[tab$Var1 == "1JPA",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ggtitle("Distribution for the attribute Io and 1JPA") +
  theme_minimal()

JPA