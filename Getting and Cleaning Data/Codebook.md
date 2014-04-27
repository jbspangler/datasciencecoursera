Codebook
========================================================
This document will provide a brief description of the "UCI HAR Dataset" and describe the 
transformation of the desired portions of this study into a tidy dataset. This transformation
was done in accordance of the parameters of the Peer Assessment of "Getting and Cleaning Data".

The raw dataset consists of 30 subjects which have been seperated into training and test sets.
The training set consists of 21 subjects (70%) and the test set consists of 9 subjects (30%). The
data from both the training and test sets is organized in an fashion.

The script "run_analysis.R" uses the following files from the UCI HAR Dataset:
  - activity_labels.txt
  - features.txt
  - subject_train.txt
  - X_train.txt
  - y_train.txt
  - subject_test.txt
  - X_test.txt
  - y_test.txt
  
The data from these files is transformed using "run_analysis.R" and turned into 
"Tidy_Dataset_of_UCI_HAR_Data.txt".

The tidy dataset contains 68 columns and 180 rows (181 including header). Each row represents a
uniquecombination of the 6 activites from "activity_labels.txt" for each of the 30 subjects in the
study. The activity and subject number are described in the first two columns. The remaining 66
columns consist of the mean of selected measurements taken during the course of the study.

#Columns included in tidy dataset
Subject_Number
Activity
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()



