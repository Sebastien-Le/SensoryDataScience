Inertia <- sum(res.cr[1,]^2)
for (i in 2:7) Inertia <- Inertia + sum(res.cr[i,]^2)
Inertia <- Inertia/I
Inertia