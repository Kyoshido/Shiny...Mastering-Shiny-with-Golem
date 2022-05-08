library(shiny)


source("selectDataVarUI.R")
source("selectDataVarServer.R")
source("datasetInput.R")
source("datasetServer.R")
source("selectVarInput.R")
source("selectVarServer.R")
source("find_vars.R")

selectVarApp <- function(filter = is.numeric) {
  
  # UI ------------------------------------------------------------------------
  ui <- fluidPage(
    h1("selectDataVarApp"),
    
    sidebarLayout(
      
      sidebarPanel(selectDataVarUI("var")),
      
      mainPanel(verbatimTextOutput("out"))
      
    )
  )

  # Server --------------------------------------------------------------------
  server <- function(input, output, session) {
    
    var <- selectDataVarServer("var", filter)
    
    output$out <- renderPrint(var(), width = 40)
    
  }
  
  shinyApp(ui, server)
}

selectVarApp()