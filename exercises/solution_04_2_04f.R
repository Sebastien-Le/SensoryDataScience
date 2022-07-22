ggplot(penalties, aes(x = Liking, y = Typicity)) +
  geom_point() +
  geom_text_repel(label = rownames(penalties), max.overlaps = Inf) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Liking") +
  ylab("Penalties for Typicity") +
  ggtitle("Impact of defects on liking and typicity") +
  coord_fixed() +
  ylim(-2.8,0.5) +
  xlim(-2.8,0.5)