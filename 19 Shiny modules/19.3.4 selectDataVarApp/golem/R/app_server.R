#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session, filter = is.numeric) {
  # Your application server logic

  var <- mod_selectDataVar_server("var", filter)
  output$out <- renderPrint(var(), width = 40)

}
