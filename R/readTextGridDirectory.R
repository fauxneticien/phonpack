#' Read in data from all Praat TextGrid files within a directory
#'
#' The function finds all .TextGrid or .textgrid (case insensitive) files within a directory and returns a list of the TextGrid data
#' @param dir Optional. The directory to read in. Default is the current working directory.
#' @param sources boolean TRUE (default) or FALSE - whether to append a 'source' column to each TextGrid data with its filename
#' @export
#' @examples
#' readTextGridDirectory("/path/to/dir")
#'
#' # Read all TextGrid files in current working directory
#' readTextGridDirectory()

readTextGridDirectory <- function(dir = ".", sources = TRUE, ...) {
  file_list <- list.files(dir, pattern = "\\.[tT]ext[gG]rid$", full.names = TRUE, ...)

  if(identical(character(0), file_list)) {
    stop("No TextGrid files found in directory.")
  }

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
