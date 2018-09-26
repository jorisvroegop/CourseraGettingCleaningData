library(xlsx)

rm(list=ls()) # Empty workspace

data_path = "C:/Users/jvroegop/Documents/Coursera/Course 3/UCI HAR Dataset" 
setwd(data_path)
available_files = list.files(data_path)

features = read.table('./features.txt',header=FALSE)
activity_type = read.table('./activity_labels.txt',header=FALSE)

# Reading train data
subject_train = read.table('./train/subject_train.txt',header=FALSE)
x_train = read.table('./train/x_train.txt',header=FALSE)
y_train = read.table('./train/y_train.txt',header=FALSE)

# Reading test data
subject_test = read.table('./test/subject_test.txt',header=FALSE)
x_test = read.table('./test/x_test.txt',header=FALSE)
y_test = read.table('./test/y_test.txt',header=FALSE)
