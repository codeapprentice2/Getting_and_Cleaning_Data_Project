#############################################
#
#Project for Getting and Cleaning Data
#
#############################################

#Download data file 
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#Extract test and train folder into working directory.

#Read in training and test sets, merge into one file
#label columns with names from features.txt
features <- read.table("features.txt")
training <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt")
mergedf <- rbind(training, test)
names(mergedf) <- features[,2]

#Read and merge activity categories.
label.tr <- read.table("./train/y_train.txt")
label.te <- read.table("./test/y_test.txt")
labels <- rbind(label.tr, label.te)
colnames(labels) <- "Activity"

#Read and merge subject ID.
sub.tr <- read.table("./train/subject_train.txt")
sub.te <- read.table("./test/subject_test.txt")
subject <- rbind(sub.tr, sub.te)
colnames(subject) <- "ID"

#step2, Extracts only the measurements on the mean and standard deviation for each measurement.
#integrate subject IDs and activity categories.
subDF <- mergedf[, sort(c(grep("mean", colnames(mergedf)), grep("std", colnames(mergedf))))]
subDF <- cbind(subject, labels, subDF)

library(plyr)
subDF <- arrange(subDF, ID) #arrange rows by subject ID.



#step3, Uses desciptive activity names
colnames(subDF) <- gsub("[()]", "", colnames(subDF))
colnames(subDF) <- gsub("-", ".", colnames(subDF))

#step4, Labels the data set with descriptive activity names
act.label <- read.table("activity_labels.txt")
subDF$Activity <- factor(subDF$Activity, levels=act.label$V1, labels=act.label$V2)

#step5, Generate and save a tidy data set.
tidyData <- aggregate(subDF[,-c(1,2)], by=list(subDF$ID, subDF$Activity), FUN=mean)

write.table(subDF,"subDf.txt")
write.table(tidyData, "tidyData.txt")
