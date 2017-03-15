tidydata.txt Code Book
===================
This is the code book for the tidydata.txt dataset, which is the final project for the "Getting and Cleaning Data" course on Coursera.

Data
-----
The data source is the UC Irvine Machine Learning Repository. Specifically, from their Human Activity Recognition Using Smartphones Data Set, available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, accessed on 3/15/2017.

The authors describe the data as such:
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Transformations
-----
The raw data from the experiment were treated by the original authors in the following way before being published:
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

With the published data, the run_analysis.R make completes the following actions:
- merges the training and test data sets
- extracts only the variables that are either the mean or standard deviation of a measurement
- labels the activities with their descriptive labels
- renames the variables to be more descriptive
- transforms the above data by taking the average of all observations for each subject (subject_id) and activity (activity_label)

Specifically, to achieve the final transformation above the data were melted using the R package *reshape2* and then recast while applying the function mean to all of the values. After transformation, the dimensions of the data are 180 rows and 68 variables.

Code Book (Variable Descriptions)
-----
In their original form, the measurement and description of the variables is:
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The original variables names were made more descriptive by substituting the terms "mean()" and "std()" with "MeanOf" and "StdDevOf," respectively, when preceding the X, Y, or Z direction, or with "Mean" and "StdDev," respectively, when the variable measures the magnitude. Moreover, since the data were transformed by taking their mean by subject and activity, the variables names are preceded by "MeanOf-" to denote that they are means of means and means of standard deviations.

The first two variables are identifier variables:
-  subject_id: range of 1 through 30
-  activity_label: range of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING

For the remaining variables, the units have been normalized and bounded within [-1,1]
-  MeanOf-tBodyAcc-MeanOfX
-  MeanOf-tBodyAcc-MeanOfY
-  MeanOf-tBodyAcc-MeanOfZ
-  MeanOf-tBodyAcc-StdDevOfX
-  MeanOf-tBodyAcc-StdDevOfY
-  MeanOf-tBodyAcc-StdDevOfZ
-  MeanOf-tGravityAcc-MeanOfX
-  MeanOf-tGravityAcc-MeanOfY
-  MeanOf-tGravityAcc-MeanOfZ
-  MeanOf-tGravityAcc-StdDevOfX
-  MeanOf-tGravityAcc-StdDevOfY
-  MeanOf-tGravityAcc-StdDevOfZ
-  MeanOf-tBodyAccJerk-MeanOfX
-  MeanOf-tBodyAccJerk-MeanOfY
-  MeanOf-tBodyAccJerk-MeanOfZ
-  MeanOf-tBodyAccJerk-StdDevOfX
-  MeanOf-tBodyAccJerk-StdDevOfY
-  MeanOf-tBodyAccJerk-StdDevOfZ
-  MeanOf-tBodyGyro-MeanOfX
-  MeanOf-tBodyGyro-MeanOfY
-  MeanOf-tBodyGyro-MeanOfZ
-  MeanOf-tBodyGyro-StdDevOfX
-  MeanOf-tBodyGyro-StdDevOfY
-  MeanOf-tBodyGyro-StdDevOfZ
-  MeanOf-tBodyGyroJerk-MeanOfX
-  MeanOf-tBodyGyroJerk-MeanOfY
-  MeanOf-tBodyGyroJerk-MeanOfZ
-  MeanOf-tBodyGyroJerk-StdDevOfX
-  MeanOf-tBodyGyroJerk-StdDevOfY
-  MeanOf-tBodyGyroJerk-StdDevOfZ
-  MeanOf-tBodyAccMag-Mean
-  MeanOf-tBodyAccMag-StdDev
-  MeanOf-tGravityAccMag-Mean
-  MeanOf-tGravityAccMag-StdDev
-  MeanOf-tBodyAccJerkMag-Mean
-  MeanOf-tBodyAccJerkMag-StdDev
-  MeanOf-tBodyGyroMag-Mean
-  MeanOf-tBodyGyroMag-StdDev
-  MeanOf-tBodyGyroJerkMag-Mean
-  MeanOf-tBodyGyroJerkMag-StdDev
-  MeanOf-fBodyAcc-MeanOfX
-  MeanOf-fBodyAcc-MeanOfY
-  MeanOf-fBodyAcc-MeanOfZ
-  MeanOf-fBodyAcc-StdDevOfX
-  MeanOf-fBodyAcc-StdDevOfY
-  MeanOf-fBodyAcc-StdDevOfZ
-  MeanOf-fBodyAccJerk-MeanOfX
-  MeanOf-fBodyAccJerk-MeanOfY
-  MeanOf-fBodyAccJerk-MeanOfZ
-  MeanOf-fBodyAccJerk-StdDevOfX
-  MeanOf-fBodyAccJerk-StdDevOfY
-  MeanOf-fBodyAccJerk-StdDevOfZ
-  MeanOf-fBodyGyro-MeanOfX
-  MeanOf-fBodyGyro-MeanOfY
-  MeanOf-fBodyGyro-MeanOfZ
-  MeanOf-fBodyGyro-StdDevOfX
-  MeanOf-fBodyGyro-StdDevOfY
-  MeanOf-fBodyGyro-StdDevOfZ
-  MeanOf-fBodyAccMag-Mean
-  MeanOf-fBodyAccMag-StdDev
-  MeanOf-fBodyBodyAccJerkMag-Mean
-  MeanOf-fBodyBodyAccJerkMag-StdDev
-  MeanOf-fBodyBodyGyroMag-Mean
-  MeanOf-fBodyBodyGyroMag-StdDev
-  MeanOf-fBodyBodyGyroJerkMag-Mean
-  MeanOf-fBodyBodyGyroJerkMag-StdDev
