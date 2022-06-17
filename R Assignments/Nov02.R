#Name: Patricia Jennesha
#Date: November 02, 2021

### GEOSPATIAL PLOTS

install.packages("ggplot2")
install.packages("dplyr")
install.packages("maps")
library(ggplot2)
library(dplyr)
library(maps)

# Read file from csv
df_popdata <- read.csv("2019_Census.csv") # do getwd() to get working directory, setwd() to set directory

# Plot the data
ggplot(df_popdata, aes(x=long, y=lat)) +
  geom_point()
  # + geom_text(aes(label=POPESTIMATE2019), size=2)
  
# Load the US states map into a dataframe
Ustates <- map_data('state')


ggplot(Ustates, aes(long, lat, group = group)) +
  geom_polygon(fill = 'grey', col = 'black')

# Create a temp df from popData
pop2 <- df_popdata %>% 
  select(region=STATE, population=POPESTIMATE2019)

pop2$region <- tolower(pop2$region) #convert to lower case

# Combine the states data with the population data
theStates <- left_join(Ustates, pop2, by="region")

# Plot the map of the States
ggplot(theStates, aes(long, lat, group = group)) +
  geom_polygon(aes(fill=population), col='white')

# NOTES:
# What maps are available? help(package='maps')