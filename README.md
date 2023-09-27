## README File: CAnD3-Data-ActivityWorkFlow
CAnD3 Research Replicability &amp; Workflow Management Activity 

## Study Description
This study examines the relationships between individual's contribution to their 
rent/mortgage and respondents' mental and physical health. 
Using the 2017 General Social Survey, analyses find that 
the health-benefits of earning more than a secondary degree vary between male 
and female respondents. Below, information is included about how to use the 
files provided to reproduce the analyses leading to this conclusion.

***
### Data Source Availabiliy Statement
Data come from the 2017 (cycle 31) Canadian General Social Survey. These data 
are made available through [ODESI](https://search1.odesi.ca/#/), a service 
provided by the Ontario Council of University Libraries. Access is restricted 
to those users who have a DLI License and can be used for statistical and 
research purposes. The terms of the license can be viewed [here](https://www.statcan.gc.ca/eng/dli/licence).  

As part of McGill University, the CAND3 initiative has a license to use the data 
for the purposes of training. Those outside of McGill university should not use 
the data provided through CAND3's training activities for purposes not related 
to their CAND3 training. Trainees who belong to another DLI institution should 
re-download the data using the ODESI site using the login provided by their 
institution if they wish to make use of the data for other purposes.  

**CODEBOOK AND SUMMARY STATISTICS**  
The codebook and summary statistics for these data are publicly available [here](http://odesi1.scholarsportal.info/documentation/GSS31/c31pumf_families_codebook_E.pdf).  
  
**CITATIONS**  
Statistics Canada. 2020. General Social Survey, Cycle 31, 2017 [Canada]: Family (version 2020-09). Statistics Canada [producer and distributor], accessed September 10, 2021. ID: gss-12M0025-E-2017-c-31
***

### Files Included

**File Name**             | **Purpose**
--------------------------| -------------------------------------------------
'GSS_2017_Recode.do'         | Cleans, Codes Variables and Create Analytical Sample 
'GSS_2017_Analysis.do' | Runs regression analysis and creates tables 

***

### Instructions for Data Preparation and Analysis
To reproduce the analyses conducted here, download the files for this project.  
Create a folder named "CAnD3-Workflow." This folder will be 
your working directory. Once you obtain access to the dataset, rename it 
"GSS_2017.csv" and save it in the working directory (CAnD3-Workflow). 

Open and run the file title 'GSS_2017_Recode.do' and 'GSS_2017_Analysis.do'. This file calls on the individual 
script files to clean the data, manage missing data, and produce the descriptive 
and regression tables.  

***

## Computational Requirements

***

### Software Requirements
The following software programs are required to reproduce these analyses:  

* Stata/SE 17.0 for Mac (Apple Silicon)

***

### Machine Information
These analyses were conducted using Mac OS Ventura (version 13.2.1):  

* Apple M2 Pro 
* 16 GB Memory

