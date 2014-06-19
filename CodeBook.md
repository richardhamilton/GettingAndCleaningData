#CodeBook
The codebook.md will explain how the variables work and the transformations done to clean the data.

##Data Source
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Backgound 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##Explanation : Part 1 of the run_analysis.R script
After setting the working directory, the script will download and uncompress the data file.

For X, Y and subjects data set, the script read the train and test sets separately and combined them. Converted the Y data frame to include factors.Read the features table and mapped the rows in the features table to column names in X data frame.Using the grepl function, subsetted the X data frame to only include the variables/columns containing mean and standard deviations (std). Formated the X data frame variable names to remove "()" and converted to lower case.Then combined X, Y and subjects data frame into one clean data set called tidy data frame.The tide data frame is then written to a text file called "tidy_data_set_1.txt".

##Explanation : Part 2 of the run_analysis.R script
In Part 2, the script calculates aggregate means based on subjects and activites. The script uses the aggregate function to calculate the aggregate means.The result are contained in agg_mean data frame which is then written to a text file called "tidy_data_set_2.txt". 



