#' histogramOutputPlot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_histogramOutputPlot_ui <- function(id){
  ns <- NS(id)
  tagList(

    plotOutput(NS(id, "hist"))

  )
}

#' histogramOutputPlot Server Functions
#'
#' @noRd
mod_histogramOutputPlot_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_histogramOutputPlot_ui("histogramOutputPlot_1")

## To be copied in the server
# mod_histogramOutputPlot_server("histogramOutputPlot_1")
