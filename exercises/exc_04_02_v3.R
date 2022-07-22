ggplot(tab, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  ____("Modalities") +
  ____("Number of occurrences") +
  ggtitle("Distribution of modalities for the attribute Io")