#' Select TextGrid Tier by its number
#'
#' This function takes a TextGrid and a number, and returns the specified tier from that TextGrid
#' @param tg TextGrid data, returned from readTextGrid() function
#' @param tier_number integer. A number of the tier to retrive from TextGrid \code{tg}
#' @export
#' @examples
#' # Get tier number 1 from data in mytg.TextGrid
#' tg_data <- readTextGrid("mytg.TextGrid")
#' getTierByNumber(tg_data, 1)
#'
#' # You may also chain with %>% from dplyr
#' readTextGrid("mytg.TextGrid") %>%
#'    getTierByNumber(1)

getTierByNumber <- function(tg, tier_number) {

    if(!tier_number %in% 1:nrow(tg$item)) {
      stop(paste0("Error: tier number", tier_number, " not found in TextGrid."))
    } else {
      tg$item[tier_number, ]
    }

}
