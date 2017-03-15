########################################################################################
# File: run_analysis.R
# Date: 3/11/17 
# Author: Vincent Palacios
########################################################################################



########################################################################################
# 0. BRIEF DESCRIPTION
########################################################################################
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


########################################################################################
# 1. CLEAR ENVIRONMENT, REQUIRE PACKAGES NEEDED
########################################################################################
#remove all objects
rm(list=ls())
sessionInfo()

# Move to the 'datadir' folder 
datadir <- "/Users/vincent/VP_GitLibrary/datasciencecoursera"
setwd(datadir)



########################################################################################
# 1. CLEAR ENVIRONMENT, REQUIRE PACKAGES NEEDED
########################################################################################
if (!file.exists("UCI HAR Dataset.zip")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "UCI HAR Dataset.zip")
  unzip("UCI HAR Dataset.zip")
}
dir("./UCI HAR Dataset/train")



########################################################################################
# 1. CLEAR ENVIRONMENT, REQUIRE PACKAGES NEEDED
########################################################################################


#### Step 1.Merge the training and the test sets to create one data set
rawtraindata <- read.table("./UCI HAR Dataset/train/subject_train.txt")
dim(rawtraindata)
rawtestdata <- read.table("./UCI HAR Dataset/test/subject_test.txt")
dim(rawtestdata)
rawdata <- rbind(rawtraindata,rawtestdata)
dim(rawdata)

extractdata$psuedo_id <- seq.int(nrow(extractdata))

rawtraindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
dim(rawtraindata)
rawtestdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(rawtestdata)
rawdata <- rbind(rawtraindata,rawtestdata)
dim(rawdata)


#### Step 2. Extract only the measurements on the mean and standard deviation for each measurement
rawdatanames <- read.table("./UCI HAR Dataset/features.txt")
extractcol <- grep("mean()|std()", rawdatanames[,2])
extractdata <- rawdata[,extractcol]
dim(extractdata)


#### Step 3. Use descriptive activity names to name the activities in the data set
acttrainlabeldata <- read.table("./UCI HAR Dataset/train/y_train.txt")
dim(acttrainlabeldata)
acttestlabeldata <- read.table("./UCI HAR Dataset/test/y_test.txt")
dim(acttestlabeldata)
actlabeldata <- rbind(acttrainlabeldata,acttestlabeldata)
dim(actlabeldata)
colnames(actlabeldata) <- "activity_id"

extractdata <- cbind(extractdata, actlabeldata)
dim(extractdata)
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activitylabels) <- c("activity_id", "activity_label")

extractdata = merge(extractdata, activitylabels, by.x = "activity_id", by.y = "activity_id")
with(extractdata, table(activity_id, activity_label))


#### Step 4. Appropriately labels the data set with descriptive variable names
extractcolnames <- as.character(rawdatanames[extractcol,2])
colnames(extractdata)[2:80] <- extractcolnames
head(extractdata)



#### Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table( ,row.name=FALSE)