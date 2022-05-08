histogramServer <- function(id, x, title = reactive("Histogram")) {
  
  moduleServer(id, function(input, output, session) {
    
    data <- reactive(mtcars[[input$var]])
    
    output$hist <- renderPlot({
      hist(data(), 
           breaks = input$bins,
           main = input$var)
    }, res = 96)
    
    
  })
}