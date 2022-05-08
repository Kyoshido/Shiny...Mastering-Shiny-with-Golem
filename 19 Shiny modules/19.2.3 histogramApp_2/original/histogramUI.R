histogramUI <- function(id) {
  
  tagList(
    selectInput(NS(id, "var"), 
                "Variable", choices = names(mtcars)),
    
    numericInput(NS(id, "bins"), 
                 "bins", value = 10, min = 1),
    
    plotOutput(NS(id, "hist"))
  )
  
}
