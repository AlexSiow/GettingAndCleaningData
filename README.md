# Getting and Cleaning Data Project

The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

I will need to create a R script called run_analysis.R that does the following. 
```
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the 
   average of each variable for each activity and each subject.
```

## Incuded the submission
|No.|File           |Description                                   |
|---|---------------|----------------------------------------------|
|1  |TidyData.txt   |The tidy data set.                            |
|2  |run_analysis.R |The R script that produces the tidy data set. |
|3  |CodeBook.md    |The code book that describes the variables, the data, and any transformations or work that was performed to clean up the data. |
|4  |README.md      | The README.md file which explains how all of the scripts work and how they are connected. |


## Reproducing the tidy data set

Download and place the **run_analysis.R** script in your R working directory.  You may use the getwd() function to find out what is your working directory.

Using either R Console or RStudio, type **source("run_analysis.R")** in the console to load the **run_analysis.R** script from your working directory and run it.

The script will download the zipped source data **UCIHARDataset.zip**.  It will then unzip **UCIHARDataset.zip** in your working directory.

The script will then perform the data processing


