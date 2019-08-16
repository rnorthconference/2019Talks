library(shiny)
ui <- fluidPage(
  h1("Shiny App Title"),
  h4("This is awesome"),
  "Hello",
  "Shiny workshop",
  br(),
  strong("bold text")
)
server <- function(input, output) {}
shinyApp(ui = ui, server = server)