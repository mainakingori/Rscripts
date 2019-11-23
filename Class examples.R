# Example 1

x <- scan()
x
treatments <- c(rep(1:6, each=5))
treatments <- as.factor(treatments)

oneway.test(x ~ treatments)
m <- aov(x ~ treatments)
summary(m)
list.files()
missinigentries <- read.csv("example 2_missing entries.csv", header = TRUE)

#  Example 2

library(tidyverse)
mydata <- missinigentries %>%
  gather(key = Treatment)
  aov(value ~ Treatment, mydata)
  summary(aov(value ~ Treatment, mydata))


cbe <- read.csv("Complete block example.csv")
library(reshape2)


#  Exercise

d1 <- read.csv("Exercise.csv", header = TRUE)
d11 <- d1 %>%
  gather(key = Treatments)
A1 <- aov(value ~ Treatments, data = d11)
summary(A1)

model.tables(A1, type = "means")

?gather

library(reshape2) 
# Script for calculationg RANDOMIZED COMPLETE BLOCK DESIGN (RCBD)
# for RCBD_example1

RCBD <- function(){
d2 <- read.csv(file.choose()) 
d21 <- as.matrix(d2[,-1])
rownames(d21) <- c("t1", "t2", "t3")
d211 <- melt(d21, varnames = c("Treatment","Block"))
aov(value ~ Treatment + Block, data = d211)
summary(aov(value ~ Treatment + Block, data = d211))
return(summary(aov(value ~ Treatment + Block, data = d211)))
}
RCBD()

d3 <- read.csv(file.choose())
d31 <- as.matrix(d3[,-1])
rownames(d31) <- c("Route_1", "Route_2", "Route_3", "Route_4")
d311 <- melt(d31, varnames = c("Treatment","Block"))
aov(value ~ Treatment + Block, data = d311)
summary(aov(value ~ Treatment + Block, data = d311))
# qf(.05, 3, 3,  lower.tail = FALSE)

model.tables(aov(value ~ Treatment + Block, data = d311), type = "means")
