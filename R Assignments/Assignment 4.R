#Name: Patricia Jennesha
#Date: September 21, 2021
#File: PJSep21.R

# Read file
df <- read.csv(file.choose(),header = T)

# 1. Show all variables (i.e. columns) for Southwest Airlines (WN) flights.
filter(df, CARRIER == 'WN')
# 2. Show Flight Date, Carrier, Origin City, Destination City for all observations (i.e. rows)
select(df, FL_DATE, CARRIER, ORIGIN_CITY, DEST_CITY)
# 3. Show Flight Date, Origin, Destination, Airline, Cancelled, Cancellation Code of all cancelled flights
select(filter(df, CANCELLED != 0), FL_DATE, ORIGIN, DEST, CARRIER, CANCELLED, CANCELLATION_CODE)
# 4. Show Flight Date, Carrier, Origin, Destination, Origin State, Destination State, Scheduled Departure time, Scheduled Arrival Time for flights between New York airports
df %>%
  filter(ORIGIN_STATE == ' NY' & DEST_STATE == ' NY') %>%
  select(FL_DATE, CARRIER, ORIGIN, DEST, ORIGIN_STATE, DEST_STATE, DEP_TIME, ARR_TIME)
# 5. Show Flight Date, Carrier, Day Name, Origin, Destination for Delta (DL) flights going to Miami on Friday
df %>%
  filter(CARRIER == 'DL' & DEST_CITY == 'Miami' & DAY_NAME == "Friday") %>%
  select(FL_DATE, CARRIER, DAY_NAME, ORIGIN, DEST)
# 6. Show Flight Date, Carrier, Origin, Destination, Destination City, and Scheduled Departure Time of flights between JFK or LGA and Florida
df %>%
  filter((ORIGIN == 'JFK' | ORIGIN == 'LGA')&(DEST_STATE == ' FL' )) %>%
  select(FL_DATE, CARRIER, ORIGIN, DEST, DEST_CITY, DEP_TIME, ORIGIN_STATE, DEST_STATE)
# 7. Show Flight Date, Carrier, Origin, Destination, and Distance for all flights with a distance more than 2200. Show the results in order from nearest to farthest
df %>%
  filter(DISTANCE > 2200) %>%
  select(FL_DATE, CARRIER, ORIGIN, DEST, DISTANCE) %>%
  arrange(DISTANCE)
# 8. Create a dataframe called longFlights. The new dataframe must have flight date, carrier, origin, destination, taxi out, taxi in, air time, and add a variable (column) called Flight_Time. Flight time is calculated as Taxi_Out + Taxi_in + Air_Time. Only those observations (rows) that had a flight time of 6 hours or more must be included.
longFlights <- df %>%
  filter(AIR_TIME > 360 ) %>%
  select(FL_DATE, CARRIER, ORIGIN, DEST, TAXI_OUT, TAXI_IN, AIR_TIME) %>%
  mutate(TOTAL_TIME = TAXI_OUT+TAXI_IN+AIR_TIME, .after = AIR_TIME)

# 9. Show the average departure delay for each carrier for flights from JFK (do not include cancelled flights). Hint: group_by and summarise
df %>%
  filter(CANCELLED != 1 & ORIGIN == "JFK") %>%
  group_by(ORIGIN) %>%
  summarise(Avg_DEPDELAY = mean(DEP_DELAY)) 
  
# 10. How many flights leave New York each day of the week (i.e. Sunday, Monday, Tuesday, .). Order by most to least busy day. Hint: count with sort option
df %>%
  group_by(DAY_NAME) %>%
  count(DAY_NAME, sort = TRUE)


####  IN CLASS MATERIAL ####
# my_df1 <-  data.frame(HairEyeColor) # Create a dataframe for data set
# 
# # Examine the Data
# View(my_df1)
# str(my_df1)
# dim(my_df1)
# nrow(my_df1)
# colnames(my_df1)
# structure(my_df1) # what does this do??
# mean(my_df1$Freq)
# 
# # SELECTING COLUMNS (only available with dplyr package)
# select(my_df1, Eye, Freq)
# select(my_df1, !c(Hair, Sex))
# 
# 
# # EXTRACT ROWS
# filter(my_df1, Sex == 'Male' & Eye =='Hazel')
# 
# # NESTING
# select(filter(my_df1,Sex == "Male" & Freq >30 | Sex == "Female" & Freq > 20), !c(Eye, Hair))
# 
# # PIPELINING (%>% = then)
# my_df1 %>%
#   filter(Sex == "Male" & Freq >30 | Sex == "Female" & Freq > 20) %>%
#   select(Sex, Freq) %>%
#   arrange(desc(Freq))
# 
# # SORTING with dplyr - ARRANGE
# arrange(my_df1, Eye)
# 
# # MODIFYING COLUMS with dyplr - MUTATE
# mutate(my_df1, newCol = Freq = 5)
# mutate(my_df1, newCol = Freq/3, after=Eye)
# 
# # Change a column
# my_df1 <- mutate(my_df1, newCol = Freq+3, after=Eye)
# 
# # Delete a column
# my_df1 <- mutate(my_df1, newCol = NULL)
# 
# # SUMMARIZING
# summarize(my_df1, avgFreq= mean(Freq), numSubjects=n())
