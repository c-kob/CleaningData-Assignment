# CleaningData-Assignment

The script run_analysis.R performs the task of:
- combining the dataset for subjects, activities and features for each of the training and the test data, selecting only mean and standard deviation for each observation
- combining these combined datasets for the training and test data
- creating a new dataset that contains the mean for each feature variable for each subject and each activity.

The script assumes that the data has been unzipped into the current working directory, i.e. it is contained in the directory structure included in the downloaded zip file
The root of the data path is therefore set to "UCI HAR Dataset"

Separately for the training and the test data, the script:

- reads the activity labels from the activity_labels.txt file
- reads the name of the feature variables from the features.txt file
- identifies the column numbers of the variables that are to be included in the final dataset by identifying those variables that contain .mean() or .std()
- reads the subject data from the subject_[train,test].txt file into a data frame named subjectData[train,test]
- reads the activity data from the y_[train,test].txt file into a data frame named activityData.[train,test]
- converts the activity levels into a factor variable, and replaces the factor levels with those from the activity levels read previously
- reads the observations from the x_[train,test].txt file into a data frame named [featureVars.[train,test]]
- converts the data frame with the observations into a data table for easier manipulation
- selects only those variables from the observations that relate to the mean or standard deviation 
- successively combines the activity data and the subject data with the data frame

These steps produce a data.train and a data.test data table.  These are then combined into a data.combined data table, which contains the tidy data set.

Finally the script creates a data.summarised data set which calculates the average across observations for each subject for each activity

Both datasets are then written to file (tab-delimited text files.)