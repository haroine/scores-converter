library(tidyverse)
library(stringr)
library(lubridate)

df_soccer <- cbind("soccer", rbind(list_sports_df[["soccer"]][["win"]]
                 , list_sports_df[["soccer"]][["draw"]], list_sports_df[["soccer"]][["loss"]]))
df_basketball <- cbind("basketball", rbind(list_sports_df[["basketball"]][["win"]]
                     , list_sports_df[["basketball"]][["draw"]], list_sports_df[["basketball"]][["loss"]]))
df_hockey <- cbind("hockey", rbind(list_sports_df[["hockey"]][["win"]]
                 , list_sports_df[["hockey"]][["draw"]], list_sports_df[["hockey"]][["loss"]]))
df_football <- cbind("football", rbind(list_sports_df[["football"]][["win"]]
                         , list_sports_df[["football"]][["draw"]], list_sports_df[["football"]][["loss"]]))
df_rugby <- cbind("rugby", rbind(list_sports_df[["rugby"]][["win"]]
                       , list_sports_df[["rugby"]][["draw"]], list_sports_df[["rugby"]][["loss"]]))
names(df_soccer)[1] <- "sport"
names(df_basketball)[1] <- "sport"
names(df_hockey)[1] <- "sport"
names(df_football)[1] <- "sport"
names(df_rugby)[1] <- "sport"


df_soccer$year <- NULL
df_basketball$date <- NULL
df_hockey$date <- NULL
df_football$date <- NULL
df_rugby$year <- NULL


df_forplot <- rbind(df_soccer, df_basketball, df_hockey, df_football, df_rugby)
# saveRDS(df_forplot, file = "df_forplot.rds")

## Stats

