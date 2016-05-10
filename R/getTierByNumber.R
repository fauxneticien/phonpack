getTierByNumber <- function(tg, tier_number) {

    if(!tier_number %in% 1:nrow(tg$item)) {
      stop(paste0("Error: tier number", tier_number, " not found in TextGrid."))
    } else {
      tg$item[tier_number, ]
    }

}
