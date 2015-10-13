# Code Book #
*Written by Siow Yong Teck*

## Introduction

The [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for this assignment is based on the data collected through an experiment conducted using Samsung Galaxy S smartphone.  Information about the experiment can be found at the [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

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
The `README.txt` contains information about the experiment and data files included in the data set.

The `features_info.txt` describes the features used in this data set.

The `features.txt` contains the complete list of variables of each feature vector.  This file will be used in this assignment.

The `activity_labels.txt` contains the descriptive activity names. This file will be used in this assignment.

The data files found in the `train/Inertial Signals` and `test/Inertial Signals` directories are raw data captured in the experiment.  These data files will not be used in this assignment.

The `train/subject_train.txt` contains the subjects in the training data.  The `train/X_train.txt` is the training set and `train/y_train.txt` contains descriptive activity names.
