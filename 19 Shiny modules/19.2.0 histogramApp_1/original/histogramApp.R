library(shiny)

histogramApp <- function() {
  
  # UI ------------------------------------------------------------------------
  ui <- fluidPage(
    h1("histogramApp"),
    
    selectInput("var", "Variable", names(mtcars)),
    numericInput("bins", "bins", 10, min = 1),
    plotOutput("hist")
  )
  
  # Server --------------------------------------------------------------------
  server <- function(input, output, session) {
    data <- reactive(mtcars[[input$var]])
    output$hist <- renderPlot({
      hist(data(), breaks = input$bins, main = input$var)
    }, res = 96)
  }
  shinyApp(ui, server)
} 

histogramApp()