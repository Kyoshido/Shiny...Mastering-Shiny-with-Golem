library(shiny)

source("histogramUI.R")
source("histogramServer.R")

histogramApp <- function() {
  
  # UI ------------------------------------------------------------------------
  ui <- fluidPage(
    h1("histogramApp"),
    
    histogramUI("hist1")
  )
  
  # Server --------------------------------------------------------------------
  server <- function(input, output, session) {
    
    histogramServer("hist1")
  }
  shinyApp(ui, server)
} 

histogramApp()