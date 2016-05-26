#' Retrieve all Intervals from an Interval Tier
#'
#' This function returns a data frame of the Intervals from an Interval Tier.
#' @param interval_tier an IntervalTier returned from getTierByName() or getTierByNumber()
#' @param discard_empty boolean FALSE (default) or TRUE. Indicates whether intervals with no text in them should be discarded in selection.
#' @export
#' @examples
#' # Get intervals from "word" tier from data in mytg.TextGrid
#' tg_data <- readTextGrid("mytg.TextGrid")
#' word_tier <- getTierByName(tg_data, "word")
#' word_intervals <- getTierIntervals(word_tier)
#'
#' # You may also chain with %>% from dplyr
#' readTextGrid("mytg.TextGrid") %>%
#'    getTierByName("word") %>%
#'    getTierIntervals()

getTierIntervals <- function(interval_tier, discard_empty = FALSE) {
  if(interval_tier$class != "IntervalTier") {
    stop("Tier is not an interval tier!")
  }

  return_df <- interval_tier$intervals[[1]]

  if(!is.null(interval_tier$source)) {
    return_df <- cbind(source = interval_tier$source,
                       return_df,
                       stringsAsFactors = FALSE)
  }

  if(discard_empty == TRUE) {
    return_df <- filter(return_df, nchar(text) > 0)
  }

  return_df
}
