run_analysis = function(){
  
  # this function does the following: 
  # 1. Merges the training and the test sets to create one data set.
  # 2. Extracts only the measurements on the mean and standard deviation 
  #   for each measurement. 
  # 3. Uses descriptive activity names to name the activities in the data set
  # 4. Appropriately labels the data set with descriptive activity names. 
  # 5. Creates a second, independent tidy data set with the average of 
  #   each variable for each activity and each subject. 
  
  # first, make sure we are in the right directory
  setwd("~/Documents/Coursera/GettingAndCleaningData//CleaningData_CourseProject")
  
  ### 1. Merges the training and the test sets to create one data set
  Xtrain = read.table("../data//UCIHARDataset//train//X_train.txt", stringsAsFactors = F)
  Ytrain=read.table("../data//UCIHARDataset//train//y_train.txt", stringsAsFactors = F)
  subtrain=read.table("../data//UCIHARDataset//train//subject_train.txt", stringsAsFactors = F)
  trainingData = cbind(subtrain, Ytrain, Xtrain)
  
  Xtest = read.table("../data//UCIHARDataset/test//X_test.txt", stringsAsFactors = F)
  Ytest=read.table("../data//UCIHARDataset//test//y_test.txt", stringsAsFactors = F)
  subtest=read.table("../data//UCIHARDataset/test//subject_test.txt", stringsAsFactors = F)
  testData = cbind(subtest, Ytest, Xtest)
  
  masterData = data.frame(rbind(trainingData, testData))
  
  # now name columns
  features = read.table("../data//UCIHARDataset//features.txt", stringsAsFactors = F)
  feat = gsub("[[:punct:]]",".",features[,2]) # get rid of "(" and ")"
  feat = gsub("[[:punct:]]{2,}",".",feat) # if "." happens more then once, reduce to just one "."
  feat = gsub("[[:punct:]]$","",feat) # get rid of punctuation at the end of label
  
  colnames(masterData)=c("sub.id","activity",feat)
  
  ### 2. Extracts only the measurements on the mean and standard deviation 
  ###   for each measurement.
  colIn = sort(c(1,2, grep("mean", names(masterData), ignore.case=TRUE), grep("std", names(masterData), ignore.case=TRUE)))
  meanSdData = masterData[, colIn]
  
  ### 3. Uses descriptive activity names to name the activities in the data set
  actLabel = read.table("../data/UCIHARDataset/activity_labels.txt",stringsAsFactors=F)
  newAct=matrix(NA,dim(meanSdData)[1],1)
  
  for (i in 1:dim(meanSdData)[1]){
    newAct[i]=actLabel[actLabel[,1]==meanSdData$activity[i],2]
  }
  meanSdData$activity=newAct

  ### 4. Appropriately labels the data set with descriptive activity names.
  # note: some of the cleaning up (e.g. getting rid of () and "...") have been
  # done at the end of step 1, using gsub
  a=colnames(meanSdData)
  a=gsub("^f","fft.",a) # clean f -> fft
  a=gsub("^t","time.",a) # clean t -> time
  a=gsub("BodyBody","Body",a) # BodyBody -> Body
  a=gsub("([[:upper:]][[:lower:]]*)", "\\1.", a) # separate camelcase with "."
  a=gsub("Acc","Acceleration",a)
  a=gsub("Mag","Magnitude",a)
  a=gsub("meanFreq","mean.Frequency",a)
  a=gsub("Gyro","Gyroscope",a)
  a=gsub("tBody","time.Body",a)
  a=gsub("gravityMean","gravity.Mean",a)
  a=gsub("[[:punct:]]{2,}",".",a) # if "." happens more then once, reduce to just one "."
  a=gsub("[[:punct:]]$","",a) # get rid of punctuation at the end of label
  a=tolower(a) # set everything to lower-case
  
  # now write .txt file
  colnames(meanSdData)=a # set col names back to data frame
  meanSdData=meanSdData[order(meanSdData$sub.id),] # sort by subID for easy reading
  write.table(meanSdData, file="meanSd_allData.txt",sep=",",
              col.names=TRUE, row.names=FALSE)
  
  ### 5. Creates a second, independent tidy data set with the average of 
  ###   each variable for each activity and each subject.
  
  
  
  
  
}