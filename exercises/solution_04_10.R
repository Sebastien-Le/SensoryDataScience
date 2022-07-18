for (j in 4:9) levels(orange[,j]) <- c(paste(colnames(orange)[j], levels(orange[,j])[1], sep="."),"JAR",
                                       paste(colnames(orange)[j], levels(orange[,j])[3], sep="."))
summary(orange)