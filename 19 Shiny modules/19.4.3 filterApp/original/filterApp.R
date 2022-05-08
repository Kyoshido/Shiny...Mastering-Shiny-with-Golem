library(shiny)

source("filterUI.R")
source("filterServer.R")
source("make_ui.R")
source("filter_var.R")
source("datasetInput.R")
source("datasetServer.R")

filterApp <- function() {
  
  # UI ------------------------------------------------------------------------
  ui <- fluidPage(
    h1("filterApp"),
    
    sidebarLayout(
      sidebarPanel(
        
        datasetInput("data", is.data.frame),
        textOutput("n"),
        filterUI("filter"),
        
      ),
      mainPanel(
        
        tableOutput("table")    
        
      )
    )
  )
  
  # Server --------------------------------------------------------------------
  server <- function(input, output, session) {
    
    df <- datasetServer("data")
    filter <- filterServer("filter", df)
    
    output$table <- renderTable(df()[filter(), , drop = FALSE])
    output$n <- renderText(paste0(sum(filter()), " rows"))
    
  }
  shinyApp(ui, server)
} 

filterApp()