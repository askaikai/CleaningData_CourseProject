README for CleaningData_CourseProject
======================================
Based on the instructions:
https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions

### GOAL OF THIS REPO
Files contained in this repository can be used to create a "tidy data," based on data from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data could be accessed from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After running run_analysis.R, you can move on to perform statistics.

### CONTENT OF THIS REPO
* meanSd_allData.txt: text file (comma-delimited) that contains mean and std of each measurement.
* meanSd_bySubByActivity.txt: text file (comma-delimited) that summarizes meanSd_allData.txt by averaging variables for each activity and each subject.
* run_analysis.R: R code to create tidy data set. Make sure the path in the code points to your directory where raw data lives.
* CodeBook.md: Explains where the data came from, and variables in output files.
* README.md: This document. Explains the content of this Repo from high-level perspective.

### STUDY BACKGROUND: from the original data directory
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


