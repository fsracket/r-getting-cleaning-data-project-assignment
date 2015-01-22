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
 .

## Activity
 .

## timeSignalForBodyAcceleration-mean-X
The mean of the time signal for body acceleration in the X dimension.

## timeSignalForBodyAcceleration-mean-Y
The mean of the time signal for body acceleration in the Y dimension.

## timeSignalForBodyAcceleration-mean-Z
The mean of the time signal for body acceleration in the Z dimension.

## timeSignalForBodyAcceleration-std-X
The standard deviation of the time signal for body acceleration in the X dimension.

## timeSignalForBodyAcceleration-std-Y
The standard deviation of the time signal for body acceleration in the Y dimension.

## timeSignalForBodyAcceleration-std-Z
The standard deviation of the time signal for body acceleration in the Z dimension.

## timeSignalForGravityAcceleration-mean-X
The mean of the time signal for gravity acceleration in the X dimension.

## timeSignalForGravityAcceleration-mean-Y
The mean of the time signal for gravity acceleration in the Y dimension.

## timeSignalForGravityAcceleration-mean-Z
The mean of the time signal for gravity acceleration in the Z dimension.

## timeSignalForGravityAcceleration-std-X
The standard deviation of the time signal for gravity acceleration in the X dimension.

## timeSignalForGravityAcceleration-std-Y
The standard deviation of the time signal for gravity acceleration in the Y dimension.

## timeSignalForGravityAcceleration-std-Z
The standard deviation of the time signal for gravity acceleration in the Z dimension.

## timeSignalForBodyAccelerationJerk-mean-X
The mean of the time signal for body acceleration jerk in the X dimension.

## timeSignalForBodyAccelerationJerk-mean-Y
The mean of the time signal for body acceleration jerk in the Y dimension.

## timeSignalForBodyAccelerationJerk-mean-Z
The mean of the time signal for body acceleration jerk in the Z dimension.

## timeSignalForBodyAccelerationJerk-std-X
The standard deviation of the time signal for body acceleration jerk in the X dimension.

## timeSignalForBodyAccelerationJerk-std-Y
The standard deviation of the time signal for body acceleration jerk in the Y dimension.

## timeSignalForBodyAccelerationJerk-std-Z
The standard deviation of the time signal for body acceleration jerk in the Z dimension.

## timeSignalForBodyGyro-mean-X
The mean of the time signal for body gyro in the X dimension.

## timeSignalForBodyGyro-mean-Y
The mean of the time signal for body gyro in the Y dimension.

## timeSignalForBodyGyro-mean-Z
The mean of the time signal for body gyro in the Z dimension.

## timeSignalForBodyGyro-std-X
The standard deviation of the time signal for body gyro in the X dimension.

## timeSignalForBodyGyro-std-Y
The standard deviation of the time signal for body gyro in the Y dimension.

## timeSignalForBodyGyro-std-Z
The standard deviation of the time signal for body gyro in the Z dimension.

## timeSignalForBodyGyroJerk-mean-X
The mean of the time signal for jerk body gyro in the X dimension.

## timeSignalForBodyGyroJerk-mean-Y
The mean of the time signal for jerk body gyro in the Y dimension.

## timeSignalForBodyGyroJerk-mean-Z
The mean of the time signal for jerk body gyro in the Z dimension.

## timeSignalForBodyGyroJerk-std-X
The standard deviation of the time signal for jerk body gyro in the X dimension.

## timeSignalForBodyGyroJerk-std-Y
The standard deviation of the time signal for jerk body gyro in the Y dimension.

## timeSignalForBodyGyroJerk-std-Z
The standard deviation of the time signal for jerk body gyro in the Z dimension.

## timeSignalForBodyAccelerationMagnitude-mean
The mean of the time signal for body acceleration magnitude .

## timeSignalForBodyAccelerationMagnitude-std
The standard deviation of the time signal for body acceleration magnitude .

## timeSignalForGravityAccelerationMagnitude-mean
The mean of the time signal for gravity acceleration magnitude .

## timeSignalForGravityAccelerationMagnitude-std
The standard deviation of the time signal for gravity acceleration magnitude .

## timeSignalForBodyAccelerationJerkMagnitude-mean
The mean of the time signal for body acceleration jerk magnitude .

## timeSignalForBodyAccelerationJerkMagnitude-std
The standard deviation of the time signal for body acceleration jerk magnitude .

## timeSignalForBodyGyroMagnitude-mean
The mean of the time signal for body gyro magnitude .

## timeSignalForBodyGyroMagnitude-std
The standard deviation of the time signal for body gyro magnitude .

## timeSignalForBodyGyroJerkMagnitude-mean
The mean of the time signal for jerk body gyro magnitude .

## timeSignalForBodyGyroJerkMagnitude-std
The standard deviation of the time signal for jerk body gyro magnitude .

## frequencySignalForBodyAcceleration-mean-X
The mean of the frequency signal for body acceleration in the X dimension.

## frequencySignalForBodyAcceleration-mean-Y
The mean of the frequency signal for body acceleration in the Y dimension.

## frequencySignalForBodyAcceleration-mean-Z
The mean of the frequency signal for body acceleration in the Z dimension.

## frequencySignalForBodyAcceleration-std-X
The standard deviation of the frequency signal for body acceleration in the X dimension.

## frequencySignalForBodyAcceleration-std-Y
The standard deviation of the frequency signal for body acceleration in the Y dimension.

## frequencySignalForBodyAcceleration-std-Z
The standard deviation of the frequency signal for body acceleration in the Z dimension.

## frequencySignalForBodyAccelerationJerk-mean-X
The mean of the frequency signal for body acceleration jerk in the X dimension.

## frequencySignalForBodyAccelerationJerk-mean-Y
The mean of the frequency signal for body acceleration jerk in the Y dimension.

## frequencySignalForBodyAccelerationJerk-mean-Z
The mean of the frequency signal for body acceleration jerk in the Z dimension.

## frequencySignalForBodyAccelerationJerk-std-X
The standard deviation of the frequency signal for body acceleration jerk in the X dimension.

## frequencySignalForBodyAccelerationJerk-std-Y
The standard deviation of the frequency signal for body acceleration jerk in the Y dimension.

## frequencySignalForBodyAccelerationJerk-std-Z
The standard deviation of the frequency signal for body acceleration jerk in the Z dimension.

## frequencySignalForBodyGyro-mean-X
The mean of the frequency signal for body gyro in the X dimension.

## frequencySignalForBodyGyro-mean-Y
The mean of the frequency signal for body gyro in the Y dimension.

## frequencySignalForBodyGyro-mean-Z
The mean of the frequency signal for body gyro in the Z dimension.

## frequencySignalForBodyGyro-std-X
The standard deviation of the frequency signal for body gyro in the X dimension.

## frequencySignalForBodyGyro-std-Y
The standard deviation of the frequency signal for body gyro in the Y dimension.

## frequencySignalForBodyGyro-std-Z
The standard deviation of the frequency signal for body gyro in the Z dimension.

## frequencySignalForBodyAccelerationMagnitude-mean
The mean of the frequency signal for body acceleration magnitude .

## frequencySignalForBodyAccelerationMagnitude-std
The standard deviation of the frequency signal for body acceleration magnitude .

## frequencySignalForBodyBodyAccelerationJerkMagnitude-mean
The mean of the frequency signal for body acceleration jerk magnitude .

## frequencySignalForBodyBodyAccelerationJerkMagnitude-std
The standard deviation of the frequency signal for body acceleration jerk magnitude .

## frequencySignalForBodyBodyGyroMagnitude-mean
The mean of the frequency signal for body gyro magnitude .

## frequencySignalForBodyBodyGyroMagnitude-std
The standard deviation of the frequency signal for body gyro magnitude .

## frequencySignalForBodyBodyGyroJerkMagnitude-mean
The mean of the frequency signal for jerk body gyro magnitude .

## frequencySignalForBodyBodyGyroJerkMagnitude-std
The standard deviation of the frequency signal for jerk body gyro magnitude .




  





