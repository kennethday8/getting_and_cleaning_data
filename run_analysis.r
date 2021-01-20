# load necessary packages
library(dplyr)

# load data for test cases
test <- read.table("./test/X_test.txt")
test_activity <- read.table("./test/y_test.txt")
test_subject <- read.table("./test/subject_test.txt")

# load data for train cases
train <- read.table("./train/X_train.txt")
train_activity <- read.table("./train/y_train.txt")
train_subject <- read.table("./train/subject_train.txt")

# load feature names and isolate column with names
features <- read.table("features.txt")
features <- features[2]

# load activity names key
activity_names <- read.table("activity_labels.txt")
colnames(activity_names) <- c("activity", "activitylabel")

# attach subject and activity data for both test and train
test <- cbind(test_subject, test_activity, test)
train <- cbind(train_subject, train_activity, train)

# bind together test and train sets
tt <- rbind(test, train)

# create vector of header labels
tt_col_names <- as.vector(features[,1])
tt_col_names <- append(c("subject", "activity"), tt_col_names)
colnames(tt) <- tt_col_names

# create vector of variable names
feature_names <- colnames(tt)

# find column indices of mean and std variables
mean_col <- grep("mean", feature_names)
std_col <- grep("std", feature_names)
mean_std_col <- sort(append(mean_col, std_col))
mean_std_col <- append(c(1,2), mean_std_col)

# filter out measurement variables that don't contain mean or standard deviation
tt <- tt[, mean_std_col]

# merge data with activity labels key to add names for activty type
tt <- merge(tt, activity_names)

# create copy of table to be used for averages table
tt_avg <- tt[, 1:(ncol(tt) - 1)]

# group by activity and subject and summarize
tt_avg <- group_by(tt_avg, activity, subject)
tt_avg <- summarize_all(tt_avg, mean)
