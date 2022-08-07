rm(list = ls())
library(ggplot2)
library(dplyr)
DATA = read.csv("C:\\Users\\kvpkr\\Desktop\\DH302\\U.S._Chronic_Disease_Indicators__CDI_.csv")

DATA[DATA == ""] <- NA 

data = DATA
dataframe = data.frame(data)

break

data_CVD = subset(data, Topic== "Cardiovascular Disease")
data_CVD_CholesterolScreening = subset(data_CVD, Question == "Cholesterol screening among adults aged >= 18 years" )
data_CVD_CholesterolPrevalence = subset(data_CVD, Question ==  "High cholesterol prevalence among adults aged >= 18 years")


data_CVD_AgeAdjustedRate_Prevalence= subset(data_CVD_CholesterolPrevalence, data_CVD_CholesterolPrevalence$LocationAbbr== "US")
data_CVD_AgeAdjustedRate_Prevalence=subset(data_CVD_AgeAdjustedRate_Prevalence, data_CVD_AgeAdjustedRate_Prevalence$DataValueTypeID == "AGEADJPREV")
  
data_CVD_AgeAdjustedRate = data_CVD_AgeAdjustedRate_Prevalence

Stratification_ID = unique(data_CVD$StratificationID1)

data_CVD_AgeAdjustedRate_1 = subset(data_CVD_AgeAdjustedRate, data_CVD_AgeAdjustedRate$StratificationID1 == Stratification_ID[1])
data_CVD_AgeAdjustedRate_2 = subset(data_CVD_AgeAdjustedRate, data_CVD_AgeAdjustedRate$StratificationID1 == Stratification_ID[2])
data_CVD_AgeAdjustedRate_3 = subset(data_CVD_AgeAdjustedRate, data_CVD_AgeAdjustedRate$StratificationID1 == Stratification_ID[3])

Xaxis = as.numeric(unlist(data_CVD_AgeAdjustedRate_1$YearStart))
Yaxis_Overall = as.numeric(array(unlist(data_CVD_AgeAdjustedRate_1$DataValue)))
Yaxis_Female = as.numeric(unlist(data_CVD_AgeAdjustedRate_2$DataValue))
Yaxis_Male = as.numeric(unlist(data_CVD_AgeAdjustedRate_3$DataValue))

ggplot(data= data_CVD_AgeAdjustedRate_1, aes(x = Xaxis, group = 1))+
  geom_line(aes(y =Yaxis_Overall, color =  "Overall"))+
  geom_line(aes(y =Yaxis_Female, color =  "Female"))+
  geom_line(aes(y =Yaxis_Male, color =  "Male"))+
  labs(y = "High cholesterol prevalence", x = "Time in years"  )



