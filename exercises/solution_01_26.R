Products_sc_Mat <- as.matrix(dist(scale(dist.prod))^2)
sum(Products_sc_Mat)/(2*dim(Products_sc_Mat)[1]*(dim(Products_sc_Mat)[1]-1))

Att_sc_Mat <- as.matrix(dist(scale(cov.att))^2)
sum(Att_sc_Mat)/(2*dim(Att_sc_Mat)[1]*(dim(Att_sc_Mat)[1]-1))