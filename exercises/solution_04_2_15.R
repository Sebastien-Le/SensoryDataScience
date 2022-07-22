library(stringr)
mod <- "JAR"
all.attr <- rownames(res.mca$var$coord)
mod.select <- all.attr[which(str_detect(all.attr, mod))]

plot.MCA(res.mca, invisible = "ind", selectMod = c("orange","pineapple","apple","20","10","0",mod.select))