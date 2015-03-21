## The function run_analysis() does the following:
##
## 1. From the data file created by average_per(), creates a second, 
##    independent tidy data set with the average of each variable for 
##    each activity and each subject.

run_analysis <- function() {
    
  runFrame <- average_per()
  columnNames <- names(runFrame)
  options(warn=-1)
  output_frame <- aggregate.data.frame(runFrame, by=list(runFrame$subject, runFrame$activity), FUN=mean)
  options(warn=0)
  drops <- c("subject", "activity")
  output_frame <- output_frame[, !(names(output_frame) %in% drops)]
  colnames(output_frame) <- columnNames
   
  write.table(output_frame, file="run_analysis_output.txt", row.name=FALSE)
  
  output_frame
  
}



## The function average_per() does the following:
##
## 1. Merges the training and test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

average_per <- function() {
  
  ## Import and process the necessary label data from the provided files
  ## for activities and features
  activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  activityLabels[,2] <- gsub("_", " ", tolower(activityLabels[,2])) 
  features <- read.table("./UCI HAR Dataset/features.txt")
  featureLabelList <- format_labels(features[,2]) 
  
  ## Import the subject data from the provided files and combine
  testSubjectIds <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  trainSubjectIds <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  allSubjectIds <- rbind(testSubjectIds, trainSubjectIds)
  
  ## Import the activity data from the provided files and combine. Merge
  ## these data with the activity labels while preserving the orignal order
  testActivityIds <- read.table("./UCI HAR Dataset/test/y_test.txt")
  trainActivityIds <- read.table("./UCI HAR Dataset/train/y_train.txt")
  allActivityIds <- rbind(testActivityIds, trainActivityIds)
  allActivityIds$sortOrder <- 1:nrow(allActivityIds)
  allActivityIds <- merge(allActivityIds, activityLabels, by="V1")
  allActivityIds <- allActivityIds[order(allActivityIds$sortOrder),]
  
  ## Import the feature data from the provided files and combine
  testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
  trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
  allData <- rbind(testData, trainData)
  
  ## Combine the subject IDs, activity labels, and feature values, add column
  ## names, and remove all feature value rows except those for means and stdevs
  allData <- cbind(allSubjectIds, allActivityIds$V2, allData)
  colnames(allData) <- c("subject", "activity", featureLabelList[[1]])
  allData <- allData[c(1, 2, featureLabelList[[2]] + 2)]

  allData 
}


##  The function format_labels() takes a list of column labels and reformats
##  the names to make them human-readable and descriptive of the data contained
##  within the column. The function also determines the columns contain mean
##  and standard deviation data based on the names of these columns. The function
##  returns a list containing the columns names and the indices of the mean and
##  standard deviation columns (so that they can later be identified and selected)

format_labels <- function(columnLabels) {
  
  labels <- tolower(as.character(columnLabels))
  means <- grep("-mean()", labels, fixed=TRUE)
  stdevs <- grep("-std()", labels, fixed=TRUE)
  tokeeps <- c(means, stdevs)
  
  labels <- gsub("-mean()", "", labels, fixed=TRUE)
  labels <- gsub("-std()", "", labels, fixed=TRUE)
  labels <- gsub("-x", " (x-axis)", labels, fixed=TRUE)
  labels <- gsub("-y", " (y-axis)", labels, fixed=TRUE)
  labels <- gsub("-z", " (z-axis)", labels, fixed=TRUE)
  labels <- gsub("^t", "time-domain ", labels)
  labels <- gsub("^f", "frequency-domain ", labels)
  labels <- gsub("body", "body ", labels, fixed=TRUE)
  labels <- gsub("gravity", "gravity ", labels, fixed=TRUE)
  labels <- gsub("jerk", "jerk ", labels, fixed=TRUE)
  labels <- gsub("acc", "accelerometer ", labels, fixed=TRUE)
  labels <- gsub("gyro", "gyroscope ", labels, fixed=TRUE)
  labels <- gsub("mag", "magnitude", labels, fixed=TRUE)
  labels <- gsub("  ", " ", labels, fixed=TRUE)
  labels[means] <- paste(labels[means], "mean")
  labels[stdevs] <- paste(labels[stdevs], "standard deviation")
  
  formattedLabels <- list(labels, tokeeps)
}




## The function average_per() does the following:
##
## 1. From the data file created by run_analysis(), creates a second, 
##    independent tidy data set with the average of each variable for 
##    each activity and each subject.