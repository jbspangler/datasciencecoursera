options(shiny.maxRequestSize=30*1024^2)

library(shiny)
library(data.table)
library(NLP)
library(tm)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {    
    # Generate a summary of the dataset
    output$Original <- renderText({
        Original_Input <- input$obs
        return(Original_Input)
    })
    
    # Generate a summary of the dataset
    output$Translated <- renderText({
        Original_Input <- input$obs
        Translated_Input <- Translate_Input(Original_Input)
        return(Translated_Input)
    })
    
    # Generate a summary of the dataset
    output$BestGuess <- renderText({
        Original_Input <- input$obs
        Translated_Input <- Translate_Input(Original_Input)
        BestGuess_Output <- "The predicted next word will be here."
        Split_Trans_Input <- Split_Translate_Input(Original_Input)
        Word_Count <- length(Split_Trans_Input)
        
        if(Word_Count==1){
            BestGuess_Output <- Word_Count1(Split_Trans_Input)
        }
        if(Word_Count==2){
            BestGuess_Output <- Word_Count2(Split_Trans_Input)
        }
        if(Word_Count==3){
            BestGuess_Output <- Word_Count3(Split_Trans_Input)
        }
        if(Word_Count > 3){
            Words_to_Search <- c(Split_Trans_Input[Word_Count - 2],
                                 Split_Trans_Input[Word_Count - 1],
                                 Split_Trans_Input[Word_Count])
            BestGuess_Output <- Word_Count3(Words_to_Search)
        }
        return(BestGuess_Output)
    })
    
    # Show the first "n" observations
    output$view <- renderTable({
        Original_Input <- input$obs
        Split_Trans_Input <- Split_Translate_Input(Original_Input)
        Word_Count <- length(Split_Trans_Input)
        
        if(Word_Count==1){
            BestGuess_Output <- Word_Count1(Split_Trans_Input)
        }
        if(Word_Count==2){
            BestGuess_Output <- Word_Count2(Split_Trans_Input)
        }
        if(Word_Count==3){
            BestGuess_Output <- Word_Count3(Split_Trans_Input)
        }
        if(Word_Count > 3){
            Words_to_Search <- c(Split_Trans_Input[Word_Count - 2],
                                 Split_Trans_Input[Word_Count - 1],
                                 Split_Trans_Input[Word_Count])
            BestGuess_Output <- Word_Count3(Words_to_Search)
        }
      
        if(exists("AlternativeGuess", where = -1)){
            AlternativeGuess
        }else{
            XNgramsTable <- data.frame(Word=NA, Likelihood=NA)
        }
      
    })
})
