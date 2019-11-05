
#load libraries
library(dplyr)

#reading features and activity data
features <- read.table("./features.txt")
activities <- read.table("./activity_labels.txt")

#reading train data
x_train <- read.table("./train/X_train.txt") #features data
y_train <- read.table("./train/y_train.txt") #activity labels
subject_train <- read.table("./train/subject_train.txt") #subjects

#reading test data
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt") 
subject_test <- read.table("./test/subject_test.txt")

#merging the train and test datasets
combined_data <- rbind(x_train, x_test)

#labelling coloumn name using features
colnames(combined_data) <- features$V2

#Extracts only the measurements on the mean and standard deviation for each measurement
meanstd_measurement <- grep("mean\\(\\)|std\\(\\)", colnames(combined_data), value=TRUE)
combined_data <- combined_data[,meanstd_measurement] 

#combing y train and y test, & subject train and subject test
combined_y <- rbind(y_train, y_test)
combined_subject <- rbind(subject_train, subject_test)

#Uses descriptive activity names to name the activities in the data set
combined_data$activity <- combined_y$V1
combined_data$actvity_label <- factor(combined_data$activity, labels = activities$V2)
combined_data$subject <- factor(combined_subject$V1)

#independent tidy data set with the average of each variable for each activity and each subject.
tidy_dataset <- combined_data %>% 
                                  select(-activity) %>% 
                                  group_by(actvity_label, subject) %>% 
                                  summarise_if(is.numeric, mean, na.rm = TRUE)

#creating a tidy dataset file  
write.table(tidy_dataset, file = "tidy_dataset.txt", row.names = FALSE)
