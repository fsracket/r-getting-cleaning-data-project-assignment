#CodeBook for Getting and Cleaning Data project

The original data used in this project was obtained from:

Human Activity Recognition Using Smartphones Dataset

Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

To use the original data in a publication, use the following reference [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The data collected in the original study was obtained from a group of 30 volunteers within an age bracket of 19-48 years.  Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  The original study captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' provided with the original data set for more details.

Using this original data, an R script (provided in the same repository as this code book) was written that performed the following analysis:

1. The training and test data sets from the original study were combined into 1 data set (hereafter referred to as the 'combined data set').
2. Each feature name from the original study (provided in the 'features.txt' file from the original data set's zip file) were connected to the appropriate column in the combined data set.
3. The combined data set was pruned by retaining only those columns whose features represented either a mean or standard variation of some measurement.  Determining which features (columns) to retain was done by simple text comparison.  More specifically, if the feature name contained either 'mean()' or 'std()' it was considered to represent either a mean value or a standard deviation value and it and its associated column was retained.
4. A text cleansing was done on the remaining column names to make them more 'human readable'.  This involved:
  1. Where 't' was shorthand for time signal it was replaced with the text 'timeSignalFor'.
  2. Where 'f' was shorthand for body signal it was replaced with the text 'bodySignalFor'.
  3. Occurrences of 'Acc' were replaced with 'Acceleration'.
  4. Occurrences of 'Mag' were replaced with 'Magnitude'.
5. Each subject id was obtained from the 'subject_test' and 'subject_train' files in the original data set and added to the appropriate row in the combined data set.  In other words, a column of subject ids (integers) was added to the data set where each subject id in the row indicates which subject (from 1 to 30) created the data displayed in the row.
6. The activity performed by the subject to generate each row of data was retrieved from the 'y_test' and 'y_train' files (in the original data set) and added to each row in the combined data set using the human readable activity labels which were specified in the 'activity_labels.txt' file of the original data set.
7. The data in the combined data set were then grouped by activity and subject and the mean was calculated for each column for each combination of activity and subject.
8. The resulting data set was then written in the current working directory (as obtained at runtime by the R script) under the name 'tidy-mean-by-subject-activity.txt'

The remaining sections of this code book list each column of the data set written out in the file 'tidy-mean-by-subject-activity.txt' and provides a brief description of the column (feature).

## Subject
The integer id of the subject who performed the activity for which the various measurement data was captured. Values range from 1-30.

## Activity
One of six activities that the subject performed when the original data was captured.   (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

## timeSignalForBodyAcceleration-mean-X
The mean of the the average of the time signal for body acceleration in the X dimension for the given subject and activity.

## timeSignalForBodyAcceleration-mean-Y
The mean of the the average of the time signal for body acceleration in the Y dimension for the given subject and activity.

## timeSignalForBodyAcceleration-mean-Z
The mean of the the average of the time signal for body acceleration in the Z dimension for the given subject and activity.

## timeSignalForBodyAcceleration-std-X
The mean of the the standard deviation of the time signal for body acceleration in the X dimension for the given subject and activity.

## timeSignalForBodyAcceleration-std-Y
The mean of the the standard deviation of the time signal for body acceleration in the Y dimension for the given subject and activity.

## timeSignalForBodyAcceleration-std-Z
The mean of the the standard deviation of the time signal for body acceleration in the Z dimension for the given subject and activity.

## timeSignalForGravityAcceleration-mean-X
The mean of the the average of the time signal for gravity acceleration in the X dimension for the given subject and activity.

## timeSignalForGravityAcceleration-mean-Y
The mean of the the average of the time signal for gravity acceleration in the Y dimension for the given subject and activity.

## timeSignalForGravityAcceleration-mean-Z
The mean of the the average of the time signal for gravity acceleration in the Z dimension for the given subject and activity.

## timeSignalForGravityAcceleration-std-X
The mean of the the standard deviation of the time signal for gravity acceleration in the X dimension for the given subject and activity.

## timeSignalForGravityAcceleration-std-Y
The mean of the the standard deviation of the time signal for gravity acceleration in the Y dimension for the given subject and activity.

## timeSignalForGravityAcceleration-std-Z
The mean of the the standard deviation of the time signal for gravity acceleration in the Z dimension for the given subject and activity.

## timeSignalForBodyAccelerationJerk-mean-X
The mean of the the average of the time signal for body acceleration jerk in the X dimension for the given subject and activity.

## timeSignalForBodyAccelerationJerk-mean-Y
The mean of the the average of the time signal for body acceleration jerk in the Y dimension for the given subject and activity.

## timeSignalForBodyAccelerationJerk-mean-Z
The mean of the the average of the time signal for body acceleration jerk in the Z dimension for the given subject and activity.

## timeSignalForBodyAccelerationJerk-std-X
The mean of the the standard deviation of the time signal for body acceleration jerk in the X dimension for the given subject and activity.

## timeSignalForBodyAccelerationJerk-std-Y
The mean of the the standard deviation of the time signal for body acceleration jerk in the Y dimension for the given subject and activity.

## timeSignalForBodyAccelerationJerk-std-Z
The mean of the the standard deviation of the time signal for body acceleration jerk in the Z dimension for the given subject and activity.

## timeSignalForBodyGyro-mean-X
The mean of the the average of the time signal for body gyro in the X dimension for the given subject and activity.

## timeSignalForBodyGyro-mean-Y
The mean of the the average of the time signal for body gyro in the Y dimension for the given subject and activity.

## timeSignalForBodyGyro-mean-Z
The mean of the the average of the time signal for body gyro in the Z dimension for the given subject and activity.

## timeSignalForBodyGyro-std-X
The mean of the the standard deviation of the time signal for body gyro in the X dimension for the given subject and activity.

## timeSignalForBodyGyro-std-Y
The mean of the the standard deviation of the time signal for body gyro in the Y dimension for the given subject and activity.

## timeSignalForBodyGyro-std-Z
The mean of the the standard deviation of the time signal for body gyro in the Z dimension for the given subject and activity.

## timeSignalForBodyGyroJerk-mean-X
The mean of the the average of the time signal for jerk body gyro in the X dimension for the given subject and activity.

## timeSignalForBodyGyroJerk-mean-Y
The mean of the the average of the time signal for jerk body gyro in the Y dimension for the given subject and activity.

## timeSignalForBodyGyroJerk-mean-Z
The mean of the the average of the time signal for jerk body gyro in the Z dimension for the given subject and activity.

## timeSignalForBodyGyroJerk-std-X
The mean of the the standard deviation of the time signal for jerk body gyro in the X dimension for the given subject and activity.

## timeSignalForBodyGyroJerk-std-Y
The mean of the the standard deviation of the time signal for jerk body gyro in the Y dimension for the given subject and activity.

## timeSignalForBodyGyroJerk-std-Z
The mean of the the standard deviation of the time signal for jerk body gyro in the Z dimension for the given subject and activity.

## timeSignalForBodyAccelerationMagnitude-mean
The mean of the the average of the time signal for body acceleration magnitude for the given subject and activity.

## timeSignalForBodyAccelerationMagnitude-std
The mean of the the standard deviation of the time signal for body acceleration magnitude for the given subject and activity.

## timeSignalForGravityAccelerationMagnitude-mean
The mean of the the average of the time signal for gravity acceleration magnitude for the given subject and activity.

## timeSignalForGravityAccelerationMagnitude-std
The mean of the the standard deviation of the time signal for gravity acceleration magnitude for the given subject and activity.

## timeSignalForBodyAccelerationJerkMagnitude-mean
The mean of the the average of the time signal for body acceleration jerk magnitude for the given subject and activity.

## timeSignalForBodyAccelerationJerkMagnitude-std
The mean of the the standard deviation of the time signal for body acceleration jerk magnitude for the given subject and activity.

## timeSignalForBodyGyroMagnitude-mean
The mean of the the average of the time signal for body gyro magnitude for the given subject and activity.

## timeSignalForBodyGyroMagnitude-std
The mean of the the standard deviation of the time signal for body gyro magnitude for the given subject and activity.

## timeSignalForBodyGyroJerkMagnitude-mean
The mean of the the average of the time signal for jerk body gyro magnitude for the given subject and activity.

## timeSignalForBodyGyroJerkMagnitude-std
The mean of the the standard deviation of the time signal for jerk body gyro magnitude for the given subject and activity.

## frequencySignalForBodyAcceleration-mean-X
The mean of the the average of the frequency signal for body acceleration in the X dimension for the given subject and activity.

## frequencySignalForBodyAcceleration-mean-Y
The mean of the the average of the frequency signal for body acceleration in the Y dimension for the given subject and activity.

## frequencySignalForBodyAcceleration-mean-Z
The mean of the the average of the frequency signal for body acceleration in the Z dimension for the given subject and activity.

## frequencySignalForBodyAcceleration-std-X
The mean of the the standard deviation of the frequency signal for body acceleration in the X dimension for the given subject and activity.

## frequencySignalForBodyAcceleration-std-Y
The mean of the the standard deviation of the frequency signal for body acceleration in the Y dimension for the given subject and activity.

## frequencySignalForBodyAcceleration-std-Z
The mean of the the standard deviation of the frequency signal for body acceleration in the Z dimension for the given subject and activity.

## frequencySignalForBodyAccelerationJerk-mean-X
The mean of the the average of the frequency signal for body acceleration jerk in the X dimension for the given subject and activity.

## frequencySignalForBodyAccelerationJerk-mean-Y
The mean of the the average of the frequency signal for body acceleration jerk in the Y dimension for the given subject and activity.

## frequencySignalForBodyAccelerationJerk-mean-Z
The mean of the the average of the frequency signal for body acceleration jerk in the Z dimension for the given subject and activity.

## frequencySignalForBodyAccelerationJerk-std-X
The mean of the the standard deviation of the frequency signal for body acceleration jerk in the X dimension for the given subject and activity.

## frequencySignalForBodyAccelerationJerk-std-Y
The mean of the the standard deviation of the frequency signal for body acceleration jerk in the Y dimension for the given subject and activity.

## frequencySignalForBodyAccelerationJerk-std-Z
The mean of the the standard deviation of the frequency signal for body acceleration jerk in the Z dimension for the given subject and activity.

## frequencySignalForBodyGyro-mean-X
The mean of the the average of the frequency signal for body gyro in the X dimension for the given subject and activity.

## frequencySignalForBodyGyro-mean-Y
The mean of the the average of the frequency signal for body gyro in the Y dimension for the given subject and activity.

## frequencySignalForBodyGyro-mean-Z
The mean of the the average of the frequency signal for body gyro in the Z dimension for the given subject and activity.

## frequencySignalForBodyGyro-std-X
The mean of the the standard deviation of the frequency signal for body gyro in the X dimension for the given subject and activity.

## frequencySignalForBodyGyro-std-Y
The mean of the the standard deviation of the frequency signal for body gyro in the Y dimension for the given subject and activity.

## frequencySignalForBodyGyro-std-Z
The mean of the the standard deviation of the frequency signal for body gyro in the Z dimension for the given subject and activity.

## frequencySignalForBodyAccelerationMagnitude-mean
The mean of the the average of the frequency signal for body acceleration magnitude for the given subject and activity.

## frequencySignalForBodyAccelerationMagnitude-std
The mean of the the standard deviation of the frequency signal for body acceleration magnitude for the given subject and activity.

## frequencySignalForBodyAccelerationJerkMagnitude-mean
The mean of the the average of the frequency signal for body acceleration jerk magnitude for the given subject and activity.

## frequencySignalForBodyAccelerationJerkMagnitude-std
The mean of the the standard deviation of the frequency signal for body acceleration jerk magnitude for the given subject and activity.

## frequencySignalForBodyGyroMagnitude-mean
The mean of the the average of the frequency signal for body gyro magnitude for the given subject and activity.

## frequencySignalForBodyGyroMagnitude-std
The mean of the the standard deviation of the frequency signal for body gyro magnitude for the given subject and activity.

## frequencySignalForBodyGyroJerkMagnitude-mean
The mean of the the average of the frequency signal for jerk body gyro magnitude for the given subject and activity.

## frequencySignalForBodyGyroJerkMagnitude-std
The mean of the the standard deviation of the frequency signal for jerk body gyro magnitude for the given subject and activity.





  





