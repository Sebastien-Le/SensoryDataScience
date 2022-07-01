experts_subset <- experts %>%
  select(c(Panelist,Product, Floral, Marine, Fruity, Heady, Wrapping, Oriental, Greedy, Vanilla)) %>%
  filter(Product == "Angel" | Product == "Pleasures" | Product == "J'adore EP" | Product == "Aromatics Elixir" | Product == "Shalimar" | Product == "Chanel N5" | Product == "Lolita Lempicka")