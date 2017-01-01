#' Setup load all libraries
library(dplyr)
library(tidyr)


#' define directory with data set
data_dir <- "UCI HAR Dataset/"


#' methods
read_data_set <- function(directory, features, activity_labels) {
  
  # read feature data
  data_file <- dir(directory, "^X_(test|train).txt", full.names = T)
  data_feat <- data.matrix(read.fwf(data_file,
                        widths = rep(16, 561),
                        strip.white = T))
  
  # read subject IDs
  subject_file <- dir(directory, "^subject_(test|train).txt", full.names = T)
  subjects <- readLines(subject_file)
  
  # read activity states
  activity_file <- dir(directory, "^y_(test|train)", full.names = T)
  activities <- readLines(activity_file)
  
  # assemble final dataset
  res <- data.frame(Subject = rep(subjects, each = ncol(data_feat)),
                    Activity = rep(activities, each = ncol(data_feat)),
                    Feature = rep(features, nrow(data_feat)),
                    Value = as.numeric(data_feat), stringsAsFactors = F)
  rm(data_feat)
  gc()
  
  # recode activities and filter for feaures that are mean and std of measurements
  res <- res %>%
    filter(grepl("mean\\(\\)", Feature) | grepl("std\\(\\)", Feature)) %>% 
    mutate(Activity = activity_labels[Activity])
    
  res
  
}

#' Get activity names
activity_labels <- read.table(file.path(data_dir, "activity_labels.txt"), sep = " ", header = F, as.is = T)
activity_labels <- setNames(activity_labels[,2], activity_labels[,1])


#' Get the feature vector
features <- read.table(file.path(data_dir, "features.txt"), sep = " ", as.is = T)[,2]


#' Read data
sets <- c("Training" = "train",
          "Test" = "test")
 
data_combined <- lapply(sets, function(set) read_data_set(directory = file.path(data_dir, set),
                                                          features = features,
                                                          activity_labels = activity_labels))
data_combined <- do.call("rbind", data_combined) %>% 
  arrange(Subject, Activity, Feature)

#' Average data
data_combined <- data_combined %>% 
  group_by(Subject, Activity, Feature) %>% 
  summarize(Value = mean(Value, na.rm = T)) %>% 
  ungroup() %>% 
  mutate(Feature = paste(Feature, "averaged", sep = "_"))

#' Spread data to bring it into a tidy format
#' where each column holds one variable
data_combined <- data_combined %>% 
  spread(key = Feature, val = Value)


#' Write data to file: into current working directory
write.table(data_combined, 
            file = "UCI_HAR_Data_Averaged.txt",
            row.names = F)
