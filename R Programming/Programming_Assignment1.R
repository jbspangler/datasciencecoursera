#Problem 1
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
#[1] 4.064128

pollutantmean("specdata", "nitrate", 70:72)
#[1] 1.706047

pollutantmean("specdata", "nitrate", 23)
#[1] 1.280833
###################################################################
#Problem 2
source("complete.R")
complete("specdata", 1)
#id nobs
#1  1  117

complete("specdata", c(2, 4, 8, 10, 12))
#  id nobs
#1  2 1041
#2  4  474
#3  8  192
#4 10  148
#5 12   96

complete("specdata", 30:25)
#  id nobs
#1 30  932
#2 29  711
#3 28  475
#4 27  338
#5 26  586
#6 25  463

complete("specdata", 3)
#  id nobs
#1  3  243

###################################################################
#Problem 3
source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
#[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

summary(cr)
#    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#-0.21060 -0.05147  0.09333  0.12400  0.26840  0.76310

cr <- corr("specdata", 400)
head(cr)
#[1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

summary(cr)
#    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#-0.17620 -0.03109  0.10020  0.13970  0.26850  0.76310

cr <- corr("specdata", 5000)
summary(cr)

length(cr)
#0

cr <- corr("specdata")
summary(cr)
#    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#-1.00000 -0.05282  0.10720  0.13680  0.27830  1.00000 

length(cr)
#323




