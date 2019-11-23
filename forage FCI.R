sales=c(6.5,4.5,10.0,12.7,6.6,4.6,9.7,13,7,5,10.4,14,7.1,5.5,10.8,15)
sales
myts=(ts(sales,frequency=4,start = c(2001,1)))
myts
matplot(myts)
dotchart(myts)
stripchart(myts)
ts.plot(myts)
diff(myts)
ts.plot(diff(myts))
library(TSA)
library(tseries)
adf.test(diff(myts))
acf(myts)
pacf(myts)
predict(arima(myts,order = c(1,1,1)), n.ahead = 2)
j
        rnorm(1, 0, 45)
        
        FCI <- as.numeric(3000)
        FCI[1] <- 20
        FCI[2] <- 32       
        
       for(i in 3:3000){
         
          FCI[i]=0.2*FCI[i-1]+0.1*FCI[i-2]+rnorm(1, 0, 45)
          print(FCI)
       }
ts.plot(FCI)        
stripchart(FCI)
dotchart(FCI)
matplot(FCI)
