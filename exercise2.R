# EXERCISE OF APPLE DATASET
# Level : Very Easy (Beginner)
# Time  : 15 minutes
# Author: Bernardus Ari Kuncoro
# Topic : Data Visualization with R
# Subtopic: ggplot2, scatterplot

#---------
# Instruction: Please fill the '___' (gap)!

library('tidyverse')

# Read Dataset
df_apple <- read.csv("exercise.csv")

# Data Dictionary
# df_apple is a dummy dataset that contains the following data columns:
# apple_type: type of apples
# country : origin of apple
# reviewer : a person who reviewed the apple
# chrunchines: level of crunchiness subjectively reviewed by a reviewer (max 10)
# sweetness: level of sweetness subjectively reviewed by a reviewer (max 10)
# final_score: a score that represents the level of interest (max 10)

#1. What are the dimension of the dataset? (Hint: use dim() function)
___(df_apple)

#2. How can we describe the relationship between chrunchiness as x axis vs sweetness as y axis using ggplot() and scatterplot? (Hint: use geom_point)

ggplot(df_apple, aes(x=___, y=___)) + geom_point()

#3. Plot the relationship between crunchiness vs sweetness and plot apple_type with different color!

ggplot(df_apple, aes(x=___, y=___, ___=___)) + geom_point()

#4. Assign the number #2 as a variable called 'p' (use this sign: '<-' )

___ ___ ggplot(df_apple, aes(x=___, y=___)) + geom_point()

#5. Add statistic linear model line and assign as 'q'. Use method: linear model (lm).

___ <- p + stat_smooth(mapping = aes(x = ___, y = ___),method="__")

#6. Add title "Crunchiness vs Sweetness of Apple" and assign as variable r

r <- q + ggtitle("___")

#7. Rename x axis as "The Crunchiness of the Apple" and y axis as "The Sweetness of The Apple", assign as variable s.

s <- r + xlab("___") + ylab("___")

#8. Show s variable and share with your friends in your social media, give hashtag #DataMBA #DemoClass and tag @arikunc0r0 and @iykra_id for your work.

___
