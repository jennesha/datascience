# Working with dates
# r dates  yyyy-mm-dd
# Date objects Date, POSIXlt, POSIXct

install.packages("lubridate")
install.packages("tidyverse")
library(tidyverse)
library(lubridate)

thisDay <- Sys.Date() # System date
class(thisDay)
unclass(thisDay)

# CREATE DATE FROM CHARACTER
d1 <- "2020-09-10"
class(d1)
d1 <- as.Date(d1)

d2 <- "2020/09/10"
class(d2)
d2 <- as.Date(d2)
d2


# CREATE DATE FROM NUMBERS
dn1 = as.Date(30, origin = "2021-01-01")
dn1
class(dn1)
unclass(dn1)


# DATE ARITHMETIC
d2 <- d2 + 5 # adds days ( [-] will subtract)
d2

d2 - d1
difftime(d2, d1, units = "weeks") #

################################################################################
### FROM ASSIGNMENT ###

## EXERCISE ONE ##

#Convert it to R's date-time format.
d3 <- "09-10-2021"
d3 <- mdy(d3)
class(d3)

d4 <- "2021.9.10"
d4 <- ymd(d4)

d5 <- "Sep, 10th 2021"
d5 <- mdy(d5)

d6 <- "Thu Sep 30th 2021"
d6 <- mdy(d6)


d7 <- "any day could be Sep always the 10th of the year 2021"
d7 <- mdy(d7)

today() # current date - lubridate

yday(thisDay)
day(thisDay)
wday(thisDay, label = T, abbr=F)
month(thisDay, label = T, abbr=F)

## Write code for: 
# 220th day of 2020
thatDate <- as.Date(220, origin = "2020-01-01")
thatDate

# another way
# thatDate2 <- ymd("2020-01-01")
# day(thatDate2) <- 220 - 1
# thatDate2

# 42nd week of 2020
thatdate3 <- ymd("2020-01-01")
week(thatdate3) <- 42
thatdate3


# the time difference in weeks between x <- 20th June 2020, y <-  August 24th 2020
dt3 <- dmy("20th June 2020")
dt4 <- mdy("August 24th 2020")
difftime(dt4, dt3, units = "weeks")

# add 1 dayt to x
x <- "20th June 2020"
x <- dmy(x)
y <- x+1

# add 100 hours to x and find which date it is
x + hours(100)

# Get the date of 4 weeks prior to x
x - weeks(4)

# DATE AND TIME
x2 <- "20th September 2018 11.30.00"
x2 <- dmy_hms(x2)
x2
class(x2)
typeof(x2)
unclass(x2)

y2 <- now()
y2
x3 <-  dmy_hm("30, Sep, 2021 12:58", tz="America/New_York")
x3
now()-x3 # pls make sure time zone is appropriate


## EXERCISE TWO ##
# Read the csv file, replacing all blanks with NAs
emp_df <- read.csv(file.choose(), header = T, na.strings = "")
viw(emp_df)

# Make sure all datetimes are formatted as r expects 
#  (note that there are corresponding ymd_h, ymd_hm, 
#     ymd_hms etc for the ymd . functions)
str(emp_df)
emp_df$BirthDate <- mdy(emp_df$BirthDate)
emp_df$DateHired <- mdy(emp_df$DateHired)

emp_df$StartProject <- mdy_hm(emp_df$StartProject)
emp_df$LeaveProject <- mdy_hm(emp_df$LeaveProject)

# Replace missing dates in the LeaveProject column with the current date and time
emp_df [is.na(emp_df$LeaveProject), 'LeaveProject'] <- now()

# Calculate the values for the empty columns:
# Age (i.e. current age)
age <- (today() - emp_df$BirthDate)/365.25
age

# HiredDay (i.e. day of week)
HiredDay <- wday(emp_df$DateHired, T , F)
HiredDay
# Project_hours (i.e. Hours spent on Project)
emp_df$Project_Hours <- emp_df$LeaveProject - emp_df$StartProject
# to check timezone
tz(emp_df$LeaveProject)
tz(emp_df$StartProject)


# AgeHired (i.e. age when hired)
# YearsToRetirement (retiremt age is 65)
