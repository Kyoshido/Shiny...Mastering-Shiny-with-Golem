find_vars <- function(data, filter) {
  
  stopifnot(is.data.frame(data))
  stopifnot(is.function(filter))
  
  names(data)[vapply(data, filter, logical(1))]
}