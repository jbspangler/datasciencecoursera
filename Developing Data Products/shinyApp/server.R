library(shiny)
library(caret)
library(randomForest)
library(datasets)
library(e1071)

# Define server logic for slider examples
shinyServer(function(input, output) {
  
  Dataset <- iris
  
  set.seed(135)
  inTrain <- createDataPartition(y=Dataset$Species, p=0.75, list=FALSE)
  Training <- Dataset[inTrain,]
  Testing <- Dataset[-inTrain,]
  
  set.seed(1337)
  modelFit <- train(Species~., data=Training, method="rf")
  
  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("Sepal Length", 
               "Sepal Width",
               "Petal Length",
               "Petal Width"),
      Value = as.character(c(input$SL, 
                             input$SW,
                             input$PL,
                             input$PW)), 
      stringsAsFactors=FALSE)
  }) 
  
  IdentifySpecies <- reactive({
    as.character(predict(modelFit, newdata=data.frame("Sepal.Length"=input$SL, "Sepal.Width"=input$SW,
                                                      "Petal.Length"=input$PL, "Petal.Width"=input$PW)))
  })
  
  # Show the values using an HTML table
  output$Values <- renderTable({
    sliderValues()
  })
  
  output$Species <- renderText({
    paste("Iris ", IdentifySpecies(), sep="")
  })
  
  # Sends pre-rendered images
  output$Image <- renderImage({   
    if (IdentifySpecies() == "setosa") {
      return(list(
        src = "www/Kosaciec_szczecinkowaty_Iris_setosa.jpg",
        contentType = "image/jpg",
        alt = "setosa"
      ))
    } else if (IdentifySpecies() == "versicolor") {
      return(list(
        src = "www/Iris_versicolor_3.jpg",
        contentType = "image/jpg",
        alt = "versicolor"
      ))
    } else if (IdentifySpecies() == "virginica") {
      return(list(
        src = "www/Iris_virginica.jpg",
        contentType = "image/jpg",
        alt = "virginica"
      ))
    }
    
  }, deleteFile = FALSE)
  
})