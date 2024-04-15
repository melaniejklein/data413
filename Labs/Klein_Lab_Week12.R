# Problem 1 Add two lines of code to the user interface component of the shiny code 
# below to produce the frequency polygon shiny app shown.  
# After adjusting the code in the ui, check to make sure that your app is Reactive.                                                    


library(tidyverse)    
library(shiny)

diamonds%>%
  select(carat,price,x,y,z) -> diamonds1
diamonds1

ui <- fluidPage(
  titlePanel("Frequency Plots"),
  sidebarLayout(      
    sidebarPanel(
      selectInput("DVvar", "Diamond Variables:", 
                  choices=colnames(diamonds1)),
    ),
    mainPanel(
      plotOutput("plot")  
    )
))

server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(diamonds, mapping = aes(x = .data[[input$DVvar]], color = cut)) +
      geom_freqpoly(binwidth = 0.1) +
      ggtitle("Frequency Polygons")
  })
}

shinyApp(ui = ui, server = server)
