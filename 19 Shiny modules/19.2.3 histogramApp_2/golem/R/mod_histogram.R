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

    selectInput(NS(id, "var"),
                "Variable",
                choices = names(mtcars)),

    numericInput(NS(id, "bins"),
                 "bins",
                 value = 10,
                 min = 1),

    plotOutput(NS(id, "hist"))

  )
}

#' histogram Server Functions
#'
#' @noRd
mod_histogram_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    data <- reactive(mtcars[[input$var]])
    output$hist <- renderPlot({
      hist(data(), breaks = input$bins, main = input$var)
    }, res = 96)

  })
}

## To be copied in the UI
# mod_histogram_ui("histogram_1")

## To be copied in the server
# mod_histogram_server("histogram_1")
