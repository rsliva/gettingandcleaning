## run_analysis.R

This program produces means by Subject and Activity for the Test and Train measurements for the  

"Human Activity Recognition Using Smartphones Data Set"  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The basic process is to:
+ Combine the training and the test sets to create one data set.  
+ Limit the measurements to the mean and standard deviations.   
+ Add in the activity names.  
+ Melt the data to produce a wide format of mean values for the measurements by subject and activity.  
+ Cast the data to create a long format tidy data output file.  

The files used by the program are:  
+ X_test.txt                 The set of test measurements  
+ X_train.txt                The set of training measurements  
+ features.txt               The set of measurement labels (column names)  
+ subject_test.txt           The set of Subject IDs for the test data  
+ subject_train.txt          The set of Subject IDs for the train data  
+ y_test.txt                 The Activity IDs for the test data  
+ y_train.txt                The Activity IDs for the training data  
+ activity_labels.txt        The activity labels (WALKING, WALKING_UPSTAIRS, etc.)  


The files should be placed in the working directory.  


Source data is located at:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
