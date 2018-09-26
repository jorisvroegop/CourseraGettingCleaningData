# CourseraGettingCleaningData
Peer-graded Assignment: Getting and Cleaning Data Course Project

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

## Transformations

1. Merges the training and the test sets to create one data set.
Load both the train and test sets (x and y data), enrich with subject_id. Giving column names.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
Using grepl() to select only mean and standard deviation columns.

3. Uses descriptive activity names to name the activities in the data set.
Adjusting names for better readability.

4. Appropriately labels the data set with descriptive activity names.
Merge with the acitvity_labels to replace activity_id.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Use aggregate function to create a table with means per subject per activity for each variable. This new table is found in tidy_data.txt.
