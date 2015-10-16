library(dplyr)

# Downloading the zip file containing the dataset and unzip into the current
# working directory.
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, "UCIHARDataset.zip")
unzip("UCIHARDataset.zip")

# Read the Subjects, Activities and variable Data from the training set
# and assign them to dfTrainSubject, dfTrainActivity and dfTrainSet respectively.
dfTrainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
dfTrainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")
dfTrainSet <- read.table("UCI HAR Dataset/train/X_train.txt")

# Read the Subjects, Activities and variable Data from the test set
# and assign them to dfTestSubject, dfTestActivity and dfTestSet respectively.
dfTestSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
dfTestActivity <- read.table("UCI HAR Dataset/test/y_test.txt")
dfTestSet <- read.table("UCI HAR Dataset/test/X_test.txt")

# Combine the Subjects in the training and test set and assign to dfSubject
dfSubject <- rbind(dfTrainSubject, dfTestSubject)
# Combine the Activities in the training and test set and assign to dfActivity
dfActivity <- rbind(dfTrainActivity, dfTestActivity)
# Combine the variable Data in the training and test set and assign to dfSet
dfSet <- rbind(dfTrainSet, dfTestSet)

# Read the list of variable names and assign to dfFeatures
dfFeatures <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# Using grepl to search the second column of the list of
# variable names for the words mean or std.  This will return
# a logical vector where TRUE means a match.  The Mean (with capital M)
# was left out from the search because it is actually part of
# the angle measurement and not a mean measure.
onlyMeanAndStdCols <- grepl("mean|std", dfFeatures$V2)

# Using the logical vector to subset the columns of dfSet.
# Only columns with TRUE in the logical vector will be retained.
dfSet <- dfSet[,onlyMeanAndStdCols]

# Combine the the complete Subjects, Activies and variable Data.
dfMeanAndStd <- cbind(dfSubject, dfActivity, dfSet)

# Contruct the header for the combined dataset and apply it to the dataset.
featureLabel <- dfFeatures$V2[onlyMeanAndStdCols]
label <- c("Subject", "ActivityID", featureLabel)
names(dfMeanAndStd) <- label

# Read the list of Activity Labels and assign to dfActivityLabel.
dfActivityLabel <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# Assign header names to dfActivityLabel
names(dfActivityLabel) <- c("ActivityID", "Activity")

# Merge dfMeanAndStd with dfActivityLabel using the ActivityID column.
# The merge will create a new Activity column in dfMeanAndStd with activity
# name that matches the activity number.  ActivityID will then be removed
# from dfMeanAndStd.
dfMeanAndStd <- left_join(dfMeanAndStd, dfActivityLabel, by = "ActivityID")
dfMeanAndStd$ActivityID <- NULL

# Using the group_by function to group dfMeanAndStd by Subject and Activity.
# Pipe the result to summarize_each function to compute the mean for each of the
# feature.  This will result in a tidy dataset with the average of each variable for 
# each activity and each subject.
dfTidyData <- group_by(dfMeanAndStd, Subject, Activity) %>% summarize_each(funs(mean))

# Finally write the tidy dataset to TidyData.txt without row name.
write.table(dfTidyData, file = "TidyData.txt", row.names = FALSE)