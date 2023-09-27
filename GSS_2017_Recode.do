//CAnD3 
capture clear 

/* Create a log file */
log using "/Users/meganskowronski/Desktop/CAnD3/Data Management/CAND3 Data/Workflow.log", replace 

/* Import data */
import delimited "/Users/meganskowronski/Desktop/CAnD3/Data Management/CAND3 Data/GSS 2017 - Family, Cycle 31/gss-12M0025-E-2017-c-31_F1.csv", clear 

/*Recoding */ 

*** Covariates *** 

**recode sex**
recode  sex (1=1) (2=0) 
label   variable sex "Sex"
label   define se 0 "0.Female" 1 "1.Male" 
label   values sex se
tab     sex 

**create new variable called age based on agec, divide into 4 brackets* 
tab     agec
gen     age=1 if agec>=15 & agec<=25
replace age=2 if agec>=26 & agec<=45
replace age=3 if agec>=46 & agec<=65
replace age=4 if agec>=66 & agec<=80
label   variable age "Age"
label   define ag 1 "15-25" 2 "26-45" 3 "46-65" 4 "66-80"
label   values age ag
tab     age

*label number of children living in household* 
gen     childrenhh = chrinhdc
label   variable childrenhh "Number of Children in Household"
label   define chh 0 "No Children" 1 "1 Child" 2 "2 Children" 3 "3 Children" 4 "4 Children" 
label   values childrenhh chh
tab     childrenhh

**Income of respondent** 
gen     personalinc = ttlincg2 
label   variable personalinc "Personal Income"
label   define pinc 1 "Less than $25,000" 2 "$25,000 to $49,999" 3 "$50,000 to $74,999" 4 "$75,000 to $99,999" 5 "$100,000 to $124,999" 6 "$125,000 or more"
label   values personalinc pinc
tab     personalinc

*** Partner Status *** 
gen     partnered=marstat
replace partnered=1 if marstat==1 | marstat==2 
replace partnered=0 if marstat==3 | marstat==4 | marstat==5 | marstat==6
replace partnered=. if marstat==96 | marstat==97 | marstat==98 | marstat==99
label   variable partnered "Partner Status"
label   define part 0 "Not Partnered" 1 "Partnered" 
label   values partnered part 
drop    if partnered=. 

*** IV: Rent/mortgage *** 
tab     com_215
gen     finconhouse = com_215
replace finconhouse=. if com_215==96 | com_215==97 | com_215==98 | com_215==99 
replace finconhouse=0 if com_215==4 | com_215==5 | com_215==6
replace finconhouse=1 if com_215==1 | com_215==2 | com_215==3 
label   variable finconhouse "Personal Financial Contribution to Rent/Mortgage"
label   define finhh 0 "0. Less than half" 1 "1. Half or more" 
label   values finconhouse finhh
drop    if finconhouse==. 

** DV: Self-rated mental health **
gen     mentalhealth=srh_115
replace mentalhealth=. if srh_115==6 | srh_115==7 | srh_115==8 | srh_115==9
label   variable mentalhealth "Self Rated Mental Health"
label   define mh 1 "1. Excellent" 2 "2.Very Good" 3 "3. Good" 4 "4.Fair" 5 "5.Poor"
label   values mentalhealth mh 
drop    if mentalhealth==. 

** DV: Self-rated physical health ** 
gen     srhealth=srh_110 
replace srhealth=. if srh_110==6 | srh_110==7 | srh_110==8 | srh_110==9
label   variable srhealth "Self Rated Physical Health"
label   define srh 1 "1. Excellent" 2 "2.Very Good" 3 "3. Good" 4 "4.Fair" 5 "5.Poor"
label   values srhealth srh
drop    if srhealth==. 


keep    mentalhealth srhealth finconhouse sex age childrenhh personalinc partnered wght_per

save "/Users/meganskowronski/Desktop/CAnD3/Data Management/CleanedVariablesGSS2017.dta", replace 



