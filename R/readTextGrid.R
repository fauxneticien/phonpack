readTextGrid <- function(file, format = "R") {

  ctx <- v8()
  ctx$source(system.file("js/TextGridtoJSON.min.js",
                         package = "phonpack"))

  tg_lines <- tryCatch(readLines(file),
                       error = function(e) { stop(paste0("Error! Can't read ", file, ". Is the encoding UTF-8?")) },
                       warning = function(w) { stop(paste0("Error! Can't read ", file, ". Is the encoding UTF-8?")) })

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
