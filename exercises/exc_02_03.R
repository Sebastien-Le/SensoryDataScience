#selection variable Political.Party and Position.Al.A
GMO.Al.A <- GMO[,c( "Political.Party","Position.Al.A")]

#or tidyverse version : 
library(dplyr)
GMO.Al.A <- GMO %>% select(c( Political.Party,Position.Al.A,))