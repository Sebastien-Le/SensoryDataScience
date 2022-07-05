#barplot
barplot((as.table(as.matrix(GMO_theo))), beside = TRUE, main="effectifs theoriques", col=c("#bb0000","#3BA019","#FF8080","#ffeb00","#0066cc"))
legend("topleft", inset=.02, title="Political Party", c("Extreme left","Greens", "Left", 'Liberal', 'Right'), horiz=TRUE, cex=0.8, fill=c("#bb0000", "#3BA019", "#FF8080", "#ffeb00", "#0066cc"))

barplot(t(table(GMO.Al.A.Sample))/135, beside = TRUE, main="sample", col=c("#bb0000", "#3BA019", "#FF8080", "#ffeb00", "#0066cc"))
legend("topleft", inset=.02, title="Political Party", c("Extreme left", "Greens", "Left", 'Liberal', 'Right'), horiz=TRUE, cex=0.8, fill=c("#bb0000", "#3BA019", "#FF8080", "#ffeb00", "#0066cc"))
#
barplot((table(GMO.Al.A)/135), beside = TRUE,main="non sample", col=c("#bb0000", "#3BA019","#FF8080","#ffeb00","#0066cc"))
legend("topleft", inset=.02, title="Political Party", c("Extreme left", "Greens", "Left", 'Liberal', 'Right'), horiz=TRUE, cex=0.8, fill=c("#bb0000", "#3BA019","#FF8080", "#ffeb00", "#0066cc"))