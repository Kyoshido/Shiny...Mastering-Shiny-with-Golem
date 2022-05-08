#' dataset UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_dataset_ui <- function(id, filter = NULL){
  ns <- NS(id)

  names <- ls("package:datasets")

  if (!is.null(filter)) {
    data <- lapply(names, get, "package:datasets")
    names <- names[vapply(data, filter, logical(1))]
  }

  tagList(
    selectInput(NS(id, "dataset"), "Pick a dataset", choices = names)
  )
}

#' dataset Server Functions
#'
#' @noRd
mod_dataset_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    reactive(get(input$dataset, "package:datasets"))


  })
}

## To be copied in the UI
# mod_dataset_ui("dataset_1")

## To be copied in the server
# mod_dataset_server("dataset_1")
