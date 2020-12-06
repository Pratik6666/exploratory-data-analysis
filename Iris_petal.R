data("iris")
View(iris)

install.packages("skimr")
library(skimr)

# first 4 and last 4 using head and tail
head(iris, 4)
tail(iris, 4)

#Summary statistics
summary(iris$Sepal.Length)
summary(iris)

#let's check if there are any missing values in the iris dataset
summary(is.na(iris$Sepal.Length))

# we can use the skim package
skim(iris)
ggplot(data = iris, aes(x = Sepal.Width, fill = Species))+
  geom_histogram(binwidth = 0.1, alpha = 0.5)

iris%>%
  dplyr::group_by(Species)%>%
  skim()

#####################################################################
