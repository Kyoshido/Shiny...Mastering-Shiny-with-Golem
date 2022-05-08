selectDataVarUI <- function(id) {
  tagList(
    
    datasetInput(NS(id, "data"), filter = is.data.frame),
    selectVarInput(NS(id, "var"))
    
  )
}