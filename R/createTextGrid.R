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

    blank_tg <- list(item = new_list)

    # Validate the structure, make sure you can pass it back and forth
    # If it fails here, everything is useless
    ctx <- v8()
    ctx$source(system.file("js/JSONtoTextGrid.min.js",
                           package = "phonpack"))

    ctx$source(system.file("js/TextGridtoJSON.min.js",
                           package = "phonpack"))

    tg_str <- ctx$call("JSONtoTextGrid", blank_tg)
    tg_str <- ctx$call("TextGridtoJSON", tg_str)

    tg_str

}