# Code Book #
*Written by Siow Yong Teck*

## Introduction

The [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for this project is based on the data collected through an experiment conducted using Samsung Galaxy S smartphone.  Information about the experiment can be found at the [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The downloaded data set comes in a zipped format.  Following is the content of the zipped file.
```
README.txt
features_info.txt
features.txt
activity_labels.txt
train/Inertial Signals/body_acc_x_train.txt
train/Inertial Signals/body_acc_y_train.txt
train/Inertial Signals/body_acc_z_train.txt
train/Inertial Signals/body_gyro_x_train.txt
train/Inertial Signals/body_gyro_y_train.txt
train/Inertial Signals/body_gyro_z_train.txt
train/Inertial Signals/total_acc_x_train.txt
train/Inertial Signals/total_acc_y_train.txt
train/Inertial Signals/total_acc_z_train.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt
test/Inertial Signals/body_acc_x_test.txt
test/Inertial Signals/body_acc_y_test.txt
test/Inertial Signals/body_acc_z_test.txt
test/Inertial Signals/body_gyro_x_test.txt
test/Inertial Signals/body_gyro_y_test.txt
test/Inertial Signals/body_gyro_z_test.txt
test/Inertial Signals/total_acc_x_test.txt
test/Inertial Signals/total_acc_y_test.txt
test/Inertial Signals/total_acc_z_test.txt
test/subject_test.txt
test/X_test.txt
test/y_test.txt
```
The `README.txt` contains information about the experiment and data files included in the data set.  The `features_info.txt` describes the features used in this data set.

The `features.txt` contains the complete list of variables of each feature vector.  The `activity_labels.txt` contains the descriptive activity names. These files will be used in this project.

The data files found in the `train/Inertial Signals` and `test/Inertial Signals` directories are raw data captured in the experiment.  These data files will not be used in this project.

The `train/subject_train.txt` contains the subjects in the training set.  The `train/X_train.txt` is the features data in the training set.  The `train/y_train.txt` contains the corresponding activities performed by the subjects in the training set.  These files will be used in this project.

The `test/subject_test.txt` contains the subjects in the test set.  The `test/X_test.txt` is the features data in the test set.  The `test/y_test.txt` contains the corresponding activities performed by the subjects in the test set.  These files will be used in this project.
___

## Progressing the Data
I am supposed to merge the data in the training set and test set into one single set of data.  I have merged `subject_train.txt` with `subject_test.txt`, `X_train.txt` with `X_test.txt` and `y_train.txt` with `y_test.txt` using rbind.  

I leave the merging of the subject, activity and measurement set (`X_train.txt` and `X_test.txt`) at the later part.  This is because we only want to retain measurements with mean and standard deviation measurement.  It will be easier to do that before the measurement set gets merged.  In order to achieve this goal, I used grepl to search the 561 feature labels from `features.txt` for the pattern "mean|std".  The result from grepl is a logical vector where value will be set to TRUE if there is a match.  The logical vector is used to subset the columns that I want to keep in the measurement set.

Feature labels with the word Mean (capital M) was not included because they are used in the angle variable and not really a measurement of mean.  The subsetting has also dropped the bandsEnergy variables which are having duplication.

After retaining only the measurements I need in the measurement set, I merged subject, activity and measurement set using cbind.  This formed the single data set.  I had then provided descriptive names for the variables in the single data set.  For the subject and activity variables, I have given the names "Subject" and "ActivityID".  I have used "ActivityID" because the value is still in numeric form at that point of time.  For the rest of measurement variables, the names come from the subsetted feature labels which have either the word "mean" or "std" in the name.

Next I need to replace the values of the activity variable with descriptive activity name.  In order to do that, I loaded the activity names from `activity_labels.txt` into a data frame.  Each of the activity name has a key in the data frame that allows us to link to the "ActivityID" variable in the single data set.  Using this key, I did an inner join to add a new variable in the single data set with the matching activity name populated.  I named this new variable as "Activity".  I had then removed the "ActivityID" variable which is numberic representation of the activities.

Finally the goal is to create a tidy data set with with the average of each measurement variable for each activity and each subject.  I had used the group_by function to group the single data set by "Subject" and "Activity".  The grouped data set was then piped into the summarize_each function to compute the mean of each measurement variable for each activity and each subject.  The resultant tidy data set was then written to TidyData.txt using the write.table function.
___

## Tidy Data Set

According to Hadley Wickham, a tidy data set needs to have the following 3 characteristics.

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

In this tiday data set, Subject and Activity are the Fixed variables representing the volunteer and activity performed by the volunteer respectively.  The rest are measured variables each representing mean of different signal for each subject and activity.  Therefore it conforms to the first characteristic.

For each of the measured variable in this tidy data set, it belongs to excactly one set of subject and activity.  Therefore it conforms to the second characteristic.

The observations in this tidy data set are the mean of different signal for each subject and activity from the ADL experiment.  Therefore it conforms to the third characteristic.

The following describes the variables in the final Tidy Data Set.

### Subject
```
Description   : The volunteers taking part in the experimenet.  
                There are 30 volunteers and each number represents 1 volunteer.
Class         : Integer
Value         : 1 to 30
```

### Activity
```
Description   : The six activities to be performed by each volunteer.
Class         : Character
Value         : WALKING
                WALKING_UPSTAIRS
                WALKING_DOWNSTAIRS
                SITTING
                STANDING
                LAYING
```

### tBodyAcc-mean()-X	
```
Description   : The mean of the time domain body acceleration signal in x axis.  
                In this Tidy Data Set, each value of tBodyAcc-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAcc-mean()-Y	
```
Description   : The mean of the time domain body acceleration signal in y axis.  
                In this Tidy Data Set, each value of tBodyAcc-mean()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAcc-mean()-Z	
```
Description   : The mean of the time domain body acceleration signal in z axis.  
                In this Tidy Data Set, each value of tBodyAcc-mean()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAcc-std()-X	
```
Description   : The standard deviation of the time domain body acceleration signal in x axis.  
                In this Tidy Data Set, each value of tBodyAcc-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAcc-std()-Y	
```
Description   : The standard deviation of the time domain body acceleration signal in y axis.  
                In this Tidy Data Set, each value of tBodyAcc-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAcc-std()-Z	
```
Description   : The standard deviation of the time domain body acceleration signal in z axis.  
                In this Tidy Data Set, each value of tBodyAcc-std()-Z	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tGravityAcc-mean()-X	
```
Description   : The mean of the time domain gravity acceleration signal in x axis.  
                In this Tidy Data Set, each value of tGravityAcc-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tGravityAcc-mean()-Y	
```
Description   : The mean of the time domain gravity acceleration signal in y axis.  
                In this Tidy Data Set, each value of tGravityAcc-mean()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tGravityAcc-mean()-Z	
```
Description   : The mean of the time domain gravity acceleration signal in z axis.  
                In this Tidy Data Set, each value of tGravityAcc-mean()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tGravityAcc-std()-X	
```
Description   : The standard deviation of the time domain gravity acceleration signal in x axis.  
                In this Tidy Data Set, each value of tGravityAcc-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tGravityAcc-std()-Y	
```
Description   : The standard deviation of the time domain gravity acceleration signal in y axis.  
                In this Tidy Data Set, each value of tGravityAcc-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tGravityAcc-std()-Z	
```
Description   : The standard deviation of the time domain gravity acceleration signal in z axis.  
                In this Tidy Data Set, each value of tGravityAcc-std()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccJerk-mean()-X	
```
Description   : The mean of the time domain body acceleration jerk signal in x axis.  
                In this Tidy Data Set, each value of tBodyAccJerk-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccJerk-mean()-Y	
```
Description   : The mean of the time domain body acceleration jerk signal in y axis.  
                In this Tidy Data Set, each value of tBodyAccJerk-mean()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccJerk-mean()-Z	
```
Description   : The mean of the time domain body acceleration jerk signal in z axis.  
                In this Tidy Data Set, each value of tBodyAccJerk-mean()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccJerk-std()-X	
```
Description   : The standard deviation of the time domain body acceleration jerk signal in x axis.  
                In this Tidy Data Set, each value of tBodyAccJerk-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccJerk-std()-Y	
```
Description   : The standard deviation of the time domain body acceleration jerk signal in y axis.  
                In this Tidy Data Set, each value of tBodyAccJerk-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccJerk-std()-Z	
```
Description   : The standard deviation of the time domain body acceleration jerk signal in z axis.  
                In this Tidy Data Set, each value of tBodyAccJerk-std()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-mean()-X	
```
Description   : The mean of the time domain body gyroscope signal in x axis.  
                In this Tidy Data Set, each value of tBodyGyro-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-mean()-Y	
```
Description   : The mean of the time domain body gyroscope signal in y axis.  
                In this Tidy Data Set, each value of tBodyGyro-mean()-Y	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-mean()-Z	
```
Description   : The mean of the time domain body gyroscope signal in z axis.  
                In this Tidy Data Set, each value of tBodyGyro-mean()-Z	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-std()-X	
```
Description   : The standard deviation of the time domain body gyroscope signal in x axis.  
                In this Tidy Data Set, each value of tBodyGyro-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-std()-Y	
```
Description   : The standard deviation of the time domain body gyroscope signal in y axis.  
                In this Tidy Data Set, each value of tBodyGyro-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-std()-Z	
```
Description   : The standard deviation of the time domain body gyroscope signal in z axis.  
                In this Tidy Data Set, each value of tBodyGyro-std()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-mean()-X	
````
Description   : The mean of the time domain body gyroscope jerk signal in x axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-mean()-Y	
```
Description   : The mean of the time domain body gyroscope jerk signal in y axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-mean()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-mean()-Z	
```
Description   : The mean of the time domain body gyroscope jerk signal in z axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-mean()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-std()-X	
```
Description   : The standard deviation of the time domain body gyroscope jerk signal in x axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-std()-Y	
```
Description   : The standard deviation of the time domain body gyroscope jerk signal in y axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-std()-Z	
```
Description   : The standard deviation of the time domain body gyroscope jerk signal in z axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-std()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccMag-mean()	
```
Description   : Mean of the magnitude of time domain body acceleration signal in all 3 axes.  
                In this Tidy Data Set, each value of tBodyAccMag-mean()	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccMag-std()	
```
Description   : Standard deviation of the magnitude of time domain body acceleration signal in all 3 axes.  
                In this Tidy Data Set, each value of tBodyAccMag-mean()	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tGravityAccMag-mean()	
```
Description   : Mean of the magnitude of time domain gravity acceleration signal in all 3 axes.  
                In this Tidy Data Set, each value of tGravityAccMag-mean() is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tGravityAccMag-std()	
```
Description   : Standard deviation of the magnitude of time domain gravity acceleration signal in all 3 axes.  
                In this Tidy Data Set, each value of tGravityAccMag-std()	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccJerkMag-mean()	
```
Description   : Mean of the magnitude of time domain body acceleration jerk signal in all 3 axes.  
                In this Tidy Data Set, each value of tBodyAccJerkMag-mean()	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccJerkMag-std()	
```
Description   : Standard deviation of the magnitude of time domain body acceleration jerk signal in all 3 axes.  
                In this Tidy Data Set, each value of tBodyAccJerkMag-std()	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroMag-mean()	
```
Description   : Mean of the magnitude of time domain body gyroscope signal in all 3 axes.  
                In this Tidy Data Set, each value of tBodyGyroMag-mean() is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroMag-std()	
```
Description   : Standard deviation of the magnitude of time domain body gyroscope signal in all 3 axes.  
                In this Tidy Data Set, each value of tBodyGyroMag-std() is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerkMag-mean()	
```
Description   : Mean of the magnitude of time domain body gyroscope jerk signal in all 3 axes.  
                In this Tidy Data Set, each value of tBodyGyroJerkMag-mean() is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerkMag-std()	
```
Description   : Standard deviation of the magnitude of time domain body gyroscope jerk signal in all 3 axes.  
                In this Tidy Data Set, each value of tBodyGyroJerkMag-std() is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-mean()-X	
```
Description   : Mean of the frequency domain body acceleration signal in x axis.  
                In this Tidy Data Set, each value of fBodyAcc-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-mean()-Y	
```
Description   : Mean of the frequency domain body acceleration signal in y axis.  
                In this Tidy Data Set, each value of fBodyAcc-mean()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-mean()-Z	
```
Description   : Mean of the frequency domain body acceleration signal in z axis.  
                In this Tidy Data Set, each value of fBodyAcc-mean()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-std()-X	
```
Description   : Standard deviation of the frequency domain body acceleration signal in x axis.  
                In this Tidy Data Set, each value of fBodyAcc-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-std()-Y	
```
Description   : Standard deviation of the frequency domain body acceleration signal in y axis.  
                In this Tidy Data Set, each value of fBodyAcc-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-std()-Z	
```
Description   : Standard deviation of the frequency domain body acceleration signal in z axis.  
                In this Tidy Data Set, each value of fBodyAcc-std()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-meanFreq()-X	
```
Description   : Mean frequency of the frequency domain body acceleration signal in x axis.  
                In this Tidy Data Set, each value of fBodyAcc-meanFreq()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-meanFreq()-Y	
```
Description   : Mean frequency of the frequency domain body acceleration signal in y axis.  
                In this Tidy Data Set, each value of fBodyAcc-meanFreq()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAcc-meanFreq()-Z	
```
Description   : Mean frequency of the frequency domain body acceleration signal in z axis.  
                In this Tidy Data Set, each value of fBodyAcc-meanFreq()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAccJerk-mean()-X	
```
Description   : Mean of the frequency domain body acceleration jerk signal in x axis.  
                In this Tidy Data Set, each value of fBodyAccJerk-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAccJerk-mean()-Y	
```
Description   : Mean of the frequency domain body acceleration jerk signal in y axis.  
                In this Tidy Data Set, each value of fBodyAccJerk-mean()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAccJerk-mean()-Z	
```
Description   : Mean of the frequency domain body acceleration jerk signal in z axis.  
                In this Tidy Data Set, each value of fBodyAccJerk-mean()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAccJerk-std()-X	
```
Description   : Standard deviation of the frequency domain body acceleration jerk signal in x axis.  
                In this Tidy Data Set, each value of fBodyAccJerk-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAccJerk-std()-Y	
```
Description   : Standard deviation of the frequency domain body acceleration jerk signal in y axis.  
                In this Tidy Data Set, each value of fBodyAccJerk-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAccJerk-std()-Z	
```
Description   : Standard deviation of the frequency domain body acceleration jerk signal in z axis.  
                In this Tidy Data Set, each value of fBodyAccJerk-std()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### fBodyAccJerk-meanFreq()-X	
```
Min.   :-0.57604
	1st Qu.:-0.28966
	Median :-0.06091
	Mean   :-0.06910
	3rd Qu.: 0.17660
	Max.   : 0.33145
```

### fBodyAccJerk-meanFreq()-Y	
```
Min.   :-0.60197
	1st Qu.:-0.39751
	Median :-0.23209
	Mean   :-0.22810
	3rd Qu.:-0.04721
	Max.   : 0.19568
```

### fBodyAccJerk-meanFreq()-Z	
```
Min.   :-0.62756
	1st Qu.:-0.30867
	Median :-0.09187
	Mean   :-0.13760
	3rd Qu.: 0.03858
	Max.   : 0.23011
```

### fBodyGyro-mean()-X	
```
Min.   :-0.9931
	1st Qu.:-0.9697
	Median :-0.7300
	Mean   :-0.6367
	3rd Qu.:-0.3387
	Max.   : 0.4750
```

### fBodyGyro-mean()-Y	
```
Min.   :-0.9940
	1st Qu.:-0.9700
	Median :-0.8141
	Mean   :-0.6767
	3rd Qu.:-0.4458
	Max.   : 0.3288
```

### fBodyGyro-mean()-Z	
```
Min.   :-0.9860
	1st Qu.:-0.9624
	Median :-0.7909
	Mean   :-0.6044
	3rd Qu.:-0.2635
	Max.   : 0.4924
```

### fBodyGyro-std()-X	
```
Min.   :-0.9947
	1st Qu.:-0.9750
	Median :-0.8086
	Mean   :-0.7110
	3rd Qu.:-0.4813
	Max.   : 0.1966
```

### fBodyGyro-std()-Y	
```
Min.   :-0.9944
	1st Qu.:-0.9602
	Median :-0.7964
	Mean   :-0.6454
	3rd Qu.:-0.4154
	Max.   : 0.6462
```

### fBodyGyro-std()-Z	
```
Min.   :-0.9867
	1st Qu.:-0.9643
	Median :-0.8224
	Mean   :-0.6577
	3rd Qu.:-0.3916
	Max.   : 0.5225
```

### fBodyGyro-meanFreq()-X	
```
Min.   :-0.395770
	1st Qu.:-0.213363
	Median :-0.115527
	Mean   :-0.104551
	3rd Qu.: 0.002655
	Max.   : 0.249209
```

### fBodyGyro-meanFreq()-Y	
```
Min.   :-0.66681
	1st Qu.:-0.29433
	Median :-0.15794
	Mean   :-0.16741
	3rd Qu.:-0.04269
	Max.   : 0.27314
```

### fBodyGyro-meanFreq()-Z	
```
Min.   :-0.50749
	1st Qu.:-0.15481
	Median :-0.05081
	Mean   :-0.05718
	3rd Qu.: 0.04152
	Max.   : 0.37707
```

### fBodyAccMag-mean()	
```
Min.   :-0.9868
	1st Qu.:-0.9560
	Median :-0.6703
	Mean   :-0.5365
	3rd Qu.:-0.1622
	Max.   : 0.5866
```

### fBodyAccMag-std()	
```
Min.   :-0.9876
	1st Qu.:-0.9452
	Median :-0.6513
	Mean   :-0.6210
	3rd Qu.:-0.3654
	Max.   : 0.1787
```

### fBodyAccMag-meanFreq()	
```
Min.   :-0.31234
	1st Qu.:-0.01475
	Median : 0.08132
	Mean   : 0.07613
	3rd Qu.: 0.17436
	Max.   : 0.43585
```

### fBodyBodyAccJerkMag-mean()	
```
Min.   :-0.9940
	1st Qu.:-0.9770
	Median :-0.7940
	Mean   :-0.5756
	3rd Qu.:-0.1872
	Max.   : 0.5384
```

### fBodyBodyAccJerkMag-std()	
```
Min.   :-0.9944
	1st Qu.:-0.9752
	Median :-0.8126
	Mean   :-0.5992
	3rd Qu.:-0.2668
	Max.   : 0.3163
```

### fBodyBodyAccJerkMag-meanFreq()	
```
Min.   :-0.12521
	1st Qu.: 0.04527
	Median : 0.17198
	Mean   : 0.16255
	3rd Qu.: 0.27593
	Max.   : 0.48809
```

### fBodyBodyGyroMag-mean()	
```
Min.   :-0.9865
	1st Qu.:-0.9616
	Median :-0.7657
	Mean   :-0.6671
	3rd Qu.:-0.4087
	Max.   : 0.2040
```

### fBodyBodyGyroMag-std()	
```
Min.   :-0.9815
	1st Qu.:-0.9488
	Median :-0.7727
	Mean   :-0.6723
	3rd Qu.:-0.4277
	Max.   : 0.2367
```

### fBodyBodyGyroMag-meanFreq()	
```
Min.   :-0.45664
	1st Qu.:-0.16951
	Median :-0.05352
	Mean   :-0.03603
	3rd Qu.: 0.08228
	Max.   : 0.40952
```

### fBodyBodyGyroJerkMag-mean()	
```
Min.   :-0.9976
	1st Qu.:-0.9813
	Median :-0.8779
	Mean   :-0.7564
	3rd Qu.:-0.5831
	Max.   : 0.1466
```

### fBodyBodyGyroJerkMag-std()	
```
Min.   :-0.9976
	1st Qu.:-0.9802
	Median :-0.8941
	Mean   :-0.7715
	3rd Qu.:-0.6081
	Max.   : 0.2878
```

### fBodyBodyGyroJerkMag-meanFreq()
```
Min.   :-0.18292
	1st Qu.: 0.05423
	Median : 0.11156
	Mean   : 0.12592
	3rd Qu.: 0.20805
	Max.   : 0.42630
```
