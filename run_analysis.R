d1 <- "C:/Users/Sebastian/Documents/R Files/Getting and Cleaning Data/Week 4/UCI HAR Dataset/train"  

d2 <- "C:/Users/Sebastian/Documents/R Files/Getting and Cleaning Data/Week 4/UCI HAR Dataset/test"

d3 <- "C:/Users/Sebastian/Documents/R Files/Getting and Cleaning Data/Week 4/UCI HAR Dataset"

#1: Merges training and test
setwd(d1)
subject_train <- read.table("subject_train.txt",col.names=c("subject"))
y_train <- read.table("y_train.txt", col.names=c("activity"))
x_train <- read.table("x_train.txt")
setwd(d2)
subject_test <- read.table("subject_test.txt", col.names=c("subject"))
y_test <- read.table("y_test.txt", col.names=c("activity"))
x_test <- read.table("x_test.txt")

# Fill id column by row number
subject_train$id <- as.numeric(rownames(subject_train))
x_train$id <- as.numeric(rownames(x_train))
y_train$id <- as.numeric(rownames(y_train))
subject_test$id <- as.numeric(rownames(subject_test))
x_test$id <- as.numeric(rownames(x_test))
y_test$id <- as.numeric(rownames(y_test))

# merge subject_train, y_train, and x_train
mergetrain <- merge(subject_train, y_train, all=TRUE)
mergetrain <- merge(mergetrain, x_train, all=TRUE)
# merge subject_test, y_test, and x_test 
mergetest <- merge(subject_test, y_test, all=TRUE) 
mergetest <- merge(mergetest, x_test, all=TRUE) 
#combine train and test
traintest <- rbind(mergetrain, mergetest)


#2: Extracts mean and standard deviation of each measurement
setwd(d3)
features = read.table("features.txt", col.names=c("number", "feature"))
specific_features <- features$feature[grep("mean\\(\\)|(std\\(\\)", features$feature)]
step2 <- traintest[, c(c(1, 2, 3), specific_features$number + 3) ]

#3: Activities named descriptively
activities = read.table("activity_labels.txt", col.names=c("activity", "activity_label"))
step3 = merge(step2, activities)

#4: Dataset labeled with descriptive variable names 
specific_features$feature = gsub("\\(\\)", "", specific_features$feature)
specific_features$feature = gsub("-", ".", specific_features$feature)
for (i in 1:length(specific_features$feature)) {
      colnames(step3)[i + 3] <- specific_features$feature[i]
}
step4 = step3

#5: Independent tidy data set with the average of each variable for each activity and subject
remove <- c("id","activity_label")
step5 <- step4[,!(names(step4) %in% remove)]
meandata <-aggregate(step5, by=list(subject = step5$subject, activity = step5$activity), FUN=mean, na.rm=TRUE)
remove <- c("subject","activity")
meandata <- meandata[,!(names(meandata) %in% remove)]
meandata = merge(meandata, activities)
meandata$activity = NULL
meandata <- meandata[c(67, 1, 2, 3:66)]
write.txt(file="meandata.txt", x=meandata, row.names = FALSE)
