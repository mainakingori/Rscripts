library(tidyverse)
library(dygraph)

#using mtcars to do ggplots
data("mtcars")
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ, y=hwy, color=class))

ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy ), color = "blue")
  )
#Facetting using facet_wrap which is for the descrete case only
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,color=class)) +
  facet_wrap(~ class, nrow = 2)
 

#using facet_grid for combination of the two categories
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy,color=class)) +
  facet_grid(drv ~ cyl)
