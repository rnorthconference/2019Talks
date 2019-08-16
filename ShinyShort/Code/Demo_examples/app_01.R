library(shiny)
ui <- fluidPage(
  
  titlePanel("Hello Shiny!")
)
server <- function(input, output) {}

# shinyApp(ui = ui, server = server) same code that is run when you hit the Run App button.