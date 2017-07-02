library(readr)
Beers <- read_csv("~/SMU/Doing DataScience/Case Study 1/Beers.csv")
Breweries <- read_csv("~/SMU/Doing DataScience/Case Study 1/Breweries.csv")
BB_Data <- merge(Breweries, Beers, by.Breweries ="Brew_ID", by.Beers = "Brewery_id", all=TRUE)
BB_Data