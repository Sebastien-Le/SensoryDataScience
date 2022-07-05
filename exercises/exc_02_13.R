res.chi2.gmo <- chisq.test(GMO_table)
res.chi2.sample <- chisq.test(table(GMO.Al.A.Sample))
res.chi2.gmo$residuals