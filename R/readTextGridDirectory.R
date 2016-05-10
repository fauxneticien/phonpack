readTextGridDirectory <- function(dir, sources = TRUE, ...) {
  file_list <- list.files(dir, pattern = ".TextGrid$", full.names = TRUE, ...)

  return_list <- list()

  for(i in 1:length(file_list)) {
    tg_name <- file_list[i]
    tg_data <- readTextGrid(tg_name)

    if(sources == TRUE) {
      tg_data$item <- cbind(source = tg_name,
                            tg_data$item,
                            stringsAsFactors = FALSE)
    }

    return_list[[tg_name]] <- tg_data
  }

  return_list

}
