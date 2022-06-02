Products_sc_Mat <- as.matrix(dist(scale(dist.prod))^2)
sum(Products_sc_Mat)/12