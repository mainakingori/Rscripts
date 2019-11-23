dose <- c(20, 30, 40, 45, 60)
dose
drugA <- c(16, 20, 27, 40, 60)
drugA
drugB <- c(15, 18, 25, 31, 40)
drugB
data.frame(dose,drugA,drugB)
opar=par(no.readonly = TRUE)
par(lwd=3,cex=0.5)
plot(dose,drugB,type = "b",pch=15,lty=2,col="blue",xlim=c(0,50),ylim=c(0,60),main="drug samples",xlab="drugdose",ylab="drugresponse")
