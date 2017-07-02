
##  title: "BeerData"
##author: "Atsu Atakpa"
##date: "June 27, 2017"
##output:
##  html_document: default
##pdf_document: default
##word_document: default


## Analysis information for Breweries and Beers

library(readxl)
Beers <- read_excel("~//SMU//Doing DataScience//Case Study 1//CaseStudy1//Data//Beers.xlsx")
Breweries <- read_excel("~//SMU/Doing DataScience//Case Study 1//CaseStudy1//Data//Breweries.xlsx")
BB_Data <- merge(Breweries, Beers, by = c("Brewery_id"), all =TRUE)


## Number of Breweries in each state
library(plyr)
count(Breweries, "State")

## First 6 Observations of Merged Data
head(BB_Data,6)
## Last 6 Observations of Merged Data
tail(BB_Data,6)
## Count of NA's in each column
sapply(BB_Data,function(x) sum(is.na(x)))
## Median ABV and IBU by state
aggregate(BB_Data[, 7:8],list(BB_Data$State), median, na.rm = TRUE)
## Plot (needs work)
median_ABU_IBU <-aggregate(BB_Data[, 7:8],list(BB_Data$State), mean, na.rm = TRUE)
barplot(median_ABU_IBU$IBU)
barplot(median_ABU_IBU$ABV)

## State with the maximum alcoholic beverage
attach(BB_Data)
BB_Data[which(BB_Data$ABV == max(BB_Data$ABV, na.rm = TRUE)) ,"State"]
## State with the most bitter beer
attach(BB_Data)
BB_Data[which(BB_Data$IBU == max(BB_Data$IBU, na.rm = TRUE)) ,"State"]
## Summary statistics of ABV
summary(BB_Data$ABV)
## Plot of ABV and IBU
plot(BB_Data$ABV, BB_Data$IBU, main = 'Plot of ABV and IBU',xlab = 'Alcohol By Volume(ABV)', ylab = 'International Bittering Units(IBU)', col = "dark blue",lwd = 1)
