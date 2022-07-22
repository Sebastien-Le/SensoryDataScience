JPA <- ggplot(tab[tab$Var1 == "____",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ____("Number of occurrences") +
  ggtitle("Distribution for the attribute Io and 1JPA") +
  theme_minimal()

JPA