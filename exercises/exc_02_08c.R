barplot(table(GMO$Political.Party, GMO$Position.A.Food), beside = TRUE, main = "Independent data", 
        col = c("brown", "palevioletred2", "chartreuse4", "gold1", "dodgerblue3"))
legend("topright", inset=.02, title="Political Party", 
       c("Extreme left", "Left", "Greens", "Liberal", "Right"), 
       horiz = FALSE, cex = 0.8, 
       fill = c("brown", "palevioletred2", "chartreuse4", "gold1", "dodgerblue3"))