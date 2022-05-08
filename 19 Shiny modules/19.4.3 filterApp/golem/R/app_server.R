#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  df <- mod_dataset_server("data")
  filter <- mod_filter_server("filter", df)

  output$table <- renderTable(df()[filter(), , drop = FALSE])
  output$n <- renderText(paste0(sum(filter()), " rows"))

}
