for (j in 4:22) ____(sennheiser[,j]) <- c("No","Yes")
for (j in 23:30) sennheiser[,j] <- ____(sennheiser[,j], levels = c('r_ne', 'ne', 'JAR', 't', 'r_t'))
print("Done!")