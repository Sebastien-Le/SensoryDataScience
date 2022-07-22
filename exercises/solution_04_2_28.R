summary(penalties)

ggplot(penalties, aes(x = Session_1, y = Session_2)) +
  geom_point() +
  geom_text_repel(label = rownames(penalties), max.overlaps = Inf) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for Session_1") +
  ylab("Penalties for Session_2") +
  ggtitle("Impact of defects on session 1 and session2") +
  coord_fixed() +
  ylim(-3,0.5) +
  xlim(-3,0.5) +
  theme_light()