getTierIntervals <- function(interval_tier, discard_empty = TRUE) {
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
