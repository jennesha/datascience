# Name: Patricia Jennesha
# November 11 2021
# Experimant with Tmap

install.packages("tmap")
library(tmap)

install.packages("dplyr")
library(dplyr)

# Open the world dataset
data("World")
data("land")

# Change mode to static: plot or interactive:view
tmap_mode("view")

tmap_mode('plot')

# Create the plot object
tm_shape(World) +
  tm_polygons('economy')

tm_shape(land) +
  tm_raster('elevation')

tm_shape(land) +
  tm_raster('trees')

tm_shape(land) +
  tm_raster('cover_cls')


### EXERCISE
df_asia <-filter(World, continent == "Asia")

tmap_mode("view")

tm_shape(df_asia) +
  tm_polygons("life_exp", palette = blues9) + 
  tm_text("sovereignt", size = "AREA") 

tm_shape(df_asia) +
  tm_polygons("life_exp", palette = "magma") + 
  tm_text("sovereignt", size = "AREA") 

