# Getting and Cleaning Data Project

*Prepared by Siow Yong Teck*

The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

I will need to create a R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the 
   average of each variable for each activity and each subject.


## Incuded the submission
|No.|File           |Description                                   |
|---|---------------|----------------------------------------------|
|1  |TidyData.txt   |The tidy data set.                            |
|2  |run_analysis.R |The R script that produces the tidy data set. |
|3  |CodeBook.md    |The code book that describes the variables, the data, and any transformations or work that was performed to clean up the data. |
|4  |README.md      | The README.md file which explains how all of the scripts work and how they are connected. |


## Reproducing the tidy data set

1. The script requires the **dplyr** package to be installed.  You may use **install.packages("dplyr")** to install the **dplyr** package if it is not installed yet.

2. Download and place the **run_analysis.R** script in your R working directory.  You may use the **getwd()** function to find out what is your working directory.

3. Using either R Console or RStudio, type **source("run_analysis.R")** in the console to load the **run_analysis.R** script from your working directory and run it.

4. The script will download the zipped source data **UCIHARDataset.zip**.  It will then unzip **UCIHARDataset.zip** in your working directory.

5. The script will then process and clean up the data as described in the *Processing the Data* section in the *CodeBook.md*.

6. Finally, the script will write the tidy data set into **TidyData.txt** located in your working directory.  The **TidyData.txt** is created using the *write.table* function with *row.names* set to *FALSE*.

7. You can use the following code snippet to read the tidy data set from **TidyData.txt** and view it in a tabular format.
```
data<-read.table("TidyData.txt", header = TRUE)
View(data)
```


