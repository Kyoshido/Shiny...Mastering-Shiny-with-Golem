#' histogramOutputBins UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_histogramOutputBins_ui <- function(id){
  ns <- NS(id)
  tagList(

    numericInput(NS(id, "bins"), "bins", 10, min = 1, step = 1)

  )
}

#' histogramOutputBins Server Functions
#'
#' @noRd
mod_histogramOutputBins_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_histogramOutputBins_ui("histogramOutputBins_1")

## To be copied in the server
# mod_histogramOutputBins_server("histogramOutputBins_1")
