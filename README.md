##run_analysis
The run_analysis package includes three interconnected functions:


###run_analysis()
From the data file created by average_per(), creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The run_analysis() function does the following:
1. Runs the average_per() function (see description below) to obtain the means and standard deviations for each measurement taken for all of the features and subjects.
2. Uses aggregate.data.frame() with FUN=mean to determine the average means and standard deviations across all measurements for each combination of subject and activity (by subject, activity).
3. Writes the resulting tidy data set to a file titled 'run_analysis_output.txt' in the current working directory.
4. Returns the tidy data set.


###average_per()
From the raw data files provided, creates a tidy data set (as a data frame) with the means and standard deviations  for each measurement taken for all of the features and subjects included in both the training and test data sets combined.

The function average_per() does the following:
1. Merges the raw training and test sets stored in 'UCI HAR Dataset' folder within the workind directory to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement based on the columns names (determined using the format_labels() function). 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names by processing the column names provided in the raw data sets with the function format_labels() to make them descriptive and human-readable.


##format_labels()
The function format_labels() takes a list of column labels and reformats the names to make them human-readable and descriptive of the data contained within the column. The function also determines the columns contain mean and standard deviation data based on the names of these columns. The function returns a list containing the columns names and the indices of the mean and standard deviation columns (so that they can later be identified and selected).

1. Uses the grep() function to search for the character strings '-mean()' and '-std()' within each of the column names passed to it in order to identify the columns containing mean or standard deviation data for any feature in the data set.
2.Uses the gsub() and paste() functions to replace abbreviations within the column names passed to it in order to make these names fully descriptive and human-readable.
3. Returns a list containing the reformatted label names and a combined vector of the indices of the columns contain either mean or standard deviation data.
