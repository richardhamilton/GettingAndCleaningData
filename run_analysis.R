#There are two parts to this script. Part 1 will collect and clean the data. Part 2 will perform calculations on the data.

#Part 1

#clean the workspace
rm(list=ls())

#set working directory
setwd("C:/Users/Tom/Desktop/Coursera/3/Project - Assignment")

#create a directory to store file
if (!file.exists("data")) {dir.create("data")}

#download and unzip
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileUrl, destfile = "data/project.zip", mode="wb")
unzip("data/project.zip")

#read the files for Y data sets and convert to a factor
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
Y <- rbind(y_train, y_test)
names(Y)<-"Activity"
Y$Activity <-factor(Y$Activity, levels = c(1,2,3,4,5,6),labels = c("Walking","Walking Upstairs", "Walking Downstairs","Sitting","Standing","Laying")) #convert to a factor

#read the files for X data sets
x_train <- read.table("UCI HAR Dataset/train/x_train.txt")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt")
X<-rbind(x_train, x_test)
 



#subjects are volunteers
#read the files for subject data sets
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject<-rbind(subject_train,subject_test)
names(subject)<-"Volunteer"


#read features table and map col names to X dataframe
features <- read.table("UCI HAR Dataset/features.txt")
names(X)<-features[,2]


#subset X dataframe for only mean and std and format labels
X<-X[,grepl("-mean\\(\\)|-std\\(\\)", names(X))]
names(X) <- gsub("\\(|\\)", "", names(X)) # removes ()
names(X) <- tolower(names(X))# to lower case

#Combine the Tables together
tidy <- cbind(subject, Y, X)
write.table(tidy, "tidy_data_set_1.txt")


#Part 2
#Calculating the Aggregate Mean
agg_mean <-aggregate(tidy[,-2], by=list(tidy$Activity,tidy$Volunteer),FUN=mean, na.rm=TRUE)
agg_mean<-agg_mean[-2]#drop 2nd row
agg_mean<-agg_mean[c(2,1,3:68)]#switch 1st and 2nd rows
names(agg_mean)[names(agg_mean)=="Group.1"] <- "Activity"#rename the second col to Activity
write.table(agg_mean, "tidy_data_set_2.txt")
