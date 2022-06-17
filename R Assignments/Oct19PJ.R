# Name: Patricia Jennesha
# Date: October 19 2021
# Assignment - October 19 2021

install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyverse")

library(dplyr)
library(tidyverse)
library(ggplot2)

# 1. Read the data into a dataframe
df <- read.csv(file.choose())

# 2. Anonymize the data by removing the First_Name, Initial, and Last_Name columns
df <- select(df, -c(First_Name, Last_Name))

# 3. TLC wants to see how the customer's disposable income compares with the current mortgage payment. 
## a. Prepare a scatter plot for New_Pmt vs Disp_Inc.
## b. Add a trend line to the plot
## c. Add appropriate title, subtitle, and axes labels
## d. Show the customers IDs on the plot. Configure so that it is legible
## e. The IDs should be colored according to the customer's state
## f. Use a theme that is different form the default
ggplot(df, aes(New_Pmt, Disp_Inc)) +
  geom_point() +
  geom_smooth(method = lm) +
  labs(title = "Current Mortgage Payment vs Disposable Income", subtitle = "TLC Loan Dataframe", x = "New Payment", y = "Disposable Income") +
  geom_text(aes(label = Cust_ID, colour = State)) +
  theme_minimal()
  
# 4. What can you infer from the plot.
There is no correlation between their Disposable Income and their Morgage Payment

# 5. Add a new column called Default_Likelihood. The values in this new column will be HIGH for Pmt_Inc_Ratio >.6 
# and LOW otherwise

df <- mutate(df, Default_Likelihood = ifelse(Pmt_Inc_Ratio >.6, "HIGH", "LOW"))

# OR
#df$Default_Likelihood <- ifelse(ifelse(Pmt_Inc_Ratio >.6, "HIGH", "LOW"))

# 6. Prepare a visualization that will compare the number of loans for each Loan_Rep. The plot should also indicate 
# which are high risk for defaulting and which are low. The plot should have appropriate titles, labels, legend.
ggplot(df, aes(x=Loan_Rep, fill = Default_Likelihood)) +
  geom_bar() +
  labs(title = "Loan Reps vs Loan Count", x = "Loan Representative", y = "# Loan")
# 7. What can you infer from the plot.
Most of the loans handled are has a HIGH default of likelihood