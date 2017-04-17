print("Loading data...")

load("converter_data.Rdata")
source("converter_functions.R")

print("Data loaded.")

capitalize <- function(x) {
  paste0(toupper(substr(x, 1, 1)), tolower(substring(x, 2)))
}

display_sports <- capitalize(available_sports)

named_available_sports <- available_sports
names(named_available_sports) <- display_sports

sizeSportImage <- 75

renderSportImage <- function(sport) {
  list(src = paste0(sport,".png"),
       contentType = 'image/png',
       width = sizeSportImage,
       height = sizeSportImage,
       alt = "Sport image")
}
