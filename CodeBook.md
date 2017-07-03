Code book for Course Project
Coursera-Data Science, Course 3, Week 4

Objective of the project:
To create a tidy data set from the data sets given in the following source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Short description of the data files present in the above zip folder
The data in the above link represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The above zip file contains data sets broadly divided into two categories: training and test sets. Details of each data set is given in the following list:

1. 'train/X_train.txt': This data set contains 561 columns of variables, each containing 7352 observations.

2. 'test/X_test.txt': This data set forms the test set containing 561 columns of variables, each containing 2947 observations.

3.  'train/y_train.txt': This data set contains activity data labels 1~6 corresponding to the training data set of observations(1.); 1-WALKING,2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING. The dimension of this data set is 7352 X 1.

4. 'test/y_test.txt': This data set also contains activity data labels 1~6 corresponding to the test data set of observations (2.); 1-WALKING,2-WALKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS,
4-SITTING, 5-STANDING, 6-LAYING. The dimension of this data set is 2947 X 1.

5. 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample corresponding to training data (1.). Its range is from 1 to 30. It is an array of dimension 30 X 1.

6. 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample corresponding to test data(2.). Its range is from 1 to 30. It is an array of dimension 30 X 1.

7. 'features.txt': This is a text file of length 561. Each character represents one type of variable.

8. 'features_info.txt': Shows information about the variables used on the feature vector.

9. 'activity_labels.txt': Links the class labels with their     activity name.

Any other text file apart from the above, have not been used in the current analysis.

Short description of R-code[run_analysis.R]
List of variables used:
1. y_train, y_test: Contains the training and test activity label sets(ranges from 1~6; dimension 7352 X 1 and 2947 X 1 resp.)

2. y_activity: Contains the training and the test activity label sets merged (data set of dimension 10299 X 1)

3. subject_train, subject_test: Data frames which contains the training and test subject ids identifying the subject (each of dimension 10299 X 1; values ranging from 1~30.

4. subject : merged data frame of subject_train and subject_test.

5. x_train, x_test: A data frame which contains the training and test data sets of observations (of dimension 7352 X 561 and 2947 X 561)

6. x_data: Merged data frame of observations (of dimension 10299 X 561)

7. feature_label: A data frame containing the names of the variables which have been recorded/present in the data set of observations (x_train, x_test). It is of dimension 561 X 1.

8. data_act: A complete Data frame consisting of the subject ids(variable subject), activity labels (variable y_activity) and data frame of observations (x_data)

9.  extract_data: Data frame containing the observations corresponding to those variables which are either mean or standard deviations of the measurements. In this case it is of dimension 10299 X 88.

10. activity_label: Contains activity label data.

11. data_act2: It is a merged data frame of containing the above extracted data along with the descriptive names to the activity labels.

12. clean.name: It is a character vector which contains the column names(variable names from feature_label) of data_act2 with all the proper formatting included.

13. data.tidy: A table form of data_act2.

14. tidy.data: the above table grouped by subject id and activity type.

15. ind.tidydata: Independent tidy data set with the average of each variable for each activity and each subject.
  
  
Contents of Code :

The code is divided according to the Questions given in the assignemnt viz:

Q1: Merges the training and the test sets to create one data set.
Q2: Extracts only the measurements on the mean and standard deviation for each measurement.
Q3: Uses descriptive activity names to name the activities in the data set
Q4: Appropriately labels the data set with descriptive variable names.
Q5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The steps done to get the ultimate tidy data are as follows:

1. Reading all the training and test data sets viz data set of observations, data sets of activity labels and subjects. Merge the training and test sets. Add appropriate column names to all.

2. Merge the above data sets (observations, subject id and activity labels)

3. Extracting those columns of the above data frame which contain either mean or standard deviation of the measurements. 

4. Add descriptive names to the activity labels by merging the above extracted data frame and the activity_label object by activity label(numeric).

5. rearrange the above data frame in ascending order of subject id and removing the column of activity label.

6. Cleaning the names of the variables of the data frame by removing the inappropriate punctuation marks from them.

7. Creating a new independent tidy data set ind.tidydata ith the average of each variable for each activity and each subject.

Output

A tidy data set (ind.tidydata) which is an independent data set containing the average of each variable for each activity and each subject. The output is the variable ind.tidydata and it is saved in a text format as tidydata.txt


