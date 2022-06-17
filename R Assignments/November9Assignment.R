#Name: Patricia Jennesha
#Date: November 9 2021

# Shapefiles
install.packages("rgdal") # to read shapefile
library(rgdal)
install.packages("tidygeocoder") # to get coordinates
library(tidygeocoder)
install.packages("ggplot2") # to plot
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("ggrepel")
library(ggrepel)

# Read shapefile
texas_shp <- readOGR(file.choose()) # choose the shp file
plot(texas_shp)

# to create df for ggplot
texas_df <- fortify(texas_shp)

# read the data file for layering university locations
texas_places <- read.csv(file.choose())


# get coordinates for addresses
places_coord <- geocode(texas_places, address = Address)


# Create viz using ggplot
ggplot(data = places_coord, aes(long, lat), color = 'red')+
  geom_polygon(data = texas_df, aes(long, lat, group=group), fill='beige', color='black') +
  geom_point() +
  labs(title = "Visiting Texas?") +
  geom_label_repel(aes(label = Sights), color = 'black') 
