library(____)
mod <- "____"
all.attr <- rownames(res.mca$var$coord)
mod.select <- all.attr[which(str_detect(____, ____))]

plot.MCA(res.mca, invisible = "ind", selectMod = c("orange","____","apple","____","10","____",mod.select))