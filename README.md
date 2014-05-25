Getting_and_Cleaning_Data_Project
=================================

Project of getting and cleaning data course from JHU


### Brief ######
This project demonstrate how to read in and merge data files. Moreover, a tidy dataset 
is generated after run R script file 'run_analysis.R'.


### Download data files. #####
First, download zipped data file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
Then, extract all files into R working directory.

### Step1, #####
Use read.table function read in training and test dataset, merge into one file and lable
column by names from feature files. Also, read and merge activity cateories to one file,
read and merge subject ID files.

### Step2, #####
Extracts columns containing mean or standard deviation. Integrate subject IDs and activity 
labels. Sort the file by subject ID.

### Step3, #####
Try to rename columns, make it more readable for human.

### Step4, #####
Use descriptive activity names to label dataset.

### Step5, #####
Generate a new data file by aggregate function. write files into current directory.

#### Note ####
In this repo, data files are put in data directory, result files are in result directoy.
