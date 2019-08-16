library(shiny)
library(ggplot2)
library(fivethirtyeight)

# Define UI for application that plots college graduate  -----------
ui <- fluidPage(
  
  # Sidebar layout with a input and output definitions --------------
  sidebarLayout(
    
    # Inputs: Select variables to plot ------------------------------
    sidebarPanel(
      
      # Select variable for y-axis ----------------------------------
      selectInput(inputId = "y", 
                  label = "Y-axis:",
                  choices = c("employed", "employed_fulltime", "unemployed"), 
                  selected = "employed"),
      
      # Select variable for x-axis ----------------------------------
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = c("major_category", "major"), 
                  selected = "major_category")
    ),
    # Output: Show scatterplot --------------------------------------
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)

# Define server function required to create the scatterplot ---------
server <- function(input, output) {
  
  # Create scatterplot object the plotOutput function is expecting --
  output$scatterplot <- renderPlot({
    ggplot(data = college_recent_grads, aes_string(x = input$x, y = input$y)) +
      geom_point()+
      geom_line()+
      theme(axis.text.x = element_text(angle = 65, hjust = 1))
  })
}

# Run the application -----------------------------------------------
shinyApp(ui = ui, server = server)