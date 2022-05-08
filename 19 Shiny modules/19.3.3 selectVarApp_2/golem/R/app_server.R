#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session, filter = is.numeric) {
  # Your application server logic

  data <- mod_dataset_server("data")
  var <- mod_selectVar_server("var",
                         data,
                         filter = filter)
  output$out <- renderPrint(var())

}
