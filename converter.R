load("converter_data.Rdata")
source("converter_functions.R")

## Parameters
scoreVec <- c(20,17)
sport_from <- "football"

get_equivalent_scores_all(scoreVec,sport_from)