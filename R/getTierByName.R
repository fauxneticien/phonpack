getTierByName <- function(tg, tier_name) {

  if(!tier_name %in% tg$item$name) {
    stop(paste0("Error: tier \"", tier_name, "\" not found in TextGrid."))
  } else {
    tg$item[which(tg$item$name == tier_name), ]
  }

}
