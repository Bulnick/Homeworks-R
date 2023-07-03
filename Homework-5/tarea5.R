
library(tidyverse)
library(dplyr)
library(ggplot2)

questions <- read.csv('C:\\Users\\ldeleond\\Desktop\\R\\Tarea 5\\questions.csv')
answers <- read.csv('C:\\Users\\ldeleond\\Desktop\\R\\Tarea 5\\answers.csv')
question_tags <- read.csv('C:\\Users\\ldeleond\\Desktop\\R\\Tarea 5\\question_tags.csv')
tags <- read.csv('C:\\Users\\ldeleond\\Desktop\\R\\Tarea 5\\tags.csv')

#1
questions %>%
  left_join(question_tags, by=c("id" = "question_id"))

questions %>%
  left_join(question_tags, by=c("id" = "question_id")) %>%
  left_join(tags, by="id")

questions %>%
  left_join(question_tags, by=c("id" = "question_id")) %>%
  left_join(tags, by="id") %>%
  replace_na(list(tag_name = "only-r"))

questions_with_tags <- questions %>%
  left_join(question_tags, by=c("id" = "question_id")) %>%
  left_join(tags, by="id") %>%
  replace_na(list(tag_name = "only-r"))

#2
questions_with_tags %>%
  group_by(tag_name)

questions_with_tags %>%
  group_by(tag_name) %>%
  summarize(mean_score = mean(score))

questions_with_tags %>%
  group_by(tag_name) %>%
  summarize(mean_score = mean(score)) %>%
  arrange(desc(mean_score))

#3
questions %>%
  inner_join(answers, by=c("id" = "question_id"), suffix = c("_question","_answer"))

questions %>%
  inner_join(answers, by=c("id" = "question_id"), suffix = c("_question","_answer")) %>%
  mutate(gap = difftime(creation_date_answer,creation_date_question, units = "days"))

#4
answer_counts <- answers %>%
  count(question_id) %>%
  arrange(desc(n))

questions %>%
  left_join(answer_counts, by=c("id" = "question_id"))

questions %>%
  left_join(answer_counts, by=c("id" = "question_id")) %>%
  replace_na(list(n = 0))

question_answer_counts <- questions %>%
  left_join(answer_counts, by=c("id" = "question_id")) %>%
  replace_na(list(n = 0))

#5
question_tags %>%
  inner_join(question_answer_counts,by=c("question_id" = "id"))

question_tags %>%
  inner_join(question_answer_counts,by=c("question_id" = "id")) %>%
  inner_join(tags,by=c("tag_id" = "id")) %>%
  #arrange(desc(n))
  

