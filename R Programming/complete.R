complete <- function(directory, id = 1:332) {
  List_of_Files <- list.files(paste(getwd(), directory, sep="/"), "*\\.csv", full.names=T)
  
  Files_to_be_read <- List_of_Files[id]
  
  Matrix <- matrix(nrow=length(Files_to_be_read), ncol=2)
  colnames(Matrix) <- c("id", "nobs")
  
  for(i in 1:length(Files_to_be_read)){
    
    File_Data <- read.csv(Files_to_be_read[i])
    
    Matrix[i, ] <- c(id[i], nrow(File_Data[complete.cases(File_Data), ]))
  }
  
  OutputDF <- as.data.frame(Matrix)
  return(OutputDF) 
  
}