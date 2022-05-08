histogramServer <- function(id, x, title = reactive("Histogram")) {
  
  stopifnot(is.reactive(x))
  stopifnot(is.reactive(title))
  
  moduleServer(id, function(input, output, session) {
    
    output$hist <- renderPlot({
      req(is.numeric(x()))
      main <- paste0(title(), " [", input$bins, "]")
      hist(x(), breaks = input$bins, main = main)
    }, res = 96)
    
  })
}