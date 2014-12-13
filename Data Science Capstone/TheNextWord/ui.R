

library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
    # Application title.
    titlePanel("The Next Word"),
  
    sidebarLayout(
        sidebarPanel(
            textInput("obs", "Enter Your Statement Here:"),
            
            helpText("Note: This widget will use this statement to predict the most likely next word."),
            
            submitButton("Predict Next Word")
        ),
      
      mainPanel(
          h6("You input the following text:"),
          textOutput("Original"),
          br(),
          h6("Your statement has been reformated to the following:"),
          textOutput("Translated"),
          br(),
          br(),
          h3("Most Likely Next Word:"),
          div(textOutput("BestGuess"), style = "color:red"),
          br(),
          h3("The program guessed your word based on the following data:"),
          tableOutput("view")
    )
  )
))
