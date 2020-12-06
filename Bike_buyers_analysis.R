bike_buyers <- read.csv("bike_buyers.csv")

#data overview, get the structure, class and basic stats about the data
str(bike_buyers)
summary(bike_buyers2)
class(bike_buyers)

# convert to factors
bike_buyers$Education <- as.factor(bike_buyers$Education)
bike_buyers$Occupation <- as.factor(bike_buyers$Occupation)
bike_buyers$Home.Owner <- as.factor(bike_buyers$Home.Owner)
bike_buyers$Region <- as.factor(bike_buyers$Region)
bike_buyers$Purchased.Bike <- as.factor(bike_buyers$Purchased.Bike)
bike_buyers$Commute.Distance <- as.factor(bike_buyers$Commute.Distance)

# the ID column seems irrelevant at this point for our data analysis
library(dplyr)
bike_buyers2 <- select(bike_buyers, -ï..ID)
summary(bike_buyers2)

ggplot(data = bike_buyers2, aes(x = Income, fill = Purchased.Bike)) +
  geom_histogram(binwidth = 10000)

boxplot(bike_buyers2$Income)
hist(bike_buyers2$Income)
plot(density(bike_buyers2$Income), main = "Income Density")

# let's check  education
summary(bike_buyers2$Education)

ggplot(data = bike_buyers2, aes(x = Education, fill = Purchased.Bike))+
  geom_bar()

prop.table(table(x = bike_buyers2$Education))

# let's check marital status
summary(bike_buyers2$Marital.Status)
plot(bike_buyers2$Marital.Status)
pie(table(bike_buyers2$Marital.Status), main = "Married vs single buyers")

# Let's check children 
summary(bike_buyers2$Children)
plot(bike_buyers2$Children)

bike_children <- as.factor(bike_buyers2$Children)
plot(bike_children, main = "Children Count", xlab = "No. of Children in family", ylab = "No. of families")

library(dplyr)
bought <- filter(bike_buyers2, Purchased.Bike == "Yes")
bought$Children <- as.factor(bought$Children)
plot(bought$Children)

#what is the most common commute distance

plot(bike_buyers2$Commute.Distance)
commute <- filter(bike_buyers2, Commute.Distance == "0-1 Miles")
plot(commute$Purchased.Bike)
