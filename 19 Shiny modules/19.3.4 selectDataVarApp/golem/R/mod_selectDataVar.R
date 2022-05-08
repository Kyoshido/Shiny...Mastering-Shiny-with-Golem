#' selectDataVar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_selectDataVar_ui <- function(id){
  ns <- NS(id)
  tagList(

    mod_dataset_ui(NS(id, "data"), filter = is.data.frame),
    mod_selectVar_ui(NS(id, "var"))

  )
}

#' selectDataVar Server Functions
#'
#' @noRd
mod_selectDataVar_server <- function(id, filter = is.numeric){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    data <- mod_dataset_server("data")
    var <- mod_selectVar_server("var", data, filter = filter)
    var

  })
}

## To be copied in the UI
# mod_selectDataVar_ui("selectDataVar_1")

## To be copied in the server
# mod_selectDataVar_server("selectDataVar_1")
