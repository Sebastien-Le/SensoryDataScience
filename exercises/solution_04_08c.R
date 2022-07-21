summary(penalties)

ggplot(penalties, aes(x = All_products, y = JPR)) +
  geom_point() +
  geom_text(label = rownames(penalties)) +
  geom_abline(intercept = 0, slope = 1) +
  xlab("Penalties for all products") +
  ylab("Penalties for JPR") +
  ggtitle("Impact of defects: product space versus JPR") +
  coord_fixed() +
  ylim(-2,0.5) +
  xlim(-2,0.5)