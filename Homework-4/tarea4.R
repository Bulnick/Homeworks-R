

library(gapminder)
library(dplyr)
library(ggplot2)
library(tidyverse)

file <- "C:\\Users\\luisr\\OneDrive\\Documents\\Telecom\\Scripting\\Tareas\\Tarea4\\diamonds.csv"
diamonds <- read.csv(file)
str(diamonds)

#1
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()

ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()

#2
ggplot(diamonds, aes(x=price)) + 
  geom_histogram(bins = 40)

ggplot(diamonds, aes(x=price)) + 
  geom_histogram(bins = 40) +
  scale_x_log10()

#3
ggplot(diamonds, aes(x=cut, y=price)) + 
  geom_boxplot() +
  scale_y_log10()

ggplot(diamonds, aes(x=cut, y=price)) + 
  geom_boxplot(fill="gray") +
  scale_y_log10()

#4
filtered_price <- diamonds %>%
  filter(price > 1000) %>%
  filter(cut%in%c("Good","Ideal","Premium"))

ggplot(filtered_price, aes(x=cut, y=depth)) + 
  geom_bar(stat = "Identity")

ggplot(filtered_price, aes(x=cut, y=depth)) + 
  geom_bar(stat = "Identity") +
  facet_wrap(~clarity)

ggplot(filtered_price, aes(x=cut, y=depth)) + 
  geom_bar(stat = "Identity", fill="green") +
  facet_wrap(~clarity)

#5
median_dimension_diamond <- diamonds %>%
  group_by(cut) %>%
  summarize(mediaX = mean(x),mediaY = mean(y),mediaZ = mean(z))

median_dimension_diamond

cut_premium <- diamonds %>%
  filter(cut == "Premium") %>%
  group_by(clarity) %>%
  summarize(minPrice = min(price),maxPrice = max(price))

cut_premium

ggplot(cut_premium, aes(x=clarity, y=maxPrice)) + 
  geom_bar(stat = "Identity", fill="blue")


