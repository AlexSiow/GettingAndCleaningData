# Code Book #
*Written by Siow Yong Teck*

## Introduction

The [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is collected through an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years.

### The Experiment
In the experiment, each volunteer performed the following six activities while wearing a Samsung Galaxy S II smartphone on the waist.
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

Using the accelerometer and gyroscope embedded in the smartphone, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  This means that dataset from 21 voluteers will go to the training data and dataset from 9 voluteers will go to the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


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
