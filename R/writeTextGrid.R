#' Write data to a Praat TextGrid file
#'
#' Write data to a TextGrid file into R
#' @param tg TextGrid data, returned from readTextGrid() or createTextGrid() functions
#' @param file a character string of the filename to write to
#' @export
#' @examples
#' Write to the current working directory
#' writeTextGrid(tg_data, "my_tg.TextGrid")
#'
#' Write to specific file path
#' readTextGrid(tg_data, "path/to/textgrids/thisfile.TextGrid")

writeTextGrid <- function(tg, file) {

  ctx <- v8()
  ctx$source(system.file("js/JSONtoTextGrid.min.js",
                         package = "phonpack"))

  tg_str <- ctx$call("JSONtoTextGrid", tg)

  write_lines(tg_str, file)

}
