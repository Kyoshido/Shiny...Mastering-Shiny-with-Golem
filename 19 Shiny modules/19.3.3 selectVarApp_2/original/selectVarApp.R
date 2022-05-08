library(shiny)

source("datasetInput.R")
source("datasetServer.R")
source("selectVarInput.R")
source("selectVarServer.R")
source("find_vars.R")

selectVarApp <- function(filter = is.numeric) {
  
  # UI ------------------------------------------------------------------------
  ui <- fluidPage(
    h1("selectVarApp"),
    
    datasetInput("data", 
                 is.data.frame),
    selectVarInput("var"),
    verbatimTextOutput("out")
  )

  # Server --------------------------------------------------------------------
  server <- function(input, output, session) {
    data <- datasetServer("data")
    var <- selectVarServer("var", 
                           data, 
                           filter = filter)
    output$out <- renderPrint(var())
  }
  
  shinyApp(ui, server)
}

selectVarApp()