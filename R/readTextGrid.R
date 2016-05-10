readTextGrid <- function(file, format = "R") {

  ctx <- v8()
  ctx$source(system.file("js/TextGridtoJSON.min.js",
                         package = "phonpack"))

  tg <- paste0(readLines(file), collapse = "\n")

  data <- ctx$call("TextGridtoJSON", tg)

  if(format == "R") {
    data
  } else if (format == "JSON") {
    toJSON(data)
  } else {
    error(paste0("Unknown return format: ", format))
  }

}
