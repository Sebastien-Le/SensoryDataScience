library(ggplot2)

ggplot(GMO.Al.A, aes(Position.Al.A, ..count..)) + geom_bar(aes(fill = Political.Party), color="black", position = "dodge") + ggtitle("Barplot of cross-categories") +
  scale_fill_manual(values=c("Extreme left"="#bb0000", "Left"="#FF8080", "Liberal"="#ffeb00", "Greens"="#3BA019", "Right"="#0066cc"))
## ..count.. : stat transformation of the original data set