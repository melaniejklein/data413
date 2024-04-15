# Activate the link below and study the shiny app and the associated code.
# https://shiny.posit.co/r/gallery/start-simple/single-file-shiny-app/
  
# In a new R script window, change the code so that the shiny app features a 
# boxplot instead of a histogram and the boxplot should be colored red. 
# Do not forget to add your name to the top of the shiny app.


# Global variables can go here
n <- 200

# Define the UI
ui <- bootstrapPage(
  titlePanel("Melanie Klein"),
  numericInput('n', 'Number of obs', n),
  plotOutput('plot')
)

# Define the server code
server <- function(input, output) {
  output$plot <- renderPlot({
    boxplot(runif(input$n), col = "red")
  })
}

# Return a Shiny app object
shinyApp(ui = ui, server = server)