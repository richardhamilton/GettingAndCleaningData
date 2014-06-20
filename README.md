#Getting and Cleaning Data Project

The purpose of this project is to collect and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Other files in this Repo are:

1. Codebook.md
2. run_analysis.R

The codebook.md will explain how the variables work and the transformations done to clean the data. The run_analysis.R is the R script that was used in transforming the data. The R script was successfully executed on a 64 bit Windows 7 system with R  studio version 0.98.501. 

The R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

To run the R script, one would need to first set the working directory. The script will download the compressed file from the web and uncompressed the files in the working directory. The script is divided into two parts: first part will collect and clean the data set and the second part will perform calculations on the clean data set. In both parts, the script will write final results in a text files named as tidy_data_set_1.txt and tidy_data_set_2.txt.
