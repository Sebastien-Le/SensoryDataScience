mod <- "JAR"
mod.select <- mod.active[which(str_detect(mod.active, mod))]
plot.MCA(res.mca, invisible = "ind", selectMod = c(mod.select,rownames(res.mca$quali.sup$coord)))