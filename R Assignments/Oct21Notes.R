#Name: Patricia Jennesha
#Date: October 21, 2021
# This is currently my best attempt

# 1. Install and load the titanic package and store the titanic_train dataset as a dataframe in a new
# object
install.packages("titanic")
install.packages("tidyverse")
install.packages("ggplot2")

library(titanic)
library(tidyverse)
library(ggplot2)

df_titanic <- as.data.frame(titanic_train)
str(df_titanic)
# 2. Prepare the data for visualization:
# a. Remove all observations where the Survived variable is not known

df_titanic <- df_titanic[!(df_titanic$Survived == ""),]

# b. Assign the mean age to all ages that are unknown
mean_age <- mean(df_titanic$Age, na.rm = T)
mean_age

df_titanic$Age <- replace_na(df_titanic$Age, mean_age)

# c. Assign the median fare to all unknown fares
median_fare <- median(df_titanic$Fare, na.rm = T)
median_fare

df_titanic$Fare <- replace_na(df_titanic$Fare, median_fare)

# d. Assign S to all Embarked values that are unknown
df_titanic$Embarked[df_titanic$Embarked == ""] <- "S"

# e. Make sure that the Pclass (i.e. Passenger class), and Survived variables are factors.
df_titanic$Pclass <- as.factor(df_titanic$Pclass)
df_titanic$Survived <- as.factor(df_titanic$Survived)

# 3. Create another dataframe called survivors_df that has data for the survivors only
 survivors_df <- df_titanic[!(df_titanic$Survived == 0),]

# 4. Create plots for the following
# a. Show how the number of males and females on the ship compare by age (overlapping histogram with 10 age bins)
 ggplot(df_titanic, aes(x=Age, fill = Sex)) +
   geom_histogram(position = "dodge", bins = 10)
 
# b. Show number of survivors by class
 ggplot(survivors_df, aes(x=Pclass, fill=Pclass)) +
   geom_bar(position = "dodge")
 
# c. Prepare a plot that compares the number of passengers and survivors/non-survivors
# from each class. Use a bar with one column of survivors and the other of non-survivors
ggplot(df_titanic, aes(x=Pclass, fill=Survived)) +
   geom_bar(position = "dodge") +
   scale_fill_discrete(labels = c("Non-survivors", "Survivors"))

# d. Show how the number of male survivors compares with that of females survivors by
# age. (bar plot)
ggplot(survivors_df, aes(Age, fill = Sex)) +
   geom_bar(position = "dodge")

# e. Is survival rate influenced by the port of embarkation?
# Use a bar chart with Embarked on X axis. plot the bars side by side
 ggplot(df_titanic, aes(x=Embarked, fill = Survived)) +
    geom_bar(position = "dodge") +
    scale_fill_discrete(labels = c("Non-survivors", "Survivors"))

# f. Is there any relationship between Fare and Age? Use points and smooth
## No?
 ggplot(df_titanic, aes(x = Age, y = Fare)) +
   geom_point() + 
   geom_smooth(method = lm) 

 # g. Is survival related to this relationship between Age and Fare?
 ggplot(df_titanic, aes(x = Age, y = Fare, fill = Survived)) +
    geom_point() + 
    geom_smooth(method = lm) +
    labs(title = "Age vs Fare")
 
# h. Is there any correlation between Age and Survived and Gender?
  ggplot(df_titanic, aes(x = Survived, y = Age, colour = Sex)) +
    geom_point()
  
# i. Create a density plot that compares survival by age.
  ggplot(df_titanic, aes(x = Age, fill = Survived)) +
     geom_density(alpha = 0.5)
  