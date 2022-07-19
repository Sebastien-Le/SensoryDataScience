mod <- "JAR"
active.mod <- rownames(res.mca$var$coord)
mod.select <- active.mod[which(str_detect(active.mod, mod))]
plot.MCA(res.mca, invisible = "ind", selectMod = c(mod.select,rownames(res.mca$quali.sup$coord)))