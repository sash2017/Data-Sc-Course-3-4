run_analysis<-function()
{
  rm(list=ls())
  library(dplyr)
  library(Hmisc)
  library(data.table)
  library(lubridate)
  
  
  #Question 1. merging training and test sets
  
  ##a. Merging activity level sets
  y_train<-read.table("y_train.txt") # reading training label
  y_test<-read.table("y_test.txt")   # reading test label
  y_activity<-bind_rows(y_train,y_test) # merging data
  colnames(y_activity)<-"activity"
  
  
  ## b. Merging subject sets
  subject_train<-read.table("subject_train.txt") # reading training set
  subject_test<-read.table("subject_test.txt")   # reading test set
  subject<-bind_rows(subject_train,subject_test) # merging data
  colnames(subject)<-"subject"
  
  ## c. Merging training and test feature sets
  x_train<-read.table("X_train.txt")
  x_test<-read.table("X_test.txt")
  X_data<-bind_rows(x_train,x_test)
  
  ## d. reading feature labels
  feature_label<-read.table("features.txt")
  colnames(feature_label)<-c("number","name")
  colnames(X_data)<-make.names(tolower(feature_label$name),unique=TRUE)
  
  ## f. merging the data sets together
  data_act<-cbind(y_activity,subject,X_data)
  
  #________________________________________________________________________________________
  
  ## Question 2. Extracting the measurements on the mean and standard deviation 
  
  name.match<- grepl("subject|activity|mean|std",colnames(data_act))
  extract_data<-data_act[,name.match]
 # _________________________________________________________________________________________
  
  ## Question 3. adding descriptive names to the activity labels
  
  activity_label<-read.table("activity_labels.txt")# reading activity label data
  colnames(activity_label)<-c("activity","activity_")
  data_act2<-merge(activity_label,extract_data,by="activity")
  data_act2<-select(data_act2,-activity)
  data_act2<-arrange(data_act2,subject)##arranging the data by increasing order of subject id
  data_act2<-select(data_act2, subject,activity_,2:ncol(data_act2))
  #________________________________________________________________________________________
 
  ## Question 4. Appropriately labeling the data set with descriptive variable names.

  colnames <-colnames(data_act2)
  colnames <- make.names(colnames, unique=TRUE)
  
  #Cleanup the variable names by replacing characters
  cleanname<-gsub("-", " ", colnames) #Rplace - with a space
  cleanname<-gsub("\\.", " ", cleanname) #Replace . with a space
  cleanname<-gsub("tbody", "Body", cleanname) #Remove the t
  cleanname<-gsub("tgravity", "Gravity", cleanname) #Remove the t
  cleanname<-gsub("fbody", "Body", cleanname) #Remove the f
  cleanname<-gsub("Bodybody", "Body", cleanname) #Remove double Body
  cleanname<-trimws(cleanname, which = c("both", "left", "right"))# removing trailing leading spaces
  
  # Recreate the column names for the dataset
  colnames(data_act2) <- cleanname
  colnames(data_act2)<-make.names(colnames(data_act2),unique=TRUE)
  
  # Check the structure
  str(data_act2)
  #________________________________________________________________________________________
  
  ## Question 5. Create tidy dataset from step 4

  data.tidy<-tbl_df(data_act2) 
  colnames(data.tidy)<-cleanname 
  colnames(data.tidy)<-make.names(colnames(data.tidy),unique=TRUE)
  tidy.data<-group_by(data.tidy,subject,activity_)
  
  ind.tidydata<-summarize_each(tidy.data,funs(mean))
  colnames(ind.tidydata)<-cleanname
   
  str(ind.tidydata)
  
  write.table(ind.tidydata, file = "tidydata.txt", append = FALSE, quote = TRUE, sep = " ",row.names=FALSE,col.names=TRUE)
  
  dim(ind.tidydata)
  
 

}