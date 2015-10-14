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

Each variable forms a column.
Each observation forms a row.
Each type of observational unit forms a table.

## The Tidy Data Set

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
Description   : The mean of the time domain body gyroscope measurement in x axis.  
                In this Tidy Data Set, each value of tBodyGyro-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-mean()-Y	
```
Description   : The mean of the time domain body gyroscope measurement in y axis.  
                In this Tidy Data Set, each value of tBodyGyro-mean()-Y	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-mean()-Z	
```
Description   : The mean of the time domain body gyroscope measurement in z axis.  
                In this Tidy Data Set, each value of tBodyGyro-mean()-Z	is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-std()-X	
```
Description   : The standard deviation of the time domain body gyroscope measurement in x axis.  
                In this Tidy Data Set, each value of tBodyGyro-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-std()-Y	
```
Description   : The standard deviation of the time domain body gyroscope measurement in y axis.  
                In this Tidy Data Set, each value of tBodyGyro-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyro-std()-Z	
```
Description   : The standard deviation of the time domain body gyroscope measurement in z axis.  
                In this Tidy Data Set, each value of tBodyGyro-std()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-mean()-X	
````
Description   : The mean of the time domain body gyroscope jerk measurement in x axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-mean()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-mean()-Y	
```
Description   : The mean of the time domain body gyroscope jerk measurement in y axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-mean()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-mean()-Z	
```
Description   : The mean of the time domain body gyroscope jerk measurement in z axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-mean()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-std()-X	
```
Description   : The standard deviation of the time domain body gyroscope jerk measurement in x axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-std()-X is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-std()-Y	
```
Description   : The standard deviation of the time domain body gyroscope jerk measurement in y axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-std()-Y is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyGyroJerk-std()-Z	
```
Description   : The standard deviation of the time domain body gyroscope jerk measurement in z axis.  
                In this Tidy Data Set, each value of tBodyGyroJerk-std()-Z is the average for each 
                activity and each subject.
Class         : Numeric
Value         : -1.0000000 to 1.00000000
```

### tBodyAccMag-mean()	
```
Min.   :-0.9865
	1st Qu.:-0.9573
	Median :-0.4829
	Mean   :-0.4973
	3rd Qu.:-0.0919
	Max.   : 0.6446
```

### tBodyAccMag-std()	
```
Min.   :-0.9865
	1st Qu.:-0.9430
	Median :-0.6074
	Mean   :-0.5439
	3rd Qu.:-0.2090
	Max.   : 0.4284
```

### tGravityAccMag-mean()	
```
Min.   :-0.9865
	1st Qu.:-0.9573
	Median :-0.4829
	Mean   :-0.4973
	3rd Qu.:-0.0919
	Max.   : 0.6446
```

### tGravityAccMag-std()	
```
Min.   :-0.9865
	1st Qu.:-0.9430
	Median :-0.6074
	Mean   :-0.5439
	3rd Qu.:-0.2090
	Max.   : 0.4284
```

### tBodyAccJerkMag-mean()	
```
Min.   :-0.9928
	1st Qu.:-0.9807
	Median :-0.8168
	Mean   :-0.6079
	3rd Qu.:-0.2456
	Max.   : 0.4345
```

### tBodyAccJerkMag-std()	
```
Min.   :-0.9946
	1st Qu.:-0.9765
	Median :-0.8014
	Mean   :-0.5842
	3rd Qu.:-0.2173
	Max.   : 0.4506
```

### tBodyGyroMag-mean()	
```
Min.   :-0.9807
	1st Qu.:-0.9461
	Median :-0.6551
	Mean   :-0.5652
	3rd Qu.:-0.2159
	Max.   : 0.4180
```

### tBodyGyroMag-std()	
```
Min.   :-0.9814
	1st Qu.:-0.9476
	Median :-0.7420
	Mean   :-0.6304
	3rd Qu.:-0.3602
	Max.   : 0.3000
```

### tBodyGyroJerkMag-mean()	
```
Min.   :-0.99732
	1st Qu.:-0.98515
	Median :-0.86479
	Mean   :-0.73637
	3rd Qu.:-0.51186
	Max.   : 0.08758
```

### tBodyGyroJerkMag-std()	
```
Min.   :-0.9977
	1st Qu.:-0.9805
	Median :-0.8809
	Mean   :-0.7550
	3rd Qu.:-0.5767
	Max.   : 0.2502
```

### fBodyAcc-mean()-X	
```
Min.   :-0.9952
	1st Qu.:-0.9787
	Median :-0.7691
	Mean   :-0.5758
	3rd Qu.:-0.2174
	Max.   : 0.5370
```

### fBodyAcc-mean()-Y	
```
Min.   :-0.98903
	1st Qu.:-0.95361
	Median :-0.59498
	Mean   :-0.48873
	3rd Qu.:-0.06341
	Max.   : 0.52419
```

### fBodyAcc-mean()-Z	
```
Min.   :-0.9895
	1st Qu.:-0.9619
	Median :-0.7236
	Mean   :-0.6297
	3rd Qu.:-0.3183
	Max.   : 0.2807
```

### fBodyAcc-std()-X	
```
Min.   :-0.9966
	1st Qu.:-0.9820
	Median :-0.7470
	Mean   :-0.5522
	3rd Qu.:-0.1966
	Max.   : 0.6585
```

### fBodyAcc-std()-Y	
```
Min.   :-0.99068
	1st Qu.:-0.94042
	Median :-0.51338
	Mean   :-0.48148
	3rd Qu.:-0.07913
	Max.   : 0.56019
```

### fBodyAcc-std()-Z	
```
Min.   :-0.9872
	1st Qu.:-0.9459
	Median :-0.6441
	Mean   :-0.5824
	3rd Qu.:-0.2655
	Max.   : 0.6871
```

### fBodyAcc-meanFreq()-X	
```
Min.   :-0.63591
	1st Qu.:-0.39165
	Median :-0.25731
	Mean   :-0.23227
	3rd Qu.:-0.06105
	Max.   : 0.15912
```

### fBodyAcc-meanFreq()-Y	
```
Min.   :-0.379518
	1st Qu.:-0.081314
	Median : 0.007855
	Mean   : 0.011529
	3rd Qu.: 0.086281
	Max.   : 0.466528
```

### fBodyAcc-meanFreq()-Z	
```
Min.   :-0.52011
	1st Qu.:-0.03629
	Median : 0.06582
	Mean   : 0.04372
	3rd Qu.: 0.17542
	Max.   : 0.40253
```

### fBodyAccJerk-mean()-X	
```
Min.   :-0.9946
	1st Qu.:-0.9828
	Median :-0.8126
	Mean   :-0.6139
	3rd Qu.:-0.2820
	Max.   : 0.4743
```

### fBodyAccJerk-mean()-Y	
```
Min.   :-0.9894
	1st Qu.:-0.9725
	Median :-0.7817
	Mean   :-0.5882
	3rd Qu.:-0.1963
	Max.   : 0.2767
```

### fBodyAccJerk-mean()-Z	
```
Min.   :-0.9920
	1st Qu.:-0.9796
	Median :-0.8707
	Mean   :-0.7144
	3rd Qu.:-0.4697
	Max.   : 0.1578
```

### fBodyAccJerk-std()-X	
```
Min.   :-0.9951
	1st Qu.:-0.9847
	Median :-0.8254
	Mean   :-0.6121
	3rd Qu.:-0.2475
	Max.   : 0.4768
```

### fBodyAccJerk-std()-Y	
```
Min.   :-0.9905
	1st Qu.:-0.9737
	Median :-0.7852
	Mean   :-0.5707
	3rd Qu.:-0.1685
	Max.   : 0.3498
```

### fBodyAccJerk-std()-Z	
```
Min.   :-0.993108
	1st Qu.:-0.983747
	Median :-0.895121
	Mean   :-0.756489
	3rd Qu.:-0.543787
	Max.   :-0.006236
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
