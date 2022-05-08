library(shiny)

source("randomUI.R")
source("randomServer.R")

randomApp <- function() {
  
  # UI ------------------------------------------------------------------------
  ui <- fluidPage(
    h1("randomApp"),
    
    randomUI("random1")
  )
  
  # Server --------------------------------------------------------------------
  server <- function(input, output, session) {
    
    randomServer("random1")

  }
  shinyApp(ui, server)
} 

randomApp()