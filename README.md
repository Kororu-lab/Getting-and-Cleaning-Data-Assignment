Getting and Cleaning Dataset
============================

This repositorty contains a datast for assignment of coursera course "Getting and Cleaning Dataset".

About the Data
---------------
run_analysis.R has supposed to work on R with working directory set on "UCI HAR Dataset" a root folder of zip file provided. If you are trying to test a code, please set working diredctory by setwd() to "UCI HAR Dataset" folder.
all of these base dataset came from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and raw data from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (zip file)




"Tidy dataset" has made through following instructions from the lecture;

--------------------------------
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each > > subject.

---------------------------------


About running environment
---------------------------
This function has been written in R version: 4.0.2; with Windows 10(64 bit OS)
Since made in RStudio, recommended to run in RStudio(Version 1.2.1335)

--------------------------------


In-code explanation
----------------------------
run_analysis.R changes some variablenames to make it easy for reader to figure out what each variables mean.
I tried to change these 9 patterns with gsub() function

--------------------------
Acc -> Accelerometer
Gyro -> Gyroscope
Mag <- Magnitude
BodyBody <- Body(unnecessary?)
^t(starts with t) -> Time
^f(starts with f) -> Frequency
mean() -> Mean
std() -> StandardDeviation
Freq -> Frequency

--------------------------