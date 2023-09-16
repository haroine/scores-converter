library(tidyverse)
library(stringr)
library(lubridate)

raw_rugby_data <- read_csv("rugby_1871_2020.csv")
raw_rugby_data$year <- as.numeric(str_sub(raw_rugby_data$Date,-4,-1))

splitted_teams <- str_split_fixed(raw_rugby_data$Match, pattern = " v ", n=2)

rugby_data <- cbind(raw_rugby_data %>% select(-c(Match)), splitted_teams) %>% 
  rename(home_team = `1`, away_team = `2`)

splitted_scores <- str_split_fixed(raw_rugby_data$Score, pattern = "-", n=2)

rugby_data <- cbind(rugby_data %>% select(-c(Score)), splitted_scores) %>% 
  rename(home_score = `1`, away_score = `2`) %>% 
  filter(is.na(`Neut.`) | `Neut.` != "Y")

rugby_df <- rugby_data %>% select(home_team, away_team, home_score, away_score, year) %>% 
  mutate(home_score = as.numeric(home_score)
         , away_score = as.numeric(away_score))
rugby_df <- rugby_df %>% 
  mutate(offense = pmax(home_score, away_score)
         , diff = (home_score - away_score)) %>% 
  mutate(home = home_score
         , away = away_score) %>% 
  select(home, away, year, diff, offense) %>% 
  filter(year >= 1995)


win <- rugby_df %>% 
  filter(home > away)

draw <- rugby_df %>% 
  filter(home == away)

loss <- rugby_df %>% 
  filter(home < away)

##### Add sport #####

available_sports <- c(available_sports, "rugby")
rugby <- list(win, draw, loss)
names(rugby) <- c("win","draw","loss")
list_sports_df[[5]] <- rugby
names(list_sports_df)[5] <- "rugby"

save(list_sports_df, available_sports, file="converter_data.Rdata")