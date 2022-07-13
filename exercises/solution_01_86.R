magicsort(res.decat$tabT, method = "median")
res.sort <- magicsort(res.decat$tabT, method = "median")[-8,-9]

coltable(res.sort, level.lower = -1.96, level.upper = 1.96,
         main.title = "Average by perfume")