************************************************************************
************************************************************************
* AUTHOR: Megan Skowronski
* DATE: September 22, 2023 
* FUNCTION: Personal contribution to housing costs & self-reported mental/physical health analysis
* INPUT DATA: GSS - 2017 DATA
* OUTPUT DATA: Summary tables and regressions
************************************************************************
************************************************************************

use "/Users/meganskowronski/Desktop/CAnD3/Data Management/CleanedVariablesGSS2017.dta"

***Data Weights***
svyset [pw=wght_per]

***Summary Statistics - Table 1
svy: proportion mentalhealth srhealth finconhouse sex age childrenhh personalinc partnered

*Generate Table*
esttab m1 m2, eform b(a2) not label nonumber wide modelwidth(12 12) varwidth(15) ///
title("Table 1") mtitle("Model 1" "Model 2")

***Multivariate Table
svy: regress mentalhealth i.finconhouse i.sex i.age i.childrenhh i.personalinc i.partnered
eststo m1
svy: regress srhealth i.finconhouse i.sex i.age i.childrenhh i.personalinc i.partnered
eststo m2

*Generate Table*
esttab, label                               ///
title(Table 2)       ///
nonumbers mtitles("Model 1" "Model 2")  ///
addnote("Source: 2017 GSSS")

