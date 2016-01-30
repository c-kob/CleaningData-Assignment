library(dplyr)

dataPathRoot <- "UCI HAR Dataset"


activityLabels <- read.table(file.path(dataPathRoot,"activity_labels.txt"))
featureVars <- read.table(file.path(dataPathRoot,"features.txt"), as.is=TRUE)
varnames <- c(grep("mean\\(\\)", featureVars$V2), grep("std\\(\\)", featureVars$V2))

subjectData.train <- read.table(file.path(dataPathRoot,"train","subject_train.txt"), col.names=c("Subject"))
activityData.train <- read.table(file.path(dataPathRoot,"train","y_train.txt"), col.names=c("Activity"))
activityData.train$Activity <- as.factor(activityData.train$Activity)
levels(activityData.train$Activity) <- levels(activityLabels$V2)

featureData.train <- read.table(file.path(dataPathRoot,"train","x_train.txt"), col.names=featureVars$V2)


data.train <- tbl_df(featureData.train)
data.train <- select(data.train,varnames)
data.train <- bind_cols(activityData.train,data.train)
data.train <- bind_cols(subjectData.train,data.train)

subjectData.test <- read.table(file.path(dataPathRoot,"test","subject_test.txt"), col.names=c("Subject"))
activityData.test <- read.table(file.path(dataPathRoot,"test","y_test.txt"), col.names=c("Activity"))
activityData.test$Activity <- as.factor(activityData.test$Activity)
levels(activityData.test$Activity) <- levels(activityLabels$V2)

featureData.test <- read.table(file.path(dataPathRoot,"test","x_test.txt"), col.names=featureVars$V2)


data.test <- tbl_df(featureData.test)
data.test <- select(data.test,varnames)
data.test <- bind_cols(activityData.test,data.test)
data.test <- bind_cols(subjectData.test,data.test)

data.combined <- bind_rows(data.train,data.test)

data.summarised <- data.combined %>% group_by(Subject,Activity)  %>% summarise_each(funs(mean))

write.table(data.combined,file="CombinedData.txt",row.names=FALSE,sep="\t")
write.table(data.summarised,file="SummarisedData.txt",row.names=FALSE,sep="\t")



