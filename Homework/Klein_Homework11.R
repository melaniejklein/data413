# Melanie Klein
# Shiny App HW2

library(tidyverse)    
library(shiny)
library(shinyWidgets)


# Problem 2   
# Now, continuing adding additional code to the coding chunk for problem 1 to create the Reactive shiny app below.  
# Note that your app produces three Reactive elements; two plots and a dynamic table.

diamonds%>%
  select(carat,price,x,y,z) -> diamonds1
diamonds1

ui <- fluidPage(
  titlePanel("Frequency Plots, Box Plots, and a Table"),
  sidebarLayout(      
    sidebarPanel(
      selectInput("DVvar", "Diamond Variables:", 
                  choices=colnames(diamonds1)),
    ),
    mainPanel(
      plotOutput(outputId = "FrequencyPlot"),
      plotOutput(outputId = "BoxPlot"),
      dataTableOutput(outputId = "Table")
    )
  ))

server <- function(input, output) {
  output$FrequencyPlot <- renderPlot({
    ggplot(diamonds, mapping = aes(x = .data[[input$DVvar]], color = cut)) +
      geom_freqpoly(binwidth = 0.1) +
      ggtitle("frequency polygons")
  })
  
  output$BoxPlot <- renderPlot({
    ggplot(diamonds, mapping = aes(x = cut, y = .data[[input$DVvar]])) +
      geom_boxplot(fill = "purple") +
      ggtitle("boxplot")
  })
  
  output$Table <- renderDataTable({
    diamonds1
  })
}

shinyApp(ui = ui, server = server)

# Problem 3
# Now produce your Problem 2 app using tabs as demonstrated in class and use background color or color scheme of your choice (other than white).

diamonds%>%
  select(carat,price,x,y,z) -> diamonds1
diamonds1

ui <- fluidPage(
  titlePanel("Frequency Plots, Box Plots, and a Table"),
  setBackgroundColor(
    color = c("lightblue", "lightpink"),
    gradient = "linear",
    direction = "bottom"
  ),
  sidebarLayout(      
    sidebarPanel(
      selectInput("DVvar", "Diamond Variables:", 
                  choices=colnames(diamonds1)),
    ),
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("FrequencyPlot", plotOutput("FrequencyPlot")),
                  tabPanel("BoxPlot", plotOutput("BoxPlot")),
                  tabPanel("Table", dataTableOutput("Table"))
              
  ))))

server <- function(input, output) {
  output$FrequencyPlot <- renderPlot({
    ggplot(diamonds, mapping = aes(x = .data[[input$DVvar]], color = cut)) +
      geom_freqpoly(binwidth = 0.1) +
      ggtitle("frequency polygons")
  })
  
  output$BoxPlot <- renderPlot({
    ggplot(diamonds, mapping = aes(x = cut, y = .data[[input$DVvar]])) +
      geom_boxplot(fill = "purple") +
      ggtitle("boxplot")
  })
  
  output$Table <- renderDataTable({
    diamonds1
  })
}

shinyApp(ui = ui, server = server)