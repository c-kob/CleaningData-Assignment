There are two data files based on data from the Human Activity Recognition Using Smartphones Dataset (see README.txt in UCI HAR Dataset for more information)

CombinedData.txt combines the data from the test and training data sets, and includes only the variables that correspond to  mean and standard deviation for each measurement

It contins 10299 observations of  68 variables
Subject:     is an integer identifyin the experimental subject
Activity:    a factor variable describing the activity to which the observations relate
Feature variables:
These are named according to the following pattern:
- a combination of the signals that were calculated from the raw observations 
        tBodyAcc
        tGravityAcc
        tBodyAccJerk
        tBodyGyro
        tBodyGyroJerk
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc
        fBodyAccJerk
        fBodyGyro
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag
- whether the variable relates to the mean or the std deviation of the underlying observations (a sample of measurements over a predefined time period)
- where appropriate, the spatial dimension (X/Y/Z)
Thus, tBodyAcc.mean().X reflects the average of the measurements of the total body acceleration in the X-dimension over the sampling period.
These are dimensionless numerical variables between -1 and +1

For further information see the documentation in the data directory.

SummarisedData.txt is derived from the combined data and provides the average for each of the feature variables for each particular subject and each particular activity.  

It containse 180 observations of the same 68 variables
Each subject appears only once, and each activity appears once for each subject.
The feature variables are the averages of the corresponding feature variables in the full data set.  
For example, tBodyAcc.mean().X reflects the average of the average of the measurements of the total body acceleration in the X-dimension over the sampling period for a particualr subject carrying out a particular activity.
These are dimensionless numerical variables between -1 and +1