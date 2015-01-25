
#Main entry point function that performs the analysis required by the
#Course Project
#Before running this function, please ensure that your working directory
#is set to be the folder that contains all the UCI HAR data!
run_analysis <- function() {
  #get the train data
  trainData <- read.table("./train/X_train.txt")
  
  #get the test data
  testData <- read.table("./test/X_test.txt")
  
  #since the data in both data tables is exactly the same format
  #(i.e. same number of columns, same order of columns)
  #a merge in the sense of a join is not required; instead combine the data
  #using rbind.
  numTestRows <- nrow(testData)
  combinedData <- rbind(trainData, testData[1:numTestRows,])
  
  #sets the columns names of all the features
  featureNames <- readFeatureNames()
  colnames(combinedData) <- featureNames$V2
  
  #retains only those column names that contain either 'mean' or 'std'
  combinedData <- combinedData[,grep("mean\\(\\)|std\\(\\)", featureNames$V2)]
  
  #make column names human readable
  colnames(combinedData) <- sapply(colnames(combinedData), cleanName)
 
  #retrieve and set the activity labels for train and test data
  activityLabels <- readActivityLabels()
  combinedData$activity <- activityLabels
  
  #retrieve and set the subject column for the data set
  subjects <- readSubjects()
  combinedData$subjects <- subjects
  
  #write out a file in tidy data format of the mean of all features
  #grouped by activity and subject.
  #activity and subject are the last 2 columns; aggregate using all other cols
  write.table(aggregate(combinedData[, 1:(ncol(combinedData) - 2)], 
                        list(Subject = combinedData$subjects,
                             Activity = combinedData$activity), 
                        mean), 
              file="tidy-mean-by-subject-activity.txt", 
              sep = "\t", 
              row.names = FALSE)
  
  combinedData
}


#reads the list of subjects from the train and test files
#each row in subject_train.txt matches up with the identically numbered row
#in X_train.txt.  The same is true for the test data.
#This function returns a vector of all the subjects; in this vector
#all the train data comes first.
readSubjects <- function() {
  trainSubjects <- read.table("./train/subject_train.txt")
  testSubjects <- read.table("./test/subject_test.txt")
  
  allSubjects <- rbind(trainSubjects, testSubjects)
  allSubjects$V1
}

readActivityLabels <- function() {
  trainLabels <- read.table("train/y_train.txt")
  testLabels <- read.table("test/y_test.txt")
  allLabels <- rbind(trainLabels, testLabels)
  
  readableLabels <- read.table("activity_labels.txt")
  
  #return the human readable text
  sapply(allLabels$V1, function(x) {readableLabels$V2[x]} )
  
}

#reads the feature names from the text file
#and returns a vector of indices where
#each index corresponds to a column where name contains either 'mean' or 'std'
readFeatureNames <- function() {
  featureNames <- read.table("features.txt")
  
}

#transforms each input string to something more "human readable
#the inspiration for the transforms are taken from a careful reading
#of the features-info.txt included with the dataset
cleanName <- function(input) {
  transform1 <- gsub("tBody", "timeSignalForBody", input)
  transform2 <- gsub("fBody", "frequencySignalForBody", transform1)
  transform3 <- gsub("tGravity", "timeSignalForGravity", transform2)
  transform4 <- gsub("fGravity", "frequencySignalForGravity", transform3)
  transform5 <- gsub("Acc", "Acceleration", transform4)
  transform6 <- gsub("Mag", "Magnitude", transform5)
  transform7 <- gsub("BodyBody", "Body", transform6)
  
  gsub("[\\(\\)]", "", transform7)
  
}