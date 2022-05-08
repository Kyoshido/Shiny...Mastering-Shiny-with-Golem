selectVarInput <- function(id) {
  selectInput(NS(id, "var"), "Variable", choices = NULL) 
}