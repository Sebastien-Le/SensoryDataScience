summary(coord.freq)

library(ggplot2)
library(ggrepel)
____(coord.freq, aes(x = Dim.1, y = Dim.2)) +
  ____(aes(colour = ____)) +
  geom_text_repel(label = rownames(coord.freq), max.overlaps = 10) +
  xlab("Dim 1") +
  ylab("Dim 2") +
  ggtitle("AFM") +
  coord_fixed() +
  ylim(-0.5,_) +
  xlim(-1,1.5) +
  theme_light()