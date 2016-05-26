#' Create a new TextGrid object
#'
#' Create a new TextGrid in R
#' @param xmin numeric, minimum time value
#' @param xmax numberic, maximum time value
#' @param tier_names character vector of tier names
#' @param point_tiers subset character vector of tier names that are to be point tiers, or NA if none
#' @export
#' @examples
#' # Create the default Praat TextGrid
#' createTextGrid(0, 1, c("Mary", "John", "bell"), "bell")
#'

createTextGrid <- function(xmin, xmax, tier_names, point_tiers) {

  lapply(tier_names, function(tg_name) {
    ret_list <- list(class = ifelse(tg_name %in% point_tiers, "TextTier", "IntervalTier"),
                     name = tg_name,
                     xmin = xmin,
                     xmax = xmax
    )

    if(tg_name %in% point_tiers) {
      ret_list$points = list()
    } else {
      ret_list$intervals = list(list(xmin = xmin,
                                     xmax = xmax,
                                     text = ""))
    }

    ret_list
  }) -> new_list

  list(item = new_list)
}
