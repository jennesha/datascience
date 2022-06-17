library(dplyr)  #for manipulating data

# Get module
install.packages("dplyr")
install.packages("tidyr")
install.packages("stringr")

library(dplyr)
library(tidyr)
library(stringr)

# Read csv file
sep23_df <- read.csv(file.choose(), header = T)

# UNITE - Combine two columns
sep23_df <- unite(sep23_df, FullName, fName, lName, sep = " ")

# SEPERATE - One column to Two
sep23_df <- separate(sep23_df, Address, into = c("Street", "City", "State", "ZIP"), sep = ", ",remove = FALSE)

# drop.na(sep23_df, "Street")
# replace.na(sep23_df, 'City', 'No Address Data')

# data("starwars")  #loads the dataset

# # Note that the starwars dataset is available in the dplyr package
# # Load dplyr before using starwars
# # Create a dataframe from  the starwars dataset 
# Sep21_df2 <- data.frame(starwars)
# 
# 
# #EXAMINE THE DATA
# View(Sep21_df2)
# head(Sep21_df2,2)
# summary(Sep21_df2$height)
# colnames(Sep21_df2)
# dim(Sep21_df2)
# str(Sep21_df2)
# nrow(Sep21_df2)
# ncol(Sep21_df2)
# 
# mean(Sep21_df2$height, na.rm = T)  #note removal of NAs
# 
# 
# # SELECTING VARIABLES
# #Sep21_df2 %>% select(name,height,homeworld)
# 
# select(Sep21_df2, name,height,homeworld)
# select(Sep21_df2, c(name,height,homeworld))
# select(starwars, species:gender)
# select_if(Sep21_df2, is.numeric)
# select(Sep21_df2, ends_with('color'))
# select(Sep21_df2,name, !c(vehicles,starships,homeworld, films, ends_with('color')))
# select(Sep21_df2, ends_with('color') & !contains('skin'))
# 
# #FILTERING OBSERVATIONS.  faster with ungrouped data
# some_droids <- filter(Sep21_df2, height >200 | height < 100 & species =='Droid') 
# 
# #NESTING vs PIPELINING
# my_result <- filter(select(starwars, contains("or"), species, gender), gender=='masculine')
# #rewrite using pipelining %>%
# my_result2 <- starwars %>% select(contains("or"), species, gender) %>% filter(gender == "masculine")
# 
# 
# #ARRANGE.  NAs are sorted at the end.
# #compare with order and sort which are base R
# sep21_arranged <-  arrange(Sep21_df2,species,desc(name))
# 
# #MUTATE.  
# #         to add - use new variable name, 
# #         to remove - set to null,
# #         to alter - use same name
# 
# # note that base R adds column at the end
# Sep21_df2$age <- 2021 - Sep21_df2$birth_year
# 
# #mutate allows positioning with .before=  .after=
# Sep21_df2 <- mutate(Sep21_df2,age2=2022 - birth_year, .after=birth_year)
# 
# 
# #SUMMARISE  or SUMMARIZE
# summarise(Sep21_df2,avgHeight = mean(height, na.rm=T), total = n())
# 
# summarize(Sep21_df2, tonnage = sum(mass, na.rm = T))
# 
# #GROUPING
# Sep21_grouped <- Sep21_df2 %>% 
#   group_by(species) %>% 
#   summarise(numMembers=n(), avgHeight = mean(height, na.rm=T),tonnage=sum(mass, na.rm = T))
# 
# 
# summarize(group_by(starwars,eye_color, species), tonnage = sum(mass, na.rm = T), numMembers=n())
