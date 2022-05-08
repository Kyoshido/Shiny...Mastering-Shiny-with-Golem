library(shiny)

source("histogramOutput.R")
source("histogramServer.R")
source("datasetInput.R")
source("datasetServer.R")
source("selectVarInput.R")
source("selectVarServer.R")
source("find_vars.R")


histogramApp <- function() {
  
  # UI ------------------------------------------------------------------------
  ui <- fluidPage(
    h1("histogramApp"),
    
    sidebarLayout(
      
      sidebarPanel(
        
        datasetInput("data", is.data.frame),
        selectVarInput("var"),
        
      ),
      mainPanel(
        
        histogramOutput("hist")   
        
      )
    )
    
  )
  
  # Server --------------------------------------------------------------------
  server <- function(input, output, session) {
    
    data <- datasetServer("data")
    
    x <- selectVarServer("var", data)
    
    histogramServer("hist", x)
    
  }
  shinyApp(ui, server)
} 

histogramApp()