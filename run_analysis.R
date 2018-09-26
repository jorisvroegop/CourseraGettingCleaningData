library(xlsx)

path = "C:/Users/jvroegop/Documents/Coursera/Course 3/Week 4" 
setwd(path)
datafolder <- "/UCI HAR Dataset"
testfolder <- "/test"
trainfolder <- "/train"

current_folder = paste(path, datafolder, testfolder, sep = "")
available_files = list.files(current_folder)

data <- read.csv(paste(current_folder, available_files[4], sep = "/"), sep = " ")

