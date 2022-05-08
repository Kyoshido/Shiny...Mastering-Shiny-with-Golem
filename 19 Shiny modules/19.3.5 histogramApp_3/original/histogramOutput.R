histogramOutput <- function(id) {
  tagList(
    
    numericInput(NS(id, "bins"), "bins", 10, min = 1, step = 1),
    
    plotOutput(NS(id, "hist"))
    
  )
}