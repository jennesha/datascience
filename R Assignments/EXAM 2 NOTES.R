# Working with data. Getting, cleaning, basic statistics, charting
# . Getting data
# o From external source
install.packages("dplyr")
library(dplyr)
df <- read.csv(file.choose(), header = T, na.strings = "")
# o From R packages
df_cars <- data.frame(mtcars)

# . Packages:
#   o all the previous ones plus ggplot2, DMwR2 , corrplot, sf, rgdal, tmap, plotly

# . handling missing data
# o locating

# o removing
df_titanic <- df_titanic[!(df_titanic$Survived == ""),]
# o replacing

# ??? fixed value
mean_age <- mean(df_titanic$Age, na.rm = T)

df_titanic$Age <- replace_na(df_titanic$Age, mean_age)

df_titanic$Embarked[df_titanic$Embarked == ""] <- "S"
# ??? central value

# ??? nearest neighbors

# ??? related variables

# . handling duplicate data
# o identify
unique(studentAges[duplicated(studentAges)])
# o removing
a. REMOVE ROWS =  example_df[!duplicated(example_df),]
b. REMOVE COOLUMNS = example_df[!duplicated(as.list(example_df))]
c. ROWS w/ DPLYR = example_df %>% distinct()

# . renaming columns
colnames(df)[which(names(df) == 'col1')] <- "new_col1"
colnames(df)[2] <- "new_col2"

# . tidying data: long and wide forms

# . charting, including annotating, labeling
# o bar
geom_bar
# o boxplots
# o correlations
geom_smooth
# o curves

# o density
geom_density #Oct21Notes
# o geospatial charts, including shapefiles
install maps, gpplot #Nov02
install rgdal, tidygeocoder #November9Assignment
# o histograms
geom_histogram
# o interactive charts
install tmap, view mode 
# o layering

# o lines

# o scatterplots


# . exporting visualizations
# o saving
# o publishing