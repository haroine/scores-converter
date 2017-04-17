load("converter_data.Rdata")
source("converter_functions.R")

## Parameters
scoreVec <- c(2,0)
sport_from <- "soccer"

get_equivalent_scores_all(scoreVec,sport_from)