df_theo <- as.data.frame.matrix(GMO_theo)
library(tibble)
df <- rownames_to_column(df_theo, "Political.Party")

df <- df %>% pivot_longer(!Political.Party, names_to="Position.Al.A", values_to = "frequence")
ggplot(df, aes(y=frequence,x=Position.Al.A, fill=Political.Party))+
         geom_col( position = "dodge", color="black")+ggtitle("Barplot of theorical table")+
  scale_fill_manual(values=c("Extreme left"="#bb0000", "Left"="#FF8080", "Liberal"="#ffeb00", "Greens"="#3BA019", "Right"="#0066cc"))