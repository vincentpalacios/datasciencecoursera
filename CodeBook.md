tidydata.txt Code Book
===================
This is the code book for the tidydata.txt dataset, which is the final project for the "Getting and Cleaning Data" course on Coursera.

Data
-----
The data here come from the UC Irvine Machine Learning Repository. Specifically, from their Human Activity Recognition Using Smartphones Data Set, available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, accessed on 3/15/2017.

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

Code Book
-----