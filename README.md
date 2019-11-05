# "Getting and Cleaning Data" Course Project
---

## DATA USED

The project is to demonstrate your ability to collect, work with, and clean a data set from [UCI HAR dataset] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The following files are used:

- **features_info.txt**: Shows information about the variables used on the feature vector.
- **features.txt**: List of all features.
- **activity_labels.txt**: Links the class labels with their activity name.
- **train/X_train.txt**: Training set.
- **train/y_train.txt**: Training labels.
- **test/X_test.txt**: Test set.
- **test/y_test.txt**: Test labels.

---
## THE SCRIPT

The following is a description of how the script works:

1. The above mentioned data is read into R. The training and the test sets are merged to create one data set.

2. The features data is used to label the dataset.

3. The measurements containing only the mean and standard deviation are extracted using the grep function.

4. The **y_train.txt** data and **y_test.txt** data are merged and joined onto the main dataframe. 

5. The variable containing the activities is relabelled, and another variable is created using descriptive activity names using the data **activity_labels.txt** dataset.

6. An independent tidy data set with the average of each variable for each activity and each subject is created using the **group_by** and **summarise_if** functions in the **dplyr** package. 

7. The tidy dataset is written onto a text file using the **write.table** command.
