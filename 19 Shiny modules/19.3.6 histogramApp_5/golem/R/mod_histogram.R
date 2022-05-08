#' histogram UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_histogram_ui <- function(id){
  ns <- NS(id)
  tagList(

  )
}

#' histogram Server Functions
#'
#' @noRd
mod_histogram_server <- function(id, x, title = reactive("Histogram")){

  stopifnot(is.reactive(x))
  stopifnot(is.reactive(title))

  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$hist <- renderPlot({
      req(is.numeric(x()))
      main <- paste0(title(), " [", input$bins, "]")
      hist(x(), breaks = input$bins, main = main)
    }, res = 96)

  })
}

## To be copied in the UI
# mod_histogram_ui("histogram_1")

## To be copied in the server
# mod_histogram_server("histogram_1")
