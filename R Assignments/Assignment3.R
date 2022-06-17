#Name: Patricia Jennesha
#Date: September 14, 2021
#File: Assignment 3

### Exercise 1 

# Create a dataframe using csv file
df <- read.csv(file.choose(),header = T)

# Show structure
str(df)

# Make host name character and price numeric
df$name <- as.character(df$name)
df$price <- as.integer(df$price)

# View data. First 10 rows
#df[1:10,] another way
head(df,10)
# Show names of columns
colnames(df)

# Show names of all listings and the corresponding neighborhood
df[,c("name","neighbourhood")]

# Listing name, neighborhood-group, neighborhood and price of all listings in Manhattan
df[df$neighbourhood_group == 'Manhattan', c("name","neighbourhood_group","price")]

# Add a column named allYear that has the value true for those units that open over 300 days a year
df$allYear <- ( df$availability_365 > 300)


### Exercise 2
#A,B Create vectors: studentsID, studentsAges
studentsID <- seq(13000,14500,length.out = 20)

studentAges <- sample(17:25, size=20, T)

#C Print list
print(studentsID)
print(studentAges)

#D Ages not represented
setdiff(17:25, unique(studentAges))


### Functions
#remove(function) to remove function
#e. Write a function called newAges that accepts a vector v and a possible integer n (default is 1 if no integer passed). Return a vector the shows the values of v increased by n (or increased by 1 if no n is specified in the call)
newAges <- function(v,n=1){
  print(v+n)
}
#f. Write a function called studentsOverAge that will accept a vector v and an integer age. The function should return a vector that consists of the ages of students over n.
studentsOverAge <- function(v,n){
  v[v > n]
}
#g. Write a function called studentsBetween that will accept a vector v and 2 integers age1 and age2 The function should return a vector that consists of values between the 2 ages.
studentsBetween <- function(v,age1, age2){
  v[age1 < v & v < age2]
}
#h. Write a function called numberUnderAge that will accept a vector v and an integer age. The function should return the number of students under age. Test with studentAges and a desired age
numberUnderAge <- function(v, age){
  sum(v<age)
}
#i. Write a function called totalAges that accepts a vector v and returns the sum of all the ages
totalAges <- function(v){
  sum(v)
}
#j. Write a function called totalUnderAge that accepts a vector v and an age. The function should return the sum of all the values in the vector that are under the specified age.
totalUnderAge <- function(v, age){
  sum(v[v<age])
}
#k. Test all the functions using the studentAges vector and desired values for the age parameters

#l. Generate a vector called Gender that consists of random values F, M and add the vector to your dataframe
gender <- c('F','M')
Gender <- sample(gender, size=20, replace = TRUE)

#m. Use a for loop to print the ID and Gender of all the male students
stuIDGen <- cbind(studentsID, Gender)
i=1
for (i in nrow(stuIDGen)){
  print(stuIDGen[Gender == 'M',])
  i <- i+1
}
#n. Print the ID and gender of all the female students without using a loop
print(stuIDGen[Gender == 'F',])
