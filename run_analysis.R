## This .R script reads in the following local files from your working director, 
## where you have saved the .Zip file to your current directory, with "./test" 
## and "./train" as subfolders

## We will start with the TEST files, read them into temporary tables
subject_test <-read.table("./test/subject_test.txt",header = FALSE)
subject_test <- rename(subject_test, subject.id = V1)

raw_y_test <-read.table("./test/y_test.txt",header = FALSE)
raw_y_test <-rename(raw_y_test, activity = V1)

raw_X_test <-read.table("./test/X_test.txt",header = FALSE)

## For the clean_X_test, we will only bring in those columns that have to do
## with the mean and the standard deviation (std)

clean_X_test <- select(raw_X_test, 1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 
82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 
201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 
345, 346, 347, 348, 349,350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 
529, 530, 542, 543)

## Once the X_test has been read, rename the columns based on the corresponding 
## names from the features file

clean_X_test_name <- rename(clean_X_test, "tBodyAcc-mean()-X" = V1, "tBodyAcc-mean()-Y" = V2,
 "tBodyAcc-mean()-Z" = V3, "tBodyAcc-std()-X" = V4, "tBodyAcc-std()-Y" = V5, 
 "tBodyAcc-std()-Z" = V6, "tGravityAcc-mean()-X" = V41, "tGravityAcc-mean()-Y" = V42, 
 "tGravityAcc-mean()-Z" = V43, "tGravityAcc-std()-X" = V44, "tGravityAcc-std()-Y" = V45, 
 "tGravityAcc-std()-Z" = V46, "tBodyAccJerk-mean()-X" = V81, 
 "tBodyAccJerk-mean()-Y" = V82, "tBodyAccJerk-mean()-Z" = V83, "tBodyAccJerk-std()-X" = V84, 
 "tBodyAccJerk-std()-Y" = V85, "tBodyAccJerk-std()-Z" = V86, "tBodyGyro-mean()-X" = V121, 
 "tBodyGyro-mean()-Y" = V122, "tBodyGyro-mean()-Z" = V123, "tBodyGyro-std()-X" = V124, 
 "tBodyGyro-std()-Y" = V125, "tBodyGyro-std()-Z" = V126, "tBodyGyroJerk-mean()-X" = V161, 
 "tBodyGyroJerk-mean()-Y" = V162, "tBodyGyroJerk-mean()-Z" = V163, 
 "tBodyGyroJerk-std()-X" = V164, "tBodyGyroJerk-std()-Y" = V165, 
 "tBodyGyroJerk-std()-Z" = V166, "tBodyAccMag-mean()" = V201, "tBodyAccMag-std()" = V202, 
 "tGravityAccMag-mean()" = V214, "tGravityAccMag-std()" = V215, 
 "tBodyAccJerkMag-mean()" = V227, "tBodyAccJerkMag-std()" = V228, "tBodyGyroMag-mean()" = V240, 
 "tBodyGyroMag-std()" = V241, "tBodyGyroJerkMag-mean()" = V253, "tBodyGyroJerkMag-std()" = V254, 
 "fBodyAcc-mean()-X" = V266, "fBodyAcc-mean()-Y" = V267, "fBodyAcc-mean()-Z" = V268, 
 "fBodyAcc-std()-X" = V269, "fBodyAcc-std()-Y" = V270, "fBodyAcc-std()-Z" = V271, 
 "fBodyAccJerk-mean()-X" = V345, "fBodyAccJerk-mean()-Y" = V346, "fBodyAccJerk-mean()-Z" = V347, 
 "fBodyAccJerk-std()-X" = V348, "fBodyAccJerk-std()-Y" = V349, "fBodyAccJerk-std()-Z" = V350, 
 "fBodyGyro-mean()-X" = V424, "fBodyGyro-mean()-Y" = V425, "fBodyGyro-mean()-Z" = V426, 
 "fBodyGyro-std()-X" = V427, "fBodyGyro-std()-Y" = V428, "fBodyGyro-std()-Z" = V429, 
 "fBodyAccMag-mean()" = V503, "fBodyAccMag-std()" = V504, "fBodyBodyAccJerkMag-mean()" = V516, 
 "fBodyBodyAccJerkMag-std()" = V517, "fBodyBodyGyroMag-mean()" = V529, 
 "fBodyBodyGyroMag-std()" = V530, "fBodyBodyGyroJerkMag-mean()" = V542, 
 "fBodyBodyGyroJerkMag-std()" = V543)

 ## Now bind the columns for each of the three tables so you have one table
 
test_bind <- cbind(subject_test, raw_y_test, clean_X_test_name)

## We continue with the TRAIN data as we did above

subject_train <-read.table("./train/subject_train.txt",header = FALSE)
subject_train <- rename(subject_train, subject.id = V1)

raw_y_train <-read.table("./train/y_train.txt",header = FALSE)
raw_y_train <-rename(raw_y_train, activity = V1)

raw_X_train <-read.table("./train/X_train.txt",header = FALSE)

## For the clean_X_train, we will only bring in those columns that have to do
## with the mean and the standard deviation (std)

clean_X_train <- select(raw_X_train, 1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 
82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 
201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 
345, 346, 347, 348, 349,350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 
529, 530, 542, 543)


## Once the X_train has been read, rename the columns based on the corresponding 
## names from the features file

clean_X_train_name <- rename(clean_X_train, "tBodyAcc-mean()-X" = V1, "tBodyAcc-mean()-Y" = V2,
 "tBodyAcc-mean()-Z" = V3, "tBodyAcc-std()-X" = V4, "tBodyAcc-std()-Y" = V5, 
 "tBodyAcc-std()-Z" = V6, "tGravityAcc-mean()-X" = V41, "tGravityAcc-mean()-Y" = V42, 
 "tGravityAcc-mean()-Z" = V43, "tGravityAcc-std()-X" = V44, "tGravityAcc-std()-Y" = V45, 
 "tGravityAcc-std()-Z" = V46, "tBodyAccJerk-mean()-X" = V81, 
 "tBodyAccJerk-mean()-Y" = V82, "tBodyAccJerk-mean()-Z" = V83, "tBodyAccJerk-std()-X" = V84, 
 "tBodyAccJerk-std()-Y" = V85, "tBodyAccJerk-std()-Z" = V86, "tBodyGyro-mean()-X" = V121, 
 "tBodyGyro-mean()-Y" = V122, "tBodyGyro-mean()-Z" = V123, "tBodyGyro-std()-X" = V124, 
 "tBodyGyro-std()-Y" = V125, "tBodyGyro-std()-Z" = V126, "tBodyGyroJerk-mean()-X" = V161, 
 "tBodyGyroJerk-mean()-Y" = V162, "tBodyGyroJerk-mean()-Z" = V163, 
 "tBodyGyroJerk-std()-X" = V164, "tBodyGyroJerk-std()-Y" = V165, 
 "tBodyGyroJerk-std()-Z" = V166, "tBodyAccMag-mean()" = V201, "tBodyAccMag-std()" = V202, 
 "tGravityAccMag-mean()" = V214, "tGravityAccMag-std()" = V215, 
 "tBodyAccJerkMag-mean()" = V227, "tBodyAccJerkMag-std()" = V228, "tBodyGyroMag-mean()" = V240, 
 "tBodyGyroMag-std()" = V241, "tBodyGyroJerkMag-mean()" = V253, "tBodyGyroJerkMag-std()" = V254, 
 "fBodyAcc-mean()-X" = V266, "fBodyAcc-mean()-Y" = V267, "fBodyAcc-mean()-Z" = V268, 
 "fBodyAcc-std()-X" = V269, "fBodyAcc-std()-Y" = V270, "fBodyAcc-std()-Z" = V271, 
 "fBodyAccJerk-mean()-X" = V345, "fBodyAccJerk-mean()-Y" = V346, "fBodyAccJerk-mean()-Z" = V347, 
 "fBodyAccJerk-std()-X" = V348, "fBodyAccJerk-std()-Y" = V349, "fBodyAccJerk-std()-Z" = V350, 
 "fBodyGyro-mean()-X" = V424, "fBodyGyro-mean()-Y" = V425, "fBodyGyro-mean()-Z" = V426, 
 "fBodyGyro-std()-X" = V427, "fBodyGyro-std()-Y" = V428, "fBodyGyro-std()-Z" = V429, 
 "fBodyAccMag-mean()" = V503, "fBodyAccMag-std()" = V504, "fBodyBodyAccJerkMag-mean()" = V516, 
 "fBodyBodyAccJerkMag-std()" = V517, "fBodyBodyGyroMag-mean()" = V529, 
 "fBodyBodyGyroMag-std()" = V530, "fBodyBodyGyroJerkMag-mean()" = V542, 
 "fBodyBodyGyroJerkMag-std()" = V543)

 ## As we did above, now bind the columns for each of the three tables so you have one table
 
train_bind <- cbind(subject_train, raw_y_train, clean_X_train_name)

## now with two seperate TRAN and TEST data tables, we use a rbind function to create one table:

merged_data <- rbind(test_bind,train_bind)

## as part of question 3, we will not add descriptive names to the following activites:
merged_data %>% mutate(named.activity = ifelse(activity == 1, "WALKING", ifelse(activity == 2, "WALKING_UPSTAIRS", ifelse(activity == 3, "WALKING_DOWNSTAIRS", ifelse(activity == 4, "SITTING", ifelse(activity == 5, "STANDING", "LAYING"))))))

merged_data_two <- mutate(merged_data,named.activity = ifelse(activity == 1, "WALKING", ifelse(activity == 2, "WALKING_UPSTAIRS", ifelse(activity == 3, "WALKING_DOWNSTAIRS", ifelse(activity == 4, "SITTING", ifelse(activity == 5, "STANDING", "LAYING"))))))

