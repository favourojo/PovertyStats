### Name:
# Hailey, Mariah, Kyrie, Favour 

# Date: 13 December 2021

# Final project code


rm(list = ls()) # remove variables stored in memory.


# If you want to remove all previous plots and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

#################################################
#### Setup your common libraries
#################################################

# add your libraries here

library(tidyverse)

#install.packages("psych")
library(psych)
library(ggplot2)

#Selecting the file
myFile  <- file.choose() # pick the csv filename
myData <- read.csv(myFile) # load the data

# View data
View(myData)

# Filtering the data to select certain variables to test using select()
# also filtering out countries that have no data using filter()
dat <- myData %>% select(country, year, MPOV08_PT190, FPOV08_PT190, MPOV08_PT310, FPOV08_PT310, MPOV08_GAP190, FPOV08_GAP190
, MPOV08_GAP310, FPOV08_GAP310, MPOV08_PN190, FPOV08_PN190, MPOV08_PN310, FPOV08_PN310, MPOV08_PCEXP, FPOV08_PCEXP, MPOV08_FOOD, FPOV08_FOOD, MPOV08_NFOOD, FPOV08_NFOOD
, PN08_MAL, PN08_FEM, TPOV08_PT190, TPOV08_PT310, TPOV08_GAP190, TPOV08_GAP310, TPOV08_PN190
, TPOV08_PN310, TPOV08_PCEXP, TPOV08_FOOD, TPOV08_NFOOD, PN08_TOT) %>% filter(MPOV08_PT190 > 0)

View(dat)

# correlation matrix of data set to find statistically significant relationships
#pairs.panels(dat)

#################################################
#### 2005 Survey Year Analysis
#################################################

# creating new variable with necessary data points for analysis
# filtering for the year 2005, and filtering Uganda's results for Food expenditures, as there are no data points for these variables in the original data set
data2005_Spend <- dat %>% select(country, year, MPOV08_FOOD, FPOV08_FOOD, MPOV08_NFOOD, FPOV08_NFOOD) %>% filter(year == 2005 & country != "Uganda")

# looking at correlation
pairs.panels(data2005_Spend)


# view data
View(data2005_Spend)

# How did monthly food expenditures differ between people of different genders and from different African countries in 2005?
ggplot(data = data2005_Spend) + geom_point(mapping = aes(x = country, y = MPOV08_FOOD), color = "blue") +
  geom_point(mapping=aes(x=country, y = FPOV08_FOOD), color = "red") + 
  labs(subtitle = "2005",
       y = "Monthly Food Expenditure in 2011 PPP$", 
       x = "Country", title = "Monthly Food Expenditures")

# How did monthly nonfood expenditures differ between people of different genders and from different African countries in 2005?
ggplot(data = data2005_Spend) + geom_point(mapping = aes(x = country, y = MPOV08_NFOOD), color = "blue") +
  geom_point(mapping=aes(x=country, y = FPOV08_NFOOD), color = "red") + 
  labs(subtitle = "2005",
       y = "Monthly Non-Food Expenditure in 2011 PPP$", 
       x = "Country", title = "Monthly Non-Food Expenditures")

# How did the poverty headcount ratio differ between people of different genders and from different African countries in 2005?
data2005_Poverty <- dat %>% select(country, year, MPOV08_PT190, FPOV08_PT190, MPOV08_PT310, FPOV08_PT310) %>% filter(year == 2005)

# at $1.90/day PPP
ggplot(data = data2005_Poverty) + geom_point(mapping = aes(x = country, y = MPOV08_PT190), color = "blue") +
  geom_point(mapping=aes(x=country, y = FPOV08_PT190), color = "red") + 
  labs(subtitle = "2005",
       y = "Poverty Headcount Ratio (%)", 
       x = "Country", title = "Poverty Headcount Ratio (%) by country")


#################################################
#### 2012 Survey Year Analysis
#################################################

# creating new variable with necessary data points for analysis
data2012_Spend <- dat %>% select(country, year, MPOV08_FOOD, FPOV08_FOOD, MPOV08_NFOOD, FPOV08_NFOOD) %>% filter(year == 2012 & country != "Uganda")

View(data2012_Spend)

# How did monthly food expenditures differ between people of different genders and from different African countries in 2012?
ggplot(data = data2012_Spend) + geom_point(mapping = aes(x = country, y = MPOV08_FOOD), color = "blue") +
  geom_point(mapping=aes(x=country, y = FPOV08_FOOD), color = "red") + 
  labs(subtitle = "2012",
       y = "Monthly Food Expenditure in 2011 PPP$", 
       x = "Country", title = "Monthly Food Expenditures")

# How did monthly non-food expenditures differ between people of different genders and from different African countries in 2012?
ggplot(data = data2012_Spend) + geom_point(mapping = aes(x = country, y = MPOV08_NFOOD), color = "blue") +
  geom_point(mapping=aes(x=country, y = FPOV08_NFOOD), color = "red") + 
  labs(subtitle = "2012",
       y = "Monthly Non-Food Expenditure in 2011 PPP$", 
       x = "Country", title = "Monthly Non-Food Expenditures")

# How did the poverty headcount ratio differ between people of different genders and from different African countries in 2012?
data2012_Poverty <- dat %>% select(country, year, MPOV08_PT190, FPOV08_PT190) %>% filter(year == 2012)

# at $1.90/day PPP
ggplot(data = data2012_Poverty) + geom_point(mapping = aes(x = country, y = MPOV08_PT190), color = "blue") +
  geom_point(mapping=aes(x=country, y = FPOV08_PT190), color = "red") + 
  labs(subtitle = "2012",
       y = "Poverty Headcount Ratio (%)", 
       x = "Country", title = "Poverty Headcount Ratio (%) by country")


#################################################
#### Multi-Year Analysis
#################################################

##########
# Ethiopia
##########

dataEthiopia <- dat %>% select(country, year, MPOV08_FOOD, FPOV08_FOOD, MPOV08_NFOOD, FPOV08_NFOOD, MPOV08_PT190, FPOV08_PT190) %>% filter(country == "Ethiopia")

View(dataEthiopia)

# How did monthly food expenditures differ between people of different genders in Ethiopia during the years 2010 and 2012?
ggplot(data = dataEthiopia) + geom_point(mapping = aes(x = year, y = MPOV08_FOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_FOOD), color = "red") + xlim(2008, 2013) +
  labs(subtitle = "For 2010 and 2012",
       y = "Monthly Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Food Expenditures in Ethiopia by Gender")

# How did monthly non-food expenditures differ between people of different genders in Ethiopia in 2010 and 2012?
ggplot(data = dataEthiopia) + geom_point(mapping = aes(x = year, y = MPOV08_NFOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_NFOOD), color = "red") + xlim(2008, 2013) +
  labs(subtitle = "For 2010 and 2012",
       y = "Monthly Non-Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Non-Food Expenditures in Ethiopia by Gender")

# How did the poverty headcount ratio differ between people of different genders in Ethiopia in 2000, 2010, 2012?

ggplot(data = dataEthiopia) + geom_point(mapping = aes(x = year, y = MPOV08_PT190), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_PT190), color = "red") + 
  labs(subtitle = "For 2000, 2010, and 2012",
       y = "Poverty Headcount Ratio (%)", 
       x = "Year", title = "Poverty Headcount Ratio (%) in Ethiopia by Gender")


##########
# Malawi
##########

dataMalawi <- dat %>% select(country, year, MPOV08_FOOD, FPOV08_FOOD, MPOV08_NFOOD, FPOV08_NFOOD, MPOV08_PT190, FPOV08_PT190) %>% filter(country == "Malawi")

View(dataMalawi)

# How did monthly food expenditures differ between people of different genders in Malawi during the years 2010 and 2012?
ggplot(data = dataMalawi) + geom_point(mapping = aes(x = year, y = MPOV08_FOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_FOOD), color = "red") + xlim(2002, 2011) +
  labs(subtitle = "For 2004 and 2010",
       y = "Monthly Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Food Expenditures in Malawi by Gender")

# How did monthly non-food expenditures differ between people of different genders in Ethiopia in 2010 and 2012?
ggplot(data = dataMalawi) + geom_point(mapping = aes(x = year, y = MPOV08_NFOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_NFOOD), color = "red") + xlim(2002, 2011) +
  labs(subtitle = "For 2004 and 2010",
       y = "Monthly Non-Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Non-Food Expenditures in Malawi by Gender")

# How did the poverty headcount ratio differ between people of different genders in Ethiopia in 2000, 2010, 2012?

ggplot(data = dataMalawi) + geom_point(mapping = aes(x = year, y = MPOV08_PT190), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_PT190), color = "red") + 
  labs(subtitle = "For 1998, 2004, and 2010",
       y = "Poverty Headcount Ratio (%)", 
       x = "Year", title = "Poverty Headcount Ratio (%) in Malawi by Gender")


##########
# Madagascar
##########

dataMadagascar <- dat %>% select(country, year, MPOV08_FOOD, FPOV08_FOOD, MPOV08_NFOOD, FPOV08_NFOOD, MPOV08_PT190, FPOV08_PT190) %>% filter(country == "Madagascar")

View(dataMadagascar)

# How did monthly food expenditures differ between people of different genders in Ethiopia during the years 2010 and 2012?
ggplot(data = dataMadagascar) + geom_point(mapping = aes(x = year, y = MPOV08_FOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_FOOD), color = "red") +
  labs(subtitle = "For 2001, 2005, and 2010",
       y = "Monthly Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Food Expenditures in Madagascar by Gender")

# How did monthly non-food expenditures differ between people of different genders in Ethiopia in 2010 and 2012?
ggplot(data = dataMadagascar) + geom_point(mapping = aes(x = year, y = MPOV08_NFOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_NFOOD), color = "red") +
  labs(subtitle = "For 2001, 2005, and 2010",
       y = "Monthly Non-Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Non-Food Expenditures in Madagascar by Gender")

# How did the poverty headcount ratio differ between people of different genders in Ethiopia in 2000, 2010, 2012?

ggplot(data = dataMadagascar) + geom_point(mapping = aes(x = year, y = MPOV08_PT190), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_PT190), color = "red") + 
  labs(subtitle = "For 2001, 2005, and 2010",
       y = "Poverty Headcount Ratio (%)", 
       x = "Year", title = "Poverty Headcount Ratio (%) in Madagascar by Gender")

##########
# Malawi
##########

dataMalawi <- dat %>% select(country, year, MPOV08_FOOD, FPOV08_FOOD, MPOV08_NFOOD, FPOV08_NFOOD, MPOV08_PT190, FPOV08_PT190) %>% filter(country == "Malawi")

View(dataMalawi)

# How did monthly food expenditures differ between people of different genders in Ethiopia during the years 2010 and 2012?
ggplot(data = dataMalawi) + geom_point(mapping = aes(x = year, y = MPOV08_FOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_FOOD), color = "red") + xlim(2002, 2011) +
  labs(subtitle = "For 2004 and 2010",
       y = "Monthly Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Food Expenditures in Malawi by Gender")

# How did monthly non-food expenditures differ between people of different genders in Ethiopia in 2010 and 2012?
ggplot(data = dataMalawi) + geom_point(mapping = aes(x = year, y = MPOV08_NFOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_NFOOD), color = "red") + xlim(2002, 2011) +
  labs(subtitle = "For 2004 and 2010",
       y = "Monthly Non-Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Non-Food Expenditures in Malawi by Gender")

# How did the poverty headcount ratio differ between people of different genders in Ethiopia in 2000, 2010, 2012?

ggplot(data = dataMalawi) + geom_point(mapping = aes(x = year, y = MPOV08_PT190), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_PT190), color = "red") + 
  labs(subtitle = "For 1998, 2004, and 2010",
       y = "Poverty Headcount Ratio (%)", 
       x = "Year", title = "Poverty Headcount Ratio (%) in Malawi by Gender")


##########
# Senegal
##########

dataSenegal <- dat %>% select(country, year, MPOV08_FOOD, FPOV08_FOOD, MPOV08_NFOOD, FPOV08_NFOOD, MPOV08_PT190, FPOV08_PT190) %>% filter(country == "Senegal")

View(dataSenegal)

# How did monthly food expenditures differ between people of different genders in Ethiopia during the years 2010 and 2012?
ggplot(data = dataSenegal) + geom_point(mapping = aes(x = year, y = MPOV08_FOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_FOOD), color = "red") +
  labs(subtitle = "For 2001, 2005, and 2011",
       y = "Monthly Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Food Expenditures in Senegal by Gender")

# How did monthly non-food expenditures differ between people of different genders in Ethiopia in 2010 and 2012?
ggplot(data = dataSenegal) + geom_point(mapping = aes(x = year, y = MPOV08_NFOOD), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_NFOOD), color = "red") +
  labs(subtitle = "For 2001, 2005, and 2011",
       y = "Monthly Non-Food Expenditure in 2011 PPP$", 
       x = "Year", title = "Monthly Non-Food Expenditures in Senegal by Gender")

# How did the poverty headcount ratio differ between people of different genders in Ethiopia in 2000, 2010, 2012?

ggplot(data = dataSenegal) + geom_point(mapping = aes(x = year, y = MPOV08_PT190), color = "blue") +
  geom_point(mapping=aes(x=year, y = FPOV08_PT190), color = "red") + 
  labs(subtitle = "For 2001, 2005, and 2011",
       y = "Poverty Headcount Ratio (%)", 
       x = "Year", title = "Poverty Headcount Ratio (%) in Senegal by Gender")



# (Did you remember to add your name to this script?)
