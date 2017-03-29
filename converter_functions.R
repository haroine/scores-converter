
## Get quantiles equivalent of score btw two dataframes
## @param score_home
## @param score_away
## @param sport_from_df dataframe for the input sport
## @param sport_to_df datafram for the output sport
get_equivalent_scores_df <- function(score_home,score_away,sport_from_df,sport_to_df) {
  
  diff_from <- score_home - score_away
  
  if(diff_from != 0) {
    quantile_from <- sum(as.numeric(sport_from_df$diff <= diff_from), na.rm=T) / nrow(sport_from_df)
    diff_to <- quantile(sport_to_df$diff, quantile_from, na.rm=T)[[1]]
  } else {
    diff_to <- 0
  }
  
  offense_from <- pmax(score_home,score_away)
  offense_quantile_from <- sum(as.numeric(sport_from_df$offense <= offense_from), na.rm=T) / nrow(sport_from_df)
  offense_to <- quantile(sport_to_df$offense, offense_quantile_from, na.rm=T)[[1]]
  
  if(!is.integer(offense_to)) {
    offense_to <- round(offense_to,0)
  }
  
  if(!is.integer(diff_to)) {
    diff_to <- round(diff_to,0)
  }
  
  if(diff_from > 0) {
    equivalent_score <- c(offense_to,pmax(offense_to - diff_to,0))
  }
  
  if(diff_from < 0) {
    equivalent_score <- c(pmax(offense_to + diff_to,0),offense_to) ## diff_to is negative
  }
  
  if(diff_from == 0) {
    offense_to <- pmax(offense_to,0)
    equivalent_score <- c(offense_to,offense_to)
  }
  
  return(equivalent_score)
}

## Get equivalent score with strings as parameters
get_equivalent_scores <- function(scoreVec, sportFrom, sportTo) {
  
  diff_from <- scoreVec[1] - scoreVec[2]
  
  if(diff_from == 0) {
    diff_str <- "draw"
  }
  
  if(diff_from < 0) {
    diff_str <- "loss"
  }
  
  if(diff_from > 0) {
    diff_str <- "win"
  }
  
  sport_from_df <- list_sports_df[[sportFrom]][[diff_str]]
  sport_to_df <- list_sports_df[[sportTo]][[diff_str]]
  
  return(get_equivalent_scores_df(scoreVec[1],scoreVec[2],sport_from_df,sport_to_df))
}

## Get equivalent scores for all sports available
get_equivalent_scores_all <- function(scoreVec,sportFrom) {
  
  sports_to <- available_sports[available_sports != sportFrom]
  returnList <- vector("list",length(sports_to))
  names(returnList) <- sports_to
  
  for(i in 1:length(sports_to)) {
    sportTo <- sports_to[i]
    returnList[[i]] <- get_equivalent_scores(scoreVec,sportFrom,sportTo)
  }
  
  return(returnList)
}
