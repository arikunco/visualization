#Title      : visualisasi.R
#Description: Data Visualization with R (ggplot2)
#Date       : 27 June 2019

# Load library
library(tidyverse)
library(corrgram)
library(corrplot)
##############

# Start with mpg dataset
?mpg

# Show the first ggplot graph
# Among the variables in mpg are:
#
# displ, a car’s engine size, in litres.
#
# hwy, a car’s fuel efficiency on the highway, in miles per gallon (mpg). A car with a low fuel efficiency consumes more fuel than a car with a high fuel efficiency when they travel the same distance.

# 1. creating a ggplot basic:

# TEMPLATE:
# ggplot(data = <DATA>) + 	<GEOM_FUNCTION>(
#   mapping = aes(<MAPPINGS>))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# Data, Aesthetic & Geom

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Exercise 1

# Run ggplot(data = mpg). What do you see?
ggplot(data=mpg)

# How many rows are in mpg? How many columns?
dim(mpg)

# What does the drv variable describe? Read the help for ?mpg to find out.
?mpg
# Make a scatterplot of hwy vs cyl.
ggplot(data=mpg) + geom_point(mapping = aes(x = hwy, y = cyl))

# What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data=mpg) + geom_point(mapping = aes(x = class, y = drv))

# Facets

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

# Statistics

ggplot(data = data_mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(.~ class, nrow=2) +
  stat_smooth(aes(x=displ, y=hwy), method = 'lm', se = F, col="red")

# Coordinates

ggplot(data = mpg) +
geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(.~ class, nrow = 1) +
  stat_smooth(aes(x=displ, y=hwy), method = 'lm', se = F, col="red") +
  scale_y_continuous("Displacement of Engines in litres") +
  scale_x_continuous("Highway miles per gallon") + coord_cartesian()

# Themes

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(.~ class, nrow = 1) +
  stat_smooth(aes(x=displ, y=hwy), method = 'lm', se = F, col="red") +
  scale_y_continuous("Displacement of Engines in litres") +
  scale_x_continuous("Highway miles per gallon")  + coord_cartesian() +
  theme(panel.background = element_blank())


#1 Scatter Plot

ggplot(diamonds) + geom_point(mapping = aes(x = carat, y = price)) + labs(title="ScatterPlot Carat vs Price")

#2. Histogram

ggplot(diamonds) + geom_histogram(mapping= aes(x=price), bins=30) + labs(title="Histogram")

#3. Bar chart

# vertical bar chart
ggplot(diamonds) + geom_bar(aes(x=cut),fill="blue") + labs(title="Cut Vertical Bar Chart")

# horizontal bar chart
ggplot(diamonds) + geom_bar(aes(x=cut)) + coord_flip() + labs(title="Cut Horizontal Bar Chart")

# Stacked Bar chart
ggplot(diamonds) + geom_bar(aes(x=cut, fill=color)) + labs(title="Stacked Bar Chart of Cut and Color")

diamonds <- diamonds

mpg <- mpg

#4 Boxplot
ggplot(diamonds) + geom_boxplot(aes(x=cut, y=price), fill="red") +
  labs(title = "Box Plot", x = "Cut Category")

ggplot(mpg) + geom_boxplot(aes(class, hwy), fill="red") +
  labs(title = "Box Plot", x = "Class Category")

#5 Area chart

ggplot(diamonds) + geom_line(aes(price), stat="bin", bins=30) + scale_x_continuous(breaks=seq(0,20000,10000)) + labs(title = "Area Chart", x="Diamond Price", y= "Count")

#6 Heatmap

mpg$transmission <- ifelse(grepl("auto", mpg$trans), "auto", "manual" )

ggplot(mpg, aes(transmission, class)) + geom_raster(aes(fill=cty)) + labs(title="Heat Map", x="transmission", y="class")

#7 Corrplot

numericVars <- which(sapply(diamonds, is.numeric)) #index vector numeric variables
numericVarNames <- names(numericVars) #saving names vector for use later on
cat('There are', length(numericVars), 'numeric variables')
diamond_numVar <- diamonds[, numericVars]
cor_numVar <- cor(diamond_numVar, use="pairwise.complete.obs") #correlations of all numeric variables

corrplot.mixed(cor_numVar, tl.col="black")

#sort on decreasing correlations with SalePrice
cor_sorted <- as.matrix(sort(cor_numVar[,'price'], decreasing = TRUE))

#select only high corelations
CorHigh <- names(which(apply(cor_sorted, 1, function(x) abs(x)>0.5)))
cor_numVar <- cor_numVar[CorHigh, CorHigh]

corrplot.mixed(cor_numVar, tl.col="black")


#cara lain dengan corrgram (package corrgram)
corrgram(diamonds, order=TRUE, panel=panel.shade, text.panel=panel.txt,
         main="Correlogram")
