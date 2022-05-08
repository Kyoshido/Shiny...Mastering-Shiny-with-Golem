#' random UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_random_ui <- function(id){
  ns <- NS(id)
  tagList(

    textOutput(NS(id, "val")),
    actionButton(NS(id, "go"), "Go!")

  )
}

#' random Server Functions
#'
#' @noRd
mod_random_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    rand <- eventReactive(input$go, sample(100, 1))
    output$val <- renderText(rand())


  })
}

## To be copied in the UI
# mod_random_ui("random_1")

## To be copied in the server
# mod_random_server("random_1")
