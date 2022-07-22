JPA <- ggplot(tab[tab$Var1 == "1JPA",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ____(0, _) +
  ggtitle("Distribution for the attribute Io and 1JPA") +
  theme_minimal()

TWA <- ggplot(tab[tab$Var1 == "7TWA",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ____(0, _) +
  ggtitle("Distribution for the attribute Io and 7TWA") +
  theme_minimal()

____(JPA, TWA, labels = c("A","B"), ncol = 2, nrow = 1)