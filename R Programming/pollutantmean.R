pollutantmean <- function(directory, pollutant, id = 1:332) {
 
  List_of_Files <- list.files(paste(getwd(), directory, sep="/"), "*\\.csv", full.names=T)
  
  Files_to_be_read <- List_of_Files[id]
  
  Large_Vector <- NULL
  
  for(i in 1:length(Files_to_be_read)){
    Vector_Data <- read.csv(Files_to_be_read[i])[ ,pollutant]
    
    Large_Vector <- c(Large_Vector, Vector_Data)
  }
  
  Mean_of_Pollutant <- mean(Large_Vector, na.rm=TRUE)
  return(Mean_of_Pollutant) 
}