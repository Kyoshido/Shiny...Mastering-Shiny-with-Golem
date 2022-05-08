selectDataVarServer <- function(id, filter = is.numeric) {
  
  moduleServer(id, function(input, output, session) {
    
    data <- datasetServer("data")
    var <- selectVarServer("var", data, filter = filter)
    var
    
  })
}