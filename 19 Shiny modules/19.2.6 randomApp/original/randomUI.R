randomUI <- function(id) {
  tagList(
    
    textOutput(NS(id, "val")),
    actionButton(NS(id, "go"), "Go!")
    
  )
}