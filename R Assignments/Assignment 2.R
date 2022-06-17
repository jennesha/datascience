#Name: Patricia Jennesha
#Date: September 9,2021
#File: Assignment 2 

#1. Create a matrix called New_York to store the data. Assign appropriate names to the rows and columns
New_York <- c(10,8,5,12,17,3,6,5,3,2,100,189,127,130,22)
dim(New_York) <- c(5, 3)
rownames(New_York) <- c("NY1", "NY2", "NY3", "NY4", "NY5")
colnames(New_York) <- c("Age", "Employees", "2018 profit")

#2. Display the 2018 profit for store NY4
New_York[4,3]

#3. Display all the profits
New_York[,"2018 profit", drop=FALSE]
#New_York[,3]

#4. Display the shop, employees and 2018 profit only
New_York[,c("Employees", "2018 profit"), drop=FALSE]

#5. Find the largest profit
max(New_York[,3])

#6. Create a matrix called Jersey to store the NJ data. Assign appropriate names to the rows and columns
Jersey.data <- c("NJ1","NJ2","NJ3",11,9,5,1,6,5,14,92,38) 
Jersey <- matrix(Jersey.data, nrow = 3, ncol = 4, byrow = FALSE)
colnames(Jersey) <- c("Store","Age","Employee","2018 profit")


# 7. Create a vector called New_Profit to store these values
New_Profit <- c(100,200,137,128,25,15,93,40,81,144)

# 8. Combine all the data into a single matrix called Store_Profit. Do not include the CT data
Store_Profit <- c(Jersey[,4],New_York[,3],New_Profit[0:8])
dim(Store_Profit) <- c(8,2)
colnames(Store_Profit) <- c("2018 profit", "2019 profit")
rownames(Store_Profit) <- c("NJ1", "NJ2", "NJ3", "NY1", "NY2", "NY3", "NY4", "NY5")

# 9. Find the min, max, median, mean of the 2018 profit, repeat for 2019
summary(as.integer(Store_Profit[,1]))
summary(as.integer(Store_Profit[,2]))


# 10. Multiply the 2018 profit by a thousand, repeat for 2019
as.integer(Store_Profit)* 1000


# 11. Can you find which store has the largest profit? (hint you might use which())
which(Store_Profit == max(as.integer(Store_Profit)),arr.ind=T)

# 12. Create a barplot with appropriate labels, color, titles etc. for the 2018 profit and another for the 2019 profit
barplot(as.integer(Store_Profit[,1]), main= "2018 Store Profit",  xlab = "Stores", ylab = "Profit", names.arg = row.names(Store_Profit), col = Store_Profit[,1])

barplot(as.integer(Store_Profit[,2]), main= "2019 Store Profit",  xlab = "Stores", ylab = "Profit", names.arg = row.names(Store_Profit), col = Store_Profit[,1])
