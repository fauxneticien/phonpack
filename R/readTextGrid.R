#' Read in data from a Praat TextGrid file
#'
#' Read data from a TextGrid file into R
#' @param file a character string of the filename to read
#' @param format optional. A character string "R" (default) or "JSON" of the data format to be returned.
#' @export
#' @examples
#' readTextGrid("my_tg.TextGrid")
#' readTextGrid("path/to/textgrids/thisfile.TextGrid")

readTextGrid <- function(file, format = "R") {

  ctx <- v8()
  ctx$source(system.file("js/TextGridtoJSON.min.js",
                         package = "phonpack"))

  f_enc <- guess_encoding(file)

  if(f_enc[1, "confidence"] != 1.00) {
    warning(paste0("Not certain about encoding for file ", file))
  }

  f_conn <- tryCatch(file(file, encoding = as.character(f_enc[1, "encoding"])))
  on.exit(close(f_conn))

  tg_lines <- tryCatch(readLines(f_conn),
                       error = function(e) { stop(paste0("Error! Can't read ", file, ". File encoding issues?")) },
                       warning = function(w) { stop(paste0("Error! Can't read ", file, ". File encoding issues?")) })

  tg <- paste0(tg_lines, collapse = "\n")

  data <- ctx$call("TextGridtoJSON", tg)

  if(format == "R") {
    data
  } else if (format == "JSON") {
    toJSON(data)
  } else {
    error(paste0("Unknown return format: ", format))
  }

}
