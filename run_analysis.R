d1 <- "C:/Users/Sebastian/Documents/R Files/Getting and Cleaning Data/Week 4/UCI HAR Dataset/train"  

d2 <- "C:/Users/Sebastian/Documents/R Files/Getting and Cleaning Data/Week 4/UCI HAR Dataset/test"

d3 <- "C:/Users/Sebastian/Documents/R Files/Getting and Cleaning Data/Week 4/UCI HAR Dataset"

setwd(d1)
      subject_train <- read.table("subject_train.txt")
      y_train <- read.table("y_train.txt")
      x_train <- read.table("x_train.txt")
setwd(d2)
      subject_test <- read.table("subject_test.txt")
      y_test <- read.table("y_test.txt")
      x_test <- read.table("x_test.txt")
      
#Merge training and test by row
mergesubject <- rbind(subject_train, subject_test)
mergey <- rbind(y_train, y_test)
mergex <- rbind(x_train, x_test)

#Merge the merged tables by column
mergesubject <- cbind(mergesubject, mergey)
mergex <- cbind(mergesubject, mergex)
setNames(mergex, names(mergex) <- c("subject", "activity"))

#Dl mean and standard deviation data
setwd(d3)
      names <- read.table("names.txt")
      colnames(names)[1:2] <-  c("number", "name")

#Subset mean and standard deviation

subsetnames <- names$name[grep("mean\\(\\)|std\\(\\)", names$name)]
subsetnumbers <- names$number[grep("mean\\(\\)|std\\(\\)", names$name)]
subsetnames <- as.character(subsetnames)
subsetnumbers <- as.character(subsetnumbers)
bind <- cbind(subsetnumbers, subsetnames)
colnames(bind)[1:2] <- c("number", "name")
bind <- as.data.frame(bind)
bind$number <- paste("V", bind$number, sep="")
bind$name <- as.character(bind$name)
rownames(bind) <- bind[,1]
names(mergex) <- paste("V", 1:ncol(mergex)-2, sep="")
final <- subset(mergex,select=bind$number)
transposefinal <- t(final)
rownames(bind) <- bind[,1]
final1 <- merge(bind, transposefinal, by="row.names")

#Creates descriptive activity names
mergey[, 1] <- read.table("activity_labels.txt")[mergey[, 1], 2]
names(mergey) <- "activity"


#Appropriately labels data set with descriptive names
names(mergesubject) <- "subject"
names(final1) <- paste("V", 1:ncol(final1)-3, sep="")
mergex$V0 <- factor(mergex$V0, levels=c('1','2','3','4','5','6'), 
labels=c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'))
final1$V0 <- gsub("Acc","Acceleration", final1$V0)
final1$V0 <- gsub("Mag","Magnitude", final1$V0)
final1$V0 <- gsub("Gyro","AngularSpeed", final1$V0)
final1$V0 <- gsub("Freq\\.","Frequency.", final1$V0)
final1$V0 <- gsub("GyroJerk","AngularAcceleration", final1$V0)
final1$V0 <- gsub("^t","TimeDomain.", final1$V0)
final1$V0 <- gsub("^f","FrequencyDomain.", final1$V0)
final1$V0 <- gsub("Freq$","Frequency", final1$V0)

mergena <- merge(mergex, final1, by="row.names")
single <- merge(final1$V0, mergena, by="row.names")
single$Row.names <- NULL
single$Row.names <- NULL
colnames(single)[1:3] <- c("name", "subject", "activity")

#2nd independent data set
means <- aggregate(single, by=list(single$subject, single$activity), FUN=mean)
means$subject <- NULL
means$activity <- NULL
colnames(means)[1:2] <- c("subject", "activity")
write.table(means, file = "meandata.txt",row.name=FALSE)








                           





                           