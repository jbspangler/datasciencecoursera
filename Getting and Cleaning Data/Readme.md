Getting and Cleaning Data Peer Assignment
========================================================

This project involves obtaining a raw dataset and applying the principles learned in class to obtain
a tidy dataset. The raw dataset used for this assignment is a University California Irvine Human
Activity Recognition study. The details of the study can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Obtaining the raw data
The script will look for the zip file containing the raw data in your working directory. If it does
not exist it will download the data and unzip it in the current working directory.

#Reading in the Activity Descriptions and Column headers
This portion of the script reads in the human readable descriptions for the activities monitored
and the official column headers for the training and test datasets.

#Read in Training set information
The script reads in the training subject information. This identifies which row is associated with
which subject from the training set measurements.

The script will then read in the numerical identifier for each activity. These identifiers correspond
to each row in the data. The identifiers are then transformed into the human readable versions using
the earlier descriptions file.

The script will then read in the raw data for the training set and rename the columns based on the
official list of column headers.

#Limit Training data to means and std
For the purposes of this assignment we are only interested in 66 of the 561 measurements taken during
this study. These 66 measurements correspond to the means and standard deviations of particular 
variables. The exact list of variables is described in more detail within the Codebook.md.

#Combine Training set information
The training set is then combined into a large dataframe containing the desired measurements, subject
number and human readable activity description.

#Repeat data processing for the Test set.
The script then follows the same formatting procedure for the Test set.

#Combine datasets and Process into tidy format
The training set and test set and then combined into a single dataframe. The Combined data frame is
then condensed into a tidy dataset by calculating the mean for each of the 66 desired measurements
across subject number and activity. The final output is a tab delimited text file with 68 columns
and 180 rows (181 rows including the header).



