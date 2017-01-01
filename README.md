# Averaged Human Activity Recognition Using Smartphones Dataset: Description of R Script

The repository contains the R script **run_analysis.R** doing the following:

- read in and merge test and training sets from the UHI HAR dataset
- select only mean and std measurements from the 561 feature vector
- label the activities with their descriptive labels instead of numeric IDs
- create a tidy dataset and average each of the 66 features per subject and activity
- write the resulting data frame to a space separated text file named **UCI_HAR_Data_Averaged.txt**

The script needs to R libraries that are loaded at the beginning:

- dplyr
- tidyr

It also needs the UCI HAR dataset unpacked. The variable *data_dir* set at the begiing of the script points to that directory. The script 
performs follwing steps:

- read in the activity labels and numeric IDs from **activity_labels.txt**
- read in the feature (variable) names from the 561 features from **features.txt**
- defining a function *read_data_set* (with activity labels and feature names as parameters) for reading in the training and test set:
    - reading in the actually feature data and assign appropriate feature names (based on position on data matrix)
    - reading the activity IDs and map it to the activity labels
    - reading the subject IDs (volunteers, 1-30)
    - combine all data in one data frame
    - select feature with "mean()" and "std()" in the name
- merge data frame from test and training set
- aggregate the 66 chosen features per subject and activity using the the average
- write data to file (to the current working directory)