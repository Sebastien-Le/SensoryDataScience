floral_citrus <- as.data.frame(cov.att) %>% select(mean_Citrus, mean_Floral)
floral_citrus <- floral_citrus[-1,] 

Att_floral_citrus_sc_Mat <- as.matrix(dist(scale(floral_citrus))^2)
sum(Att_floral_citrus_sc_Mat)/(2*dim(Att_floral_citrus_sc_Mat)[1]*(dim(Att_floral_citrus_sc_Mat)[1]-1))

spicy <- as.data.frame(cov.att)[1, 1]
# Prendre plus grande matrice