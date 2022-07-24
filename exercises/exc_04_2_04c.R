library(____)
ggplot(penalties, aes(x =____, y =____)) +
  geom_point() +
  geom_text(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Liking") +
  ylab("Penalties for Typicity") +
  ggtitle("Impact of defects on liking and typicity")