mod <- c("____")
all.attr <- rownames(res.mfa$freq$coord)
mod.select <- all.attr[which(____(all.attr,mod))]
mod.select <- c(mod.select, rownames(res.mfa$freq$coord)[1:19])

coord.freq$names <- rownames(coord.freq)
ggplot(coord.freq, aes(x = Dim.1, y = Dim.2, label=names)) +
  geom_point(aes(colour = type)) +
  geom_text_repel(data=subset(coord.freq, names%in%____), aes(label=names, colour=type), max.overlaps = 10)+
  #scale_colour_manual(values=c("orange", "blue"))+
  xlab("Dim 1") +
  ylab("Dim 2") +
  ggtitle("AFM") +
  coord_fixed() +
  ylim(-0.5,1.5) +
  xlim(-1,1.5) +
  theme_light()