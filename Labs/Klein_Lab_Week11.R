# Melanie Klein
# Week 11 Lab
# DATA-413
# 4/8/24

library(shiny)
library(ggplot2)


# 1 Use and show R code that will create a shiny app that produces a scatter plot for any two variables for the iris data set. Make sure that your shiny app is reactive.  Provided below is the layout for your shiny app.

ui <- fluidPage(
  titlePanel("Iris Scatter Plot"),
  selectInput("var1", "Variable 1", choices = names(iris)),
  selectInput("var2", "Variable 2", choices = names(iris)),
  plotOutput("plot")
)

server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(iris, aes(x = .data[[input$var1]], y = .data[[input$var2]])) +
      geom_point(color = "red")
  })
}

shinyApp(ui = ui, server = server)


# 2 Use and show R code that will create a shiny app that produces a boxplot for any variable of the iris data set. The layout is provided below. 
```{r}
ui <- fluidPage(
  titlePanel("Iris Box Plots"),
  selectInput("vars", "Variables", 
              choices = names(iris)),
  plotOutput("plot"),
  
)

server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(iris, aes(y = .data[[input$vars]])) +
      geom_boxplot(fill = "blue")
    
  })
}
shinyApp(ui = ui, server = server)


# 3 Use and show R code that will create a shiny app that produces multiple choice options for choosing favorite sports. The shiny layout is provided below.
sports <- c("Football", "Basketball", "Baseball", "Tennis", "Soccer")
ui <- fluidPage(
  titlePanel("Play Ball !"),
  checkboxGroupInput("sports", "What are your favorite sports?", 
                     choices = sports)
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)