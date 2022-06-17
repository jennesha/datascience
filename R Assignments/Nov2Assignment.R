#Name: Patricia Jennesha
#Date: November 02, 2021

# Data Source: https://data.worldbank.org/indicator/SP.DYN.LE00.IN?name_desc=false
# Note - data downloaded was modified for use

### GEOSPATIAL PLOTS

install.packages("ggplot2")
install.packages("dplyr")
install.packages("maps")
library(ggplot2)
library(dplyr)
library(maps)

# Read file from csv
df <- read.csv(file.choose())

world_map <- select(map_data('world'), !c("subregion"))

df_plot <- left_join(world_map, df, by = 'region')

# Plot
ggplot(df_plot, aes(long, lat, group = group)) +
  geom_polygon(aes(fill=X2019)) +
  scale_fill_gradient(low = "red", high = "green")
  labs(title='2019 Life Expectancy')

# Note:
# Some countries' data does not exist, and data on Denmark is not translating properly