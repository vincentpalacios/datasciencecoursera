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
subtraindata <- read.table("./UCI HAR Dataset/train/subject_train.txt")
labtraindata <- read.table("./UCI HAR Dataset/train/y_train.txt")
rawtraindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
traindata <- cbind(subtraindata,labtraindata,rawtraindata)
head(traindata)[1:6]

subtestdata <- read.table("./UCI HAR Dataset/test/subject_test.txt")
labtestdata <- read.table("./UCI HAR Dataset/test/y_test.txt")
rawtestdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
testdata <- cbind(subtestdata,labtestdata,rawtestdata)
head(testdata)[1:6]

rawdata <- rbind(traindata,testdata)
colnames(rawdata)[1:2] <- c("subject_id", "activity_id")
head(rawdata)[1:6]
dim(rawdata)

#### Step 2. Extract only the measurements on the mean and standard deviation for each measurement
varnames <- read.table("./UCI HAR Dataset/features.txt")
extractcol <- grep("mean()|std()", varnames[,2])
extractdata <- rawdata[,append(extractcol+2, 1:2, after = 0)]
head(extractdata)[1:6]


#### Step 3. Use descriptive activity names to name the activities in the data set
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activitylabels) <-  c("activity_id", "activity_label")

extractdata = merge(activitylabels, extractdata, by.x = "activity_id", by.y = "activity_id")
head(extractdata)[c(1:7)]
with(extractdata, table(activity_id, activity_label))
extractdata <- subset( extractdata, select = -c(activity_id) )


#### Step 4. Appropriately labels the data set with descriptive variable names
extractcolnames <- as.character(varnames[extractcol,2])
colnames(extractdata)[3:81] <- extractcolnames
head(extractdata)


#### Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- recast(extractdata, subject_id + activity_label~ variable, mean, id.var = c("activity_label", "subject_id"))
#tidydata2 <- aggregate(. ~ activity_label + subject_id, data = extractdata, FUN= "mean")


library(reshape2)
tidydata2 <- recast(extractdata, activity_id + subject_id ~ variable, mean, id.var = c("activity_id", "subject_id", "psuedo_id"))
gg <- melt(extractdata, id.var = c("activity_id", "subject_id", "psuedo_id"))
head(gg)
class(gg$variable)
levels(gg$variable)

data <- subset( extractdata, select = -c(activity_id, psuedo_id ) )
gg2 <- melt(data, id.var = c("activity_label", "subject_id"))
gg3 <- dcast(gg2, subject_id + activity_label~ variable, mean)

with(extractdata, tapply(extractdata$tBodyAcc-mean()-X, c(subject_id,activity_id), mean))
aggregate(. ~ subject_id + activity_id, data = extractdata, FUN= "mean" )


write.table( ,row.name=FALSE)

#https://www.r-bloggers.com/a-quick-primer-on-split-apply-combine-problems/