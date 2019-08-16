library(shiny)
library(ggplot2)
library(fivethirtyeight)
library(dbplyr)

# Define UI for application that plots college graduate  -----------
ui <- fluidPage(
  
  # Sidebar layout with a input and output definitions --------------
  sidebarLayout(
    
    # Inputs: Select variables to plot ------------------------------
    sidebarPanel(
      
      # Select variable for y-axis ----------------------------------
      selectInput(inputId = "y", 
                  label = "Y-axis:",
                  choices = c("total", "employed", "employed_fulltime", "unemployed"), 
                  selected = "employed"),
      
      # Select variable for x-axis ----------------------------------
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = c("major_category", "major"), 
                  selected = "major_category"),
    # Select variable for line type -----------------------------------
    selectInput(inputId = "line", 
                label = "Line Type:",
                choices = c("dashed", "dotted"),
                selected = "dashed"),
 
  # Show data table ---------------------------------------------
  checkboxInput(inputId = "show_data",
                label = "Show data table",
                value = TRUE),
  selectInput(inputId = "major_category", 
              label = "Major Category",
              choices = c(unique(college_recent_grads$major_category)),
              selected = "Engineering"),
  numericInput(inputId = "n_samp", 
               label = "Sample size:", 
               min = 1, max = nrow(college_recent_grads), 
               value = 50),
  # Enter text for plot title ---------------------------------------------
  textInput(inputId = "plot_title", 
            label = "Plot title", 
            placeholder = "Enter text to be used as plot title")
  
  ),
    # Output: Show scatterplot --------------------------------------
    mainPanel(
      plotOutput(outputId = "scatterplot"),
      DT::dataTableOutput(outputId = "college_data")
    )
  )
)

# Define server function required to create the scatterplot ---------
server <- function(input, output) {
  
  #allow user to enter plot title
 # output$pretty_plot_title <- toupper(input$plot_title)
  
  pretty_plot_title <- reactive({ toupper(input$plot_title) })
  
  major_subset<-reactive({
    req(input$major_category)
    filter(college_recent_grads, major_category %in% input$major_category)
  })
  
  # Create scatterplot object the plotOutput function is expecting --
  output$scatterplot <- renderPlot({
    ggplot(data = major_subset(), aes_string(x = input$x, y = input$y)) +
      geom_line(linetype = input$line)+
      geom_point()+
      theme(axis.text.x = element_text(angle = 90, hjust = 1))+
      labs(title = pretty_plot_title())
  })
  
  output$college_data <- DT::renderDataTable(
    if(input$show_data){
      DT::datatable(data = major_subset(), 
                    options = list(pageLength = 10), 
                    rownames = FALSE)
    }
  )
}


# Run the application -----------------------------------------------
shinyApp(ui = ui, server = server)