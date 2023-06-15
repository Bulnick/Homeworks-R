

library(gapminder)
library(dplyr)

file <- "C:\\Users\\luisr\\OneDrive\\Documents\\Telecom\\Scripting\\Tareas\\Tarea3\\primary_results.csv"
dataset_results <- read.csv(file)
dataset_results

#1
dataset_results %>%
  filter(state == "Florida")

#2.1
dataset_results %>%
  filter((candidate == "Hillary Clinton")|(candidate == "Donald Trump"))

#2.2
dataset_results %>%
  filter((party == "Democrat")&(county == "Shelby"))

#2.3
dataset_results %>%
  filter((state == "Alabama")&(votes > 15000))

#3
dataset_results %>%
  filter((state == "Texas")&(county == "Denton")) %>%
  select('party','candidate','votes') %>%
  arrange(desc(votes))

#4
dataset_results %>%
  filter((state == "Alaska")&(party == "Republican")&(candidate == "Ted Cruz")) %>%
  mutate( vote_count = votes/fraction_votes) %>%
  arrange(desc(vote_count))
  