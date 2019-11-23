library(tidyverse)
# Data with headers (A1, A2, ...)

data_h <- read_csv(file.choose())

# Data with labels 

data_l <- read_csv(file.choose())
# data_ht <- as.tibble(data_h)
# data_lt <- as.tibble(data_l)
# Working with data_h
# Demographic data


# Data having removed missing values



  data_ht <- data_h %>% filter(A1 == 1)

  # Demographics data, 'demo' DATA WITH RENAMED COLUMNS
  
  demo <- data_ht %>%
    select(A1:Q6) %>% 
    rename(Consent = A1, Q_ID = A2, Date = A3,
              Gender = Q1, Age = Q2, Accomodation = Q3,
              Department = Q4, MSPS = Q5,
              BESS = Q5_001, MMPE = Q5_002, IC = Q5_003, Year = Q6 ) %>%
    unite(Course, MSPS, MMPE, IC, BESS)
  
  
  # PHYSICAL EXERCISE SCORES 
  phyc <- data_ht %>%
    select(Q7:Q12) %>%
    replace(is.na(.), 0) %>%
    transmute(pa_score = rowSums(.[1:6]))
    
  
  # DIET SCORES
  diet <- data_ht %>%
    select(Q13:Q16) %>%
    replace(is.na(.), 0) %>%
    transmute(diet_score = rowSums(.[1:4]))
  
  
  # SMOKING
  # Those who have NEVER SMOKED or USED TO SMOKE BUT HAVE NOW STOPPED
  data_ht %>%
    select(Q38:Q43) %>%
    transmute( Q38=recode(data_ht$Q38, `0`=13L, `1`=0L, `2`=0L), # Question 38
               Q39=Q39,
               Q40=recode(data_ht$Q40, `0`=5L, `1`=4L, `2`=3L, `3`=2L, `4`=1L,`5`=0L),# Qusstion 40 HNumber of cigars
               Q41=Q41,
               Q42=recode(data_ht$Q42, `0`=1L, `1`=0L),
               Q43=recode(data_ht$Q43, `0`=1L, `1`=0L)) %>%
    rowSums(na.rm = TRUE) -> smokingscore
  as.tibble(smokingscore) %>%
    rename(smokingscore = value)

  
  
# ALCOHOL
  data_ht %>%
    select(Q30:Q37) %>%
    transmute( Q30=recode(data_ht$Q30, `0`=20L, `1`=0L), # Question 30
               Q31=recode(data_ht$Q31, `0`=4L, `1`=3L, `2`=2L, `3`=1L, `4`=0L),
               Q32=recode(data_ht$Q32, `0`=4L, `1`=3L, `2`=2L, `3`=1L, `4`=0L),# Qusstion 40 HNumber of cigars
               Q33=Q33,
               Q34=Q34,
               Q35=recode(data_ht$Q35, `0`=1L, `1`=0L),
               Q36=recode(data_ht$Q36, `0`=1L, `1`=0L),
               Q37=recode(data_ht$Q37, `0`=1L, `1`=0L)) %>%
    rowSums(na.rm = TRUE) -> alcohol
  alcohol <- as.tibble(alcohol) %>%
    rename(alcoscore = "value")
  
  # DRUGS
  data_ht %>%
    select(Q44:Q46_001) %>%
    transmute(Q44=recode(data_ht$Q44, `0`=6L, `1`=0L), # Question 44
               Q45=Q45) %>%
    rowSums(na.rm = TRUE) -> drugs
  drugs <- as.tibble(drugs) %>%
    rename(drugscore = "value")
  
  # SEXUAL HEALTH
  
  sexual_health <- data_ht %>% 
    select(Q25:Q29) %>%
    transmute( Q25=recode(data_ht$Q25, `1`=1L, `0`=3L), 
               Q26=recode(data_ht$Q26, `0`=2L, `1`=1L, `2`=0L),
               Q27=recode(data_ht$Q27, `0`=0L, `1`=1L, `2`=1L, `3`=1L),# Qusstion 40 HNumber,
               Q28=Q28,
               Q29=recode(data_ht$Q29, `0`=1L, `1`=0L, `2`=0L, `3`=0L)
               )
  
  sexual_health %>%
    rowSums(na.rm = TRUE) -> sexhealth 
  sexhealth <- as.tibble(sexhealth) %>%
    rename(sexscore = "value")
  
  
  # SLEEP
  sleep <- data_ht %>%
    as.tibble() %>%
    select(Q17:Q24)
    
  
  a <- sleep$Q17   #  How long (in minutes) has it taken you to fall asleep each night?
  a[a<15] <- 0 
  a[(a>=15)&(a<=30)] <- 1
  a[(a>31)&(a<=60)] <- 2
  a[a>60] <- 3
  sleep$Component_2 <- a
  
  b <- sleep$Q19
  b[b<5] <- 3
  b[(b>=5)&(b<=6)] <- 2
  b[(b>6)&(b<=7)] <- 1
  b[b>7] <- 0  # need some adjustment
  sleep$Component_3 <- b
  
   sleep <- sleep %>%
    mutate(Q19=Q19, Q19_001=Q19_001, Component_4 = (Q19/Q19_001)*100, Component_6 = Q21, Component_1 = Q24) %>%
              mutate(Component_41 = case_when(
                                    Component_4 > 85  ~ 0,
                                    Component_4 >= 75 & Component_4 < 84 ~ 1,
                                    Component_4 >= 65 & Component_4 < 74 ~ 2,
                                    Component_4 < 65 ~ 3
                                    )
              )
   
     sleep %>%
       select(Q21:Q22) %>%
       rowSums() -> sleep$Component_7 
     
     sleep <- sleep %>%
       mutate(Component_71 = case_when(
       Component_7 == 0  ~ 0,
       Component_7 >= 1 & Component_7 <= 2 ~ 1,
       Component_7 >= 3 & Component_7 <= 4 ~ 2,
       Component_7 >= 5 & Component_7 <= 6 ~ 3
     )
     )
     # %>%
     #   select(Q21, Q22, Component_7,Component_71)
     # 
   
  # Component_5
   # # sum of scores 5b to 5j (0=0; 1-9=1; 10-18=2; 19-27=3)
  sleep %>%
    select(Q20_001:Q20_008) %>%
    rowSums() -> sleep$Component_5

   # write_csv(as_tibble(d), "C:/Users/Jobu_Harrison/Desktop/project data dummy/d.csv")

  
  # FINAL SLEEP TIBBLEtibble
  sleep_final <- sleep %>%
    select(Component_1, Component_2,
           Component_3, Component_41,
           Component_5, Component_6,
           Component_7
           ) 
  sleep_final %>%
    rowSums() -> sleep_final$Sleepscore
  
  
  
  # demo;phyc;diet;smokingscore;alcohol;sleep_final$Sleepscore;drugs;sexual_health
  
  
  
  # HEALTH AND LIFESTYLE DATA 
  hs_data <- as.tibble(data.frame(demo,
                       phyc,
                       diet,
                       smokingscore,
                       alcohol,
                       sleep_final$Sleepscore,
                       drugs,
                       sexhealth)
            )
  
  hs_data %>% 
    select(pa_score:sexscore) %>%
    rowSums() -> hs_data$health_score
  
  
  write_csv(hs_data, "hs_data.csv") 
  