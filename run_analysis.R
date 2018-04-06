# load required packages
library(reshape2)

#1.Merges the training and the test sets to create one data set.
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")


# rename the column name from V1 to subjectID for test and train subject dataframes. 
names(subject_test) <- "subjectID"
names(subject_train) <- "subjectID"

# rename the column name from V1 to activity for test and train y dataframes. 
names(y_test) <- "activity"
names(y_train) <- "activity"

# rename x dataframe columns with the fetures in features file 
featureNames <- read.table("./UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# combine the three train and test dataframes into two dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)

# join both data sets train and test 
unifiedDF <- rbind(train, test)


#2.Extracts only the measurements on the mean and standard deviation for each measurement. 

# determine which columns contain the word mean or std
selectedcols <- grepl("std\\(\\)", names(unifiedDF)) | grepl("mean\\(\\)", names(unifiedDF))

# change to true column subjectID and activity 
selectedcols[1:2] <- TRUE

# remove all unnecessary columns
unifiedDF <- unifiedDF[, selectedcols]


#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 

# Cast the activity column from integer to factor
unifiedDF$activity <- factor(unifiedDF$activity, labels=c("Walking","Sitting","Walking Upstairs", "Walking Downstairs", "Standing", "Laying"))


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# create the tidy data set
meltedDF <- melt(unifiedDF, id=c("subjectID","activity"))
tidyDF <- dcast(meltedDF, subjectID+activity ~ variable, mean)

# output the result data set to a csv 
write.csv(tidyDF, "tidyDF.csv", row.names=FALSE)