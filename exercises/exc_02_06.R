#visualization
ggplot(GMO, aes(Position.Al.A.break, ..count..)) + 
      geom_bar(aes(fill = Political.Party), color="black", position = "dodge") + 
      ggtitle("Barplot of cross-categories sampled") +
      scale_fill_manual(values=c("Extreme left"="#bb0000", "Left"="#FF8080", "Greens"="#3BA019", "Liberal"="#ffeb00", "Right"="#0066cc"))