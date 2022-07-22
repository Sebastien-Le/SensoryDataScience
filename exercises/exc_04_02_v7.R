TWA <- ggplot(tab[tab$Var1 == "____",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  ____("Modalities") +
  ylab("Number of occurrences") +
  ggtitle("Distribution for the attribute Io and 7TWA") +
  theme_minimal()

TWA