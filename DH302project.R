rm(list = ls())
library(dplyr)
DATA = read.csv("C:\\Users\\kvpkr\\Desktop\\DH302\\U.S._Chronic_Disease_Indicators__CDI_.csv")

DATA[DATA == ""] <- NA 

data = DATA
dataframe = data.frame(data)

data_CVD = subset(data, Topic== "Cardiovascular Disease")
data_CVD_CrudeRate = subset(data_CVD, data_CVD$DataValueTypeID == "CRDRATE")
data_CVD_AgeAdjustedRate = subset(data_CVD, data_CVD$DataValueTypeID == "AGEADJRATE")

data_CVD_AgeAdjustedRate_bycategory= list()

#CVD1_1 - Total cardiovascular disease
#CVD1_2 - Diseases of the heart
#CVD1_3 - Coronary Artery disease
#CVD1_4 - Heart failure
#CVD1_5 - Cerebro vascular disease (stroke)

QuestionIDs= unique(data_CVD$QuestionID)
Questions = unique(data_CVD$Question)

QuestionsStarred = c("CVD1_1", "CVD1_2", "CVD1_3","CVD1_4", "CVD3_5")
Stratification_ID = unique(data_CVD$StratificationID1)


for (i in 1:8){ ##Omitting last two categories
  data_CVD_AgeAdjustedRate_bycategory[[i]]= subset(data_CVD_AgeAdjustedRate, data_CVD_AgeAdjustedRate$StratificationID1 == Stratification_ID[i])
}
for (i in 1:5){
  data_
}

for (i in 

  X = data_CVD_AgeAdjustedRate_bycategory[[3]]
#For reference, just specify each year's data

G = list()
for(i in 1:11){
  G[[i]]= subset(data_CVD, YearStart == 2009+i)
}

CVDStats = list()
for(i in 1:11){
  CVDStats[[i]]= subset(G[[i]], Topic == "Cardiovascular Disease")
}

HeartDisease = list() #Diseases of the heart
for (i in 1:11){
  HeartDisease[[i]]= subset(CVDStats[[i]], Question == "Mortality from diseases of the heart" )
}

CHF = list() #Congestive Heart Failure
for (i in 1:11){
  CHF[[i]]= subset(CVDStats[[i]], Question =="Mortality from heart failure"  )
}

CAD = list() #Coronary Artery Disease/ Coronary Heart Disease
for (i in 1:11){
  CAD[[i]]= subset(CVDStats[[i]], Question =="Mortality from coronary heart disease"  )
}

CVD = list() #Cerebro Vascular Disease
for (i in 1:11){
  CVD[[i]]= subset(CVDStats[[i]], Question =="Mortality from cerebrovascular disease (stroke)" )
}

Stratification_Unique = unique(data_CVD$Stratification1) #How many classifications are there?

names(data) 
us_state_abbrevs=c("AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE",
                   "FL","GA","GU","HI","IA","ID","IL","IN","KS","KY",
                   "LA","MA","MD","ME","MI","MN","MO","MS","MT","NC",
                   "ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR",
                   "PA","PR","RI","SC","SD","TN","TX","UT","VA","VI",
                   "VT","WA","WI","WV","WY")    ##55 states

StateWiseCVD =list()
StateWiseCAD= list()
StateWiseCHF= list()
StateWiseHD = list()

unique()
n=0
for (j in 1:11){
  for (i in 1:length(us_state_abbrevs)){
    StateWiseCAD[[i+n]]= subset (CAD[[j]], CAD[[j]]$LocationAbbr == us_state_abbrevs[i])
  }
  n= n+length(us_state_abbrevs)
}

n=0
for (j in 1:11){
  for (i in 1:length(us_state_abbrevs)){
    StateWiseCHF[[i+n]]= subset (CHF[[j]], CHF[[j]]$LocationAbbr == us_state_abbrevs[i])
  }
  n= n+length(us_state_abbrevs)
}
n=0
for (j in 1:11){
  for (i in 1:length(us_state_abbrevs)){
    StateWiseCVD[[i+n]]= subset (CVD[[j]], CVD[[j]]$LocationAbbr == us_state_abbrevs[i])
  }
  n= n+length(us_state_abbrevs)
}
n=0
for (j in 1:11){
  for (i in 1:length(us_state_abbrevs)){
    StateWiseHD[[i+n]]= subset (HeartDisease [[j]], HeartDisease [[j]]$LocationAbbr == us_state_abbrevs[i])
  }
  n= n+length(us_state_abbrevs)
}

data_specific= StateWiseCAD[[56]]
data_specific= StateWiseCVD[[56]]
data_specific= StateWiseHD[[56]]
data_specific= StateWiseCHF[[56]]

QuestionIDs= unique(data_CVD$QuestionID)
Questions = unique(data_CVD$Question)



# if state number = i and year = 2009+j, then call for Disease[[55*j+i]]

#Work with CVD (Stroke)
StateWiseCVDMatrix = matrix(data = StateWiseCVD, nrow = 11, ncol =  55)





# StateWiseCAD[[55*2+29]] calls for State#29 i.e Montana's CAD Statistics for the year 2009+2= 2011

# Getting the incidence 

DataAggregated <- 


