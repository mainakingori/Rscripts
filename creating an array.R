dim1=c("A1","A2")
dim2=c("B1","B2","B3")
dim3=c("C1","C2","C3","C4")
z=array(1:24,c(2,3,4),dimnames=list(dim1,dim2,dim3))
z


patientID <- c(1, 2, 3, 4)
 age <- c(25, 34, 28, 52)
 diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
 patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
patientdata[c("age","diabetes")]
patientdata$agecat

[ patientdata&age >75] <- "diabetes"
table(patientdata$diabetes, patientdata$status)

attach(mtcars)
summary(mpg)
par(lty=2,pch=17)
plot(mpg,disp,wt)
plot(mpg, wt)


with(mtcars, {
  summary(mpg, disp, wt)
  par(lty=2,pch=17)
  plot(mpg, disp,type = "b")
  plot(mpg, wt)
})
patientdata <- data.frame(patientID, age, diabetes, status,
                          row.names=patientID)

dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
opar <- par(no.readonly=TRUE)
par(pin=c(2, 3))
par(lwd=2, cex=1.5)
par(cex.axis=.75, font.axis=3)
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
par(opar)
patientdata
