library(shiny)

# Define UI for slider demo application
shinyUI(fluidPage(  
  #  Application title
  titlePanel("Identify your Flower"),
  
  # Sidebar with sliders that demonstrate various available
  # options
  sidebarLayout(
    sidebarPanel(
      h3("Select Your Flower's Parameters", align = "center"),
      # First Slider
      sliderInput("SL", "Sepal Length:", min=4, max=8, value=6, step=0.1),
      
      # Second Slider
      sliderInput("SW", "Sepal Width:", min = 2, max = 5, value = 3, step= 0.1),
      
      # Third Slider
      sliderInput("PL", "Petal Length:", min = 1, max = 7, value = 4, step=0.1),
      
      # Fourth Slider
      sliderInput("PW", "Petal Width:", min = 0.1, max = 3, value = 1, step = 0.1),
      submitButton("Update")
    ),
    
    # Show a table summarizing the values entered
    mainPanel(
      h3("Here are your Selected Flower Parameters"),
      tableOutput("Values"),
      br(),
      br(),
      h3("Predicted Flower Species"),
      p("Based on your selected parameters your flower is most likely "),
      strong(textOutput("Species")),
      imageOutput("Image", height="400px", width="400px"),
      br(),
      br(),
      p("Images are provided by Wikipedia.")
    )
  )
))