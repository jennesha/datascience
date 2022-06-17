# Name: Patricia Jennesha
# Date: October 5, 2021
# File: Exam 1

# I, Patricia Jennesha, declare that no unathorized documents/person was used
# for help to complete this exercise. 

## 1. Install and load the packages you will need to complete the exercise i.e. at least dplyr, tidyr, stringr, lubridate
install.packages("dplyr")
install.packages("lubridate")
install.packages("tidyr")
install.packages("stringr")

library("dplyr")
library("lubridate")
library("tidyr")
library("stringr")

##2. Read the data from the comma-delimited file test1Movies.csv in your folder into an appropriately named dataframe. Missing 
# data should be coded as NA. Note that missing data is represented by blank cells
df <- read.csv(file.choose(), header = T, na.strings = "")




## 3. What are the names of the variables i.e. columns
colnames(df)
rownames(df)
dim(df)


## 4. What is the types of the variables
str(df)

##5. Examine the data, show a sample, the first or last 5 observations
head(df, 5)
tail(df, 5)

##6. Convert the following to numbers if necessary
# a. Budget
# b. Box_Office
class(df$Budget)
class(df$Box_Office)


df$Box_Office <- as.integer(df$Box_Office)


## 7. The variable Release_Date should be a date in R format. Change it if necessary.
df$Release_Date <-  mdy(df$Release_Date)
class(df$Release_Date)


## 8. Run basic stats to get an idea of the distribution of the data i.e. min, max, mean, median, quartiles, etc. and number of NAs for 
# the variables
summary(df)

##9. The Running_Time is currently type chr because it has the units attached e.g. 80 minutes. Write the code to create a column 
# called Movie_Length that will have just the number of minutes and will be an integer. The new Movie_Length column should
# replace Running_Time and must be integer type
df <- separate(df, Running_Time, into = c("Movie_Length"), sep = " ", remove = TRUE)
df$Movie_Length <- as.integer(df$Movie_Length)
class(df$Movie_Length)

##10. The Produced_By column has all names of the movie producers. Several movies have more than one producer. Split his into 
# three new columns: Producer_1, Producer_2, Producer_3 that will have the name of the first three producers. Note that some 
# movies may have fewer than 3. For those that have more than 3, just ignore the others. These 3 columns should replace the 
# Produced By column. Remove all extra spaces from the data in these columns
df <- separate(df, Produced_By, into = c("Producer_1", "Producer_2", "Producer_3"), sep = ", ", remove = TRUE)

##11: The Languages and Countries columns are not necessary for our analysis. Remove them. (Note these are different from the 
# Language and Country columns)
df_analysis <- select(df, !c(Languages, Countries))

# #12 Remove all the rows where the language is not known
df_analysis <- filter(df_analysis, Language != "")

# Analysis:
# #13. Show the Title, release date, and the producer name for movies where Jordan Kerner is a producer
df_analysis %>%
  filter(Producer_1 == "Jordan Kerner" | Producer_2 == "Jordan Kerner" | Producer_3 == "Jordan Kerner") %>%
  select(Title, Release_Date, Producer_1, Producer_2, Producer_3)

#  #14 Show the Title, Budget and Box Office values for the 5 most successful movies based on profit
df_analysis$Profit <- df$Box_Office - df$Budget
head(sort(df_analysis$Profit, decreasing = T), 5)

head(select(df_analysis, c("Profit", "Title", "Budget", "Box_Office"), sort(df_analysis$Profit, decreasing = T), 5))

# #15 Show the Average budget and box office by language
df_analysis %>%
  group_by(Language) %>%
  summarise(Avg_Budget = mean(Budget, na.rm = T), Avg_BoxOffice = mean(Box_Office, na.rm = T)) 
# #16. Determine how long ago (years) the oldest movie was released
oldest <- head(sort(df_analysis$Release_Date, decreasing = FALSE), 1)

years_ago <- as.integer((today()-oldest)/365.25)
years_ago
