library(shiny)
library(data.table)
library(NLP)
library(tm)

#Read in Dataset
Dataset <- fread("NgramTable_05percent_Datatable.txt")
setkeyv(Dataset, c('w1', 'w2', 'w3', 'w4', 'freq'))

Translate_Input <- function(Text){
    Mod_Input <- tolower(Text)
    Mod_Input <- stripWhitespace(Mod_Input)
    Mod_Input <- gsub("[^\\p{L}\\s]+", "", Mod_Input, ignore.case=F, perl=T)
    return(Mod_Input)
}

Split_Translate_Input <- function(Text){
    Mod_Input <- tolower(Text)
    Mod_Input <- stripWhitespace(Mod_Input)
    Mod_Input <- gsub("[^\\p{L}\\s]+", "", Mod_Input, ignore.case=F, perl=T)
    Split_Trans_Input <- unlist(strsplit(Mod_Input, " "))
    return(Split_Trans_Input)
}

Word_Count1 <- function(TextInputA){
    NgramsTable <<- Dataset[list("<s>", TextInputA[1])]
    NgramsTable <<- NgramsTable[NgramsTable$w3!="<s>", ]
    NgramsTable <<- NgramsTable[order(NgramsTable$freq, decreasing=TRUE), ]
    
    #List Alternatives
    AlternativeGuess <<- as.data.frame(NgramsTable)
    AlternativeGuess <<- AlternativeGuess[1:5, c("w3", "freq")]
    AlternativeGuess <<- AlternativeGuess[!is.na(AlternativeGuess$freq), ]
    AlternativeGuess <<- AlternativeGuess[!duplicated(AlternativeGuess), ]
    if(nrow(AlternativeGuess)==0){
        AlternativeGuess <<- data.frame(Word=NA, Likelihood=NA)
    }else{
        AlternativeGuess$freq <- round(AlternativeGuess$freq/sum(AlternativeGuess$freq)*100, 1)
        AlternativeGuess <<- AlternativeGuess
        colnames(AlternativeGuess) <<- c("Word", "Likelihood")
        rownames(AlternativeGuess) <<- NULL
    }
    
    Guess_Output <- NgramsTable$w3[1]
    if(is.na(Guess_Output)|is.null(Guess_Output)){
        Guess_Output <- "We're sorry. This app could not predict the next word. You either picked a rare word or possibly mispelled it."
    }
    
    return(Guess_Output)
}

Word_Count2 <- function(TextInputB){
    NgramsTable <<- Dataset[list("<s>", TextInputB[1], TextInputB[2])]
    NgramsTable <<- NgramsTable[NgramsTable$w4!="<s>", ]
    NgramsTable <<- NgramsTable[order(NgramsTable$freq, decreasing=TRUE), ]
    
    #List Alternatives
    AlternativeGuess <<- as.data.frame(NgramsTable)
    AlternativeGuess <<- AlternativeGuess[1:5, c("w4", "freq")]
    AlternativeGuess <<- AlternativeGuess[!is.na(AlternativeGuess$freq), ]
    AlternativeGuess <<- AlternativeGuess[!duplicated(AlternativeGuess), ]
    if(nrow(AlternativeGuess)==0){
        AlternativeGuess <<- data.frame(Word=NA, Likelihood=NA)
    }else{
        AlternativeGuess$freq <- round(AlternativeGuess$freq/sum(AlternativeGuess$freq)*100, 1)
        AlternativeGuess <<- AlternativeGuess
        colnames(AlternativeGuess) <<- c("Word", "Likelihood")
        rownames(AlternativeGuess) <<- NULL
    }
    
    Guess_Output <- NgramsTable$w4[1]
    if(is.na(Guess_Output)|is.null(Guess_Output)){       
        Guess_Output <- Word_Count1(TextInputB[2])
    }
    
    return(Guess_Output)
}

Word_Count3 <- function(TextInputC){
    NgramsTable <<- Dataset[list("<s>", TextInputC[1], TextInputC[2], TextInputC[3])]
    NgramsTable <<- NgramsTable[NgramsTable$w5!="<s>", ]
    NgramsTable <<- NgramsTable[order(NgramsTable$freq, decreasing=TRUE), ]
    
    #List Alternatives
    AlternativeGuess <<- as.data.frame(NgramsTable)
    AlternativeGuess <<- AlternativeGuess[1:5, c("w5", "freq")]
    AlternativeGuess <<- AlternativeGuess[!is.na(AlternativeGuess$freq), ]
    AlternativeGuess <<- AlternativeGuess[!duplicated(AlternativeGuess), ]
    if(nrow(AlternativeGuess)==0){
        AlternativeGuess <<- data.frame(Word=NA, Likelihood=NA)
    }else{
        AlternativeGuess$freq <- round(AlternativeGuess$freq/sum(AlternativeGuess$freq)*100, 1)
        AlternativeGuess <<- AlternativeGuess
        colnames(AlternativeGuess) <<- c("Word", "Likelihood")
        rownames(AlternativeGuess) <<- NULL
    }
    
    Guess_Output <- NgramsTable$w5[1]
    if(is.na(Guess_Output)|is.null(Guess_Output)){
        Shortened_Input <- c(TextInputC[2], TextInputC[3])
        Guess_Output <- Word_Count2(Shortened_Input)
        if(is.na(Guess_Output)|is.null(Guess_Output)){
            Guess_Output <- Word_Count1(TextInputC[3])
        }
    }
    
    return(Guess_Output)
}
