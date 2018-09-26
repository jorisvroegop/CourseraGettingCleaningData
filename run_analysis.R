## R script for Getting and Cleaning Data Course Project from Coursera course by Johns Hopkins University. 
## Written by Joris Vroegop

rm(list=ls()) # Empty workspace

data_path <- "C:/Users/jvroegop/Documents/Coursera/Course 3/UCI HAR Dataset" 
setwd(data_path)
available_files <- list.files(data_path)

# Reading features and activity labels
features <- read.table('./features.txt',header<-FALSE)
activity_labels <- read.table('./activity_labels.txt',header<-FALSE)

# Reading train data
subject_train <- read.table('./train/subject_train.txt',header<-FALSE)
x_train <- read.table('./train/x_train.txt',header<-FALSE)
y_train <- read.table('./train/y_train.txt',header<-FALSE)

# Reading test data
subject_test <- read.table('./test/subject_test.txt',header<-FALSE)
x_test <- read.table('./test/x_test.txt',header<-FALSE)
y_test <- read.table('./test/y_test.txt',header<-FALSE)

# Assigning column names
colnames(activity_labels)  <- c('activity_id','activity_label')

colnames(subject_train)  <- "subject_id"
colnames(x_train)        <- features[,2]
colnames(y_train)        <- "activity_id"

colnames(subject_test)  <- "subject_id"
colnames(x_test)        <- features[,2]
colnames(y_test)        <- "activity_id"

# Creating 1 train set and 1 test set, and consequently merging them. 
train_set <- cbind(y_train, subject_train, x_train)
test_set <- cbind(y_test, subject_test, x_test)
complete_set <- rbind(train_set, test_set)

# Array of column names for extracting mean and standard deviation using regular expressions. 
column_names <- colnames(complete_set)

# Extracting right columns
complete_set <- complete_set[(grepl("activity_id",column_names) | grepl("subject_id",column_names) | grepl("-mean()",column_names) & !grepl("-meanFreq()",column_names) | grepl("-std()..",column_names)) & !grepl("-X|-Y|-Z",column_names)]

# Add activity label (instead of id) and remove activity_id
complete_set <- merge(complete_set, activity_labels, by = 'activity_id')
complete_set <- complete_set[-1]

# Clarifying names
column_names <- colnames(complete_set)

column_names <- gsub("-mean","_mean",column_names)
column_names <- gsub("-std","_stddev",column_names)
column_names <- gsub("^(t)","time_",column_names)
column_names <- gsub("^(f)","freq_",column_names)
column_names <- gsub("\\()","",column_names)

# Reassigning new names
colnames(complete_set) <- column_names

# Tidy set
tidy_data <- aggregate(complete_set[,names(complete_set) != c('subject_id', 'activity_label')], by = list(subject_id = complete_set$subject_id, activity_label = complete_set$activity_label), mean)

setwd("C:/Users/jvroegop/Documents/Coursera/Course 3/GettingCleaningData")
write.table(tidy_data, './tidy_data.txt', row.names=F, sep='\t')