randomServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    rand <- eventReactive(input$go, sample(100, 1))
    output$val <- renderText(rand())
    
  })
}