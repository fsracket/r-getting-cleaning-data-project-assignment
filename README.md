This repository contains a program which takes data originally produced by ... (see codebook) and transforms it into a new data set using the steps described below.  To run the program, perform the following steps:

1.  Start R (or RStudio).
2.  Source the 'run_analysis.R' file contained in this repository.
3.  Use 'setwd()' to change your working directory to the top-level directory obtained from unzipping the original data set file which can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
4.  Execute the 'doAnalysis()' function at the R prompt.  

The provided R program performs the following transformation steps.

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
