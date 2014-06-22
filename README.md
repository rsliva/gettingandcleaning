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

