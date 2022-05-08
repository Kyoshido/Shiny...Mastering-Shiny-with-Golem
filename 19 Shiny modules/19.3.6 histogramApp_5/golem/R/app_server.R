#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  data <- mod_dataset_server("data")

  x <- mod_selectVar_server("var", data)

  mod_histogram_server("hist", x$value, x$name)

}
