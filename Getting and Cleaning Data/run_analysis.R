run_analysis<-function(){
  
  ## Load the necessary packages
  
  if(!require(data.table)){install.packages(data.table)}
  if(!require(reshape2)){install.packages(reshape2)}
  require(data.table)
  require(reshape2)
  
  ## Read in the required data files
  
  x_test<-read.table("x_test.txt")
  x_train<-read.table("x_train.txt")
  y_test<-read.table("y_test.txt")
  y_train<-read.table("y_train.txt")
  activity_labels<-read.table("activity_labels.txt")
  subject_test<-read.table("subject_test.txt")
  subject_train<-read.table("subject_train.txt")
  features<-read.table("features.txt")
  
  ## Assign the proper labels
  
  names(x_test) = features[,2]
  names(x_train) = features[,2]
  names(subject_test)<-c("subject_id")
  names(subject_train)<-c("subject_id")
  y_test[,2]=activity_labels[y_test[,1],2]
  y_train[,2]=activity_labels[y_train[,1],2]
  names(y_test) = c("activity_id","activity_name")
  names(y_train) = c("activity_id","activity_name")
  
  ## Form the test and train datasets
  
  test<-cbind(as.data.table(subject_test),y_test,x_test)
  train<-cbind(as.data.table(subject_train),y_train,x_train)
  
  ## Merge the test and train datasets
  
  combdata<-rbind(test, train)
  
  ## Extract the mean and std for each measurement
  
  mean_std<-grep("mean|std|subject|activity",names(combdata))
  mean_std_data<-combdata[,..mean_std]
  
  ## Create the tidy data with average of each variable for each activity and each subject
  
  melted<-melt(mean_std_data, id.vars = c("subject_id","activity_name","activity_id"))
  tidydata<-dcast(melted,subject_id+activity_name+activity_id~variable,mean)
  write.table(tidydata,"tidydata.txt",row.names = FALSE)
}