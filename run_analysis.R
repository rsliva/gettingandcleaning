# run_analysis.R

# "Merges the training and the test sets to create one data set."
# "Extracts only the measurements on the mean and standard deviation for each measurement. "
# "Uses descriptive activity names to name the activities in the data set"
# "Appropriately labels the data set with descriptive variable names. "
# "Creates a second, independent tidy data set with the average of each variable for each activity and each subject."

# for using melt and dcast to reshape the data (pivot)
library(reshape2)

# features.txt has the column labels 
# These are the column headings. Load them first so they can be applied during the data set reading.
featurelabels <- read.table('features.txt')
features <- gsub("-",".",gsub("\\(\\)","",featurelabels$V2))

# Read in the Test and Train data sets, adding the column labels, and convert to data tables.
testsetrd <- read.table("X_test.txt", col.names=features)
trainsetrd <- read.table("X_train.txt", col.names=features)

# Read in the subject IDs that will be merged as a column for the test and train data sets.
testsubjects <- read.table("subject_test.txt", col.names=c("SubjectId"))
trainsubjects <- read.table("subject_train.txt", col.names=c("SubjectId"))

# Read in the activity labels that will be merged as a column for the test and train data sets.
testactivities <- read.table("y_test.txt",col.names="ActivityId")
trainactivities <- read.table("y_train.txt",col.names="ActivityId")


# merge the labels with the data sets
testset <- cbind(testsetrd, testactivities,testsubjects)
trainset <- cbind(trainsetrd, trainactivities, trainsubjects)

# read in the textual names for the activity labels.
activities <- read.table('activity_labels.txt',col.names=c("ActivityId","Activity"))

testset <- merge(testset,activities,by='ActivityId')
trainset <- merge(trainset,activities,by='ActivityId')

# combine both data sets prior to the final steps of tidying and analysis
fullset <- rbind(testset,trainset)

# determine the set of columns to use - those with mean() or std() in the name
# also add the activity ID, Activity, and subject ID columns
l <- c("std\\(","mean\\(")
#smLabels <- c(TRUE, (grepl(l[1], featurelabels$V2) | grepl(l[2], featurelabels$V2)),TRUE, TRUE)
smLabels <- (grepl(l[1], featurelabels$V2) | grepl(l[2], featurelabels$V2))

# limit the set to the std dev. and mean measurements
smset <- fullset[,c(TRUE, smLabels, TRUE, TRUE)]

# create a pivoted long file
melt1 <- melt(smset,id=c("Activity","SubjectId"), measure.vars=features[smLabels])

# create a wide format for the means by Subject and Activity
# this is the tidy data
tidyData <- dcast(melt1, SubjectId + Activity ~ variable, value.var="value", mean)

# write out the file
write.csv(tidyData,"tidyData.csv")

