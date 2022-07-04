res_two_ways <- lm(Floral~Product+Panelist, data = experts)
anova(res_two_ways)
anova(res_one_way, res_two_ways)
