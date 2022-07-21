TWA <- ggplot(tab[tab$Var1 == "7TWA",], aes(x = Var2, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ggtitle("Distribution for the attribute Io and 7TWA") +
  theme_minimal()

TWA