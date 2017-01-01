# Averaged Human Activity Recognition Using Smartphones Dataset: Data Description

The dataset contains averaged data from the "Human Activity Recognition Using Smartphones Dataset", Version 1.0 (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data were downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The **Human Activitiy Recognition Using Smartphones Dataset** contains data from 30 volunteers with an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The data in this repository were derived from the 561-feature vector but only measurement on the mean and std-deviation were picked resulting in 66 variables per subject and activity.

The data in the original dataset were split in a test and training set and were stored in multiple files.  The  data in this derived dataset are combined in a tidy datasets (all volunteers) and stored in a single (space separated) text-file.

## Variables

The tidy dataset contains 68 variables:

- Subject: the subject ID (1-30)
- Activity: the activity performed during the measurements

The following 66 variables are named like the original features and follow a naming scheme described in the features_info.txt contained in the original data.

## Aggregation

The 50 values of one variable (fearture) per subject and activity were aggregated using the average of the 50 values indicated by the suffix **_averaged** at each variable (to distinguish it from the features of the original data). That leaves a dataset with 68 variables (66 aggregated features) and 180  observations (30 subjects with 6 activities each).


- 