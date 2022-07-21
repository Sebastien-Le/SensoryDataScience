ggplot(tab, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "orange") +
  xlab("Modalities") +
  ylab("Number of occurrences") +
  ggtitle("Distribution of modalities for the attribute Io")