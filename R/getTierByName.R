#' Select TextGrid Tier by its name
#'
#' This function takes a TextGrid and a name (character string), and returns the specified tier from that TextGrid
#' @param tg TextGrid data, returned from readTextGrid() function
#' @param tier_name character string. The name of the tier to retrive from TextGrid \code{tg}
#' @export
#' @examples
#' # Get word tier from data in mytg.TextGrid
#' tg_data <- readTextGrid("mytg.TextGrid")
#' getTierByName(tg_data, "word")
#'
#' # You may also chain with %>% from dplyr
#' readTextGrid("mytg.TextGrid") %>%
#'    getTierByName("word")
#'


getTierByName <- function(tg, tier_name) {

  if(!tier_name %in% tg$item$name) {
    stop(paste0("Error: tier \"", tier_name, "\" not found in TextGrid."))
  } else {
    tg$item[which(tg$item$name == tier_name), ]
  }

}
