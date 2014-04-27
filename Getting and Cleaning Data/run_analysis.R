#This script is designed to use the UCI HAR dataset from the Peer Assignment in the Getting
#and Cleaning Data course from Coursera. This dataset is summarized on the following URL:
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#This script will involve transforming the overall data into a tidy dataset summarized by
#subject number, activity and a select set of interesting variables.

#Check to see if the zipped Datafile exists in the current working directory.
#If it does not, then it will be downloaded and unzipped.
if(!file.exists("UCI_HAR_Dataset.zip")){
  #Identify the directory of the datafile
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "UCI_HAR_Dataset.zip", mode="wb")
  dateDownloaded <- date()
  dateDownloaded
  #"Sat Apr 26 11:24:57 2014"
  
  #Unzip the data
  unzip("UCI_HAR_Dataset.zip")
}
#####################################################################
#Read in the list of Activity and Column Labels

Data_Labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
Column_Names <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

#####################################################################
#Read in the training set information

Training_Subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
#According to the Readme accompanying the data should be 70% of 30 subjects in training or 21 subjects
length(unique(Training_Subjects$V1))  #21
#Rename the column
colnames(Training_Subjects)[1] <- "Subject_Number"

#Read in the training set labels
Training_Labels <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
#Check that there are 6 Training Labels
length(unique(Training_Labels$V1))  #6

#This function is meant to identify the Activity Label for each Training Set 
#row based on Training Labels
Rename_Training_Labels <- function(Number){
  Activity_Label <- Data_Labels$V2[Data_Labels$V1==Number]
  return(Activity_Label)
}

#Add a column to Training set labels using the human readable label
Training_Labels$Activity <- sapply(Training_Labels$V1, Rename_Training_Labels)
Training_Labels$V1 <- NULL

#Read in the training set data
Training_Set <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)

#Rename the columns of the training set data
colnames(Training_Set) <- Column_Names$V2

#For the purposes of this Assignment we are only interested in the mean and standard dev (std) metrics
#Limit Training Set to columns with just mean and std. Start by removing colnames involving "meanFreq"
Training_Set <- Training_Set[, grep("meanFreq", colnames(Training_Set), ignore.case=F,
                                    perl=T, invert=T)]
Training_Set <- Training_Set[, grep("mean|std", colnames(Training_Set), ignore.case=F, perl=T)]

#Create a polished Training Dataset
Polished_Training_Set <- cbind(Training_Subjects, Training_Labels, Training_Set)

#####################################################################
#Read in the test set information

Test_Subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
#According to the Readme accompanying the data should be 30% of 30 subjects in training or 9 subjects
length(unique(Test_Subjects$V1))  #9
#Rename the column
colnames(Test_Subjects)[1] <- "Subject_Number"
#Test_Subjects$Dataset <- "Test"

#Read in the test set labels
Test_Labels <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)

#Add a column to Training set labels using the human readable label
Test_Labels$Activity <- sapply(Test_Labels$V1, Rename_Training_Labels)
Test_Labels$V1 <- NULL

#Read in the test set data
Test_Set <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)

#Rename the columns of the training set data
colnames(Test_Set) <- Column_Names$V2

#Limit Test Set to columns with just mean and std. Start by removing colnames involving "meanFreq"
Test_Set <- Test_Set[, grep("meanFreq", colnames(Test_Set), ignore.case=F, perl=T, invert=T)]
Test_Set <- Test_Set[, grep("mean|std", colnames(Test_Set), ignore.case=F, perl=T)]

#Create a polished Test Dataset
Polished_Test_Set <- cbind(Test_Subjects, Test_Labels, Test_Set)

#####################################################################
#Combine the Training and Test sets

Combined_Dataset <- rbind(Polished_Training_Set, Polished_Test_Set)

Tidy_Dataset <- aggregate(.~Subject_Number+Activity, Combined_Dataset, mean)

#Output the Tidy Dataset
write.table(Tidy_Dataset, "Tidy_Dataset_of_UCI_HAR_Data.txt", quote=FALSE, sep="\t", row.names=FALSE)
