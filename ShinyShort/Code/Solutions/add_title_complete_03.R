library(fivethirtyeight)
library(dplyr)


ui <- fluidPage(
  titlePanel("Look at this awesome airline data"),
  selectInput("airline", label = "experiment",
              choices = unique(airline_safety$airline)),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session) {
  output$summary <- renderPrint({
    dataset <- airline_safety %>% 
               filter(airline==input$airline)
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- airline_safety %>% 
      filter(airline==input$airline)
    dataset
  })
}

shinyApp(ui = ui, server = server) 