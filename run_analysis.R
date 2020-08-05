
library(dplyr)  #load library


##reading files about variables info
features <- read.table("features.txt", col.names = c("no", "function"))
activity_labels <- read.table("activity_labels.txt", col.names = c("no", "activity"))

##reading 6 files: x/y/subject test/train; inputting labels(col.names)
x_test <- read.table("./test/X_test.txt", col.names = features$function.) #x_data by features.txt
y_test <- read.table("./test/Y_test.txt", col.names = "activity")
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
x_train <- read.table("./train/X_train.txt", col.names = features$function.)
y_train <- read.table("./train/y_train.txt", col.names = "activity")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")


##merging training and test data(by each three set: x/y/subject)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
##extracting columm ONLY about mean/std - containing mean()/std()
mean_std <- select(x_data, matches("mean|std")) ##using regex
##...and then merging whole data
total_data <- cbind(subject_data, y_data, mean_std)


##now renaming columm names appropriately with gsub()
colnames(total_data) <- gsub("Acc", "Acceleration", colnames(total_data))
#and so on...
colnames(total_data) <- gsub("Gyro", "Gyroscope", colnames(total_data))
colnames(total_data) <- gsub("Mag", "Magnitude", colnames(total_data))
colnames(total_data) <- gsub("BodyBody", "Body", colnames(total_data))
##t(time)/f(s)
colnames(total_data) <- gsub("^t", "Time", colnames(total_data))
colnames(total_data) <- gsub("^f", "Frequency", colnames(total_data))
##finally mean, standard deviation, Frequency
colnames(total_data) <- gsub("mean", "Mean", colnames(total_data))
colnames(total_data) <- gsub("std", "StandardDeviation", colnames(total_data))
colnames(total_data) <- gsub("Freq", "Frequency", colnames(total_data))

##making second tidy dataset by calculating each variables' average
total_data_avg <- sapply(total_data, mean) 
total_data_avg <- as.matrix(total_data_avg); colnames(total_data_avg) <- "average" ##making as a form of matrix
