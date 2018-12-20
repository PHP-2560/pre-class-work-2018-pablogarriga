# simple-app

#**************************************************************
# APP SETUP
#**************************************************************

# Load packages
library(shiny)

#**************************************************************
# UI
#**************************************************************

# Begin fluidPage
ui = fluidPage(

  sliderInput(inputId = "z",
              label = "Choose Z-value",
              min = -10,
              max = 10,
              value = 0,
              step = 0.1
              ),

  tags$div(style="margin-bottom:50px;margin-top:10px",
           tags$b("P-value:"),
           textOutput("p_value")
  )
)
#**************************************************************
# SERVER
#**************************************************************

server = function(input, output) {
  output$p_value = renderPrint({
    calculate_p_value <- function(z) {
      p_value = 2*pnorm(-abs(input$z))
      return(p_value)
    }
    cat(calculate_p_value(input$z))
  })
}

shinyApp(ui = ui, server = server)
