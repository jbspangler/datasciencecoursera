corr <- function(directory, threshold = 0) {
  List_of_Files <- list.files(paste(getwd(), directory, sep="/"), "*\\.csv", full.names=T)
  
  Observation_Counts <- complete("specdata", 1:332)
  
  Observations_at_Threshold <- Observation_Counts[(Observation_Counts$nobs>threshold)&
                                                  (Observation_Counts$nobs!=0), ]
  
  if(nrow(Observations_at_Threshold)==0){
    Corr_Vector <- as.numeric(NULL)
    return(Corr_Vector)
  }
  
  Files_to_be_read <- List_of_Files[Observations_at_Threshold$id]
  
  Corr_Vector <- NULL

  for(i in 1:length(Files_to_be_read)){
    
    File_Data <- read.csv(Files_to_be_read[i])
    File_Data <- na.omit(File_Data)
    
    Sample_Corr <- cor(File_Data$nitrate, File_Data$sulfate)
    Corr_Vector <- c(Corr_Vector, Sample_Corr)
  }

  return(Corr_Vector)
}