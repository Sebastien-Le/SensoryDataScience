summary(penalties)

ggplot(penalties, aes(x = Liking, y = Typicity)) +
  geom_point() +
  geom_text(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Liking") +
  ylab("Penalties for Typicity") +
  ggtitle("Impact of defects on liking and typicity") +
  ____() +
  ylim(_,_) +
  xlim(_,_)