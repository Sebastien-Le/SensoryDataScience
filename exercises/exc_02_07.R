#let's start by adding margins to have row and column profiles
Party.By.FoodAn <- as.data.frame.matrix(table(GMO$Political.Party, GMO$Position.Al.A))
fi <- apply(Party.By.FoodAn, 1, sum)/sum(Party.By.FoodAn)
fj <- apply(Party.By.FoodAn, 2, sum)/sum(Party.By.FoodAn)

Party.By.FoodAn.Theo <- matrix(nrow=5,ncol=4)
for(i in 1:5){
for(j in 1:4) Party.By.FoodAn.Theo[i, j] <- (fi[i]*fj[j])
}
rownames(Party.By.FoodAn.Theo) <- rownames(Party.By.FoodAn)
colnames(Party.By.FoodAn.Theo) <- colnames(Party.By.FoodAn)