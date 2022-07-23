library(stringr)
colnames(contingency.CATA) <- str_replace(colnames(contingency.CATA), ".Yes", "")