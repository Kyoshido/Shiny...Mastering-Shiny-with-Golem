#' filter UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_filter_ui <- function(id){
  ns <- NS(id)
  tagList(

    uiOutput(NS(id, "controls"))

  )
}

#' filter Server Functions
#'
#' @noRd
mod_filter_server <- function(id, df){

  stopifnot(is.reactive(df))

  moduleServer( id, function(input, output, session){
    ns <- session$ns

    vars <- reactive(names(df()))

    output$controls <- renderUI({
      map(vars(), function(var) make_ui(df()[[var]], NS(id, var), var))
    })

    reactive({
      each_var <- map(vars(), function(var) filter_var(df()[[var]], input[[var]]))
      reduce(each_var, `&`)
    })

  })
}

## To be copied in the UI
# mod_filter_ui("filter_1")

## To be copied in the server
# mod_filter_server("filter_1")
