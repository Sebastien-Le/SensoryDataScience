Apple <- apply(contingency[c("127","431","759"),], FUN = sum, 2)
Pineapple <- apply(contingency[c("245","518","876"),], FUN = sum, 2)
Orange <- apply(contingency[c("362","694","983"),], FUN = sum, 2)
print("Done!")