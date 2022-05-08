find_vars <- function(data, filter) {
  names(data)[vapply(data, filter, logical(1))]
}