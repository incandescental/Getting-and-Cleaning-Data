# Code for generating a tidy data frame from the Human Activity Recognition Using Smartphones Dataset. Please see the accompanying CodeBook.md file and readme for details.

library(dplyr)

# knit together data frame from training data set.

colfeatures <- read.table("./UCI HAR Dataset/features.txt")
subject1 <- scan("./UCI HAR Dataset/train/subject_train.txt")
activity1 <- scan("./UCI HAR Dataset/train/y_train.txt")
df1 <- read.table("./UCI HAR Dataset/train/X_train.txt")
colfeatures <- as.vector(colfeatures$V2)
names(df1) <- colfeatures
df1$Subject <- subject1
df1$Activity <- activity1
df1 <- df1[c(562,563,1:561)]

# knit together data frame from test data set.

subject2 <- scan("./UCI HAR Dataset/test/subject_test.txt")
activity2 <- scan("./UCI HAR Dataset/test/y_test.txt")
df2 <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(df2) <- colfeatures
df2$Subject <- subject2
df2$Activity <- activity2
df2 <- df2[c(562,563,1:561)]

# merge both data frames

df3 <- rbind(df1, df2)

# Find 'std' and 'mean' columns and create new dataframe

namelist <- names(df3)
meanstd <- c(1,2,grep('mean', namelist),grep('std', namelist))
df3 <- df3[,meanstd]

# Apply Activity Names

actnames <- read.table("./UCI HAR Dataset/activity_labels.txt")
df3 <- merge(df3, actnames, by.x = "Activity", by.y = "V1")
df3 <- df3[c(82,1:81)]
df3 <- df3[c(1,3:82)]
names(df3)[1] <- "Activity"

# Descriptive variable names

namelist <- names(df3)

namelist <- gsub("tBodyAcc", "Body Acceleration (Time)-", namelist)
namelist <- gsub("tGravityAcc", "Gravity Acceleration (Time)-", namelist)
namelist <- gsub("tBodyGyro", "Body Gyro (Time)-", namelist)
namelist <- gsub("Mag", "Magnitude", namelist)
namelist <- gsub("fBodyAcc", "Body Acceleration (Freq)-", namelist)
namelist <- gsub("fBodyGyro", "Body Gyro (Freq)-", namelist)
namelist <- gsub("fBody", "", namelist)
namelist <- gsub("JerkMagnitude", "Jerk Magnitude", namelist)
namelist <- gsub("BodyAccJerk", "Body Acceleration Jerk", namelist)
namelist <- gsub("BodyGyroMagnitude", "Body Gyro Magnitude", namelist)
namelist <- gsub("BodyGyroMagnitude", "Body Gyro Magnitude", namelist)
namelist <- gsub("BodyGyroJerk", "Body Gyro Jerk", namelist)
namelist <- gsub("--", "-", namelist)

names(df3) <- namelist

# Summary Table

summtab <- df3 %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))

# Save tidy data frame

write.table(summtab, file = "./tidy_data_set.txt", row.names = F)






