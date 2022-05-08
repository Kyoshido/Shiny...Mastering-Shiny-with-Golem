#' selectVar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_selectVar_ui <- function(id){
  ns <- NS(id)
  tagList(

    selectInput(NS(id, "var"), "Variable", choices = NULL)

  )
}

#' selectVar Server Functions
#'
#' @noRd
mod_selectVar_server <- function(id, data, filter = is.numeric){

  stopifnot(is.reactive(data))
  stopifnot(!is.reactive(filter))

  moduleServer( id, function(input, output, session){
    ns <- session$ns

    observeEvent(data(), {
      updateSelectInput(session, "var",
                        choices = find_vars(data(),filter)
                        )
    })

    reactive(data()[[input$var]])

  })
}

## To be copied in the UI
# mod_selectVar_ui("selectVar_1")

## To be copied in the server
# mod_selectVar_server("selectVar_1")
