# Melanie Klein
# DATA-413-001
# Final Exam

# Question 6
# Produce the R code (In an R script file) that will produce the interactive shiny app shown below. 
# The histogram and the boxplot are reactive and controlled by the select input box Iris variables.

# Load Packages
library(tidyverse)    
library(shiny)
library(shinyWidgets)

# Load Data
data(iris)
iris%>%
  select(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) -> iris1

# Define the UI
ui <- fluidPage(
  titlePanel("Melanie Klein"),
  h3("FINAL EXAM Shiny App Iris Data", style = "color:red"),
  setBackgroundColor(
    color = "yellow"),
  selectInput("irisvar", "Iris variables", 
              choices=colnames(iris1)),
  plotOutput('histogram'),
  plotOutput('boxplot'),
  verbatimTextOutput('summarystatistics')
)

# Define the server code
server <- function(input, output) {
  output$histogram <- renderPlot({
    ggplot(iris1, aes(x = .data[[input$irisvar]])) +
      geom_histogram(fill = "blue", color = "red")
  })
  
  output$boxplot <- renderPlot({
    ggplot(iris1, mapping = aes(x = .data[[input$irisvar]])) +
      geom_boxplot(fill = "red", color = "blue") 
  })
  
  output$summarystatistics <- renderPrint({
    summary(iris)
  })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)