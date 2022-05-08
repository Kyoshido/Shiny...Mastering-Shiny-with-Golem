library(shiny)

source("datasetInput.R")
source("datasetServer.R")

datasetApp <- function(filter = NULL) {
  
  # UI ------------------------------------------------------------------------
  ui <- fluidPage(
    h1("datasetApp"),
    
    datasetInput("dataset", 
                 filter = filter),
    tableOutput("data")
  )
  
  # Server --------------------------------------------------------------------
  server <- function(input, output, session) {
    
    data <- datasetServer("dataset")
    output$data <- renderTable(head(data()))
  }
  shinyApp(ui, server)
} 

datasetApp()