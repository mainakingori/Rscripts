library(tidyverse)
library(dplyr)
head(TB21)
attach(TB21)
as.data.frame(TB21)
D=TB21[,"Type.of.patient","HIV.Status","Sex.M.F","BMI","Age.on.registration"] 
EE=TB21$Age.on.registration
EE
AA=as.numeric(EE)
AA
BB=TB21$HIV.Status
BB
CC=recode(BB,"Neg"=0,"Pos"=1)
CC
DD=TB21$Sex.M.F
DD
FF=recode(DD,"M"=1,"F"=0)
FF
GG=TB21$Type.of.patient
GG
HH=recode(GG,"R"=1,"N"=0)
HH
II=TB21$BMI
II
JJ=recode(II,"N/A"=0)
JJ

VV=data.frame(AA,BB,CC,FF,HH,II)
VV
pc=princomp(VV,cor = TRUE,scores = TRUE)
summary(pc)

TT= glm(GG~BB+CC+FF+HH+II,family = "binomial")
summary(TT)
