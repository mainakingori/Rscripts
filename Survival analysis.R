library(survival)
library(KMsurv)
mydata=read.csv(file.choose(), header=TRUE)
mydata
attach(mydata)
mini=mydata[ID,1:5,]
mini
mini=mydata[-6,]
mini
attach(mini)
mini.surv(mini)
